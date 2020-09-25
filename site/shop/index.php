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
require_once './model/Main.php';

$page_id = isset($_GET['pageId']) ? $_GET['pageId'] : 0;

if($page_id===0){
    $a_url = parse_url(THIS_LINK);
    $path = str_replace('/', '', $a_url['path']);
    if(strlen($path)>3) $page_id = $path;
}
$a_layout = @parse_ini_file(FILE_LAYOUTS);
$layout = isset($a_layout[$page_id]) ? $a_layout[$page_id] : "alibaba";

$smarty = new Smarty();
$smarty->template_dir = "./view/".$layout."/layouts/";
$compile_dir = "cache/".$page_id."/";
if(!is_dir($compile_dir)) mkdir($compile_dir, 0777);
$smarty->compile_dir  = $compile_dir;
$smarty->config_dir   = 'configs/';
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 1200;

if(!isset($_SESSION[SESSION_LANGUAGE_DEFAULT])){
	$_SESSION[SESSION_LANGUAGE_DEFAULT] = DEFAULT_LANGUAGE;
}
$lang = isset($_SESSION[SESSION_LANGUAGE_DEFAULT]) ? $_SESSION[SESSION_LANGUAGE_DEFAULT] : DEFAULT_LANGUAGE;
$login = isset($_COOKIE[COOKIE_LOGIN_ID]) ? $_COOKIE[COOKIE_LOGIN_ID] : 0;
$location = isset($_COOKIE[COOKIE_LOCATION_ID_MAIN]) ? $_COOKIE[COOKIE_LOCATION_ID_MAIN] : 0;
$url_location = isset($_COOKIE[COOKIE_LOCATION_URL_MAIN]) ? $_COOKIE[COOKIE_LOCATION_URL_MAIN] : 0;

$mod = isset($_GET['mod']) ? $_GET['mod'] : "pages";
$site = isset($_GET['site']) ? $_GET['site'] : "home";

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