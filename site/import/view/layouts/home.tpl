<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="application/xhtml+xml">
<base href="{$arg.domain}">
<title>{$metadata.title|default:'Daisanplus'}</title>
<meta name="keywords" content="{$metadata.keyword|default:'daisanplus'}" />
<meta name="description"
	content="{$metadata.description|default:'Daisanplus'}" />
<meta property="og:image" content="{$metadata.image|default:''}" />

<link rel="shortcut icon" href="{$arg.img_gen}favicon.ico" type="image/x-icon" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="{$arg.stylesheet}css/bootstrap.min.css"
	type="text/css">
<link href="{$arg.stylesheet}css/jquery-ui.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="{$arg.stylesheet}css/font-awesome.min.css">
<link rel="stylesheet" href="{$arg.stylesheet}css/owl.carousel.min.css">
<link rel="stylesheet"
	href="{$arg.stylesheet}css/owl.theme.default.min.css">
<link rel="stylesheet" href="{$arg.stylesheet}css/custom.css"
	type="text/css">
<link rel="stylesheet" href="{$arg.stylesheet}css/transition.css"
	type="text/css">
<link rel="stylesheet" href="{$arg.stylesheet}css/loadingpage.css"
	type="text/css">
<link rel="stylesheet" href="{$arg.stylesheet}css/style.css"
	type="text/css">
<link rel="stylesheet" href="{$arg.stylesheet}css/mobile.css"
	type="text/css">
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script defer src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script defer src="{$arg.stylesheet}js/jquery.min.js" type="text/javascript"></script>
<script defer src="{$arg.stylesheet}js/jquery-ui.min.js"
	type="text/javascript"></script>
<script defer src="{$arg.stylesheet}js/owl.carousel.min.js"></script>
<script defer src="{$arg.stylesheet}js/bootstrap.min.js"
	type="text/javascript"></script>
<script defer src="{$arg.stylesheet}js/owl-query.js" type="text/javascript"></script>	
<script>
	var str_arg = '{$js_arg}';
</script>
<script defer src="{$arg.stylesheet}js/custom.js" type="text/javascript"></script>

</head>
<body>
	{include file="../includes/header.tpl"}
	<!-- end header -->
	{include file=$content}
    {include file="../includes/footer.tpl"}
</body>
</html>