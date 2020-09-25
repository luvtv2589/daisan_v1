<?php

lib_use(LIB_HELP_PHPMAILER);

class Home extends Sourcing {
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
        $location = isset($_GET['location'])?intval($_GET['location']):0;
        $intime = isset($_GET['intime'])?intval($_GET['intime']):0;
        $cat_level_0 = isset($_GET['cat_level_0'])?intval($_GET['cat_level_0']):0;
        $cat_level_1 = isset($_GET['cat_level_1'])?intval($_GET['cat_level_1']):0;
        $cat_level_2 = isset($_GET['cat_level_2'])?intval($_GET['cat_level_2']):0;
        $min_number = isset($_GET['min_number'])?intval($_GET['min_number']):'';
        $max_number = isset($_GET['max_number'])?intval($_GET['max_number']):'';
        
        $where = "a.status=1";
        if($location!=0) $where .= " AND a.location_id=$location";
        if($cat_level_2!=0) $where .= " AND a.taxonomy_id=$cat_level_2";
        if($min_number!=0) $where .= " AND a.number>=$min_number";
        if($max_number!=0) $where .= " AND a.number<=$max_number";
        if($intime!=0) $where .= " AND a.created>=".(time()-$intime);
        
        $sql = "SELECT a.id,a.title,a.image,a.description,a.number,a.created,t.name AS unit,
                (SELECT t.name FROM taxonomy t WHERE t.id=a.taxonomy_id) AS taxonomy,
                (SELECT t.name FROM locations t WHERE t.id=a.location_id) AS location,
                (SELECT COUNT(1) FROM rfqquotations q WHERE a.id=q.rfq_id) AS number_quotation
                FROM rfq a LEFT JOIN taxonomy t ON a.unit_id=t.id WHERE $where ORDER BY a.id DESC";
        $out = array();
        $out['number'] = $this->pdo->count_item('rfq', $where);
        $paging = new vsc_pagination($out['number'], 20, 0);
        $sql = $paging->get_sql_limit($sql);
        $rfq = $this->pdo->fetch_all($sql);
        foreach ($rfq AS $k=>$item){
            $rfq[$k]['url'] = "?site=rfq_detail&id=".$item['id'];
            $rfq[$k]['avatar'] = $this->img->get_image($this->folder, $item['image']);
        }
        $this->smarty->assign('rfq', $rfq);
        
        $out['product_cate_lv0'] = $this->tax->get_select_taxonomy('product', $cat_level_0);
        $out['product_cate_lv1'] = $this->tax->get_select_taxonomy('product', $cat_level_1, -1);
        if($cat_level_0!=0) $out['product_cate_lv1'] = $this->tax->get_select_taxonomy('product', $cat_level_1, $cat_level_0);
        $out['product_cate_lv2'] = $this->tax->get_select_taxonomy('product', $cat_level_2, -1);
        if($cat_level_1!=0) $out['product_cate_lv2'] = $this->tax->get_select_taxonomy('product', $cat_level_2, $cat_level_1);
        $out['location'] = $this->help->get_select_location($location,0,'Chọn tỉnh thành');
        $out['intime'] = $intime;
        $out['min_number'] = $min_number;
        $out['max_number'] = $max_number;
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function createRfq(){
        global $login;
//         if ($login == 0)
//             lib_redirect(DOMAIN . "?mod=account&site=login");
            if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='save_rfq'){
                $rt = array();
                $rt['code'] = 0;
                if($login==0) $rt['msg'] = "Vui lòng đăng nhập trước khi thực hiện chức năng.";
                elseif(!is_numeric($_POST['number'])) $rt['msg'] = 'Vui lòng nhập số lượng chính xác.';
                else{
                    $data = array();
                    $data['user_id'] = $login;
                    $data['title'] = trim($_POST['title']);
                    $data['number'] = trim($_POST['number']);
                    $data['unit_id'] = intval($_POST['unit']);
                    $data['location_id'] = intval($_POST['location_id']);
                    $data['taxonomy_id'] = intval($_POST['taxonomy_id']);
                    $data['payment_method'] = intval($_POST['payment_method']);
                    $data['description'] = trim($_POST['description']);
                    //$data['price'] = $this->str->convert_money_to_int($_POST['price']);
                    $data['created'] = time();
                    $data['status'] = 1;
                    
                    $id = isset($_POST['id'])?intval($_POST['id']):0;
                    if($id==0){
                        //                     $id = $this->pdo->insert('rfq', $data);
                        //                     $mail_to = array(
                        //                         'TO' => array('admin@daisan.vn'),
                        //                         'CC' => array('cntt.dsc@daisan.vn'),
                        //                         'BCC' => array('nhamphongdaijsc@gmail.com', 'luctv2589@gmail.com','chungit.dsc@daisan.vn')
                        //                     );
                        //                     $mail_content = file_get_contents(URL_SOURCING.'?site=set_mail_content&id='.$id);
                        //                     send_mail($mail_to, 'RFQ Report', 'New RFQ has just been created', $mail_content);
                        $id = $this->pdo->insert('rfq', $data);
                        $a_mail_bcc = array('nhamphongdaijsc@gmail.com', 'info@daisan.vn','chungit.dsc@daisan.vn');
                        if(isset($_POST['taxonomy_id']) && intval($_POST['taxonomy_id'])!=0){
                            $pages = $this->pdo->fetch_all("SELECT a.email FROM pages a WHERE a.status=1 AND a.email<>'' AND a.id IN
                            (SELECT p.page_id FROM products p WHERE p.status=1 AND p.taxonomy_id=".intval($_POST['taxonomy_id'])." AND p.location_id=".intval($_POST['location_id']).")
                            ORDER BY RAND() LIMIT 300");
                            foreach ($pages AS $item){
                                $a_mail_bcc[] = $item['email'];
                            }
                        }
                        $mail_title = "[$id]".'New RFQ has just been created';
                        $mail_to = array(
                            'TO' => array('admin@daisan.vn'),
                            'CC' => array('cntt.dsc@daisan.vn'),
                            'BCC' => $a_mail_bcc
                        );
                        $mail_content = file_get_contents(URL_SOURCING.'?site=set_mail_content&id='.$id);
                        send_mail($mail_to, 'RFQ Report', $mail_title, $mail_content);
                    }else{
                        $this->pdo->update('rfq', $data, "id=$id");
                    }
                    
                    if($id){
                        unset($data);
                        if(isset($_POST['image']) && strlen($_POST['image'])>100){
                            $info = $this->pdo->fetch_one('SELECT image FROM rfq WHERE id='.$id);
                            @unlink(DIR_UPLOAD.$this->folder.$info['image']);
                            $upload = $this->img->upload_image_base64(DIR_UPLOAD.$this->folder, @$_POST['image'], null, 500, 3/2);
                            $data['image'] = $upload;
                            $this->pdo->update('rfq', $data, "id=$id");
                        }
                        $rt['code'] = 1;
                        $rt['msg'] = 'Gửi yêu cầu của bạn thành công.';
                    }else{
                        $rt['msg'] = "Không lưu được nội dung";
                    }
                }
                echo json_encode($rt);
                exit();
            }
            
           // if($login==0) lib_redirect(DOMAIN."?mod=account&site=login&token=".base64_encode(THIS_LINK));
            
            $id = isset($_GET['id'])?intval($_GET['id']):0;
            $rfq = $this->pdo->fetch_one("SELECT * FROM rfq WHERE id=$id AND user_id=$login");
            $rfq['avatar'] = $this->img->get_image("rfq/", $rfq['image']);
            
            $out = array();
            $out['title'] = isset($_GET['title'])?trim($_GET['title']):'';
            $out['number'] = isset($_GET['number'])?trim($_GET['number']):'';
            $out['product_unit'] = $this->tax->get_select_taxonomy('product_unit', @$rfq['unit_id'], 0, null, 0);
            $out['product_cate'] = $this->tax->get_select_taxonomy('product');
            
            if($rfq){
                $tid_1 = $this->tax->get_biggest_parent('product', @$rfq['taxonomy_id']);
                $taxonomy = $this->pdo->fetch_one("SELECT id,parent,level FROM taxonomy WHERE type='product' AND id=".@$rfq['taxonomy_id']);
                if($taxonomy && @$taxonomy['parent']!=0){
                    $tid_2 = $taxonomy['parent'];
                    $tid_3 = $taxonomy['id'];
                }
            }
            $out['select_category'] = $this->tax->get_select_taxonomy('product', @$tid_1, 0, null, 'Chọn danh mục sản phẩm');
            $out['select_category_sub1'] = '';
            $out['select_category_sub2'] = '';
            if(isset($tid_2) && $tid_2!=0)
                $out['select_category_sub1'] = $this->tax->get_select_taxonomy('product', @$tid_2, @$tid_1, null, 'Chọn danh mục sản phẩm');
                if(isset($tid_3) && $tid_3!=0)
                    $out['select_category_sub2'] = $this->tax->get_select_taxonomy('product', @$tid_3, @$tid_2, null, 'Chọn danh mục sản phẩm');
                    $out['location'] = $this->help->get_select_location(@$rfq['location_id'],0,'Chọn tỉnh thành');
                    $out['payment_method'] = $this->help->get_select_from_array($this->pament_method, @$rfq['payment_method'], 'Chọn phương thức');
                    $this->smarty->assign('out', $out);
                    $this->smarty->assign('rfq', $rfq);
                    $this->smarty->display(LAYOUT_DEFAULT);
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
    
    
    function rfq_detail(){
        global $login;
        $number_quotation = 10;
        $id = isset($_GET['id'])?intval($_GET['id']):0;
        $rfq = $this->pdo->fetch_one("SELECT * FROM rfq WHERE id=$id");
        $rfq['unit'] = $this->pdo->fetch_one_fields('taxonomy', 'name', 'id='.$rfq['unit_id']);
        $rfq['user'] = $this->pdo->fetch_one_fields('users', 'name', 'id='.$rfq['user_id']);
        $rfq['location'] = $this->pdo->fetch_one_fields('locations', 'name', 'id='.$rfq['location_id']);
        $rfq['avatar'] = $this->img->get_image($this->folder, $rfq['image']);
        $rfq['payment_method'] = $rfq['payment_method']!=0?$this->pament_method[$rfq['payment_method']]:"NONE";
        $rfq['endtime'] = strtotime("+ 1month", $rfq['created']);
        
        $user_rfqs = $this->pdo->fetch_all("SELECT a.id,a.title,a.image,a.number,a.created,t.name AS unit
                FROM rfq a LEFT JOIN taxonomy t ON a.unit_id=t.id WHERE a.user_id=".$rfq['user_id']." ORDER BY a.id DESC LIMIT 6");
        foreach ($user_rfqs AS $k=>$item){
            $user_rfqs[$k]['avatar'] = $this->img->get_image($this->folder, $item['image']);
        }
        $this->smarty->assign('user_rfqs', $user_rfqs);
        
        $other = $this->pdo->fetch_all("SELECT a.id,a.title,a.image,a.number,a.created,t.name AS unit,
                (SELECT t.name FROM locations t WHERE t.id=a.location_id) AS location
                FROM rfq a LEFT JOIN taxonomy t ON a.unit_id=t.id WHERE a.id<>$id AND a.user_id=".$rfq['user_id']." ORDER BY a.id DESC LIMIT 5");
        foreach ($other AS $k=>$item){
            $other[$k]['url'] = "?site=rfq_detail&id=".$item['id'];
            $other[$k]['avatar'] = $this->img->get_image($this->folder, $item['image']);
        }
        $this->smarty->assign('other', $other);
        
        $pageusers = $this->pdo->fetch_all("SELECT a.id,a.name FROM pages a WHERE a.status=1 AND a.id IN (
                SELECT b.page_id FROM pageusers b WHERE b.position=0 AND b.user_id=$login)");
        $a_pages = array();
        foreach ($pageusers AS $k=>$item){
            $a_pages[$item['id']] = $item['name'];
        }
        $out = array();
        $out['s_pages'] = $this->help->get_select_from_array($a_pages, 0, 0);
        
        $products = $this->pdo->fetch_all("SELECT id,name FROM products WHERE status=1 AND page_id=".@$pageusers[0]['id']);
        $a_products = array();
        foreach ($products AS $k=>$item){
            $a_products[$item['id']] = $item['name'];
        }
        $out['s_products'] = $this->help->get_select_from_array($a_products, 0, 'Chọn sản phẩm');
        
        $quotations = $this->pdo->fetch_all("SELECT a.id,a.description,a.created,a.status,a.page_id,a.price,
                p.name AS page_name,p.logo AS page_logo
                FROM rfqquotations a LEFT JOIN pages p ON p.id=a.page_id
                WHERE a.rfq_id=$id");
        foreach ($quotations AS $k=>$item){
            $quotations[$k]['page_logo'] = $this->img->get_image($this->page->get_folder_img($item['page_id']), $item['page_logo']);
        }
        $this->smarty->assign('quotations', $quotations);
        
        $out['number_quotation'] = $number_quotation-count($quotations);
        
        $this->smarty->assign('rfq', $rfq);
        $this->get_breadcrumb($rfq['taxonomy_id']);
        $this->smarty->assign('out', $out);
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    
    function ajax_handle(){
        global $login;
        if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='load_category'){
            $parent = @$_POST['id']==0?-1:$_POST['id'];
            $rt = $this->tax->get_select_taxonomy('product', 0, $parent, null, 'Chọn danh mục');
            echo $rt; exit();
        }elseif(isset($_POST['ajax_action']) && $_POST['ajax_action']=='load_page_products'){
            $products = $this->pdo->fetch_all("SELECT id,name FROM products WHERE status=1 AND page_id=".$_POST['page_id']);
            $a_products = array();
            foreach ($products AS $item){
                $a_products[$item['id']] = $item['name'];
            }
            echo $this->help->get_select_from_array($a_products, 0, 'Chọn sản phẩm');
            exit();
        }elseif(isset($_POST['ajax_action']) && $_POST['ajax_action']=='save_quotation'){
            $rfq_id = isset($_POST['rfq_id'])?intval($_POST['rfq_id']):0;
            $page_id = isset($_POST['page_id'])?intval($_POST['page_id']):0;
            $page = $this->page->get_profile($page_id);
            $package = $this->pdo->fetch_one('SELECT numb_sourcing FROM packages WHERE id='.$page['package_id']);
            $number_rfq = $this->pdo->count_item('rfqquotations', 'page_id='.$page_id.' AND DATE_FORMAT(created, "%Y-%m-%d")="'.date('Y-m-d').'"');
            $rt['code'] = 0;
            if($login==0){
                $rt['msg'] = "Vui lòng đăng nhập trước khi thực hiện chức năng.";
            }elseif($this->pdo->check_exist("SELECT 1 FROM rfq WHERE id=$rfq_id AND user_id=$login")){
                $rt['msg'] = "Không được báo giá cho yêu cầu của bạn.";
            }elseif($this->pdo->check_exist("SELECT 1 FROM rfqquotations WHERE rfq_id=$rfq_id AND page_id=$page_id")){
                $rt['msg'] = "Đã có báo giá từ gian hàng cho yêu cầu này.";
            }elseif(!$this->pdo->check_exist("SELECT 1 FROM pageusers WHERE position=0 AND page_id=$page_id AND user_id=$login")){
                $rt['msg'] = "Không có quyền báo giá cho gian hàng lựa chọn.";
            }elseif($number_rfq>$package['numb_sourcing']){
                $rt['msg'] = "Số lượng báo giá trong tháng của gian hàng đã đạt giới hạn.";
            }else{
                $data = array();
                $data['rfq_id'] = $rfq_id;
                $data['page_id'] = $page_id;
                $data['user_id'] = $login;
                $data['product_id'] = intval($_POST['product_id']);
                $data['description'] = trim($_POST['description']);
                $data['price'] = trim($_POST['price']);
                $data['created'] = time();
                if($id = $this->pdo->insert('rfqquotations', $data)){
                    $rt['code'] = 1;
                    $rt['msg'] = "Gửi báo giá thành công.";
                    
                    if(isset($_POST['image']) && strlen($_POST['image'])>100){
                        $upload = $this->img->upload_image_base64(DIR_UPLOAD.$this->folder, @$_POST['image'], null, 800, -1);
                        $data['image'] = $upload;
                        $this->pdo->update('rfqquotations', $data, "id=$id");
                    }
                    
                }else{
                    $rt['msg'] = "Xảy ra lỗi khi lưu vào hệ thống, vui lòng thử lại.";
                }
            }
            echo json_encode($rt);
            exit();
        }
    }
}