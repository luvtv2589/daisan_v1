<?php header("X-Hiawatha-Cache: 5"); ?>
<?php
ob_start();
session_start();

error_reporting(0);
$isDebug = isset($_REQUEST['debug']) ? 0 : 1;
if ($isDebug) {
	ini_set('display_errors','On');
} else {
	ini_set('display_errors','Off');
}

require_once '../../index.php';
require_once './model/Pageadmin.php';

$smarty = new Smarty();
$smarty->template_dir = "./view/layouts/";
$compile_dir = "cache/";
if(!is_dir($compile_dir)) mkdir($compile_dir, 0777);
$smarty->compile_dir  = $compile_dir;
$smarty->config_dir   = 'configs/';
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 120000;

$lang = isset($_SESSION[SESSION_LANGUAGE_DEFAULT]) ? $_SESSION[SESSION_LANGUAGE_DEFAULT] : DEFAULT_LANGUAGE;
$login = isset($_COOKIE[COOKIE_LOGIN_ID]) ? $_COOKIE[COOKIE_LOGIN_ID] : 0;
$page_id = isset($_SESSION[SESSION_PAGEID_MANAGER]) ? $_SESSION[SESSION_PAGEID_MANAGER] : 0;
$location = isset($_COOKIE[COOKIE_LOCATION_ID_MAIN]) ? $_COOKIE[COOKIE_LOCATION_ID_MAIN] : 0;
$url_location = isset($_COOKIE[COOKIE_LOCATION_URL_MAIN]) ? $_COOKIE[COOKIE_LOCATION_URL_MAIN] : 0;
$mod = isset($_GET['mod']) ? $_GET['mod'] : "home";
$site = isset($_GET['site']) ? $_GET['site'] : "index";
if($page_id==0){
	$mod = "home";
	$site = "connect";
}

$tpl = "../" . $mod . "/" . $site . ".tpl";
$file = ucfirst($mod) . ".php";
$class = ucfirst($mod);

if(!is_file('./model/' . $file))
	lib_redirect(DOMAIN);
require_once './model/' . $file;

if(!method_exists($class, $site))
	lib_redirect(DOMAIN);
$use = new $class;
$use->$site();
ob_end_flush();
# ------------------------------------- #