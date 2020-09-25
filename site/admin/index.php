<?php header("X-Hiawatha-Cache: 5"); ?>
<?php
ob_start();
session_start();

error_reporting(E_ALL);
$isDebug = isset($_REQUEST['debug']) ? 0 : 1;
if ($isDebug) ini_set('display_errors','On');
else ini_set('display_errors','Off');

require_once '../../index.php';
require_once 'model/Admin.php';

$smarty = new Smarty();
$smarty->template_dir = "./view/layouts/";
$compile_dir = "cache/";
if(!is_dir($compile_dir)) mkdir($compile_dir, 0777);
$smarty->compile_dir  = $compile_dir;
$smarty->config_dir   = 'configs/';
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 120000;

if(!isset($_SESSION[SESSION_LANGUAGE_ADMIN])){
	$_SESSION[SESSION_LANGUAGE_ADMIN] = DEFAULT_LANGUAGE;
}
$lang = isset($_SESSION[SESSION_LANGUAGE_ADMIN]) ? $_SESSION[SESSION_LANGUAGE_ADMIN] : DEFAULT_LANGUAGE;
$login = isset($_SESSION[SESSION_LOGIN_ADMIN]) ? intval($_SESSION[SESSION_LOGIN_ADMIN]) : 0;
$location = isset($_SESSION[SESSION_LOCATION_ID]) ? intval($_SESSION[SESSION_LOCATION_ID]) : 0;

$mod = isset($_GET['mod']) ? $_GET['mod'] : "home";
$site = isset($_GET['site']) ? $_GET['site'] : "index";
if($login == 0 && !in_array($mod, ['product']) && !in_array($site, ['list'])){
	$mod = "account";
	$site = "login";
}

$tpl = "../" . $mod . "/" . $site . ".tpl";
$file = ucfirst($mod) . ".php";
$class = ucfirst($mod);

require_once './model/' . $file;
$use = new $class;
$use->$site();
ob_end_flush();
# ------------------------------------- #