<?php
define("FILE_INFO_ROUTER", "../../constant/info/router.ini");

define('ROUTER_PRODUCT', 'product/');
define('ROUTER_PRODUCT_LIST', 'products/');
define('ROUTER_PRODUCT_CATEGORY', 'categories/');
define('ROUTER_EVENT', 'event/');
define('ROUTER_NATION', 'nations/');
define('ROUTER_POST', 'post/');
define('ROUTER_POST_LIST', 'posts/');
define('ROUTER_ALBUM', 'album/');
define('ROUTER_POST_TAG', 'tag/');


// add router api
$domain_api = "v1.api.daisan.vn/api";
//$domain_api = "api.dev-2020.daisan.vn/api";
$domain = "daisan.vn";

define("DOMAIN_API", "http://".$domain_api."/");
define("DOMAIN", "https://".$domain."/");
define("URL_PAGEADMIN", "https://sellercenter.".$domain."/");
define("URL_BLOG", "https://".$domain."/blog/");
//define("URL_PAGEADMIN",DOMAIN. "mypage/");
define("URL_PAGE", "https://shops.".$domain."/");
//define("URL_PAGE",DOMAIN."shop/");
define("URL_IMAGE", "https://imgs.$domain/");
define("URL_IMAGE_S3", "https://daisan-image.s3.amazonaws.com/upload/");
define("URL_STYLE", "https://style.$domain/");
define('URL_ADMIN', DOMAIN . 'ds_admin/');
define('URL_THEME', "https://themes.hodine.com/");
define("URL_SOURCING", "https://sourcing.$domain/");
define("URL_HELPCENTER", "https://helpcenter.$domain/");
define("URL_CUSTOMER", "https://customer.$domain/");
define("URL_SUPPLIER", "https://supplier.$domain/");
define("URL_DAISANMALL","https://mall.$domain/");
define("URL_EVIETBUILD","https://evietbuild.$domain/");
define("URL_WHOLESALER","https://wholesaler.$domain/");
define("URL_IMPORT", DOMAIN."import/");
define("URL_SEARCH", DOMAIN."tim-kiem/");

define('ROUTER_SEARCH', 'product');

$router = array();
$router[ROUTER_PRODUCT_CATEGORY."(:val)"] = array('mod'=>'product', 'site'=>'category', 'id'=>'$1');
$router[ROUTER_PRODUCT_LIST."(:val)"] = array('mod'=>'product', 'site'=>'index', 'id'=>'$1');
$router[ROUTER_EVENT."(:val)"] = array('mod'=>'event', 'site'=>'products','id'=>'$1');
$router[ROUTER_EVENT] = array('mod'=>'event', 'site'=>'index');
$router[ROUTER_SEARCH] = array('mod'=>'product', 'site'=>'search');
$router[ROUTER_NATION] = array('mod'=>'home', 'site'=>'nation');
//$router['product'] = array('mod'=>'product', 'site'=>'index');
$router['supplier'] = array('mod'=>'page', 'site'=>'index');
$router['quote'] = array('mod'=>'home', 'site'=>'quote');
$router['store/finder'] = array('mod'=>'home', 'site'=>'map');
#$router[ROUTER_CATEGORY."(:val)"] = array('mod'=>'news', 'site'=>'newlist', 'id'=>'$1');
$router_conf = @parse_ini_file(FILE_INFO_ROUTER, true);
$router = array_merge($router, $router_conf);

function router_rewrire_url(){
	global $domain, $router;
	$exp_domain = explode($domain."/", $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
	$url = @$exp_domain[1];
	unset($exp_domain);

	if(strpos($url, 'mod=') && strpos($url, 'site=')){
		$result = router_get_value_url($url);
	}else{
		$exurl = explode("?", $url);
		$url = @$exurl[0];
		unset($exurl);
		if(isset($router[$url])){
			$result = $router[$url];
		}elseif(strpos($url, '/')){
			$exurl = explode("/", $url);
			foreach ($router AS $k=>$item){
				$exk = explode("/", $k);
				if(count($exurl)==count($exk) && $exurl[0]==$exk[0]){
				    $result = $item;
				    if($exk[1]=='(:val)') $result['id'] = $exurl[1];
				    break;
				}elseif($exurl[1]==$exk[0]){
				    $result = $item;
				    if($exk[1]=='(:val)') $result['id'] = $exurl[2];
				    break;
				}
			}
		}elseif(preg_match("/[_a-z0-9-]+(\.[_a-z0-9-]+)*.html$/i", $url)){
			$key = str_replace(".html", "", $url);
			$result = router_get_value_url("?mod=product&site=detail&id=$key");
		}else{
			$result = router_get_value_url("?mod=home&site=index");
		}
	}
	
	return @$result;
}


function router_get_value_url($url){
	$url = str_replace('?', '', $url);
	$split_parameters = explode('&', $url);
	
	for($i = 0; $i < count($split_parameters); $i++) {
		$final_split = explode('=', $split_parameters[$i]);
		$split_complete[$final_split[0]] = @$final_split[1];
	}
	
	return $split_complete;
}
