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

class Sourcing {

    public $pdo, $str, $img;
    public $help, $post, $tax, $media, $menu, $page, $product, $user;
    public $smarty, $_get, $arg;
    public $lang, $translate;

    function __construct() {
        global $tpl, $mod, $site, $smarty, $login, $reg, $lang, $_get;

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
        $this->option ['seo'] = $this->get_options ( 'seo' );
        $this->option ['link'] = $this->get_options ( 'link' );
        $this->_get = $_get;
        
        $a_filter_type = array('Products','Suppliers','Quotes');
        $a_filter = array(
        		'type' => $this->help->get_select_from_array($a_filter_type, isset($_GET['t'])?$_GET['t']:0),
        		'key' => isset($_GET['k'])?$_GET['k']:''
        );
        
        $this->arg = array(
            'stylesheet' => DOMAIN . "site/sourcing/webroot/",
    		'timenow' => time(),
            'domain' => DOMAIN,
            'thislink' => THIS_LINK,
            'mod' => $mod,
            'site' => $site,
    		'lang' => $lang,
    		'login' => $login,
    		'noimg' => NO_IMG,
            'logo' => $this->media->get_images(1),
            'url_sourcing' => URL_SOURCING
        );
        
        $this->get_seo_metadata();
        
        $this->smarty->assign('a_main_category', $this->tax->get_taxonomy('product', 0, null, null, 1));
        $user = $this->pdo->fetch_one("SELECT * FROM users WHERE id=$login");
        $user['avatar'] = $this->img->get_image($this->user->get_folder_img($login), $user['avatar']);
        $this->smarty->assign('user', $user);

        $this->smarty->assign('arg', $this->arg);
        $this->smarty->assign('js_arg', json_encode($this->arg));
        $this->smarty->assign('filter', $a_filter);
        $this->smarty->assign('a_menu_top', $this->menu->get_menu_arr('top'));
        $this->smarty->assign('a_menu_foot', $this->menu->get_menu_arr('foot'));
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
    
    
    function get_menu_tree($id, $str=null){
        $taxonomy = $this->pdo->fetch_one("SELECT id,name,parent,type,level FROM taxonomy WHERE id=$id");
        if($taxonomy){
            $taxonomy['url'] = "?site=index&cat_level_".$taxonomy['level']."=".$taxonomy['id'];
            $strli = "<li class=\"breadcrumb-item\"><a href=\"".$taxonomy['url']."\">".$taxonomy['name']."</a></li>";
            $str = $strli.$str;
        }
        if($taxonomy['parent']!=0){
            $str = self::get_menu_tree($taxonomy['parent'], $str);
        }
        return $str;
    }
    
    
    function get_breadcrumb($taxonomy_id){
        $str = "<ol class=\"breadcrumb\">";
        $str .= "<li class=\"breadcrumb-item\"><a href=\"./\">Tất cả yêu cầu</a></li>";
        $str .= $this->get_menu_tree($taxonomy_id);
        $str .= "</ol>";
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
}