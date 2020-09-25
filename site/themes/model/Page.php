<?php

class Page extends Main {
	
	function __construct() {
		parent::__construct ();
		
	}
	
	
	function index() {
	    global $login, $lang, $location;
		$favorites = $this->pdo->fetch_array_field('pagefavorites', 'page_id', 'user_id='.$login);
		$key = isset($_GET['k']) ? trim($_GET['k']) : null;
		$memnumber = isset($_GET['memnumber']) ? trim($_GET['memnumber']) : null;
		$revenue = isset($_GET['revenue']) ? trim($_GET['revenue']) : null;
		
		if(preg_match_all("/select|insert|update|delete|location|script|<|>/", $key))
		{
		    $this->smarty->display('403.tpl');
		    exit();
		}
		//$where = "a.name LIKE '%$key%'";
		$where = "a.status=1";
		if($key!=''){
		    $where .= " AND (a.name LIKE '%$key%' OR a.id IN (SELECT p.page_id FROM products p WHERE p.status=1 AND p.name LIKE '$key%'))";
		}
		if($location!=0) $where .= " AND a.id IN (SELECT page_id FROM pageaddress WHERE province_id=$location)";
		if($memnumber!=null){
		    $a_sql_checkbox = array();
		    foreach (explode(",", $memnumber) AS $item){
		        $a_sql_checkbox[] = "a.number_mem=$item";
		    }
		    $where .= " AND (".implode(" OR ", $a_sql_checkbox).")";
		}
		if($revenue!=null){
		    $a_sql_checkbox = array();
		    foreach (explode(",", $revenue) AS $item){
		        $a_sql_checkbox[] = "b.revenue=$item";
		    }
		    $where .= " AND a.id IN (SELECT b.page_id FROM pageprofiles b WHERE ".implode(" OR ", $a_sql_checkbox).")";
		}
		$out['number']=$this->pdo->count_rows("SELECT 1 FROM pages a LEFT JOIN pageaddress ad ON a.id=ad.page_id
        WHERE $where ORDER BY a.level DESC,a.score DESC,a.id ASC");
		$paging = new vsc_pagination($out['number'], 20);
		$limit = $paging->get_page_limit();
		$result = $this->page->get_pages($where, $limit);
		foreach ($result AS $k=>$item){
		    $result[$k]['isfavorite'] = in_array($item['id'], $favorites)?1:0;
		}
		$this->smarty->assign('result', $result);
		
		$keyword = $this->pdo->fetch_one("SELECT id FROM keywords WHERE name='$key'");
		$kid = 0;
		if($keyword) $kid = $keyword['id'];
		$a_product_ads = array();
		$product_ads = $this->product->get_adsproducts($kid, 0, 10, $a_product_ads);
		foreach ($product_ads AS $item){
		    $a_product_ads[] = $item['id'];
		}
		if(count($product_ads)<10){
		    $product_ads_more = $this->product->get_adsproducts(0,0, (13-count($product_ads)), $a_product_ads);
		    foreach ($product_ads_more AS $item){
		        $a_product_ads[] = $item['id'];
		    }
		    $product_ads = array_merge($product_ads, $product_ads_more);
		}
		$this->smarty->assign('product_ads', $product_ads);
		
		$out['checkbox_memnumber'] = $this->help->get_checkbox_from_array($this->page->number_mem, $memnumber, 'number_mem');
		$out['checkbox_revenue'] = $this->help->get_checkbox_from_array($this->page->revenue, $revenue, 'revenue');
		$out['location'] = $this->help->get_select_location($location_id,0,'Chọn tỉnh thành');
		$out['url'] = "?mod=page&site=index";
		$out['favorites'] = $favorites;
		$this->smarty->assign('out', $out);
		$this->smarty->display(LAYOUT_DEFAULT);
	}
	
	
	function contact(){
		global $login, $lang;	
		if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='send_contact'){
			$page_id = isset($_POST['page_id']) ? intval($_POST['page_id']) : 0;
			$product_id = isset($_POST['product_id']) ? intval($_POST['product_id']) : 0;
			$number = isset($_POST['number']) ? intval($_POST['number']) : 0;
			$unit_id = isset($_POST['unit_id']) ? intval($_POST['unit_id']) : 0;
			$rt['code'] = 0;
			if($login==0) $rt['msg'] = "Vui lòng đăng nhập trước khi thực hiện chức năng.";
			elseif(!$this->pdo->check_exist("SELECT 1 FROM pages WHERE id=$page_id")){
				$rt['msg'] = "Không tồn tại gian hàng này.";
			}elseif($product_id!=0 && !$this->pdo->check_exist("SELECT 1 FROM products WHERE page_id=$page_id AND id=$product_id")){
				$rt['msg'] = "Sản phẩm không thuộc gian hàng.";
			}else{
				$data['page_id'] = $page_id;
				$data['product_id'] = $product_id;
				$data['message'] = trim(@$_POST['message']);
				$data['number'] = $number;
				$data['unit_id'] = $unit_id;
				$data['user_id'] = $login;
				$data['created'] = time();
				$this->pdo->insert('pagemessages', $data);
				$rt['code'] = 1;
				$rt['msg'] = "Gửi liên hệ tới gian hàng thành công.";
			}
			echo json_encode($rt);
			exit();
		}
		
		$page_id = isset($_GET['page_id']) ? intval($_GET['page_id']) : 0;
		$product_id = isset($_GET['product_id']) ? intval($_GET['product_id']) : 0;
		
		$page = $this->page->get_profile($page_id);
		$this->smarty->assign('page', $page);
		
		$product = $this->pdo->fetch_one("SELECT id,name,images,minorder,unit_id FROM products WHERE id=$product_id");
		$product = $this->product->get_detail($product);
		
		$this->smarty->assign('product_unit',$this->tax->get_select_taxonomy('product_unit', @$product['unit_id'], 0, null, 0));
		
		$this->smarty->assign('product', $product);
		
		$this->smarty->display (LAYOUT_CUSTOM);
	}
	
	
	function ajax_handle(){
	    global $login, $lang;
	    if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='set_page_favorite'){
	        $id = intval(@$_POST['id']);
	        if($this->pdo->check_exist("SELECT 1 FROM pagefavorites WHERE user_id=$login AND page_id=$id")){
	            $rt['code'] = 0;
	            $rt['msg'] = 'Bạn đã thêm vào danh sách trước đó.';
	        }else{
	            $data['user_id'] = $login;
	            $data['page_id'] = $id;
	            $data['created'] = time();
	            $data['status'] = 1;
	            $this->pdo->insert('pagefavorites', $data);
	            $rt['code'] = 1;
	            $rt['msg'] = 'Lưu vào danh sách theo dõi thành công.';
	        }
	        echo json_encode($rt); exit();
	    }elseif(isset($_POST['ajax_action']) && $_POST['ajax_action']=='remove_page_favorite'){
	        $id = intval(@$_POST['id']);
	        $data['created'] = time();
	        $data['status'] = 0;
	        $this->pdo->update('pagefavorites', $data, "page_id=$id AND user_id=$login");
	        exit();
	    }
	}
	
}
