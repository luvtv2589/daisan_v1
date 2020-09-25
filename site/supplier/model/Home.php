<?php
class Home extends Customerbase {
    private $folder, $pament_method;
	function __construct() {
		parent::__construct ();
		
		$this->folder = "rfq/";
		$this->pament_method = array(
		    1 => 'Thanh toán tiền mặt khi giao hàng',
		    2 => 'Thanh toán chuyển khoản ATM',
		    3 => 'Thanh toán online tự động'
		);
	}
	
	
	function index() {
		$key = isset($_GET['key'])?trim($_GET['key']):'';
		$status = isset($_GET['status'])?intval($_GET['status']):0;
		$type = isset($_GET['type'])?intval($_GET['type']):0;
		$user_id = isset($_GET['user_id'])?intval($_GET['user_id']):0;
		
		$where = "a.status=$status";
		if($key!='') $where .= " AND (p.name LIKE '%$key%' OR p.email LIKE '%$key%' OR p.phone LIKE '%$key%')";
		if($type!=0) $where .= " AND a.type=$type";
		if($user_id!=0) $where .= " AND a.user_id=$user_id";
		if($this->arg['login_role']!=='admin') $where .= " AND a.user_id=".$this->arg['login'];

		$sql = "SELECT a.id,a.page_id,a.content,p.name,p.address,p.phone,p.email,p.page_name,p.website
                FROM pageverify a LEFT JOIN pages p ON a.page_id=p.id WHERE $where";
		$paging = new vsc_pagination($this->pdo->count_rows($sql), 50, 0);
		$sql = $paging->get_sql_limit($sql);
		$result = $this->pdo->fetch_all($sql);
		foreach ($result AS $k=>$item){
		    $result[$k]['url'] = $this->page->get_pageurl($item['page_id'], $item['page_name']);
		}
		$this->smarty->assign('result', $result);
		
		$out = array();
		$out['key'] = $key;
		$out['select_status'] = $this->help->get_select_from_array($this->status, $status);
		$out['select_type'] = $this->help->get_select_from_array($this->type, $type, 'Trạng thái khách hàng');
		$out['select_user'] = $this->user->get_select_useradmins($user_id, 'telesale', 'Tất cả nhân viên Telesale');
		$this->smarty->assign('out', $out);
		$this->smarty->display(LAYOUT_DEFAULT);
	}
	
	
	function allcustomer() {
	    if(isset($_POST['action']) && $_POST['action']=='save_for_telesale'){
	        if(@$_POST['user_id']==0){
	            echo 0; exit();
	        }
	        foreach ($_POST['ids'] AS $item){
	            $data = array();
	            $data['user_id'] = intval($_POST['user_id']);
	            $data['page_id'] = $item;
	            $data['updated'] = time();
	            $data['admin_id'] = $this->arg['login'];
	            $this->pdo->insert('pageverify', $data);
	        }
	        echo 1; exit();
	    }
	    
	    $key = isset($_GET['key'])?trim($_GET['key']):'';
	    $tt =  isset($_GET['tt'])?intval($_GET['tt']):0;
	    if($user_id!=0) $where .= " AND a.user_id=$user_id";
	    if($this->arg['login_role']!=='admin') $where .= " AND a.user_id=".$this->arg['login'];
	    $where = "status=$tt";
	    
	    $sql = "SELECT id,name,address,phone,email FROM pages WHERE id NOT IN (SELECT page_id FROM pageverify) AND $where";
	    
	    $paging = new vsc_pagination($this->pdo->count_rows($sql), 50, 1);
	    $sql = $paging->get_sql_limit($sql);
	    $result = $this->pdo->fetch_all($sql);
	    $this->smarty->assign('result', $result);
	    
	    $out = array();
	    $out['key'] = $key;
	    $out['select_tt'] = $this->help->get_select_from_array($this->help->a_status, $tt);
	    $out['select_user'] = $this->user->get_select_useradmins($user_id, 'telesale', 'Tất cả nhân viên Telesale');
	    $this->smarty->assign('out', $out);
	    $this->smarty->display(LAYOUT_DEFAULT);
	}
	
	
	function statistics(){
	    
	    $from = isset($_GET['from'])?date('Y-m-d', strtotime($_GET['from'])):null;
	    $to = isset($_GET['to'])?date('Y-m-d', strtotime($_GET['to'])):null;
	    $where = '';
	    if($from!=null) $where .= " AND date_log>='$from'";
	    if($to!=null) $where .= " AND date_log<='$to'";
	    
	    $user_status = $this->pdo->fetch_all("SELECT a.username,a.name,a.id,
                (SELECT COUNT(1) FROM pageverify WHERE user_id=a.id AND status=0 $where) AS status_0,
                (SELECT COUNT(1) FROM pageverify WHERE user_id=a.id AND status=1 $where) AS status_1,
                (SELECT COUNT(1) FROM pageverify WHERE user_id=a.id AND status=2 $where) AS status_2,
                (SELECT COUNT(1) FROM pageverify WHERE user_id=a.id AND status=3 $where) AS status_3,
                (SELECT COUNT(1) FROM pageverify WHERE user_id=a.id AND status=4 $where) AS status_4
                FROM useradmin a WHERE a.type='telesale' AND a.status=1");
	    $this->smarty->assign('user_status', $user_status);

	    
	    $user_type = $this->pdo->fetch_all("SELECT a.username,a.name,a.id,
                (SELECT COUNT(1) FROM pageverify WHERE user_id=a.id AND type=1 $where) AS type_1,
                (SELECT COUNT(1) FROM pageverify WHERE user_id=a.id AND type=2 $where) AS type_2,
                (SELECT COUNT(1) FROM pageverify WHERE user_id=a.id AND type=3 $where) AS type_3,
                (SELECT COUNT(1) FROM pageverify WHERE user_id=a.id AND type=4 $where) AS type_4,
                (SELECT COUNT(1) FROM pageverify WHERE user_id=a.id AND type=5 $where) AS type_5
                FROM useradmin a WHERE a.type='telesale' AND a.status=1");
	    $this->smarty->assign('user_type', $user_type);
	    
	    $out = array();
	    $out['date_from'] = isset($_GET['from'])?date('d-m-Y', strtotime($_GET['from'])):null;
	    $out['date_to'] = isset($_GET['to'])?date('d-m-Y', strtotime($_GET['to'])):null;
	    $out['status'] = $this->status;
	    $out['type'] = $this->type;
	    $this->smarty->assign('out', $out);
	    $this->smarty->display(LAYOUT_DEFAULT);
	}
	
	
	function post_detail(){
	    $id = isset($_GET['id'])?intval($_GET['id']):0;
	    $info = $this->pdo->fetch_one("SELECT * FROM posts WHERE id=$id");
	    $this->smarty->assign('info', $info);
	    
	    $this->get_breadcrumb($info['taxonomy_id']);
	    $this->smarty->display(LAYOUT_DEFAULT);
	}
	
	
	function ajax_form(){
	    if(isset($_POST['action']) && $_POST['action']==='load_callinfo'){
	        $info = $this->pdo->fetch_one('SELECT * FROM pageverify WHERE id='.intval($_POST['id']));
	        $info['select_status'] = $this->help->get_select_from_array($this->status, @$info['status']);
	        $info['select_type'] = $this->help->get_select_from_array($this->type, @$info['type'], 'Trạng thái khách hàng');
	        echo json_encode($info);
	        exit();
	    }elseif(isset($_POST['action']) && $_POST['action']==='save_callinfo'){
	        $data = array();
	        $data['type'] = $_POST['type'];
	        $data['status'] = $_POST['status'];
	        $data['content'] = trim($_POST['content']);
	        $data['date_log'] = date('Y-m-d');
	        $this->pdo->update('pageverify', $data, 'id='.intval($_POST['id']));
	    }elseif(isset($_POST['action']) && $_POST['action']==='load_customer'){
	        $result = $this->pdo->fetch_one('SELECT id,name,phone,email,address FROM pages WHERE id='.intval($_POST['id']));
	        echo json_encode($result);
	        exit();
	    }elseif(isset($_POST['action']) && $_POST['action']==='save_customer'){
	        $data = array();
	        $data['name'] = trim($_POST['name']);
	        $data['phone'] = trim($_POST['phone']);
	        $data['email'] = trim($_POST['email']);
	        $data['address'] = trim($_POST['address']);
	        $this->pdo->update('pages', $data, 'id='.intval($_POST['id']));
	    }
	}

}
