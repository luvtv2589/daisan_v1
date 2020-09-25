<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="application/xhtml+xml">
<base href="{$arg.domain}">
<title>{$metadata.title|default:'Daisanvn'}</title>
<meta name="keywords" content="{$metadata.keyword|default:'daisan.vn'}" />
<meta name="description"
	content="{$metadata.description|default:'Daisan.vn'}" />
<meta property="og:image" content="{$metadata.image|default:''}" />
<link rel="shortcut icon" href="{$arg.img_gen}favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet" href="{$arg.stylesheet}css/bootstrap.min.css">
<link rel="stylesheet" href="{$arg.stylesheet}css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="{$arg.stylesheet}css/autocomplete.css" />
<link type="text/css" rel="stylesheet" href="{$arg.stylesheet}css/search.css" />
<link type="text/css" rel="stylesheet" href="{$arg.stylesheet}css/custom.css" />
<link type="text/css" rel="stylesheet" href="{$arg.stylesheet}css/style.css" />
<link type="text/css" rel="stylesheet" href="{$arg.stylesheet}css/mobile.css" /><!-- Bootstrap CSS -->
<script type="text/javascript" src="{$arg.stylesheet}js/jquery.min.js"></script>
<script type="text/javascript" src="{$arg.stylesheet}js/hogan-3.0.1.js"></script>
<script type="text/javascript" src="{$arg.stylesheet}js/jquery.swiftype.autocomplete.js"></script>
<script type='text/javascript' src='{$arg.stylesheet}js/jquery.ba-hashchange.min.js'></script>
<script type="text/javascript" src="{$arg.stylesheet}js/jquery.swiftype.search.js"></script>
</head>
<body>
	<div class="container">
		{include file="../includes/header.tpl"}
		<!-- end header -->
		{include file=$content} {include file="../includes/footer.tpl"}
	</div>
</body>
</html>