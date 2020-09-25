<?php

// Call to libraries
lib_use(LIB_CORE_DBO);
lib_use(LIB_DBO_HELP);
lib_use(LIB_CORE_STRING);
lib_use(LIB_CORE_IMAGE);
lib_use(LIB_CORE_PAGINATION);
lib_use(LIB_DBO_TAXONOMY);
lib_use(LIB_DBO_SERVICE);
lib_use(LIB_DBO_MEDIA);
lib_use(LIB_DBO_PRODUCT);
lib_use(LIB_DBO_PAGE);
lib_use(LIB_DBO_MENU);

class Main {
    
    public $pdo, $str, $img;
    public $help, $page, $product, $service, $dbomenu, $media;
    public $smarty, $arg;
    public $page_id, $profile, $page_url, $sour, $menu;
    public $option, $page_product;
    
    function __construct() {
        global $tpl, $mod, $site, $smarty, $login, $lang, $page_id, $layout, $location, $url_location;
        
        $this->smarty = $smarty;
        $this->pdo = new vsc_pdo();
        $this->str = new vsc_string();
        $this->img = new vsc_image();
        $this->help = new DboHelp();
        $this->page = new DboPage();
        $this->product = new DboProduct();
        $this->dbomenu = new DboMenu();
        $this->service = new DboService();
        $this->media = new DboMedia();
        
        $this->page_id = $page_id;
        $this->get_menu();
        $this->option = array ();
        $this->option ['contact'] = $this->get_options ( 'contact' );
        $this->profile = $this->page->get_profile($page_id);
        
        $this->page_id = @$this->profile['pid'];
        
        $this->smarty->assign('page', $this->profile);
        
        $this->smarty->assign('info_page_location',$this->page->info_page_location($page_id,$location,$_GET['lid']));
       
        $stylesheet = DOMAIN."site/shop/view/".$layout."/webroot/";
        //if(!is_localhost()) $stylesheet = URL_STYLE.$layout."/webroot/";
        
        $this->arg = array(
            'stylesheet' => $stylesheet,
            'timenow' => time(),
            'domain' => DOMAIN,
            'url_page' => $this->page_url,
            'url_sour' => $this->sour,
            'thislink' => THIS_LINK,
            'url_location'=> $location !=0 ? $url_location : DOMAIN,
            'mod' => $mod,
            'site' => $site,
            'lang' => $lang,
            'login' => $login,
            'page_id' => $this->page_id,
            'noimg' => NO_IMG,
            'timeout' => 60*60*12,
            'logo' => $this->media->get_images(1),
        );
       
        $stat_access = $this->pdo->fetch_one("SELECT COUNT(id) AS number FROM useronlines
                WHERE page_id= $this->page_id AND DATE_FORMAT(date_log, '%Y')='".date("Y")."'");
        $this->smarty->assign('access_month', $stat_access['number']);
        
        $this->get_seo_metadata($this->profile['meta_title'], $this->profile['meta_keyword'], $this->profile['meta_description'], $this->profile['logo_img']);
        $this->set_useronline();
        $this->accesslogs();
        
        $this->smarty->assign('a_main_product_category', $this->get_product_category());
        $this->smarty->assign('a_main_breadcrumb', $this->get_breadcrumb());
        $this->smarty->assign('banner', '');
        $this->smarty->assign('a_menu_top', $this->dbomenu->get_menu_arr('top', 0));
        
        $product_file = $this->page->get_folder_img_upload($this->page_id).'products.json';
        if(!is_file($product_file)){
            $products = $this->product->get_list_bypage($this->page_id);
            file_put_contents($product_file, json_encode($products));
        }else $products = json_decode(file_get_contents($product_file), true);
        //$products = $this->product->get_list($this->page_id);
        $this->page_product = is_array($products)?$products:array();
        
//         $top3 = $this->product->get_list($this->page_id, 0, null, 3,null, "a.views DESC");
//         $this->smarty->assign('top3', $top3);
        
//         if(isset($_COOKIE['HodineCache'])) $HodineCache = json_decode($_COOKIE['HodineCache'], true);
//         else $HodineCache = array();
//         if(!isset($HodineCache['product_view']) || !is_array($HodineCache['product_view'])) $HodineCache['product_view'] = array();
//         $HodineCache['product_view'][] = 0;
//         $a_product_views = $this->product->get_list_inarray($HodineCache['product_view']);
//         $this->smarty->assign('a_product_views', $a_product_views);
        
        
        
        
        $this->smarty->assign('arg', $this->arg);
        $this->smarty->assign('js_arg', json_encode($this->arg));
        $this->smarty->assign('option',$this->option);
        $this->smarty->assign('is_mobile',isMobile());
        $this->smarty->assign('content', $tpl);
    }
    
    function get_seo_metadata($title=null, $keyword=null, $description=null, $image=null) {
        if($image==NO_IMG) $image = URL_UPLOAD."generals/metaimage.jpg";
        
        $metadata = array();
        $metadata['title'] = $title;
        $metadata['keyword'] = $keyword;
        $metadata['description'] = $description;
        $metadata['image'] = $image;
        if ($title == null || $title=='')  $metadata['title'] = @$this->option['seo']['title'];
        if ($keyword == null || $title=='') $metadata['keyword'] = @$this->option['seo']['keyword'];
        if ($description == null || $title=='') $metadata['description'] = @$this->option['seo']['description'];
        $this->smarty->assign('metadata', $metadata);
        return $metadata;
    }
    
    
    function set_useronline(){
        global $login;
        $step_time = time()-30*60;
        $ip = $_SERVER['REMOTE_ADDR'];
        $date = date("Y-m-d");
        $online = $this->pdo->check_exist("SELECT updated,number FROM useronlines
    			WHERE user_id=$login AND date_log='$date' AND user_ip='$ip' AND page_id=".$this->page_id);
        $data['updated'] = time();
        if(!$online){
            $data['page_id'] = $this->page_id;
            $data['user_id'] = $login;
            $data['user_ip'] = $ip;
            $data['date_log'] = $date;
            $data['number'] = 1;
            $this->pdo->insert('useronlines', $data);
        }elseif($online && $online['updated']<$step_time){
            $data['number'] = $online['number']+19;
            $this->pdo->update('useronlines', $data, "user_id=$login AND date_log='$date' AND user_ip='$ip' AND page_id=".$this->page_id);
        }else{
            $this->pdo->update('useronlines', $data, "user_id=$login AND date_log='$date' AND user_ip='$ip' AND page_id=".$this->page_id);
        }
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
            
            $this->pdo->insert('accesslogs', $data);
        }
    }
    
    function get_menu(){
        $sour = "&";
        $url = URL_PAGE."?pageId=".$this->page_id;
        $subname=str_replace('&', '', $_GET['subname']);
        if(!is_localhost() && $_SERVER['HTTP_HOST']=='shops.daisan.vn'){
            $a_url = parse_url(THIS_LINK);
            $path = str_replace('/', '', $a_url['path']);
            if(strlen($path)>3){
                $this->page_id = $path;
                $url = URL_PAGE.$path;
                $sour = "?";
            }
        }elseif(!is_localhost() && $_SERVER['HTTP_HOST']!='shops.daisan.vn'){
            $this->page_id = $_SERVER['HTTP_HOST'];
            $url = (isset($_SERVER['HTTPS'])?"https":"http")."://".$_SERVER['HTTP_HOST']."/";
            $sour = "?";
        }
        $a_menu = $this->set_menu();
        $a_menu_url = array();
        foreach ($a_menu AS $k=>$item){
            $a_menu_url[$k] = $url.$sour."site=$k&pn=".$this->str->str_convert($item);
            if (isset($_GET['subname'])&&$_GET['subname']!=null)
                $a_menu_url[$k]=$a_menu_url[$k]."&subname=".$_GET['subname']."&lid=".$_GET['lid'];
        }
        $this->page_url = $url;
        $this->sour = $sour;
        $this->a_main_menu = $a_menu_url;
        $this->smarty->assign('a_main_menu', $a_menu_url);
        $this->smarty->assign('a_menu_name', $a_menu);
    }
    
    
    function get_product_category(){
        $sql = "SELECT a.id,a.name,m.name AS image,t.alias AS folder FROM taxonomy a
                LEFT JOIN media m ON a.image=m.id LEFT JOIN taxonomy t ON m.taxonomy_id=t.id
                WHERE a.id IN (SELECT b.taxonomy_id FROM products b WHERE b.status=1 AND b.page_id=".$this->page_id.")";
        $category = $this->pdo->fetch_all($sql);
        foreach ($category AS $k=>$item){
            $category[$k]['url'] = $this->page_url.$this->sour."site=product_list&cid=".$item['id']."&pn=".$this->str->str_convert($item['name']);
            //$category[$k]['prod'] = $this->product->get_list($this->page_id,$category[$k]['id'],null, 6);
            $category[$k]['image']= $this->img->get_image($this->media->get_path($item['folder'], 1), $item['image']);
           // $item['image'] = $this->img->get_image($this->media->get_path($item['folder']), $item['image']);
            
        }
        return $category;
    }
    
    function get_breadcrumb(){
        global $site;
        $cid = isset($_GET['cid'])?intval($_GET['cid']):0;
        $pid = isset($_GET['pid'])?intval($_GET['pid']):0;
        
        $result = "<ol class=\"breadcrumb\">";
        $result .= "<li class=\"breadcrumb-item\"><a href=\"".$this->a_main_menu['home']."\">".$this->menu['home']."</a></li>";
        if($site=='product_detail'){
            $product = $this->pdo->fetch_one("SELECT a.id,a.name,a.taxonomy_id,t.name AS taxname FROM products a
                    LEFT JOIN taxonomy t ON a.taxonomy_id=t.id WHERE a.id=$pid");
            $product['taxurl'] = $this->get_cateurl($product['taxonomy_id'], $product['taxname']);
            $result .= "<li class=\"breadcrumb-item\"><a href=\"".$product['taxurl']."\">".$product['taxname']."</a></li>";
            $result .= "<li class=\"breadcrumb-item active\">".$product['name']."</li>";
        }elseif($site=='product_list' && $cid!=0){
            $cate = $this->pdo->fetch_one("SELECT id,name FROM taxonomy WHERE id=$cid");
            if($cate){
                $result .= "<li class=\"breadcrumb-item\"><a href=\"".$this->a_main_menu[$site]."\">".$this->menu[$site]."</a></li>";
                $result .= "<li class=\"breadcrumb-item active\">".$cate['name']."</li>";
            }else $result .= "<li class=\"breadcrumb-item active\">".$this->menu[$site]."</li>";
        }else $result .= "<li class=\"breadcrumb-item active\">".$this->menu[$site]."</li>";
        $result .= "</ol>";
        return $result;
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
    
    private function set_menu(){
        $a_menu = $this->page->all_pages;
        return $this->menu = $a_menu;
    }
    
    
    function get_cateurl($id, $name=null){
        $result = $this->page_url.$this->sour."site=product_list&cid=$id";
        if($name!=null && trim($name)!='') $result .= "&pn=".$this->str->str_convert($name);
        if (isset($_GET['subname'])&&$_GET['subname']!=null)
            $result .= $result."&subname=".$_GET['subname']."&lid=".$_GET['lid'];
        return $result;
    }
    
    function isMobile() {
        return preg_match("/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|tablet|up\.browser|up\.link|webos|wos)/i", $_SERVER["HTTP_USER_AGENT"]);
    }
    
}