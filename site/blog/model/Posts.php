<?php
class Posts extends Blog {
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
		
		$cid = isset($_GET['cid'])?intval($_GET['cid']):0;
		$taxonomy = $this->pdo->fetch_one("SELECT id,name,parent,keyword,description FROM taxonomy WHERE id='$cid'");
		
		$where = "a.status=1 AND a.type='post'";
		if($cid != 0){
		    $taxs = $this->tax->get_all_category_id($cid);
		    if (count($taxs) > 0)
		        $where .= " AND a.id IN (SELECT post_id FROM taxonomyrls WHERE taxonomy_id IN (".implode(",", $taxs)."))";
		}
		$sql = "SELECT a.id,a.title,a.description,a.created,a.media_id
                FROM posts a WHERE $where ORDER BY a.id DESC";
		$out['number'] = $this->pdo->count_item('posts', $where);
		$paging = new vsc_pagination($out['number'], 20, 1);
		$sql = $paging->get_sql_limit($sql);
		$result = $this->pdo->fetch_all($sql);
		foreach ($result AS $k=>$item){
		    $result[$k]['url'] = "?site=post_detail&id=".$item['id'];
		    $result[$k]['avatar'] = $this->media->get_image_byid($item['media_id'],1);
		}
		$this->smarty->assign('result', $result);
		
		$a_category_submenu = $this->tax->get_taxonomy("category", $cid, NULL, 6);
		$this->smarty->assign('a_category_submenu', $a_category_submenu);
		
		$out['taxonomy_name'] = $taxonomy['name'];
		$this->smarty->assign('out', $out);
		$this->get_breadcrumb($cid);
		$this->smarty->display(LAYOUT_DEFAULT);
	}
	
	function search(){
	    $key = isset($_GET['key'])?trim($_GET['key']):'';
	    $where = "a.status=1 AND a.type='post'";
	    if($key!='') $where .= " AND a.title LIKE '%$key%'";
	    $sql = "SELECT a.id,a.title,a.description,a.created,a.media_id
                FROM posts a WHERE $where ORDER BY a.id DESC LIMIT 10";
	    $out['number'] = $this->pdo->count_item('posts', $where);
	   
	    $result = $this->pdo->fetch_all($sql);
	    foreach ($result AS $k=>$item){
	        $result[$k]['url'] = "?site=post_detail&id=".$item['id'];
	        $result[$k]['avatar'] = $this->media->get_image_byid($item['media_id'],1);
	    }
	    $this->smarty->assign('out', $out);
	    $this->smarty->assign('result', $result);
	    $this->smarty->display(LAYOUT_DEFAULT);
	}
	function ajax_loadmore(){
	    $where = "a.status=1 AND a.type='post'";
	    $limit = 10;
	    $page = isset($_POST['page'])?intval($_POST['page']):1;
	    $start = ($page - 1) * $limit;
	    $sql = "SELECT a.id,a.title,a.description,a.created,a.media_id
                FROM posts a WHERE $where ORDER BY a.id DESC LIMIT $start, $limit";
	    $result = $this->pdo->fetch_all($sql);
	    foreach ($result AS $k=>$item){
	        $result[$k]['url'] = "?site=post_detail&id=".$item['id'];
	        $result[$k]['avatar'] = $this->media->get_image_byid($item['media_id'],1);
	    }
	    $this->smarty->assign('result', $result);
	    $this->smarty->display('none.tpl');
	}

}
