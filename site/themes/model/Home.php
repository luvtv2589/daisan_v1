<?php
lib_use(LIB_HELP_PHPMAILER);
class Home extends Main{
    private $folder_rfq;
    function __construct()
    {
        parent::__construct();
        $this->folder_rfq = "rfq/";
        $this->folder = 'images/nations/';
        $this->help = new DboHelp();
    }
    
    function index()
    {   global $location;
        $out = array();
        $a_home_category = $this->tax->get_taxonomy('product', 0, 'a.featured=1', 5);
        foreach ($a_home_category as $k => $item) {
            $a_home_category[$k]['sub'] = $this->tax->get_taxonomy('product', $item['id'], null, 8);
            //$a_home_category[$k]['keyword'] = $this->tax->get_tax_keyword($item['id']);
        }
        $this->smarty->assign('a_home_category', $a_home_category);
        
        $a_home_sidebar = $this->tax->get_tax_position('product', 'a.position=1', 3);
        $this->smarty->assign('a_home_sidebar', $a_home_sidebar);
        
//         if (isset($_COOKIE['HodineCache'])) $HodineCache = json_decode($_COOKIE['HodineCache'], true);
//         else $HodineCache = array();
//         if (!isset($HodineCache['product_view']) || !is_array($HodineCache['product_view'])) $HodineCache['product_view'] = array();
//         $HodineCache['product_view'][] = 0;
//         $a_product_views = $this->product->get_list_inarray($HodineCache['product_view']);
//         $this->smarty->assign('a_product_views', $a_product_views);
        
        $out['product_unit'] = $this->tax->get_select_taxonomy('product_unit', 0, 0, null, 0);
        $out['location']=$location;
        $this->smarty->assign('out', $out);
        
        $a_slider = $this->media->get_images(2, 1, 8, $location);
        $this->smarty->assign('a_slider', $a_slider);
       
        $a_ad = array();
        $a_ad['adhome']['p1'] = $this->media->get_images(3, 1, 4);
        $a_ad['adhome']['p2'] = $this->media->get_images(3, 2);
        $a_ad['admhome'] = $this->media->get_images(4,1,4);
        $a_ad['admhome']['p2'] = $this->media->get_images(4, 2);
        $this->smarty->assign('a_ad', $a_ad);
        
        $sql = "SELECT a.id,a.name,a.image,a.date_start,a.date_finish FROM events a LEFT JOIN taxonomy b ON a.taxonomy_id=b.id
                WHERE a.status=1 AND b.type='event' AND b.alias='khuyen-mai' AND a.date_start<='".date('Y-m-d')."' AND a.date_finish>='".date('Y-m-d')."'  AND a.status=1 ORDER BY a.sort ASC LIMIT 4";
        $event = $this->pdo->fetch_all($sql);
        foreach ($event AS $k=>$item){
            $event[$k]['avatar'] = $this->img->get_image('images/events/', $item['image']);
            $event[$k]['url'] = DOMAIN."event/".$this->str->str_convert($item['name'])."-".$item['id'];
        }
        $this->smarty->assign("event", $event);
        
        $sql_top_logo="SELECT id,name,logo,logo_custom,page_name FROM pages
                WHERE status=1 AND package_id>0 AND featured=1";
        if($location!=0) $sql_top_logo.=" AND id IN (SELECT page_id FROM pageaddress WHERE province_id=$location)";
        $sql_top_logo.=" ORDER BY package_id DESC LIMIT 35";
        $a_home_toplogo = $this->pdo->fetch_all($sql_top_logo);
        foreach ($a_home_toplogo AS $k=>$item){
            $a_home_toplogo[$k]['logo'] = $this->img->get_image($this->page->get_folder_img($item['id']), $item['logo']);
            $a_home_toplogo[$k]['logo_custom'] = $this->img->get_image($this->page->get_folder_img($item['id']), $item['logo_custom']);
            $a_home_toplogo[$k]['url'] = $this->page->get_pageurl($item['id'], $item['page_name']);
        }
        $this->smarty->assign('a_home_toplogo', $a_home_toplogo);
//         $nations = $this->pdo->fetch_all("SELECT * FROM nations");
//         foreach ($nations AS $k=>$item){
//             $nations[$k]['logo'] = $this->img->get_image($this->folder, @$item['Image']);
//             $nations[$k]['url'] = "https://".strtolower($item['Name']).".daisan.vn";
//         }
//         $this->smarty->assign("nations", $nations);

//         $a_post_service = $this->tax->get_tax_position("category","a.position='service'");
//         $this->smarty->assign('a_post_service', $a_post_service);

        $out['popup'] = $this->media->get_images(6);
        $this->smarty->assign("out",$out);
        if(isset($_POST['ajax_action']) && $_POST['ajax_action']=='send_phone_contact'){
            $data['location_id'] = intval($_POST['location_id']);
            if($_POST['name'] != null) $data['title'] = $_POST['name'];
            else $data['title'] = "Khách hàng cần báo giá!";
            $description = trim($_POST['description']);
            $phone = trim($_POST['phone']);
            $data['description'] = $description.". Số điện thoại: ".$phone;
            $data['taxonomy_id'] = isset($_POST['taxonomy_id']) ? $_POST['taxonomy_id'] : 0;
            $data['created'] = time();
            $data['status'] = 1;
            $id = $this->pdo->insert('rfq', $data);
            if($id){
                unset($data);
                $info = $this->pdo->fetch_one('SELECT image FROM rfq WHERE id='.$id);
                @unlink(DIR_UPLOAD.$this->folder_rfq.$info['image']);
                $upload = $this->img->upload_image_fromurl(DIR_UPLOAD.$this->folder_rfq, @$_POST['image'], 200, 1);
                $data['image'] = $upload;
                $this->pdo->update('rfq', $data, "id=$id");
                $a_mail_bcc = array('admin@gmail.com','chungit.dsc@daisan.vn');
//                 if(isset($_POST['taxonomy_id']) && intval($_POST['taxonomy_id'])!=0){
//                     $pages = $this->pdo->fetch_all("SELECT a.email FROM pages a WHERE a.status=1 AND a.email<>'' AND a.id IN
//                             (SELECT p.page_id FROM products p WHERE p.status=1 AND p.taxonomy_id=".intval($_POST['taxonomy_id'])." AND a.province_id=".intval($_POST['location_id']).")
//                             ORDER BY RAND() LIMIT 300");
//                     foreach ($pages AS $item){
//                         $a_mail_bcc[] = $item['email'];
//                     }
//                 }
                if($_POST['name'] != null) $mail_title = $_POST['name'];
                else $mail_title = "[$id]".$_POST['description'];
                $mail_to = array(
                    'TO' => array('info@daisan.vn'),
                    'CC' => array('cntt.dsc@daisan.vn'),
                    'BCC' => $a_mail_bcc
                );
                $mail_content = file_get_contents(URL_SOURCING.'?site=set_mail_content&id='.$id);
                send_mail($mail_to, 'RFQ Report', $mail_title, $mail_content);
                echo 1; exit();
            }
        }
        $this->smarty->display(LAYOUT_HOME);
    }
    function aboutus_home(){
        $a_post_service = $this->tax->get_tax_position("category","a.position='service'");
        $this->smarty->assign('a_post_service', $a_post_service);
        $this->smarty->display(LAYOUT_ABOUTUS);
    }
    function introduce(){
        $a_post_about = $this->post->get_array_posts_with_taxposition("about",'post');
        $this->smarty->assign('a_post_about',$a_post_about);
        $this->smarty->display(LAYOUT_ABOUTUS);
    }
    function nation()
    {
        global $login, $lang;
        $result = $this->pdo->fetch_all("SELECT * FROM nations");
        foreach ($result AS $k=>$item){
            $result[$k]['logo'] = $this->img->get_image($this->folder, @$item['Image']);
            $result[$k]['url'] ="https://".strtolower($item['Name']).".daisan.vn";
        }
        $this->smarty->assign("result", $result);
        $this->smarty->display(LAYOUT_HOME);
    }
    function get_login_result(){
        $fb = new Facebook\Facebook([
            'app_id' => '1152764341547099',
            'app_secret' => 'e03a834010b7270a134ed8a888077266',
            'default_graph_version' => 'v3.1',
        ]);
        $helper = $fb->getRedirectLoginHelper();
        
        try {
            $accessToken = $helper->getAccessToken();
        } catch(Facebook\Exceptions\FacebookResponseException $e) {
            // When Graph returns an error
            echo 'Graph returned an error: ' . $e->getMessage();
            exit;
        } catch(Facebook\Exceptions\FacebookSDKException $e) {
            // When validation fails or other local issues
            echo 'Facebook SDK returned an error: ' . $e->getMessage();
            exit;
        }
        
        if (! isset($accessToken)) {
            $permissions = array('public_profile','email'); // Optional permissions
            $loginUrl = $helper->getLoginUrl('https://daisan.vn/?mod=home&site=get_login_result', $permissions);
            header("Location: ".$loginUrl);
            exit;
        }
        
        try {
            // Returns a `Facebook\FacebookResponse` object
            $fields = array('id', 'name', 'email');
            $response = $fb->get('/me?fields='.implode(',', $fields).'', $accessToken);
        } catch(Facebook\Exceptions\FacebookResponseException $e) {
            echo 'Graph returned an error: ' . $e->getMessage();
            exit;
        } catch(Facebook\Exceptions\FacebookSDKException $e) {
            echo 'Facebook SDK returned an error: ' . $e->getMessage();
            exit;
        }
        
        $user = $response->getGraphUser();
        global $domain;
        if($this->pdo->check_exist("SELECT 1 FROM users WHERE username='".$user['id']."'")){
            $userlogin = $this->pdo->fetch_one("SELECT id FROM users WHERE username='".$user['id']."'");
            if (is_localhost()) setcookie(COOKIE_LOGIN_ID, $userlogin["id"], time() + (86400 * 7));
            else  setcookie(COOKIE_LOGIN_ID, $userlogin["id"], time() + (86400 * 7), "/", "." . $domain);
            $_SESSION[SESSION_LOGIN_DEFAULT] = $userlogin['id'];
        }else{
            $data = array();
            $data['username'] = $user['id'];
            $data['name'] = $user['name'];
            if(isset($user['email'])) $data['email'] = $user['email'];
            $data['created'] = time();
            $data['status'] = 1;
            $user_id = $this->pdo->insert('users', $data);
            if (is_localhost()) setcookie(COOKIE_LOGIN_ID, $user_id, time() + (86400 * 7));
            else  setcookie(COOKIE_LOGIN_ID, $user_id, time() + (86400 * 7), "/", "." . $domain);
            $_SESSION[SESSION_LOGIN_DEFAULT] = $user_id;
        }
        
        echo 'Faceook ID: ' . $user['id'];
        echo '<br />Faceook Name: ' . $user['name'];
        if(isset($user['email'])) echo '<br />Faceook Email: ' . @$user['email'];
        if(isset($user['phone'])) echo '<br />Faceook Phone: ' . @$user['phone'];
        lib_redirect(DOMAIN);
        exit();
    }
    
    
    function ajax_load_product_recommen(){
        $limit = isset($_GET['limit'])?intval($_GET['limit']):48;
        $category_id = isset($_GET['category_id'])?intval($_GET['category_id']):0;
        $page_id = isset($_GET['page_id'])?intval($_GET['page_id']):0;
        $result = $this->product->get_list($page_id, $category_id, 'a.ismain=1', $limit, null,"RAND()");
        $this->smarty->assign('result', $result);
        $this->smarty->display(LAYOUT_NONE);
    }
    
    
    function tradeassurance() {
        global $login, $lang;
        $a_product_recommen = $this->product->get_list(0, 0, 'a.ismain=1', 12);
        $this->smarty->assign('a_product_recommen', $a_product_recommen);
        $this->smarty->display('custom1.tpl');
        
    }
    function search() {
        global $login, $lang;
        $a_product_recommen = $this->product->get_list(0, 0, 'a.ismain=1', 12);
        $this->smarty->assign('a_product_recommen', $a_product_recommen);
        $this->smarty->display(LAYOUT_CUSTOM1);
        
    }
    function trends() {
        global $login, $lang;
        $pages= $this->page->get_pages("a.status=1 AND a.package_id<>0", 29);
        foreach ($pages AS $k=>$item){
            $where = "a.page_id =".$item['id']." AND a.ismain=1";
            $pages[$k]['product'] = $this->product->get_list(0, 0, $where, 8);
        }
        
        $this->smarty->assign("pages", $pages );
        $a_product_recommen = $this->product->get_list(0, 0, 'a.page_id AND a.ismain=1', 8);
        $this->smarty->assign('a_product_recommen', $a_product_recommen);
        
        $this->smarty->display('custom1.tpl');
    }
    function pricelists(){
        global $login,$lang;
        $this->smarty->display(LAYOUT_HOME);
    }
    
    function errorpage()
    {
        global $login, $lang;
        
        $this->smarty->display(LAYOUT_DEFAULT);
    }
    
    function load_search_suggest()
    {
        $key = trim(@$_POST['key']);
        $sql = "SELECT id,name,
                CASE WHEN name LIKE '$key' THEN 5 ELSE 0 END AS S1,
                CASE WHEN name LIKE '$key %' THEN 3 ELSE 0 END AS S2,
                CASE WHEN name LIKE '$key%' THEN 1 ELSE 0 END AS S3,
                CASE WHEN name LIKE '% $key %' THEN 1 ELSE 0 END AS S4
                FROM keywords WHERE name LIKE '%$key%'
                ORDER BY S1+S2+S3+S4 DESC LIMIT 10";
        if ($key == null)
            $sql = null;
            $result = $this->pdo->fetch_all($sql);
            foreach ($result as $k => $item) {
                $result[$k]['url'] = DOMAIN . "product?k=" . $item['name'] . "&kid=" . $item['id'];
            }
            $this->smarty->assign('result', $result);
            $this->smarty->display(LAYOUT_NONE);
    }
    
    function load_keyword_json() {
        $content = file_get_contents(FILE_KEYWORDS);
        echo $content;
    }
    
    function load_category()
    {
        global $url_location;
        $parent_id = isset($_POST['parent_id']) ? intval($_POST['parent_id']) : 0;
        
        $parent = $this->pdo->fetch_one("SELECT id,name,parent FROM taxonomy WHERE id=$parent_id");
        if (! $parent) {
            $parent['id'] = 0;
            $parent['parent'] = - 1;
            $parent['name'] = "Tất cả danh mục";
        }
        $this->smarty->assign('parent', $parent);
        
        $taxonomy = $this->pdo->fetch_all("SELECT id,name,alias,level,(rgt-lft) AS hasub FROM taxonomy
                WHERE type='product' AND status=1 AND parent=$parent_id");
        foreach ($taxonomy as $k => $item) {
            $taxonomy[$k]['hasub'] = $item['hasub'] == 1 ? 0 : 1;
            $taxonomy[$k]['url'] = $this->tax->get_url($url_location,'product', $item['id'], $item['alias'], $item['level']);
        }
        $this->smarty->assign('taxonomy', $taxonomy);
        
        $this->smarty->display(LAYOUT_NONE);
    }
    function ajax_loadmore()
    {
        $limit = 29;
        $page = isset($_POST['page']) ? trim($_POST['page']) : 1;
        $start = ($page - 1) * $limit;
        $a_home_toplogo = $this->pdo->fetch_all("SELECT id,name,logo,logo_custom,page_name FROM pages
                WHERE status=1 AND package_id>0 AND package_homelogo>='".date('Y-m-d')."' LIMIT $start,$limit");
        foreach ($a_home_toplogo AS $k=>$item){
            $a_home_toplogo[$k]['logo'] = $this->img->get_image($this->page->get_folder_img($item['id']), $item['logo']);
            $a_home_toplogo[$k]['logo_custom'] = $this->img->get_image($this->page->get_folder_img($item['id']), $item['logo_custom']);
            $a_home_toplogo[$k]['url'] = $this->page->get_pageurl($item['id'], $item['page_name']);
        }
        
        $this->smarty->assign('a_home_toplogo', $a_home_toplogo);
        $this->smarty->display(LAYOUT_NONE);
    }

    function map(){
        $key = $_POST['key'];
        $location = !empty($_POST['location_id']) ? $_POST['location_id'] : 0;
        $where = "p.status=1 and (pa.lat IS NOT NULL or pa.lng IS NOT NULL)";
        $sql = "SELECT pa.id,pa.page_id, pa.name name_add,pa.image, pa.address, pa.lat, pa.lng, p.name name_page,p.logo_custom,pa.province_id, pa.email, pa.phone FROM pageaddress pa INNER JOIN pages p ON p.id=pa.page_id WHERE $where";
        $s_location = $this->help->get_select_location($location,0,'Toàn Quốc');

        $address = $this->pdo->fetch_all($sql);
        foreach ($address AS $k=>$item){
        $address[$k]['image'] = $this->img->get_image($this->page->get_folder_img($item['page_id']), $item['image']);
        $address[$k]['logo_custom'] = $this->img->get_image($this->page->get_folder_img($item['page_id']), $item['logo_custom']);
        $address[$k]['url'] = $this->page->get_pageurl($item['page_id'], $item['name_page']);
        }
        $this->smarty->assign('address', $address);
        $this->smarty->assign('s_location', $s_location);
        $this->smarty->display('map.tpl');
    }

    function mapHome()
    {
        $key = $_POST['key'];
        $location = !empty($_POST['location_id']) ? $_POST['location_id'] : 0;
        $where = "p.status=1 and (pa.lat IS NOT NULL or pa.lng IS NOT NULL)";
        $sql = "SELECT pa.id,pa.page_id pa.name name_add, pa.address, pa.lat, pa.lng,p.name name_page, pa.province_id FROM pageaddress pa INNER JOIN pages p ON p.id=pa.page_id WHERE $where";
        $s_location = $this->help->get_select_location($location,0,'Toàn Quốc');
        $address = $this->pdo->fetch_all($sql);
        foreach ($address AS $k=>$item){
            $address[$k]['image'] = $this->img->get_image($this->page->get_folder_img($item['page_id']), $item['image']);
            $address[$k]['url'] = $this->page->get_pageurl($item['page_id'], $item['name_page']);
        }
        $this->smarty->assign('address', $address);
        $this->smarty->assign('s_location', $s_location);
        $this->smarty->display(LAYOUT_DEFAULT);
    }

    function ajax_mapHome(){
        $key = $_POST['key'];
        $location_id =  !empty($_POST['location_id']) ? $_POST['location_id'] : 0;
        $where = "p.status=1 and (pa.lat IS NOT NULL or pa.lng IS NOT NULL)";
        if($key!=''){
            $where .= " AND (p.name LIKE '%$key%' OR p.id IN (SELECT pro.page_id FROM products pro WHERE pro.status=1 AND pro.name LIKE '$key%'))";
        }

//        lib_dump($location_id);
        if($location_id !== 0) {
            $where .= " AND pa.province_id=$location_id";
        }


        $sql = "SELECT pa.id,pa.page_id, pa.name name_add,pa.image, pa.address, pa.lat, pa.lng, p.name name_page,p.page_name,p.logo, pa.province_id, pa.email, pa.phone FROM pageaddress pa INNER JOIN pages p ON p.id=pa.page_id WHERE $where";
//        echo '<pre>';
//        print_r(json_encode($sql));
//        echo '</pre>';die;
        $address = $this->pdo->fetch_all($sql);
        foreach ($address AS $k=>$item){
            if($item['image']==null)
            $address[$k]['image'] = $this->img->get_image($this->page->get_folder_img($item['page_id']), $item['logo']);
            else 
            $address[$k]['image'] = $this->img->get_image($this->page->get_folder_img($item['page_id']), $item['image']);
            $address[$k]['url'] = $this->page->get_pageurl($item['page_id'], $item['page_name']);
        }
        echo json_encode($address);
        exit();
    }


    function ajaxLoadMap() {

    }

    function ajax_handle()
    {
        global $login;
        $data = $rt = array();
        if (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'save_rfq') {
            $rt['code'] = 0;
            if ($login == 0)
                $rt['msg'] = "Vui lòng đăng nhập trước khi thực hiện chức năng.";
                elseif (! is_numeric($_POST['number']))
                $rt['msg'] = 'Vui lòng nhập số lượng chính xác.';
                else {
                    $data['user_id'] = $login;
                    $data['title'] = trim($_POST['title']);
                    $data['number'] = trim($_POST['number']);
                    $data['unit_id'] = intval($_POST['unit']);
                    $data['created'] = time();
                    $data['status'] = 1;
                    $this->pdo->insert('rfq', $data);
                    $rt['code'] = 1;
                    $rt['msg'] = 'Gửi yêu cầu của bạn thành công.';
                }
                echo json_encode($rt);
                exit();
        } elseif (isset($_POST['ajax_action']) && $_POST['ajax_action'] == 'save_keyhistory') {
            $key = htmlentities(trim(@$_POST['key']));
            $kid = intval(@$_POST['kid']);
            if(preg_match_all("/select|insert|update|delete|location|script|<|>/", $key))
            {
              echo "Error";
            }else if (strlen($key) > 2) {
                if (! $this->pdo->check_exist("SELECT 1 FROM keyhistory WHERE keyword_name='$key' AND user_id=$login AND created>" . (time() - 20 * 60))) {
                    $data['keyword_name'] = trim(@$_POST['key']);
                    $data['keyword_id'] = intval(@$this->pdo->fetch_one_fields('keywords', 'id', "name='$key'"));
                    $data['user_id'] = $login;
                    $data['user_ip'] = $this->str->get_client_ip();
                    $data['created'] = time();
                    $this->pdo->insert('keyhistory', $data);
                }
            }
        }
    }
}