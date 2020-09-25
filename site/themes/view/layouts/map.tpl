<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="application/xhtml+xml">
<base href="{$arg.domain}">
<title>{$metadata.title|default:'Daisan.vn'}</title>
<meta name="keywords" content="{$metadata.keyword|default:'daisan'}" />
<meta name="description"
	content="{$metadata.description|default:'daisan'}" />
<meta name="robots" content="INDEX,FOLLOW" />
<meta name="revisit-after" content="1 days" />
<meta property="og:image" content="{$metadata.image|default:''}" />
<link href="{$arg.img_gen}favicon.ico" rel="shortcut icon"
	type="image/x-icon">

<!-- Bootstrap -->
<link href="{$arg.stylesheet}css/bootstrap.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/jquery-ui.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/font-awesome.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/pnotify.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/animate.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/custom.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/style.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/mobile.css" rel="stylesheet">
<link href="{$arg.stylesheet}plugins/select2/css/select2.min.css" rel="stylesheet">
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
<script src="{$arg.stylesheet}js/jquery.lazy.min.js"></script>
<script src="{$arg.stylesheet}plugins/select2/js/select2.min.js"></script>
<script src="{$arg.stylesheet}js/jquery-ui.min.js"
	type="text/javascript"></script>
<script>
	var str_arg = '{$js_arg}';
</script>
<script src="{$arg.stylesheet}js/custom.js"></script>
</head>
<body>
<div class="overlay"></div>
{if !$is_mobile}
	<header>
		<div class="head_main py-2 shadow-sm">
			<div class="container-fluid px-2 px-sm-5">
				<nav class="navbar navbar-expand-lg px-0">
					<a class="navbar-brand d-none d-sm-block" href="./"><img src="{$arg.logo.image}" height="36"></a>
					<div class="col-10 col-sm-8">
						<form  method="POST" action="javascript:void(0);" class="form-inline my-2 my-lg-0 w-sm-100 search" onsubmit="submitFormSearch();">
							<div class="col-4" style="padding-right: 0 !important">
								<div class="search-box pr-0 headsearch" id="headsearch">
									<div class="input-group">
										<input type="text" name="search-agent"
											   class="form-control clearable" id="KeyMap"
											   placeholder="Tôi đang tìm kiếm" value="{$filter.key|default:''}"
											   style="padding-left: 10px">
									</div>
									<div id="search_suggest"></div>
								</div>
							</div>
							<div class="col-6" style="padding-left: 0 !important">
								<div class="input-group" style="float: left">
									<div class="input-group-append">
										<button class="btn bg-white border-top border-bottom border-right dropdown-toggle"
												id="btn_select" type="button" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"></button>
									</div>
								</div>
								<div class="ml-5" style="margin-left: 20px">
									<select class="custom-select d-none d-sm-none d-md-inline-block form-control"
											id="location_id" name="location_id"
											onchange="location_add(this);">{$s_location}
									</select>
									<button type="button" class="btn btn-success btn-sm-block px-5" onclick="searchAddress()">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
							<div class="dropdown-menu"
								 style="position: absolute; left: 4%; top: 98%;">
								<ul class="categories-list row row-sm"
									style="padding-left: 27px; list-style-type: disc; margin-bottom: 0 !important">
									<li class="col-6 categories-list-item" data-value="Gạch"
										onclick="clickvalue(this)"><span
												class="icon icon-restaurant icon_small"></span>Gạch</li>
									<li class="col-6 categories-list-item" data-value="Đá"
										onclick="clickvalue(this)"><span
												class="icon icon-restaurant icon_small"></span>Đá</li>
									<li class="col-6 categories-list-item" data-value="Bồn rửa"
										onclick="clickvalue(this)"><span
												class="icon icon-restaurant icon_small"></span>Bồn rửa</li>
									<li class="col-6 categories-list-item"
										data-value="Thiết bị vệ sinh" onclick="clickvalue(this)"><span
												class="icon icon-restaurant icon_small"></span>Thiết bị vệ sinh</li>
									<li class="col-6 categories-list-item"
										data-value="Thiết bị vệ sinh" onclick="clickvalue(this)"><span
												class="icon icon-restaurant icon_small"></span>Sen vòi</li>
									<li class="col-6 categories-list-item"
										data-value="Thiết bị vệ sinh" onclick="clickvalue(this)"><span
												class="icon icon-restaurant icon_small"></span>Máy cắt</li>
								</ul>
							</div>
						</form>
					</div>
					<div class="col-2 col-sm-3">
						<ul class="navbar-nav ml-auto pull-right">
							<li class="nav-item active"><a class="nav-link" href="#">Phản hồi</a></li>
							<li class="nav-item"><a class="nav-link" href="https://partner.daisan.vn/">Đăng ký nhà bán</a></li>
						</ul>
					</div>


				</nav>
				<!-- end nav-->
			</div>
			<!-- end nav-->
		</div>
	</header>
{else}
	<header>
		<div id="headsearch" class="p-2">
			<div class="input-group">
				<div class="input-group-append">
					<span class="input-group-text border-0" id="mmenu_map">
						<i class="fa fa-bars" aria-hidden="true"></i>
					</span>
					<span class="input-group-text border-0 bg-white" onclick="searchAddress()"><i class="fa fa-search"></i></span>
				</div>
				<input class="form-control border-0 rounded-0 clearable" name="search-agent" id="KeyMap" placeholder="Tôi đang tìm kiếm" value="{$filter.key|default:''}">
			</div>
		</div>
		<nav id="sidebar" class="active d-block d-sm-none">
			<div class="sidebar-header">
				{if $arg.login eq 0}
					<div class="avatar mb-2"><a href="#"><img src="{$arg.loginimg}" class="img-fluid"></a></div>
					<a href="?mod=account&site=login">Đăng nhập</a><span class="split-line">|</span><a href="?mod=account&site=register">Đăng ký</a> {else}
					<div class="avatar mb-2">
						<a href="#"><img src="{$user.avatar}" class="img-fluid"></a>
					</div>
					<a href="?mod=account&site=index">{$user.name|default:''}</a> <span class="px-1">|</span> <a href="?mod=account&site=logout" class="link-black">Thoát</a>{/if}
			</div>
			<ul class="list-unstyled components">
				<li><a href="./"><i class="fa fa-home fa-fw"></i>Trang chủ</a></li>
				<div class="dropdown-divider"></div>
				{if $arg.login neq 0}
				<li><a href="?mod=account&site=index"><i class="fa fa-user-o fa-fw"></i><span> Tài khoản</span></a></li> {/if}
				<li><a href="{$arg.url_sourcing}?site=createRfq"><i class="fa fa-envelope-o fa-fw"></i><span> Tạo yêu cầu báogiá</span></a></li>
				<li><a href="?mod=account&site=rfq"> <i class="fa fa-heart-o fa-fw"></i><span> Danh sách nhu cầu</span></a></li>
				<li><a href="?mod=account&site=pages"><i class="fa fa-fw fa-diamond"></i> Quản lý gian hàng</a></li>
				<li><a href="?mod=account&site=messages"><i class="fa fa-envelope-o fa-fw"></i><span> Tin nhắn liên hệ</span></a></li>
				<li><a href="?mod=product&site=cart"> <i class="fa fa-shopping-basket fa-fw"></i><span> Giỏ hàng</span></a></li>
				<li><a href="?mod=account&site=orders"> <i class="fa fa-file-o fa-fw"></i><span> Đơn đặt hàng</span></a></li>
				<li><a href="?mod=account&site=pagefavorites"> <i class="fa fa-heart-o fa-fw"></i><span> Gian hàng theo dõi</span></a></li>
				<li><a href="?mod=account&site=productfavorites"> <i class="fa fa-heart-o fa-fw"></i><span> Sản phẩm yêu thích</span></a></li>
			</ul>
		</nav>
	</header>
{/if}
{include file=$content}
</body>
</html>