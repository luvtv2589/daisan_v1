<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="application/xhtml+xml">
<base href="{$arg.domain}">
<title>{$metadata.title|default:'Hodine'}</title>
<meta name="keywords" content="{$metadata.keyword|default:'hodine'}" />
<meta name="description" content="{$metadata.description|default:'Hodine'}" />

<!-- Bootstrap -->
<link href="{$arg.stylesheet}css/bootstrap.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/font-awesome.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/custom.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/style.css" rel="stylesheet">

<link href="{$arg.dirimg}favicon.ico" rel="shortcut icon" type="image/x-icon">
<script src="{$arg.stylesheet}js/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/jquery-1.12.4.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/popper.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/bootstrap.min.js" type="text/javascript"></script>
<script>
	var arg = '{$js_arg}';
	var router = "{$out.router|default:'search'}";
</script>
<script src="{$arg.stylesheet}js/custom.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	{include file='../includes/header.tpl'}

	<section id="main">
		{include file=$content}
	</section>

	{include file='../includes/footer.tpl'}

</body>
</html>
