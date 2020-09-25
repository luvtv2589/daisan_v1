<?php

// Call to libraries
lib_use(LIB_CORE_DBO);
lib_use(LIB_DBO_HELP);
lib_use(LIB_CORE_STRING);
lib_use(LIB_CORE_PAGINATION);
lib_use(LIB_CORE_IMAGE);
lib_use(LIB_DBO_USER);
lib_use(LIB_DBO_POST);
lib_use(LIB_DBO_PRODUCT);
lib_use(LIB_DBO_MENU);
lib_use(LIB_DBO_PAGE);
lib_use(LIB_DBO_TAXONOMY);
lib_use(LIB_DBO_MEDIA);
lib_use(LIB_HELP_FACEBOOK);


class Main {
    
    public $pdo, $str, $img;
    public $help, $post, $tax, $media, $menu, $page, $product, $user;
    public $smarty, $_get, $arg;
    public $lang, $translate;
    public $option;
    
    function __construct() {
        global $tpl, $mod, $site, $smarty, $login, $lang, $contry_id,$_get, $location, $url_location;;
        
        $this->smarty = $smarty;
        $this->pdo = new vsc_pdo();
        $this->str = new vsc_string();
        $this->img = new vsc_image();
        $this->help = new DboHelp();
        $this->user = new DboUser();
        $this->post = new DboPosts();
        $this->product = new DboProduct();
        $this->menu = new DboMenu();
        $this->page = new DboPage();
        $this->tax = new DboTaxonomy();
        $this->media = new DboMedia();
        $this->option = array ();
        $this->option ['contact'] = $this->get_options ( 'contact' );
        //$this->option ['seo'] = $this->get_options ( 'seo' );
        //$this->option ['link'] = $this->get_options ( 'link' );
        $this->_get = $_get;
        
        $a_filter_type = array('Products','Suppliers','Quotes');
        $a_filter = array(
            'type' => $this->help->get_select_from_array($a_filter_type, isset($_GET['t'])?$_GET['t']:0),
            'key' => isset($_GET['k'])?$_GET['k']:''
        );
        $this->smarty->assign('a_main_category', $this->tax->get_taxonomy('product', 0, null, null, 1));
        $user = $this->pdo->fetch_one("SELECT id,name,avatar,phone,email,isadmin FROM users WHERE id=$login");
        $user['avatar'] = $this->img->get_image($this->user->get_folder_img($login), $user['avatar']);
        $this->smarty->assign('user', $user);
        $s_location = $this->help->get_select_location($location,0,'Toàn Quốc');
        $this->arg = array(
            'stylesheet' => DOMAIN . "site/themes/webroot/",
            'timenow' => time(),
            'domain' => DOMAIN,
            'thislink' => THIS_LINK,
            'id_location'=>$location,
            'url_location'=> $location !=0 ? $url_location : DOMAIN,
            'this_location'=> $this->pdo->fetch_one("SELECT Name FROM locations WHERE Id=$location"),
            'mod' => $mod,
            'site' => $site,
            'lang' => $lang,
            'login' => $login,
            'noimg' => NO_IMG,
            'img_gen' => URL_UPLOAD . "generals/",
            'loginimg' => LOGIN_IMG_DEFAULT,
            'url_sourcing' => URL_SOURCING,
            'url_helpcenter' => URL_HELPCENTER,
            'logo' => $this->media->get_images(1),
            'background' => $this->media->get_images(5),
            'json_keyword' => DOMAIN.'constant/info/keywords.json',
            'isadmin' => isset($user['isadmin'])?$user['isadmin']:0,
        );
        
        $this->get_seo_metadata();
        //$this->accesslogs();
        $keyword = array();
        $keyword['hot'] = $this->get_keywords('keywords',"status=1", 12);
        $keyword['history'] = $this->get_keywords('keyhistory',null, 12);
        $this->smarty->assign('s_location', $s_location);
        $this->smarty->assign ('locations',$this->get_location());
        $this->smarty->assign('arg', $this->arg);
        $this->smarty->assign('option',$this->option);
        $this->smarty->assign('js_arg', json_encode($this->arg));
        $this->smarty->assign('filter', $a_filter);
        $this->smarty->assign('keyword',$keyword);
        $this->smarty->assign('a_menu_top', $this->menu->get_menu_arr('top'));
        $this->smarty->assign('a_menu_main', $this->menu->get_menu_arr('main'));
        $this->smarty->assign('a_menu_foot', $this->menu->get_menu_arr('foot'));
        $this->smarty->assign('is_mobile',isMobile());
        $this->smarty->assign('content', $tpl);
        
        $btn_fb_login = null;
        if($login===0){
            $fb = new Facebook\Facebook([
                'app_id' => '1152764341547099',
                'app_secret' => 'e03a834010b7270a134ed8a888077266',
                'default_graph_version' => 'v3.1',
            ]);
            $helper = $fb->getRedirectLoginHelper();
            $permissions = ['email']; // Optional permissions
            $loginUrl = $helper->getLoginUrl('https://daisan.vn/?mod=home&site=get_login_result', $permissions);
            $btn_fb_login = $loginUrl;
        }
        $this->smarty->assign('btn_fb_login', $btn_fb_login);
    }
    function get_location() {
        $sql = "SELECT Id,Name,Prefix FROM locations a WHERE Status=1 AND Parent=0 ORDER BY Featured DESC,Sort DESC,Name";
        $stmt = $this->pdo->conn->prepare ( $sql );
        $stmt->execute ();
        $result = array ();
        while ( $item = $stmt->fetch () ) {
            $result [] = $item;
        }
        return $result;
    }
    function get_session_country_id(){
        $id = isset($_GET[country_id])?$_GET[country_id]:0;
        $result = $this->pdo->fetch_one("SELECT Id,Name FROM nations WHERE Id=$id");
        $_SESSION[SESSION_COUNTRY_ID] = $result['Id'];
        $url = "https://".strtolower($item['Name']).".daisan.vn";
        
        lib_redirect($url);
    }
    function get_seo_metadata($title = null, $keyword = null, $description = null, $image = null) {
        if($image == null) $image = URL_UPLOAD . "generals/metaimage.jpg";
        $this->option ['seo'] = $this->get_options ( 'seo' );
        $this->option ['contact'] = $this->get_options ( 'contact' );
        $this->option ['link'] = $this->get_options ( 'link' );
        $metadata = array ();
        $metadata ['title'] = $title;
        $metadata ['keyword'] = $keyword;
        $metadata ['description'] = $description;
        $metadata ['image'] = $image;
        if ($title == null || $title == '')
            $metadata ['title'] = @$this->option ['seo'] ['title'];
        if ($keyword == null || $title == '')
            $metadata ['keyword'] = @$this->option ['seo'] ['keyword'];
        if ($description == null || $title == '')
            $metadata ['description'] = @$this->option ['seo'] ['description'];
        $this->smarty->assign ( 'metadata', $metadata );
        return $metadata;
    }
    
     function get_menu_tree($id, $str=null){
        $taxonomy = $this->pdo->fetch_one("SELECT id,name,parent,type,level,alias FROM taxonomy WHERE id=$id");
        if($taxonomy){
            $taxonomy['url'] = $this->tax->get_url($url_location,'product', $taxonomy['id'],$taxonomy['alias'],$taxonomy['level']);
            $strli = "<li class=\"breadcrumb-item\"><a href=\"".$taxonomy['url']."\">".$taxonomy['name']."</a></li>";
            $str = $strli.$str;
        }
        if($taxonomy['parent']!=0){
            $str = self::get_menu_tree($taxonomy['parent'], $str);
        }
        return $str;
    }
    
    function get_breadcrumb($taxonomy_id){
        $str = null;
        $str .= "<li class=\"breadcrumb-item\"><a href=\"./\">Trang chủ</a></li>";
        $str .= $this->get_menu_tree($taxonomy_id);
        $this->smarty->assign('breadcrumb', $str);
    }
    
    function get_options($type = null, $use_lang = 1){
        global $lang;
        $options = array ();
        $sql = "SELECT name,value FROM options WHERE name IS NOT NULL";
        if($use_lang == 1) $sql .= " AND lang='$lang'";
        if($type != null) $sql .= " AND type='$type'";
        
        $stmt = $this->pdo->conn->prepare($sql);
        $stmt->execute ();
        while($item = $stmt->fetch()){
            $options[$item['name']] = $item['value'];
        }
        return $options;
    }
    function get_keywords($table, $where=null,$limit=8){
        $sql = "SELECT * FROM $table WHERE 1=1";
        if($where != null) $sql .=" AND $where";
        $sql .=" ORDER BY id DESC";
        $sql .= " LIMIT $limit";
        $result = $this->pdo->fetch_all($sql);
        return $result;
    }
    
    
    function accesslogs(){
        global $login;
        if(!$this->pdo->check_exist("SELECT 1 FROM accesslogs WHERE user_id=$login
            AND url='".THIS_LINK."' AND date_log='".date('Y-m-d')."' AND user_ip='".$this->str->get_client_ip()."'")){
            $data = array();
            $data['url'] = THIS_LINK;
            $data['user_id'] = $login;
            $data['date_log'] = date('Y-m-d');
            $data['updated'] = time();
            $data['user_ip'] = $this->str->get_client_ip();
            $data['ismobile'] = $this->isMobile();
            $details = json_decode(file_get_contents("http://ipinfo.io/".$this->str->get_client_ip()."/json"));
            if($details){
                $a_address = array();
                if(isset($details->region)) $a_address[] = $details->region;
                if(isset($details->city)) $a_address[] = $details->city;
                if(isset($details->country)) $a_address[] = $details->country;
                $data['location'] = implode(', ', $a_address);
                unset($a_address);
            }
            
            $this->pdo->insert('accesslogs', $data);
        }
    }
function isMobile() {
    return preg_match("/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|tablet|up\.browser|up\.link|webos|wos)/i", @$_SERVER["HTTP_USER_AGENT"]);
}
}