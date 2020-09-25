<?php
class Pages extends Main {
    
    function __construct() {
        parent::__construct ();
    }
    function home() {
        if($this->page_id != NULL){
        $out = array ();
        $a_sliders = strlen(@$this->profile['img_sliders'])>30 ? explode(";", @$this->profile['img_sliders']) : array();
        $a_sliders_show = array();
        foreach ($a_sliders AS $k=>$item){
            if(is_file($this->page->get_folder_img_upload($this->page_id).$item))
                $a_sliders_show[] = $this->img->get_image($this->page->get_folder_img($this->page_id), $item);
        }
        $this->smarty->assign('a_home_sliders_show', $a_sliders_show);
        $a_home_supporters = $this->pdo->fetch_all("SELECT id,name,phone,avatar,email,skype FROM pagesupporters WHERE status=1 AND page_id=".$this->page_id);
        foreach ($a_home_supporters AS $k=>$item){
            $a_home_supporters[$k]['avatar'] = $this->img->get_image($this->page->get_folder_img($this->page_id), $item['avatar']);
        }
        $this->smarty->assign('a_home_supporters', $a_home_supporters);
        $a_home_product_main = array();
        $i = 0;
        foreach ($this->page_product AS $k=>$item){
            if(@$item['ismain']==1 && $i<8){
                $a_home_product_main[$k] = $item;
                $i++;
            }
        }
        $this->smarty->assign ('a_home_product_main', $a_home_product_main);
        $a_home_product_new = array();
        $i = 0;
        /*foreach ($this->page_product AS $k=>$item){
            if(@$item['ismain']!=1 && $i<16){
                $a_home_product_new[$k] = $item;
                $i++;
            }
        }*/
        foreach ($this->page_product AS $k=>$item){
            if($i<16){
                $a_home_product_new[$k] = $item;
                $i++;
            }
        }
        $this->smarty->assign ('a_home_product_new', $a_home_product_new);
        $this->smarty->assign('Video',$this->page->getvideo(@$this->page_id));
        $this->profile['a_image'] = array();
        $a_image = strlen(@$this->profile['images'])>30 ? explode(";", @$this->profile['images']) : array();
        foreach ($a_image AS $k=>$item){
            if(is_file($this->page->get_folder_img_upload($this->page_id).$item)){
                $this->profile['a_image'][] = $this->img->get_image($this->page->get_folder_img($this->page_id), $item);
            }
        }
        $this->smarty->assign('page', $this->profile);
        
        $a_home_partners = $this->pdo->fetch_all("SELECT a.id,p.description,a.name,a.logo_custom
				FROM pagepartners p LEFT JOIN pages a ON a.id=p.partner_id
				WHERE p.page_id=".$this->page_id);
        foreach ($a_home_partners AS $k=>$item){
            $a_home_partners[$k]['logo_custom'] = $this->img->get_image($this->page->get_folder_img($item['id']), $item['logo_custom']);
            $a_home_partners[$k]['url'] = URL_PAGE."?pageId=".$item['id'];
        }
        $this->smarty->assign ('a_home_partners', $a_home_partners);
//         if($this->profile['img_intro'] !=NULL)
//             $this->smarty->assign('banner', $this->img->get_image($this->page->get_folder_img($this->page_id), $this->profile['img_intro']));
        $this->smarty->assign ( 'out', $out );
        $this->smarty->display ( LAYOUT_HOME );
        }else{
            $this->smarty->display ( '404.tpl' );
        }
    }
    
    
    function search() {
        global $login, $lang;
        
        $key = isset ( $_GET ['k'] ) ? trim ( $_GET ['k'] ) : null;
        $kId = isset ( $_GET ['kId'] ) ? intval ( $_GET ['kId'] ) : null;
        $a_key = explode ( " ", $key );
        
        $where = "a.status=1 AND a.page_id=".$this->page_id;
        if($key!=null) $where .= " AND (a.name LIKE '%$key%' OR a.code LIKE '%$key%' OR a.keyword LIKE '%$key%')";
        
        $number = $this->pdo->count_item('products', $where);
        $paging = new vsc_pagination($number, 12);
        $limit = $paging->get_page_limit();
        $result = $this->product->get_list($this->page_id, 0, $where, $limit, $this->page_url);
        $this->smarty->assign ('result', $result);
        
        $out['number'] = $number;
        $this->smarty->assign('out', $out);
        $this->smarty->display ( LAYOUT_DEFAULT );
    }
    
    
    function contact() {
        global $login, $lang;
        if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='send_contact'){
            $page_id = isset($_POST['page_id']) ? intval($_POST['page_id']) : 0;
            $product_id = isset($_POST['product_id']) ? intval($_POST['product_id']) : 0;
            $rt['code'] = 0;
            if($login==0){
                $rt['msg'] = "Vui lòng đăng nhập trước khi thực hiện chức năng này.";
            }elseif(!$this->pdo->check_exist("SELECT 1 FROM pages WHERE id=$page_id")){
                $rt['msg'] = "Không tồn tại gian hàng này.";
            }elseif($product_id!=0 && !$this->pdo->check_exist("SELECT 1 FROM products WHERE page_id=$page_id AND id=$product_id")){
                $rt['msg'] = "Sản phẩm không thuộc gian hàng.";
            }else{
                $data['page_id'] = $page_id;
                $data['product_id'] = $product_id;
                $data['message'] = trim(@$_POST['message']);
                $data['user_id'] = $login;
                $data['created'] = time();
                $this->pdo->insert('pagemessages', $data);
                $rt['code'] = 1;
                $rt['msg'] = "Gửi liên hệ tới gian hàng thành công.";
            }
            echo json_encode($rt);
            exit();
        }
        
        $a_home_supporters = $this->pdo->fetch_all("SELECT id,name,phone,avatar FROM pagesupporters WHERE status=1 AND page_id=".$this->page_id);
        foreach ($a_home_supporters AS $k=>$item){
            $a_home_supporters[$k]['avatar'] = $this->img->get_image($this->page->get_folder_img($this->page_id), $item['avatar']);
        }
        $this->smarty->assign('a_home_supporters', $a_home_supporters);
        
        $this->smarty->assign('banner', $this->img->get_image($this->page->get_folder_img($this->page_id), $this->profile['img_contact']));
        $this->smarty->display ( LAYOUT_DEFAULT );
    }
    
    
    function company_information() {
        global $login, $lang;
        $out = array();
        $this->profile['url_contact'] = DOMAIN."?mod=page&site=contact&page_id=".$this->page_id;
        
        $this->profile['a_image'] = array();
        $a_image = strlen(@$this->profile['images'])>30 ? explode(";", @$this->profile['images']) : array();
        foreach ($a_image AS $k=>$item){
            if(is_file($this->page->get_folder_img_upload($this->page_id).$item)){
                $this->profile['a_image'][] = $this->img->get_image($this->page->get_folder_img($this->page_id), $item);
            }
        }
        $this->smarty->assign('profile', $this->profile);
        
        $a_home_product_main = array();
        $i = 0;
        foreach ($this->page_product AS $k=>$item){
            if(@$item['ismain']==1 && $i<8){
                $a_home_product_main[$k] = $item;
                $i++;
            }
        }
        $this->smarty->assign ('a_home_product_main', $a_home_product_main);
        
        $this->smarty->assign('out', $out);
        $this->smarty->assign('banner', $this->img->get_image($this->page->get_folder_img($this->page_id), $this->profile['img_intro']));
        $this->get_seo_metadata($this->profile['name'], $this->profile['meta_keyword'], $this->profile['meta_description'], @$this->profile['a_image'][0]);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function company_profile(){
        global $login, $lang;
        $this->profile['revenue'] = @$this->page->revenue[$this->profile['revenue']];
        $this->profile['url_contact'] = DOMAIN."?mod=page&site=contact&page_id=".$this->page_id;
        $this->smarty->assign('profile', $this->profile);
        
        $address = $this->pdo->fetch_all("SELECT id,name,address,email,phone FROM pageaddress WHERE page_id=".$this->page_id);
        $this->smarty->assign('address', $address);
        
        $this->smarty->assign('banner', $this->img->get_image($this->page->get_folder_img($this->page_id), $this->profile['img_intro']));
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function company_capacity(){
        global $login, $lang;
        $this->profile['revenue'] = @$this->page->revenue[$this->profile['revenue']];
        $this->smarty->assign('profile', $this->profile);
        
        $address = $this->pdo->fetch_all("SELECT id,name,address,email,phone FROM pageaddress WHERE page_id=".$this->page_id);
        $this->smarty->assign('address', $address);
        
        $this->smarty->assign('banner', $this->img->get_image($this->page->get_folder_img($this->page_id), $this->profile['img_intro']));
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function company_partners(){
        global $login, $lang;
        
        $partners = $this->pdo->fetch_all("SELECT a.id,a.name,a.logo,p.year_start,p.year_finish,p.description FROM pagepartners p
				LEFT JOIN pages a ON a.id=p.partner_id
				WHERE p.page_id=".$this->page_id);
        foreach ($partners AS $k=>$item){
            $partners[$k]['logo'] = $this->img->get_image($this->page->get_folder_img($item['id']), $item['logo']);
            $partners[$k]['year_finish'] = $item['year_finish']==0?'Nay':$item['year_finish'];
            $partners[$k]['url'] = URL_PAGE."?pageId=".$item['id'];
        }
        $this->smarty->assign('partners', $partners);
        
        $this->smarty->assign('banner', $this->img->get_image($this->page->get_folder_img($this->page_id), $this->profile['img_intro']));
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    function service_list() {
        global $login, $lang;
        $out = array();
        
        $services = $this->service->get_pageservices($this->page_id, null, 24, $this->page_url);
        $this->smarty->assign ('services', $services);
        
        $this->smarty->assign('banner', $this->img->get_image($this->page->get_folder_img($this->page_id), $this->profile['img_service']));
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function service_detail(){
        global $login, $lang;
        $service_id = isset($_GET['service_id']) ? intval($_GET['service_id']) : 0;
        $service = $this->pdo->fetch_one("SELECT s.id,s.name,s.avatar,ps.* FROM pageservices ps
				LEFT JOIN services s ON s.id=ps.service_id
				WHERE ps.service_id=$service_id AND ps.page_id=".$this->page_id);
        $service['avatar'] = $this->img->get_image($this->service->get_folder_img($service_id), @$service['avatar']);
        
        $service['metas'] = $this->pdo->fetch_all("SELECT meta_key,meta_value FROM pageservicemetas
				WHERE service_id=$service_id AND page_id=".$this->page_id);
        $service['steps'] = $this->pdo->fetch_all("SELECT content FROM pageservicesteps
				WHERE service_id=$service_id AND page_id=".$this->page_id);
        $service['promos'] = $this->pdo->fetch_all("SELECT content FROM pageservicepromos
				WHERE service_id=$service_id AND page_id=".$this->page_id);
        $service['prices'] = $this->pdo->fetch_all("SELECT version,price FROM pageserviceprices
				WHERE service_id=$service_id AND page_id=".$this->page_id);
        
        $price = "Giá liên hệ";
        if(count($service['prices'])==1){
            $price = "VN ".number_format($service['prices'][0]['price'])."đ";
        }elseif (count($service['prices'])>1){
            $price = "VN ".number_format($service['prices'][0]['price'])."đ";
            $number = count($service['prices']) - 1;
            $price .= " - ".number_format($service['prices'][$number]['price'])."đ";
        }
        $service['price'] = $price;
        
        $other = $this->service->get_pageservices($this->page_id, "a.id<>$service_id", 5, $this->page_url);
        $this->smarty->assign('other', $other);
        
        $this->smarty->assign('service', $service);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function product_list() {
        $out = array();
        $cid = isset($_GET['cid']) ? intval($_GET['cid']) : 0;
        $limit = 24;
        $page = isset($_GET['page'])?intval($_GET['page']):1;
        $start = ($page-1)*$limit;
        $products = array();
        foreach ($this->page_product AS $k=>$item){
            if($cid!=0 && @$item['taxonomy_id']==$cid) $products[$k] = $item;
            elseif($cid==0) $products[$k] = $item;
        }
        $i = 0;
        $j = 0;
        $result = array();
        foreach ($products AS $k=>$item){
            if($i>=$start && $j<$limit){
                $result[$k] = $item;
                $j++;
            }
            $i++;
        }
        $number = count($products);
        new vsc_pagination($number, $limit);
        $this->smarty->assign ('result', $result);
        $this->smarty->assign('banner', $this->img->get_image($this->page->get_folder_img($this->page_id), $this->profile['img_product']));
        $out['number'] = $number;
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function product_detail(){
        global $login, $lang;
        $pid = isset($_GET['pid']) ? intval($_GET['pid']) : 0;
        $this->pdo->query("UPDATE products SET views=views+1 WHERE id=$pid");
        lib_redirect(DOMAIN."?mod=product&site=detail&pid=$pid");
        $info = $this->pdo->fetch_one("SELECT * FROM products WHERE id=$pid AND page_id=".$this->page_id);
        
        $a_images = explode(";", @$info['images']);
        foreach ($a_images AS $k=>$item){
            $a_images[$k] = $this->img->get_image($this->product->get_folder_img($pid), $item);
        }
        $info['a_images'] = $a_images;
        $info['avatar'] = @$a_images[0];
        
        $info['metas'] = $this->pdo->fetch_all("SELECT meta_key,meta_value FROM productmetas WHERE product_id=$pid ORDER BY id");
        $info['prices'] = $this->pdo->fetch_all("SELECT version,price FROM productprices WHERE product_id=$pid ORDER BY price");
        
        $price = "Giá liên hệ";
        if(count($info['prices'])==1){
            $price = "VN ".number_format($info['prices'][0]['price'])."đ";
        }elseif (count($info['prices'])>1){
            $price = "VN ".number_format($info['prices'][0]['price'])."đ";
            $number = count($info['prices']) - 1;
            $price .= " - ".number_format($info['prices'][$number]['price'])."đ";
        }
        $info['price'] = $price;
        $info['order'] = count($info['prices'])==0?0:1;
        $info['unit'] = $this->pdo->fetch_one_fields('taxonomy', 'name', "id=$pid");
        $info['unit'] = $info['unit']==''?'Piece':$info['unit'];
        
        $other = $this->product->get_list($this->page_id, 0, "a.id<>$pid", 5, $this->page_url);
        $this->smarty->assign('other', $other);
        
        $info['url_contact'] = DOMAIN."?mod=page&site=contact&page_id=".$info['page_id']."&product_id=".$pid;
        $info['url_addcart'] = DOMAIN."?mod=product&site=addcart&pid=$pid";
        $this->smarty->assign('info', $info);
        $this->smarty->assign('a_images', $a_images);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function jobpost(){
        global $login, $lang;
        $result = $this->job->get_pagejobposts($this->page_id, null, null, $this->page_url);
        
        $this->smarty->assign('result', $result);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function jobpost_detail(){
        global $login, $lang;
        $id = isset($_GET['post_id']) ? intval($_GET['post_id']) : 0;
        $post = $this->pdo->fetch_one("SELECT * FROM jobposts WHERE id=$id AND page_id=".$this->page_id);
        
        $this->smarty->assign('post', $post);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
}