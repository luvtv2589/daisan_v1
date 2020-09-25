<?php
class Home extends Helpcenter {
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
		global $login, $lang;
		
		$cid = isset($_GET['cid'])?intval($_GET['cid']):0;
		$key = isset($_GET['key'])?trim($_GET['key']):'';
		
		$where = "a.status=1 AND a.type='support'";
		if($key!='') $where .= " AND a.title LIKE '%$key%'";
		if($cid!=0) $where .= " AND a.taxonomy_id IN (".implode(",", $this->tax->get_subcategory($cid)).")";
		$sql = "SELECT a.id,a.title,a.description,a.created
                FROM posts a WHERE $where ORDER BY a.id DESC";
		$out['number'] = $this->pdo->count_item('posts', $where);
		$paging = new vsc_pagination($out['number'], 20, 1);
		$sql = $paging->get_sql_limit($sql);
		$result = $this->pdo->fetch_all($sql);
		foreach ($result AS $k=>$item){
		    $result[$k]['url'] = "?site=post_detail&id=".$item['id'];
		}
		$this->smarty->assign('result', $result);
		
		$out['key'] = $key;
		$this->smarty->assign('out', $out);
		$this->get_breadcrumb($cid);
		$this->smarty->display(LAYOUT_DEFAULT);
	}
	
	function post_detail(){
	    global $login, $lang;
	    
	    $id = isset($_GET['id'])?intval($_GET['id']):0;
	    $info = $this->pdo->fetch_one("SELECT * FROM posts WHERE id=$id");
	    $info['content'] = str_replace('http://imgs.beta.daisan.vn','http://imgs.daisan.vn',$info['content']);
	    $this->smarty->assign('info', $info);
	    
	    $this->get_breadcrumb($info['taxonomy_id']);
	    $this->smarty->display(LAYOUT_DEFAULT);
	}
	

}
