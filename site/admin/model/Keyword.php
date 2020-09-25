<?php

# ================================ #
# Module for Pages management
# ================================ #

class Keyword extends Admin {
	
	
	function __construct() {
		parent::__construct();
	}


	function index() {
		global $login, $lang;
		$out = array();
		if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='load_keyword'){
		    $id = intval(@$_POST['id']);
		    $result = $this->pdo->fetch_one("SELECT * FROM keywords WHERE id=$id");
		    echo json_encode($result);
		    exit();
		}if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='save_keyword'){
		    $id = intval(@$_POST['id']);
		    $data = array();
		    $data['name'] = trim(@$_POST['name']);
		    $data['admin_id'] = $login;
		    $data['created'] = time();
		    if($id==0){
		        $data['status'] = 1;
		        $this->pdo->insert('keywords', $data);
		    }else $this->pdo->update('keywords', $data, "id=$id");
		    echo 1; exit();
		}
		
		$where = "1=1";
		if(isset($_GET['key']) && $_GET['key'] != "") $where .= " AND a.name LIKE '%".$_GET['key']."%'";
		$sql = "SELECT a.* FROM keywords a WHERE $where ORDER BY a.id DESC";
		
		$paging = new vsc_pagination($this->pdo->count_item('keywords'), 20);
		$sql = $paging->get_sql_limit($sql);
		$result = $this->pdo->fetch_all($sql);
		foreach ($result AS $k=>$item){
		    $result[$k]['status'] = $this->help_get_status($item['status'], 'keywords', $item['id']);
		}
		$this->smarty->assign("result", $result);
		
		$out['filter_key'] = trim(@$_GET['key']);
		$this->smarty->assign('out', $out);
		$this->smarty->display(LAYOUT_DEFAULT);
	}

	
	function history() {
	    global $login, $lang;
	    $out = array();
	    $data = array();
	    if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='set_keyword'){
	        $key = trim(@$_POST['key']);
	        if(strlen($key)>2){
    	        $keyword = $this->pdo->fetch_one("SELECT id FROM keywords WHERE name='$key'");
    	        $key_id = intval(@$keyword['id']);
    	        if(!$keyword){
    	            $data['name'] = $key;
    	            $data['admin_id'] = $login;
    	            $data['created'] = time();
    	            $data['status'] = 1;
    	            $key_id = $this->pdo->insert('keywords', $data);
    	            unset($data);
    	        }
    	        $data['keyword_id'] = $key_id;
    	        $this->pdo->update('keyhistory', $data, "keyword_name='$key'");
	        }
	        exit();
	    }
	    
	    $where = "1=1";
	    if(isset($_GET['key']) && $_GET['key'] != "") $where .= " AND a.keyword_name LIKE '%".$_GET['key']."%'";
	    $sql = "SELECT a.* FROM keyhistory a WHERE $where ORDER BY a.id DESC";
	    
	    $paging = new vsc_pagination($this->pdo->count_item('keyhistory'), 20);
	    $sql = $paging->get_sql_limit($sql);
	    $result = $this->pdo->fetch_all($sql);
	    $this->smarty->assign("result", $result);
	    
	    $out['filter_key'] = trim(@$_GET['key']);
	    $this->smarty->assign('out', $out);
	    $this->smarty->display(LAYOUT_DEFAULT);
	}

	/** =========================================================================== */

	function ajax_delete() {
		$id = isset($_POST ['Id']) ? intval($_POST ['Id']) : 0;
		$rt = array();
		$rt['code'] = 0;
		$rt['msg'] = "Không xóa được nội dung";
		if($this->pdo->check_exist("SELECT 1 FROM keywords WHERE id=$id")){
			$this->pdo->query("DELETE FROM keywords WHERE id=$id");
			$rt['code'] = 1;
			$rt['msg'] = "Xóa thành công.";
		}
		
		echo json_encode($rt);
	}

	
	function ajax_delete_history() {
	    $id = isset($_POST ['Id']) ? intval($_POST ['Id']) : 0;
	    $rt['code'] = 0;
	    $rt['msg'] = "Không xóa được nội dung";
	    if($this->pdo->check_exist("SELECT 1 FROM keyhistory WHERE id=$id")){
	        $this->pdo->query("DELETE FROM keyhistory WHERE id=$id");
	        $rt['code'] = 1;
	        $rt['msg'] = "Xóa thành công.";
	    }
	    
	    echo json_encode($rt);
	}
	
	
	function ajax_export_keywords(){
	    $keywords = $this->pdo->fetch_array_field('keywords', 'name', "status=1");
	    $categoris = $this->pdo->fetch_array_field('taxonomy', 'name', "status=1 AND type='product'");
	    $keywords += $categoris;
	    $keywords = array_unique($keywords);
	    lib_dump($keywords);
	    
	    $fp = fopen(FILE_KEYWORDS, 'w');
	    fwrite($fp, json_encode($keywords));
	    fclose($fp);
	}
	
}
