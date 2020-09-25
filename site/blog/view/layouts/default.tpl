<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="application/xhtml+xml">
<base href="{$arg.url_blog}">
<title>{$metadata.title|default:'Blog - Tin tức vật liệu xây dựng'}</title>
<meta name="keywords" content="{$metadata.keyword|default:'daisan'}" />
<meta name="description"
	content="{$metadata.description|default:'Thông tin chính xác, cập nhật giá cả thị trường vật liệu xây dựng. Cung cấp kiến thức, kinh nghiệm mua và lựa chọn vật liệu xây dựng.'}" />
<link href="{$arg.stylesheet}images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<meta property="og:title" content="{$metadata.title|default:''}" />
<meta property="og:image" content="{$metadata.image|default:''}" />
<meta property="og:image:width" content="600" />
<meta property="og:site_name" content="daisan.vn" />
<meta property="og:description" content="{$metadata.description|default:''}" />
<!-- Bootstrap -->
<link href="{$arg.stylesheet}css/bootstrap.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/font-awesome.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/pnotify.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/animate.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/custom.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/style.css" rel="stylesheet">

<script src="{$arg.stylesheet}js/jquery-3.2.1.slim.min.js"
	type="text/javascript"></script>
<script src="{$arg.stylesheet}js/jquery-1.12.4.min.js"
	type="text/javascript"></script>
<script src="{$arg.stylesheet}js/popper.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="{$arg.stylesheet}js/pnotify.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/owl.carousel.min.js"></script>
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
</head>
<body class="bg-white">
	<div class="overlay"></div>
	{include file='../includes/header.tpl'}
	<div class="blog--content">
		<div class="container">{include file=$content}</div>
	</div>

	{include file='../includes/footer.tpl'}

</body>
</html>
