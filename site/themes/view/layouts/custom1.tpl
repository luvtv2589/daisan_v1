<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="application/xhtml+xml">
<base href="{$arg.domain}">
<title>{$metadata.title|default:'DAISAN'}</title>
<meta name="keywords" content="{$metadata.keyword|default:'hodine'}" />
<meta name="description"
	content="{$metadata.description|default:'Hodine'}" />
<link href="{$arg.stylesheet}images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<!-- Bootstrap -->
<link href="{$arg.stylesheet}css/bootstrap.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/jquery-ui.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/font-awesome.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/pnotify.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/animate.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/custom.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/style.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/tradeassurance.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/mobile.css" rel="stylesheet">

<link rel="stylesheet" href="{$arg.stylesheet}css/owl.carousel.min.css">
<link rel="stylesheet"
	href="{$arg.stylesheet}css/owl.theme.default.min.css">
<script src="{$arg.stylesheet}js/jquery-3.2.1.slim.min.js"
	type="text/javascript"></script>
<script src="{$arg.stylesheet}js/jquery-1.12.4.min.js"
	type="text/javascript"></script>
<script src="{$arg.stylesheet}js/popper.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="{$arg.stylesheet}js/pnotify.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/owl.carousel.min.js"></script>
<script src="{$arg.stylesheet}js/jquery-ui.min.js" type="text/javascript"></script>
<script>
	var str_arg = '{$js_arg}';
</script>
<script src="{$arg.stylesheet}js/custom.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-54567873-6"></script>
{literal}
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-54567873-6');
</script>
{/literal}
</head>
<body>
	{if !$is_mobile} {include file='../includes/header.tpl'} {/if}
	<section id="mains-1">{include file=$content}</section>
	{include file='../includes/footer.tpl'}
</body>
</html>