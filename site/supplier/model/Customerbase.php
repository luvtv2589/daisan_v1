<?php

// Call to libraries
lib_use(LIB_CORE_DBO);
lib_use(LIB_DBO_HELP);
lib_use(LIB_CORE_STRING);
lib_use(LIB_CORE_PAGINATION);
lib_use(LIB_CORE_IMAGE);
lib_use(LIB_DBO_USER);
lib_use(LIB_DBO_PAGE);
lib_use(LIB_DBO_TAXONOMY);
lib_use(LIB_DBO_MEDIA);

$login = isset($_SESSION['daisan_customer_login']) ? $_SESSION['daisan_customer_login'] : 0;

class Customerbase {

    public $pdo, $str, $img;
    public $help, $media, $page, $user;
    public $smarty, $arg;
    public $status, $type;

    function __construct() {
        global $mod, $site, $smarty, $login;

        $site_check = array('login', 'register', 'forgetpass', 'resetpass', 'logout');
        if($login===0 && !in_array($site, $site_check)){
            lib_redirect('?mod=account&site=login');
        }
        
        $this->smarty = $smarty;
        $this->pdo = new vsc_pdo();
        $this->str = new vsc_string();
        $this->img = new vsc_image();
        $this->help = new DboHelp();
        $this->user = new DboUser();
        $this->page = new DboPage();
        $this->media = new DboMedia();
        
        $this->arg = array(
            'stylesheet' => DOMAIN . "site/supplier/webroot/",
    		'timenow' => time(),
            'domain' => DOMAIN,
            'thislink' => THIS_LINK,
            'mod' => $mod,
            'site' => $site,
    		'login' => $login,
            'login_role' => isset($_SESSION['daisan_customer_login_role']) ? $_SESSION['daisan_customer_login_role'] : null,
    		'noimg' => NO_IMG,
            'url_page' => URL_SUPPLIER,
            'logo' => $this->media->get_images(1)
        );
        
        $this->status = array(
            0=>'Chưa gọi', 
            1=>'Gọi thành công', 
            2=>'Yêu cầu gọi lại', 
            3=>'Không bắt máy',
            4=>'Không liên lạc được', 
        );
        
        $this->type = array(
            1 => 'Quan tâm sản phẩm',
            2 => 'Yêu cầu tư vấn thêm',
            3 => 'Chưa có nhu cầu',
            4 => 'Không quan tâm',
            5 => 'Đã gửi Email'
        );
        
        
        
        $user = $this->pdo->fetch_one("SELECT * FROM users WHERE id=$login");
        $user['avatar'] = $this->img->get_image($this->user->get_folder_img($login), $user['avatar']);
        $this->smarty->assign('user', $user);

        $this->smarty->assign('filter_key', isset($_GET['key'])?trim($_GET['key']):'');
        $this->smarty->assign('arg', $this->arg);
        $this->smarty->assign('js_arg', json_encode($this->arg));
        $this->smarty->assign('content', "../" . $mod . "/" . $site . ".tpl");
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
    
    
}
