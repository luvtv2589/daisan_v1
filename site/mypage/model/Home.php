<?php

class Home extends Pageadmin{
	function __construct() {
		parent::__construct ();
	}
	
	
	function index(){
		global $login, $lang;
		$out = array ();
		
		$stat_order = $this->pdo->fetch_one("SELECT COUNT(id) AS number FROM productorders 
                WHERE page_id=".$this->page_id." AND DATE_FORMAT(FROM_UNIXTIME(created), '%Y')='".date("Y")."' AND DATE_FORMAT(FROM_UNIXTIME(created), '%m')='".date("m")."'");
		$stat_access = $this->pdo->fetch_one("SELECT COUNT(id) AS number FROM useronlines
                WHERE page_id=".$this->page_id." AND DATE_FORMAT(date_log, '%Y')='".date("Y")."'");
		
		$page = $this->profile;
		$page['package'] = $page['package_id']==0?"Free":$this->pdo->fetch_one_fields('packages', 'name', "id=".$this->profile['package_id']);
		$package = $this->pdo->fetch_one("SELECT * FROM packages WHERE id=".$page['package_id']);
		$package['numb_showcase_used'] = $this->pdo->count_item('products', "ismain=1 AND page_id=".$this->page_id);
		
		$this->smarty->assign('page', $page);
		$this->smarty->assign('package', $package);
		
		$out['show_active_homelogo'] = 0;
		if(@$package['numb_homelogo']>0){
		    if($page['package_homelogo'] == null) $out['show_active_homelogo'] = 1;
		    elseif(date('m-Y', strtotime($page['package_homelogo']))!==date('m-Y') ) $out['show_active_homelogo'] = 1;
		}
		
		$out['order_month'] = $stat_order['number'];
		$out['access_month'] = $stat_access['number'];
		$out['favorites'] = $this->pdo->count_item('pagefavorites', 'status=1 AND page_id='.$this->page_id);
		$this->smarty->assign('out', $out);
		$this->smarty->display(LAYOUT_DEFAULT);
	}
	
	
	function images(){
	    global $login, $lang;
	    
	    $folder = $this->page->get_folder_img_upload($this->page_id);
	    $files = scandir($folder);
	    unset($files[0]);
	    unset($files[1]);
	    arsort($files);
	    $files = array_values($files);
	    $out['number_file'] = count($files);
	    
	    $paging = new vsc_pagination(count($files), 32);
	    $limit = $paging->get_page_limit();
	    $ex_limit = explode(",", $limit);
	    
	    $folder_size = 0;
	    foreach ($files AS $item){
	        $folder_size += @filesize($folder.$item);
	    }
	    
	    $news_files = array_splice($files, @$ex_limit[0], @$ex_limit[1]);
	    $result = array();
	    foreach ($news_files AS $item){
	        $result[] = $this->img->get_image($folder, $item);
	    }
	    
	    $out['folder_size'] = round($folder_size/1024/1024, 2);
	    $this->smarty->assign('out', $out);
	    $this->smarty->assign('result', $result);
	    $this->smarty->display(LAYOUT_DEFAULT);
	}
	
	
	function connect(){
		global $login, $lang;
		$out = array ();
		
		$userId = isset($_GET['userId']) ? intval($_GET['userId']) : 0;
		$pageId = isset($_GET['pageId']) ? intval($_GET['pageId']) : 0;
		$token = isset($_GET['token']) ? trim($_GET['token']) : null;
		
		$check = $this->pdo->fetch_one("SELECT 1 FROM pageusers WHERE user_id=$userId AND page_id=$pageId AND status=1");
		$msg = "";
		if(!$check){
			unset($_SESSION[SESSION_PAGEID_MANAGER]);
			$msg = "Xảy ra lỗi truy cập, bạn không có quyền truy cập quản lý cho page này.";
		}else{
			$_SESSION[SESSION_PAGEID_MANAGER] = $pageId;
			lib_redirect(URL_PAGEADMIN);
		}
		
		echo $msg;
		$this->smarty->assign('out', $out);
	}
	
	
	function errorpage(){
		global $login, $lang;
		
		$this->smarty->display(LAYOUT_DEFAULT);
	}
	
	function ajax_handle(){
	    if(isset($_POST['action']) && $_POST['action']=='active_homelogo'){
	        $package = $this->pdo->fetch_one("SELECT * FROM packages WHERE id=".$this->profile['package_id']);
	        $rt = array();
	        $rt['code'] = 0;
	        if(!$package) $rt['msg'] = 'Xảy ra lỗi liên quan đến gói VIP gian hàng của bạn.';
	        else{
	            $data = array();
	            $data['package_homelogo'] = date('Y-m-d', strtotime('+'.$package['numb_homelogo'].' day'));
	            $this->pdo->update('pages', $data, 'id='.$this->page_id);
	            $rt['msg'] = 'Active hiển thị logo thành công ra trang chủ hệ thống.';
	            $rt['code'] = 1;
	        }
	        echo json_encode($rt);
	        exit();
	    }
	}
	
}
