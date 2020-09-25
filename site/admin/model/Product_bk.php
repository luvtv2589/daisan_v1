<?php

# ================================ #
# Module for Product management
# ================================ #
lib_use(LIB_CORE_SITEMAPXML);
class Product extends Admin {
    
    function __construct() {
        $seoOption = array(
            'version'       => '1.0',
            'charset'       => 'UTF-8',
            'xml_filename'  => 'sitemap.xml'
        );
        parent::__construct();  
        $this->product = new DboProduct();
        $this->sitemap = new vsc_sitemapxml($seoOption);
    }
    
    
    function index() {
        global $login, $lang;
        $out = array();
        $status = isset($_GET['status']) ? $_GET['status'] : -1;
        $page_id = isset($_GET['page_id']) ? $_GET['page_id'] : 0;
        $cate_id = isset($_GET['cat'])?intval($_GET['cat']):-1;
        $out['filter_status']= $this->help->get_select_from_array($this->help->a_status, $status, 'Trạng thái');
        $out['filter_keyword'] = isset($_GET['key']) ? $_GET['key'] : "";
        $out['filter_category'] = $this->taxonomy->get_select_taxonomy_tree('product', $cate_id, 0, null, 'Không có danh mục');
        $out['page_id'] = $page_id;
        
        $where = "1=1";
        if($status!=-1) $where.=" AND a.status = $status";
        if(isset($_GET['key']) && $_GET['key'] != "") $where .= " AND (a.name LIKE '%".$_GET['key']."%' OR a.code LIKE '%".$_GET['key']."%')";
        if(isset($_GET['cat']) && intval($_GET['cat']) != 0) $where .= " AND a.taxonomy_id=".intval($_GET['cat']);
        if($page_id!=0) $where .= " AND a.page_id=$page_id";
        if($cate_id != -1){
            if($cate_id==0){
                $where .= " AND a.taxonomy_id=0";
            }else{
                $where .= " AND a.taxonomy_id IN (SELECT id FROM taxonomy WHERE type='product'
                AND (lft BETWEEN (SELECT lft FROM taxonomy WHERE id=$cate_id) AND (SELECT rgt FROM taxonomy WHERE id=$cate_id))
                ORDER BY lft)";
            }
        }
        $sql = "SELECT a.id,a.name,a.code,a.images,a.status,a.created,a.featured,ad.name AS admin,
				(SELECT t.name FROM taxonomy t WHERE t.id=a.taxonomy_id) AS category,
				(SELECT b.name FROM pages b WHERE b.id=a.page_id) AS page,
				(SELECT p.price FROM productprices p WHERE a.id=p.product_id ORDER BY p.price LIMIT 1) AS price,
                (SELECT u.name FROM users u WHERE u.id=a.user_id) AS user_name
				FROM products a LEFT JOIN useradmin ad ON ad.id=a.admin_id WHERE $where ORDER BY a.created DESC";
        $paging = new vsc_pagination($this->pdo->count_item('products', $where), 50);
        $sql = $paging->get_sql_limit($sql);
        $stmt = $this->pdo->conn->prepare($sql);
        $stmt->execute();
        $result = array();
        while ($item = $stmt->fetch()) {
            $a_images = explode(";", $item['images']);
            $item ['avatar'] = $this->img->get_image($this->product->get_folder_img($item['id']), @$a_images[0]);
            //$item ['url'] = DOMAIN."?mod=product&site=detail&pid=".$item['id'];
            $item['url']=$this->product->get_url($item['id'], $this->str->str_convert($item['name']));
            $item ['status'] = $this->help_get_status($item ['status'], 'products', $item['id']);
            $item ['featured'] = $this->help_get_featured($item['featured'], 'products', $item['id']);
            $result [] = $item;
        }
        $this->smarty->assign("result", $result);
        
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_DEFAULT);
    }

    
    function showcase() {
        $out = array();
        $status = isset($_GET['status']) ? $_GET['status'] : -1;
        $page_id = isset($_GET['page_id']) ? $_GET['page_id'] : 0;
        $cate_id = isset($_GET['cat'])?intval($_GET['cat']):-1;
        $out['filter_status']= $this->help->get_select_from_array($this->help->a_status, $status, 'Trạng thái');
        $out['filter_keyword'] = isset($_GET['key']) ? $_GET['key'] : "";
        $out['filter_category'] = $this->taxonomy->get_select_taxonomy_tree('product', $cate_id, 0, null, 'Không có danh mục');
        $out['page_id'] = $page_id;
        
        $where = "a.ismain=1";
        if($status!=-1) $where.=" AND a.status = $status";
        if(isset($_GET['key']) && $_GET['key'] != "") $where .= " AND (a.name LIKE '%".$_GET['key']."%' OR a.code LIKE '%".$_GET['key']."%')";
        if(isset($_GET['cat']) && intval($_GET['cat']) != 0) $where .= " AND a.taxonomy_id=".intval($_GET['cat']);
        if($page_id!=0) $where .= " AND a.page_id=$page_id";
        if($cate_id != -1){
            if($cate_id==0){
                $where .= " AND a.taxonomy_id=0";
            }else{
                $where .= " AND a.taxonomy_id IN (SELECT id FROM taxonomy WHERE type='product'
                AND (lft BETWEEN (SELECT lft FROM taxonomy WHERE id=$cate_id) AND (SELECT rgt FROM taxonomy WHERE id=$cate_id))
                ORDER BY lft)";
            }
        }
        $sql = "SELECT a.id,a.name,a.code,a.images,a.status,a.created,a.featured,ad.name AS admin,
				(SELECT t.name FROM taxonomy t WHERE t.id=a.taxonomy_id) AS category,
				(SELECT b.name FROM pages b WHERE b.id=a.page_id) AS page,
				(SELECT p.price FROM productprices p WHERE a.id=p.product_id ORDER BY p.price LIMIT 1) AS price,
                (SELECT u.name FROM users u WHERE u.id=a.user_id) AS user_name
				FROM products a LEFT JOIN useradmin ad ON ad.id=a.admin_id WHERE $where ORDER BY a.created DESC";
        $paging = new vsc_pagination($this->pdo->count_item('products', $where), 50);
        $sql = $paging->get_sql_limit($sql);
        $stmt = $this->pdo->conn->prepare($sql);
        $stmt->execute();
        $result = array();
        while ($item = $stmt->fetch()) {
            $a_images = explode(";", $item['images']);
            $item ['avatar'] = $this->img->get_image($this->product->get_folder_img($item['id']), @$a_images[0]);
            $item ['url'] = DOMAIN."?mod=product&site=detail&pid=".$item['id'];
            $item ['status'] = $this->help_get_status($item ['status'], 'products', $item['id']);
            $item ['featured'] = $this->help_get_featured($item['featured'], 'products', $item['id']);
            $result [] = $item;
        }
        $this->smarty->assign("result", $result);
        
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function form(){
        global $login, $lang;
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        
        if(isset($_POST['submit'])){
            $data['name'] = trim(@$_POST['name']);
            $data['taxonomy_id'] = intval(@$_POST['taxonomy_id']);
            $data['code'] = trim(@$_POST['code']);
            $data['trademark'] = trim(@$_POST['trademark']);
            $data['ability'] = trim(@$_POST['ability']);
            $data['ordertime'] = trim(@$_POST['ordertime']);
            $data['minorder'] = intval(@$_POST['minorder']);
            $data['unit_id'] = intval(@$_POST['unit_id']);
            $data['description'] = trim(@$_POST['description']);
            $data['package'] = trim(@$_POST['package']);
            $data['qa'] = trim(@$_POST['qa']);
            $data['created'] = time();
            $data['admin_id'] = $login;
            
            if(isset($_POST['key']) && is_array($_POST['key'])){
                $a_key = array();
                foreach ($_POST['key'] AS $k=>$item){
                    if(strlen($item)>2) $a_key[] = $this->product->get_keyword_id($item);
                }
                $data['keyword'] = implode(",", $a_key);
            }
            
            if($this->pdo->update('products', $data, "id=".$id)){
                unset($data);
                $content = array('id'=>$id, 'name'=>trim(@$_POST['name']));
                $this->savetablechangelogs('edit', 'products', $content);
                ##Gửi email
                $mail_to = array(
                    'TO' => array('admin@daisan.vn'),
                    'CC' => array('cntt.dsc@daisan.vn'),
                    'BCC' => array('chungit.dsc@daisan.vn')
                );
                $user = $this->pdo->fetch_one("SELECT name FROM useradmin WHERE id =$login");
                $mail_title = "[".$user['name']."] Edit ".$_POST['name'];
                $mail_content = null;
                $mail_content .= DOMAIN."?mod=product&site=detail&pid=$id";
                send_mail($mail_to,"New Product" , $mail_title, $mail_content); 
//                 $user = $this->pdo->fetch_one("SELECT name FROM useradmin WHERE id =$login");
//                 $email = 'chungit.dsc@daisan.vn';
//                 $mail_title = "[".$user['name']."] Edit ".$_POST['name'];
//                 $mail_content = null;
//                 $mail_content .= DOMAIN."?mod=product&site=detail&pid=$id";
//                 $this->send_mail($email, $mail_title, $mail_content);
                
            }
            $service_detail = isset($_SESSION['service_add_detail'])?$_SESSION['service_add_detail']:array();
            $this->pdo->query("DELETE FROM productmetas WHERE product_id=$id");
            foreach ($service_detail AS $item){
                if(trim($item['key'])!=null && trim($item['value'])!=null){
                    $data['meta_key'] = trim($item['key'],":");
                    $data['meta_value'] = trim($item['value'],":");
                    $data['product_id'] = $id;
                    $this->pdo->insert('productmetas', $data);
                    unset($data);
                }
            }
            unset($_SESSION['service_add_detail']);
            
            $service_price = isset($_SESSION['service_add_price'])?$_SESSION['service_add_price']:array();
            $this->pdo->query("DELETE FROM productprices WHERE product_id=$id");
            foreach ($service_price AS $item){
                if(trim($item['key'])!=null && trim($item['value'])!=null){
                    $data['version'] = $item['key'];
                    $data['price'] = $this->string->convert_money_to_int($item['value']);
                    $data['product_id'] = $id;
                    $this->pdo->insert('productprices', $data);
                    unset($data);
                }
            }
            unset($_SESSION['service_add_price']);
            
            lib_redirect("?mod=product&site=index");
        }
        
        $product = $this->pdo->fetch_one("SELECT * FROM products WHERE id=$id");
        $product['folder'] = URL_UPLOAD.$this->product->get_folder_img($id);
        $a_image = strlen($product['images'])>30 ? explode(";", $product['images']) : array();
        for ($i=0; $i<6; $i++){
            if(isset($a_image[$i]) && is_file($this->product->get_folder_img_upload($id).$a_image[$i])){
                $a_image_show[$i] = $this->img->get_image($this->product->get_folder_img($id), $a_image[$i]);
            }else{
                $a_image_show[$i] = NO_IMG;
                unset($a_image[$i]);
            }
        }
        $product['images'] = implode(";", $a_image);
        $product['s_unit'] = $this->taxonomy->get_select_taxonomy('product_unit', @$product['unit_id'], 0, null, 'Chọn đơn vị');
        $keywords = $this->pdo->fetch_array_field('keywords', 'name', "id IN (".($product['keyword']==null?0:$product['keyword']).")");
        $this->smarty->assign('keywords', $keywords);
        
        
        $productmetas = $this->pdo->fetch_all("SELECT meta_key,meta_value FROM productmetas WHERE product_id=$id ORDER BY id");
        $_SESSION['service_add_detail'] = array();
        foreach ($productmetas AS $k=>$item){
            $_SESSION['service_add_detail'][$k]['key'] = $item['meta_key'];
            $_SESSION['service_add_detail'][$k]['value'] = $item['meta_value'];
        }
        
        $productprices = $this->pdo->fetch_all("SELECT version,price FROM productprices WHERE product_id=$id ORDER BY id");
        $_SESSION['service_add_price'] = array();
        foreach ($productprices AS $k=>$item){
            $_SESSION['service_add_price'][$k]['key'] = $item['version'];
            $_SESSION['service_add_price'][$k]['value'] = number_format($item['price']);
        }
        
        if($product['taxonomy_id']!==0){
            $tid_1 = $this->taxonomy->get_biggest_parent('product', @$product['taxonomy_id']);
            $taxonomy = $this->pdo->fetch_one("SELECT id,parent,level FROM taxonomy WHERE type='product' AND id=". @$product['taxonomy_id']);
            if($taxonomy && @$taxonomy['parent']!=0){
                $tid_2 = $taxonomy['parent'];
                $tid_3 = $taxonomy['id'];
            }
        }
        $out['select_category'] = $this->taxonomy->get_select_taxonomy('product', @$tid_1, 0, null, 'Chọn danh mục sản phẩm');
        $out['select_category_sub1'] = '';
        $out['select_category_sub2'] = '';
        if(isset($tid_2) && $tid_2!=0)
            $out['select_category_sub1'] = $this->taxonomy->get_select_taxonomy('product', @$tid_2, @$tid_1, null, 'Chọn danh mục sản phẩm');
        if(isset($tid_3) && $tid_3!=0)
            $out['select_category_sub2'] = $this->taxonomy->get_select_taxonomy('product', @$tid_3, @$tid_2, null, 'Chọn danh mục sản phẩm');
                
         $out['id'] = $id;
         $this->smarty->assign('out', $out);
                
        $json_keywords = @file_get_contents(FILE_KEYWORDS);
        $this->smarty->assign('json_keywords', $json_keywords);
        $this->smarty->assign('a_image_show', $a_image_show);
        $this->smarty->assign('product', $product);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function load_details(){
        $service_add_detail = isset($_SESSION['service_add_detail'])?$_SESSION['service_add_detail']:array();
        $service_add_detail = @array_values($service_add_detail);
        $_SESSION['service_add_detail'] = $service_add_detail;
        
        $out['number'] = count($service_add_detail);
        $this->smarty->assign('result', $service_add_detail);
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_NONE);
    }
    
    
    function load_prices(){
        $service_add_price = isset($_SESSION['service_add_price'])?$_SESSION['service_add_price']:array();
        $service_add_price = @array_values($service_add_price);
        $_SESSION['service_add_price'] = $service_add_price;
        
        $out['number'] = count($service_add_price);
        $this->smarty->assign('result', $service_add_price);
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_NONE);
    }
    
    function ajax_handle(){
        if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='upload_images'){
            $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
            $product = $this->pdo->fetch_one("SELECT a.images FROM products a WHERE a.id=$id");
            $a_image = strlen($product['images'])>30 ? explode(";", $product['images']) : array();
            for ($i=0; $i<6; $i++){
                if(isset($a_image[$i]) && is_file($this->product->get_folder_img_upload($id).$a_image[$i])){
                    $a_image_show[$i] = $this->img->get_image($this->product->get_folder_img($id), $a_image[$i]);
                }else{
                    $a_image_show[$i] = NO_IMG;
                    unset($a_image[$i]);
                }
            }
            
            $upload = $this->img->upload_image_base64($this->product->get_folder_img($id), @$_POST['img'], null, 800, 1);
            $a_image[] = $upload;
            $data['images'] = implode(";", $a_image);
            $this->pdo->update('products', $data, "id=$id");
            $content = array('id'=>$id, 'image'=>$upload);
            $this->savetablechangelogs('edit', 'products', $content);
            echo $upload;
            exit();
        }elseif(isset($_POST['ajax_action']) && $_POST['ajax_action']=='remove_images'){
            $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
            $product = $this->pdo->fetch_one("SELECT a.images FROM products a WHERE a.id=$id");
            $a_image = strlen($product['images'])>30 ? explode(";", $product['images']) : array();
            for ($i=0; $i<6; $i++){
                if(isset($a_image[$i]) && is_file($this->product->get_folder_img_upload($id).$a_image[$i])){
                    $a_image_show[$i] = $this->img->get_image($this->product->get_folder_img($id), $a_image[$i]);
                }else{
                    $a_image_show[$i] = NO_IMG;
                    unset($a_image[$i]);
                }
            }
            @unlink($this->product->get_folder_img_upload($id).@$_POST['imgname']);
            foreach ($a_image AS $k=>$item){
                if(!is_file($this->product->get_folder_img_upload($id).$item)) unset($a_image[$k]);
            }
            $data['images'] = implode(";", $a_image);
            $this->pdo->update('products', $data, "id=$id");
            $content = array('id'=>$id, 'image'=>'remove image');
            $this->savetablechangelogs('edit', 'products', $content);
            exit();
        }elseif(isset($_POST['ajax_action']) && $_POST['ajax_action']=='load_category'){
            $rt = $this->taxonomy->get_select_taxonomy('product', 0, @$_POST['id'], null, 'Chọn danh mục sản phẩm');
            echo $rt;
            exit();
        }elseif(isset($_POST['ajax_action']) && $_POST['ajax_action']=='set_taxonomy_multi_product'){
            $ids = isset($_POST['ids'])?$_POST['ids']:array();
            $taxonomy_id = isset($_POST['taxonomy_id'])?$_POST['taxonomy_id']:0;
            $rt = 0;
            if($taxonomy_id!=0 && count($ids)>0){
                $data = array();
                $data['taxonomy_id'] = $taxonomy_id;
                $this->pdo->update('products', $data, "id IN (".implode(',', $ids).")");
                $rt = 1;
            }
            echo $rt; exit();
        }else if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='add_detail'){
            $service_add_detail = isset($_SESSION['service_add_detail'])?$_SESSION['service_add_detail']:array();
            $number = count($service_add_detail);
            $rt['code'] = 1;
            if($number>14){
                $rt['code'] = 0;
                $rt['msg'] = "Đã vượt quá nội dung cho phép.";
            }else{
                $_SESSION['service_add_detail'][$number+1]['key'] = "";
                $_SESSION['service_add_detail'][$number+1]['value'] = "";
            }
            echo json_encode($rt);
            exit();
        }else if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='set_detail'){
            $_SESSION['service_add_detail'][$_POST['id']][$_POST['type']] = trim($_POST['value']);
            exit();
        }else if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='delete_detail'){
            unset($_SESSION['service_add_detail'][$_POST['id']]);
            exit();
        }else if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='sort_detail'){
            $id = isset($_POST['id']) ? intval($_POST['id']) : -1;
            $type = isset($_POST['type']) ? trim($_POST['type']) : 'up';
            $me = $_SESSION['service_add_detail'][$id];
            if($type=='up'){
                $up = $_SESSION['service_add_detail'][$id-1];
                $_SESSION['service_add_detail'][$id-1] = $me;
                $_SESSION['service_add_detail'][$id] = $up;
            }else{
                $up = $_SESSION['service_add_detail'][$id+1];
                $_SESSION['service_add_detail'][$id+1] = $me;
                $_SESSION['service_add_detail'][$id] = $up;
            }
        }
        
        
        else if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='add_price'){
            $service_add_price = isset($_SESSION['service_add_price'])?$_SESSION['service_add_price']:array();
            $number = count($service_add_price);
            $rt['code'] = 1;
            if($number>10){
                $rt['code'] = 0;
                $rt['msg'] = "Bạn chỉ được phép đưa tối đa 6 nội dung.";
            }else{
                $_SESSION['service_add_price'][$number+1]['key'] = "";
                $_SESSION['service_add_price'][$number+1]['value'] = "";
            }
            echo json_encode($rt);
            exit();
        }else if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='set_price'){
            $_SESSION['service_add_price'][$_POST['id']][$_POST['type']] = trim($_POST['value']);
            exit();
        }else if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='delete_price'){
            unset($_SESSION['service_add_price'][$_POST['id']]);
            exit();
        }else if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='sort_price'){
            $id = isset($_POST['id']) ? intval($_POST['id']) : -1;
            $type = isset($_POST['type']) ? trim($_POST['type']) : 'up';
            $me = $_SESSION['service_add_price'][$id];
            if($type=='up'){
                $up = $_SESSION['service_add_price'][$id-1];
                $_SESSION['service_add_price'][$id-1] = $me;
                $_SESSION['service_add_price'][$id] = $up;
            }else{
                $up = $_SESSION['service_add_price'][$id+1];
                $_SESSION['service_add_price'][$id+1] = $me;
                $_SESSION['service_add_price'][$id] = $up;
            }
        }
        
    }
    
    function set_mail_content(){
        $id = isset($_GET['id'])?intval($_GET['id']):0;
        $rfq = $this->pdo->fetch_one("SELECT a.title,a.description,a.number,a.price,a.created,
                un.name AS unit,u.name AS user,l.name AS location
                FROM rfq a LEFT JOIN taxonomy un ON un.id=a.unit_id LEFT JOIN users u ON u.id=a.user_id
                    LEFT JOIN locations l ON l.id=a.location_id
                WHERE a.id=$id");
        $rfq['url'] = URL_SOURCING.'?site=rfq_detail&id='.$id;
        $this->smarty->assign('data', $rfq);
        $this->smarty->display(LAYOUT_NONE);
    }
    
    function productmetas(){
        global $login, $lang;
        
        if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='load_metas'){
            $metas = $this->pdo->fetch_one("SELECT meta_key,meta_value FROM taxonomymetas WHERE id=".intval($_POST['id']));
            echo json_encode($metas);
            exit();
        }elseif(isset($_POST['ajax_action']) && $_POST['ajax_action']=='save_metas'){
            $data['meta_key'] = trim($_POST['meta_key']);
            $data['meta_value'] = 1;
            $data['taxonomy_id'] = intval($_POST['taxonomy_id']);
            $rt['code'] = 0;
            if($this->pdo->check_exist("SELECT 1 FROM taxonomymetas WHERE taxonomy_id=".$data['taxonomy_id']." AND meta_key='".$data['meta_key']."'")){
                $rt['msg'] = "Thuộc tính trùng lặp";
            }else{
                $id = intval(@$_POST['id']);
                if($id==0) $id = $this->pdo->insert('taxonomymetas', $data);
                else $this->pdo->update('taxonomymetas', $data, "id=$id");
                $rt['code'] = 1;
                $rt['msg'] = 'Lưu thông tin thành công';
            }
            echo json_encode($rt); exit();
        }
        
        $cat_l0 = isset($_GET['cat_l0'])?intval($_GET['cat_l0']):0;
        $cat_l1 = isset($_GET['cat_l1'])?intval($_GET['cat_l1']):0;
        $cat_l2 = isset($_GET['cat_l2'])?intval($_GET['cat_l2']):0;
        if(!$this->pdo->check_exist("SELECT 1 FROM taxonomy WHERE id=$cat_l2 AND parent=$cat_l1"))
            $cat_l2 = 0;
            
            $result = $this->pdo->fetch_all("SELECT id,meta_key,meta_value FROM taxonomymetas WHERE taxonomy_id=$cat_l2");
            
            $out['s_cat_l0'] = $this->taxonomy->get_select_taxonomy('product', $cat_l0);
            $out['s_cat_l1'] = $this->taxonomy->get_select_taxonomy('product', $cat_l1, -1);
            if($cat_l0!=0) $out['s_cat_l1'] = $this->taxonomy->get_select_taxonomy('product', $cat_l1, $cat_l0);
            $out['s_cat_l2'] = $this->taxonomy->get_select_taxonomy('product', $cat_l2, -1);
            if($cat_l0!=0 && $cat_l1!=0) $out['s_cat_l2'] = $this->taxonomy->get_select_taxonomy('product', $cat_l2, $cat_l1);
            $out['taxonomy_id'] = $cat_l2;
            $this->smarty->assign('out', $out);
            
            $this->smarty->assign("result", $result);
            $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    
    function ads(){
        global $login, $lang;
        $out = array();
        $status = isset($_GET['status']) ? $_GET['status'] : -1;
        $page_id = isset($_GET['page_id']) ? $_GET['page_id'] : 0;
        $campaign_id = isset($_GET['campaign_id']) ? $_GET['campaign_id'] : 0;
        $out['filter_status']= $this->help->get_select_from_array($this->help->a_status, $status, 'Trạng thái');
        $out['filter_keyword'] = $k = isset($_GET['key']) ? $_GET['key'] : "";
        $where = "1=1";
        $out['url'] = "?mod=product&site=ads";
        if($status!=-1){
            $where.=" AND a.status=$status";
            $out['url'] .= "&status=".$status;
        }
        if($k!=""){
            $where .= " AND (p.name LIKE '%$k%' OR c.name LIKE '%$k%' OR b.name LIKE '%$k%')";
            $out['url'] .= "&key=$k";
        }
        if($page_id!=0){
            $where.=" AND a.page_id=$page_id";
            $out['url'] .= "&page_id=".$page_id;
        }
        if($campaign_id!=0){
            $where.=" AND a.campaign_id=$campaign_id";
            $out['url'] .= "&campaign_id=".$campaign_id;
        }
        
        $sql = "SELECT a.*,p.name,p.images,c.name AS campaign_name,b.name AS page_name
                FROM adsproducts a
                LEFT JOIN products p ON p.id=a.product_id
                LEFT JOIN adscampaign c ON c.id=a.campaign_id
                LEFT JOIN pages b ON b.id=a.page_id
                WHERE p.status=1 AND c.status=1 AND b.status=1 AND $where ORDER BY a.id DESC";
        $paging = new vsc_pagination($this->pdo->count_rows($sql), 20);
        $sql = $paging->get_sql_limit($sql);
        $result = $this->pdo->fetch_all($sql);
        foreach ($result AS $k=>$item){
            $result[$k]['avatar'] = $this->product->get_avatar($item['product_id'], $item['images']);
            $result[$k]['status'] = $this->help->get_btn_status($item['status'], 'adsproducts', $item['id']);
        }
        $this->smarty->assign("result", $result);
        
        $out['s_position'] = $this->help->get_select_from_array($this->product->ad_position);
        $this->smarty->assign('out', $out);
        
        $json_keywords = @file_get_contents(FILE_KEYWORDS);
        $this->smarty->assign('json_keywords', $json_keywords);
        
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    function order() {
        global $login, $lang;
        $out = array ();
        if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='change_status'){
            $id = intval(@$_POST['id']);
            $order = $this->pdo->fetch_one("SELECT status FROM productorders WHERE id=$id AND page_id=".$this->page_id);
            $rt['code'] = 0;
            if(!$order){
                $rt['msg'] = 'Xảy ra lỗi, vui lòng thử lại';
            }elseif($order['status']==4){
                $rt['msg'] = 'Đơn hàng đã được xử lý từ phía người dùng';
            }else{
                $data['status'] = $_POST['status'];
                $data['updated'] = time();
                $this->pdo->update('productorders', $data, "id=$id AND page_id=".$this->page_id);
                $rt['msg'] = 'Cập nhật đơn hàng thành công';
            }
            echo json_encode($rt);
            exit();
            
            $id = intval(@$_POST['id']);
            $data['status'] = $_POST['status'];
            $data['updated'] = time();
            $this->pdo->update('productorders', $data, "id=$id AND page_id=".$this->page_id);
            exit();
        }elseif(isset($_POST['ajax_action']) && $_POST['ajax_action']=='load_content'){
            $id = intval(@$_POST['id']);
            $order = $this->pdo->fetch_one("SELECT * FROM productorders WHERE id=$id");
            echo json_encode($order);
            exit();
        }elseif(isset($_POST['ajax_action']) && $_POST['ajax_action']=='save_content'){
            $id = intval(@$_POST['id']);
            $data['customer'] = trim($_POST['customer']);
            $data['phone'] = trim($_POST['phone']);
            $data['email'] = trim($_POST['email']);
            $data['address'] = trim($_POST['address']);
            $data['description'] = trim($_POST['description']);
            $this->pdo->update('productorders', $data, "id=$id AND page_id=".$this->page_id);
            exit();
        }
        
        $key = isset($_GET['key'])?$_GET['key']:null;
        $status = isset($_GET['status'])?$_GET['status']:-1;
        
        $where = "1=1";
        if($key!=null) $where .= " AND a.customer LIKE '%$key%'";
        if($status!=-1) $where .= " AND a.status=$status";
        
        $sql = "SELECT a.id,a.created,a.updated,a.customer,a.phone,a.email,a.address,a.description,a.status,a.page_id,
                (SELECT SUM(b.price*b.number) FROM productorderitems b WHERE a.id=b.order_id) AS totalmoney
                FROM productorders a WHERE $where ORDER BY a.id DESC";
        $paging = new vsc_pagination($this->pdo->count_item('productorders', $where), 20);
        $sql = $paging->get_sql_limit($sql);
        
        $result = $this->pdo->fetch_all($sql);
        foreach ($result AS $k=>$item){
            $result[$k]['code'] = "#OID".$item['page_id'].$item['id'];
            $result[$k]['status_btn'] = $this->get_status_btn($item['id'], $item['status']);
            
        }
        $this->smarty->assign('result', $result);
        
        $out['select_status'] = $this->help->get_select_from_array($this->product->order_status, $status, "Chọn trạng thái");
        $out['key'] = $key;
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    function get_status_btn($id, $status){
        $status_name = $this->product->order_status[$status];
        $status_class = "btn-outline-primary dropdown-toggle";
        if($status==1||$status==2) $status_class = "btn-outline-warning dropdown-toggle";
        elseif($status==3) $status_class = "btn-outline-success";
        elseif($status==4||$status==5) $status_class = "btn-outline-danger";
        
        $str = "<div class=\"btn-group\">";
        $str .= "<button type=\"button\" class=\"btn btn-sm $status_class\" ";
        if($status!=3&&$status!=4&&$status!=5)
            $str .= "data-toggle=\"dropdown\"";
            $str .= ">";
            $str .= $this->product->order_status[$status];
            if($status!=3&&$status!=4&&$status!=5){
                $str .= "<div class=\"dropdown-menu\">";
                if($status==0)
                    $str .= "<a class=\"dropdown-item\" href=\"#\" onclick=\"ChangeStatus($id, 1);\">Đang xử lý</a>";
                    if($status==0||$status==1)
                        $str .= "<a class=\"dropdown-item\" href=\"#\" onclick=\"ChangeStatus($id, 2);\">Giao hàng</a>";
                        if($status==2){
                            $str .= "<a class=\"dropdown-item\" href=\"#\" onclick=\"ChangeStatus($id, 3);\">Thành công</a>";
                            $str .= "<a class=\"dropdown-item\" href=\"#\" onclick=\"ChangeStatus($id, 5);\">Trả lại</a>";
                        }
                        $str .= "</div>";
            }
            $str .= "</button>";
            $str .= "</div>";
            return $str;
    }
    function export_file_xml(){
        $status = isset($_POST['status']) ? $_POST['status'] : -1;
        $cate_id = isset($_POST['cat'])?intval($_POST['cat']):-1;
        $where = "1=1";
        if($status!=-1) $where.=" AND a.status=$status";
        $cate_id = isset($_POST['cat'])?intval($_POST['cat']):-1;
        if($cate_id != -1){
            if($cate_id==0){
                $where .= " AND a.taxonomy_id=0";
            }else{
                $where .= " AND a.taxonomy_id IN (SELECT id FROM taxonomy WHERE type='product'
                AND (lft BETWEEN (SELECT lft FROM taxonomy WHERE id=$cate_id) AND (SELECT rgt FROM taxonomy WHERE id=$cate_id))
                ORDER BY lft)";
            }
        }
        $limit= $_POST['number'];
        $sql = "SELECT a.id,a.name,a.created
				FROM products a WHERE $where ORDER BY a.created DESC";
        if($limit !="") $sql.=" LIMIT $limit";
        file_put_contents('product.txt',$sql);
        $stmt = $this->pdo->conn->prepare($sql);
        $stmt->execute();
        $result = array();
        while ($item = $stmt->fetch()) {
            $item ['loc'] = $this->product->get_url($item['id'], $item['name']);
            $item['lastmod']=gmdate("Y-m-d", $item['created']+7*3600);
            $item['priority']=0.80;
            unset($item['id']);
            unset($item['name']);
            unset($item['created']);
            $result [] = $item;
            
        }
        $this->sitemap->generateXML($result);
        $this->sitemap->finishGenerateXML();
    }
    /** =========================================================================== */
    /** =========================================================================== */
    
    function ajax_delete() {
        global $login, $lang;
        $id = isset($_POST ['Id']) ? intval($_POST ['Id']) : 0;
        $rt['code'] = 0;
        $rt['msg'] = "Không xóa được nội dung";
        if($this->pdo->check_exist("SELECT 1 FROM products WHERE id=$id")){
            $product = $this->pdo->fetch_one("SELECT id,name,images FROM products WHERE id=$id");
            
            $a_images = explode(";", @$product['images']);
            $folder = $this->product->get_folder_img_upload(@$product['id']);
            foreach ($a_images AS $item){
                @unlink($folder.$item);
            }
            ##Gửi email
            $mail_to = array(
                'TO' => array('admin@daisan.vn'),
                'CC' => array('cntt.dsc@daisan.vn'),
                'BCC' => array('chungit.dsc@daisan.vn')
            );
            $user = $this->pdo->fetch_one("SELECT name FROM useradmin WHERE id =$login");
            $mail_title = "[".$user['name']."] Xóa sản phẩm ".$product['name'];
            $mail_content = "Sản phẩm ".$product['name']." vừa bị xóa khỏi hệ thống Daisan.vn.";
            send_mail($mail_to,"Delete Product" , $mail_title, $mail_content);    
            
            $this->pdo->query("DELETE FROM productmetas WHERE product_id=$id");
            $this->pdo->query("DELETE FROM productprices WHERE product_id=$id");
            $this->pdo->query("DELETE FROM products WHERE id=$id");
            $content = array('id'=>$id, 'name'=>$product['name']);
            $this->savetablechangelogs('deleted', 'products', $content);
            
            $rt['code'] = 1;
            $rt['msg'] = "Xóa thông tin sản phẩm thành công.";
        }
        echo json_encode($rt);
    }
    
    function ajax_delete_multi() {
        global $login;
        $ids = isset($_POST ['id']) ? $_POST ['id'] : 0;
        $deleted_arr = array();
        $notdeleted_arr = array();
        $deleted_id = array();
        
        foreach (explode(',', $ids) AS $id) {
            if(!$this->pdo->check_exist('SELECCT 1 FROM productorderitems WHERE product_id='.$id)){
                $product = $this->pdo->fetch_one("SELECT id,name,images FROM products WHERE id=$id");
                
                $a_images = explode(";", @$product['images']);
                $folder = $this->product->get_folder_img_upload(@$product['id']);
                foreach ($a_images AS $item){
                    @unlink($folder.$item);
                }
                $this->pdo->query("DELETE FROM productmetas WHERE product_id=$id");
                $this->pdo->query("DELETE FROM productprices WHERE product_id=$id");
                $this->pdo->query("DELETE FROM productfavorites WHERE product_id=$id");
                $this->pdo->query("DELETE FROM products WHERE id=$id");
                
                $content = array('id'=>$id, 'name'=>$product['name']);
                $this->savetablechangelogs('deleted', 'products', $content);
                
                array_push($deleted_arr, $product['name']);
                array_push($deleted_id, $product['id']);
                
                ##Gửi email
                $mail_to = array(
                    'TO' => array('admin@daisan.vn'),
                    'CC' => array('cntt.dsc@daisan.vn'),
                    'BCC' => array('chungit.dsc@daisan.vn')
                );
                $user = $this->pdo->fetch_one("SELECT name FROM useradmin WHERE id =$login");
                $mail_title = "[".$user['name']."] Xóa một danh sách sản phẩm";
                $mail_content = "Một danh sách sản phẩm vừa bị xóa khỏi hệ thống Daisan.vn.";
                send_mail($mail_to,"Delete List Product" , $mail_title, $mail_content); 
            }else{
                array_push($notdeleted_arr, $product['name']);
            }
        }
        
        $data = array();
        $data['deleted'] = implode('<br>', $deleted_arr);
        $data['notdeleted'] = implode('<br>', $notdeleted_arr);
        $data['deleted_id'] = implode('-', $deleted_id);
        
        echo json_encode($data);
    }
    
    
    function ajax_delete_showcase() {
        $ids = isset($_POST ['id']) ? $_POST ['id'] : 0;
        $deleted_arr = array();
        $notdeleted_arr = array();
        $deleted_id = array();
        
        foreach (explode(',', $ids) AS $id) {
            if(!$this->pdo->check_exist('SELECCT 1 FROM productorderitems WHERE product_id='.$id)){
                $product = $this->pdo->fetch_one("SELECT id,name,images FROM products WHERE id=$id");
                $this->pdo->query("UPDATE products SET ismain=0 WHERE id=$id");
                
                array_push($deleted_arr, $product['name']);
                array_push($deleted_id, $product['id']);
            }else{
                array_push($notdeleted_arr, $product['name']);
            }
        }
        
        $data = array();
        $data['deleted'] = implode('<br>', $deleted_arr);
        $data['notdeleted'] = implode('<br>', $notdeleted_arr);
        $data['deleted_id'] = implode('-', $deleted_id);
        
        echo json_encode($data);
    }
    
    
    function ajax_delete_meta() {
        $id = isset($_POST ['Id']) ? intval($_POST ['Id']) : 0;
        $rt['code'] = 0;
        $rt['msg'] = "Không xóa được nội dung";
        if($this->pdo->check_exist("SELECT 1 FROM taxonomymetas WHERE id=$id")){
            $this->pdo->query("DELETE FROM taxonomymetas WHERE id=$id");
            $rt['code'] = 1;
            $rt['msg'] = "Xóa thông tin sản phẩm thành công.";
        }
        echo json_encode($rt);
    }
    
    
    function ajax_export_metas(){
        $taxonomy = $this->pdo->fetch_array_field('taxonomy', 'id', "type='product' AND level=2");
        $result = array();
        
        foreach ($taxonomy AS $item){
            $result[$item] = array();
            $metas = $this->pdo->fetch_all("SELECT b.taxonomy_id,a.meta_key,COUNT(1) AS number
                FROM productmetas a LEFT JOIN products b ON b.id=a.product_id
                WHERE b.taxonomy_id=$item
                GROUP BY a.meta_key
                HAVING number>0
                ORDER BY number DESC LIMIT 10");
            foreach ($metas AS $ksub=>$itemsub){
                $result[$item][$ksub]['parent'] = $itemsub['meta_key'];
                
                $meta_keys = $this->pdo->fetch_all("SELECT a.meta_value,COUNT(1) AS number
                    FROM productmetas a LEFT JOIN products b ON b.id=a.product_id
                    WHERE b.taxonomy_id=$item AND a.meta_key='".$itemsub['meta_key']."'
                    GROUP BY a.meta_value
                    ORDER BY number DESC LIMIT 10");
                $a_meta_key = array();
                foreach ($meta_keys AS $item2){
                    $a_meta_key[] = $item2['meta_value'];
                }
                $result[$item][$ksub]['sub'] = $a_meta_key;
                
            }
            
        }
        lib_dump($result);
        
        $fp = fopen(FILE_INFO_METAS, 'w');
        fwrite($fp, json_encode($result));
        fclose($fp);
    }
    
    function move_image_to_newfolder() {
        $file_saved = @file_get_contents("../../constant/info/run_update_product.json");
        $ids = $file_saved?@json_decode($file_saved, true):array(0);
        
        $product = $this->pdo->fetch_all("SELECT id,images,page_id FROM products
                WHERE images!='' AND id NOT IN (".implode(",", $ids).") LIMIT 300");
        foreach ($product AS $item){
            $a_img = explode(";", $item['images']);
            foreach ($a_img AS $imgname){
                $folder = $this->page->get_folder_img_upload($item['page_id']);
                if(!is_dir($folder)){
                    @mkdir($folder, 0775);
                    @chmod($folder, 0775);
                }
                @copy($this->product->get_folder_img_upload($item['id']).$imgname, $folder.$imgname);
                @unlink($this->product->get_folder_img_upload($item['id']).$imgname);
            }
            $file_saved = @file_get_contents("../../constant/info/run_update_product.json");
            $a_saved = @json_decode($file_saved, true);
            $a_saved[] = $item['id'];
            @file_put_contents("../../constant/info/run_update_product.json", json_encode($a_saved));
        }
        var_dump($product);
        if(count($product)>0) lib_redirect();
        else exit();
    }
    
    function update_permis(){
        $pages = $this->pdo->fetch_all('SELECT id FROM pages');
        foreach ($pages AS $item){
            $folder = $this->page->get_folder_img_upload($item['id']);
            if(!is_dir($folder)) @mkdir($folder, 0775);
            @chmod($folder, 0775);
        }
    }
    
    function ajax_copy_product(){
        $ids = isset($_POST['ids'])?$_POST['ids']:array();
        $page_id = isset($_POST['page_id'])?$_POST['page_id']:0;
        $page = $this->pdo->check_exist('SELECT 1 FROM pages WHERE id='.$page_id);
        
        $rt = array();
        if(!$page){
            $rt['code'] = 0;
            $rt['msg'] = 'Gian hàng không tồn tại';
        }else{
            foreach ($ids AS $item){
                $this->copy_product($item, $page_id);
            }
            $rt['code'] = 1;
            $rt['msg'] = 'Sao chép sản phẩm thành công.';
        }
        echo json_encode($rt);
        exit();
    }
    
    
    function copy_product($id, $page_id){
        global $login;
        $product = $this->pdo->fetch_one("SELECT * FROM products WHERE id=$id AND page_id<>$page_id");
        $product_id = 0;
        if($product){
            $old_page_id = $product['page_id'];
            unset($product['id']);
            $product['created'] = time();
            $product['user_id'] = 0;
            $product['admin_id'] = 0;
            $product['views'] = 1;
            $product['score'] = 0;
            $product['page_id'] = $page_id;
            
            if($product_id = $this->pdo->insert('products', $product)){
                $productprices = $this->pdo->fetch_all("SELECT * FROM productprices WHERE product_id=$id ORDER BY id");
                foreach ($productprices AS $item){
                    $data = array();
                    $data['product_id'] = $product_id;
                    $data['version'] = $item['version'];
                    $data['price'] = $item['price'];
                    $this->pdo->insert('productprices', $data);
                }
                
                $productmetas = $this->pdo->fetch_all("SELECT * FROM productmetas WHERE product_id=$id ORDER BY id");
                foreach ($productmetas AS $item){
                    $data = array();
                    $data['product_id'] = $product_id;
                    $data['meta_key'] = $item['meta_key'];
                    $data['meta_value'] = $item['meta_value'];
                    $this->pdo->insert('productmetas', $data);
                }
                
                $a_img = explode(";", $product['images']);
                foreach ($a_img AS $imgname){
                    $folder = $this->page->get_folder_img_upload($page_id);
                    if(!is_dir($folder)) @mkdir($folder, 0775);
                    @chmod($folder, 0775);
                    @copy($this->page->get_folder_img_upload($old_page_id).$imgname, $folder.$imgname);
                }
                
            }
        }
        return intval($product_id);
    }
    
}