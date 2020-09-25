<?php

// Call to libraries
lib_use(LIB_CORE_DBO);
lib_use(LIB_DBO_HELP);
lib_use(LIB_CORE_IMAGE);
lib_use(LIB_CORE_STRING);
lib_use(LIB_CORE_PAGINATION);
lib_use(LIB_DBO_PAGE);
lib_use(LIB_DBO_MEDIA);
lib_use(LIB_DBO_USER);
lib_use(LIB_DBO_TAXONOMY);
lib_use(LIB_DBO_PRODUCT);

class Pageadmin {

    public $pdo, $str;
    public $help, $page, $img, $user;
    public $taxonomy, $product, $media;
    public $smarty, $_get, $arg, $page_id, $profile;
    public $lang, $translate;

    function __construct() {
        global $tpl, $mod, $site, $smarty, $login, $reg, $lang, $_get, $location, $url_location;

        $this->smarty = $smarty;
        $this->pdo = new vsc_pdo();
        $this->str = new vsc_string();
        $this->img = new vsc_image();
        $this->help = new DboHelp();
        $this->page = new DboPage();
        $this->user = new DboUser();
        $this->taxonomy = new DboTaxonomy();
        $this->product = new DboProduct();
        $this->media = new DboMedia();
        $this->_get = $_get;
        
        $this->page_id = isset($_SESSION[SESSION_PAGEID_MANAGER]) ? $_SESSION[SESSION_PAGEID_MANAGER] : 0;
        $this->profile = $this->page->get_profile($this->page_id);
        $pageuser = $this->pdo->fetch_one("SELECT u.id,u.name,u.avatar,a.position 
        		FROM pageusers a LEFT JOIN users u ON u.id=a.user_id
        		WHERE a.user_id=$login AND a.page_id=".$this->page_id);
        if(!$pageuser && $site!='connect') lib_redirect(DOMAIN);
        $this->profile['position'] = @$pageuser['position'];
        $this->profile['neworders'] = $this->pdo->count_item('productorders', 'status=0 AND page_id='.$this->page_id);
       $this->profile['newcontact'] = $this->pdo->count_item('pagemessages', 'parent=0 AND status=0 AND page_id='.$this->page_id);
        $pageuser['avatar'] = $this->img->get_image($this->user->get_folder_img($pageuser['id']), $pageuser['avatar']);
        
        $this->arg = array(
	            'stylesheet' => DOMAIN . "site/mypage/webroot/",
        		'timenow' => time(),
	            'domain' => DOMAIN,
                'url_location'=> $location !=0 ? $url_location : DOMAIN,
        		'url_pageadmin' => URL_PAGEADMIN,
        		'url_upload' => URL_UPLOAD,
	            'thislink' => THIS_LINK,
	            'mod' => $mod,
	            'site' => $site,
        		'lang' => $lang,
        		'login' => $login,
        		'noimg' => NO_IMG,
            'logo' => $this->media->get_images(1),
        );
        
        $this->smarty->assign('page', $this->profile);
        $this->smarty->assign('user', $pageuser);
        $this->smarty->assign('arg', $this->arg);
        $this->smarty->assign('js_arg', json_encode($this->arg));
        $this->smarty->assign('content', $tpl);
    }
    
    
    function get_pagemenu($menu, $name='page_menu'){
    	$page_menu = "";
    	foreach ($menu AS $k=>$item){
    		if($k==$this->arg['site'])
    			$page_menu .= '<a href="?mod='.$this->arg['mod'].'&site='.$k.'" class="btn btn-primary">'.$item.'</a> ';
    		else
    			$page_menu .= '<a href="?mod='.$this->arg['mod'].'&site='.$k.'" class="btn btn-secondary">'.$item.'</a> ';
    	}
    	$this->smarty->assign($name, $page_menu);
    }
    function get_option_item($option_name) {
        $value = $this->pdo->fetch_one("SELECT value FROM options WHERE name='$option_name'");
        if ($value) return $value['value'];
        else return false;
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
    function curl_search_get_product($id)
    {
        $url = "http://103.63.215.40:8080/api/products/$id";
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "GET");
        // curl_setopt($curl, CURLOPT_POSTFIELDS, $dataCURL_str);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
        )
            );
        $resultCURL = curl_exec($curl);
        curl_close($curl);
        $resultCURL_arr = json_decode($resultCURL, true);
        return $resultCURL_arr;
    }
    
    function curl_search_update_index($id, $data)
    {
        $url = "http://103.63.215.40:8080/api/products/$id";
        
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
        )
            );
        $resultCURL = curl_exec($curl);
        curl_close($curl);
        
        // $resultCURL_arr = json_decode($resultCURL, true);
        // return $resultCURL_arr;
    }
    
    function curl_search_delete_product($id)
    {
        $url = "http://103.63.215.40:8080/api/products/$id";
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "DELETE");
        // curl_setopt($curl, CURLOPT_POSTFIELDS, $dataCURL_str);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
        )
            );
        $resultCURL = curl_exec($curl);
        curl_close($curl);
        $resultCURL_arr = json_decode($resultCURL, true);
        return $resultCURL_arr;
    }
    
    function callAPIUpload($url, $data, $method = 'POST')
    {
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_VERBOSE => 1,
            CURLOPT_CUSTOMREQUEST => $method,
            CURLOPT_POSTFIELDS => $data,
        ));
        
        //create the multiple cURL handle
        $mh = curl_multi_init();
        //add the handle
        curl_multi_add_handle($mh, $curl);
        //execute the handle
        do {
            $status = curl_multi_exec($mh, $active);
            if ($active) {
                curl_multi_select($mh);
            }
        } while ($active && $status == CURLM_OK);
        //close the handles
        curl_multi_remove_handle($mh, $curl);
        curl_multi_close($mh);
        // all of our requests are done, we can now access the results
        //        echo curl_multi_getcontent($curl);
        //        $result = curl_exec($curl);
        //        if (! $result) {
        //            die("Connection Failure");
        //        }
        //        $resultCURL_arr = json_decode($result, true);
        //        return $resultCURL_arr;
        
    }
    
    function callAPI($url, $data, $method = 'POST')
    {
        $curl = curl_init();
        switch ($method) {
            case "POST":
                curl_setopt($curl, CURLOPT_POST, 1);
                if ($data)
                    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                    break;
            case "PUT":
                curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
                if ($data)
                    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                    break;
            default:
                if ($data)
                    $url = sprintf("%s?%s", $url, http_build_query($data));
        }
        
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'APIKEY: 111111111111111111111',
            'Content-Type: application/json'
        ));
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
        $result = curl_exec($curl);
        //        if (! $result) {
        //            die("Connection Failure");
        //        }
        //        $resultCURL_arr = json_decode($result, true);
        return $result;
    }
}