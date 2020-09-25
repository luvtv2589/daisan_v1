<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="application/xhtml+xml">
<base href="{$arg.domain}">
<title>{$metadata.title|default:'Daisan.vn'}</title>

<meta name="keywords" content="{$metadata.keyword|default:'daisan'}" />
<meta name="description" content="{$metadata.description|default:'daisan'}" />
<meta name="robots" content="INDEX,FOLLOW"/>
<meta name="revisit-after" content="1 days" />
<meta property="og:title" content="{$metadata.title|default:''}" />
<meta property="og:image" content="{$metadata.image|default:''}" />
<meta property="og:image:width" content="600" />
<meta property="og:site_name" content="daisan.vn" />
<meta property="og:description" content="{$metadata.description|default:''}" />

<link href="{$arg.img_gen}favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="{$arg.stylesheet}css/bootstrap.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/jquery-ui.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/font-awesome.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/pnotify.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/animate.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/custom.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/style.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/mobile.css" rel="stylesheet">
<link rel="stylesheet" href="{$arg.stylesheet}css/owl.carousel.min.css">
<link rel="stylesheet" href="{$arg.stylesheet}css/owl.theme.default.min.css">

<script src="{$arg.stylesheet}js/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/jquery-1.12.4.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/popper.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/bootstrap.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/pnotify.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/owl.carousel.min.js"></script>
<script src="{$arg.stylesheet}js/jquery.lazy.min.js"></script>
<script src="{$arg.stylesheet}js/jquery-ui.min.js" type="text/javascript"></script>
<script>var str_arg = '{$js_arg}';</script>
<script src="{$arg.stylesheet}js/custom.js"></script>
<!-- suggest style -->
<style>
	#search_suggest_api{
		position: relative;
		z-index: 9;
		display: none;
	}
	.wrap-suggest{
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		background: white;
	}
	.main-suggest{
		width: 50%;
	}

	.sub-suggest {
		position: absolute;
		top: 0;
		right: 0;
		background: white;
		width: 50%;
		display: none;
	}
	.main-suggest li:hover{
		color: rgb(43, 36, 36);
		background: #007bff;
	}
	.main-suggest li:hover a{
		color: white !important;
		background: #007bff;
	}
	.main-suggest li:hover i{
		color: white !important;
	}
	.main-suggest li i{
		margin-bottom: 5px;
	}
	.main-suggest li:hover .sub-suggest{
		display: block;
		color: #212529;
	}
	.w-90{
		width: 90%;
		display: inline-block;
		padding: 5px 5px 0 5px;
	}
	.w-10{
		width: 10%;
		text-align: right;
	}
	.sub-suggest-text{
		padding: 5px 5px 0 5px;
		z-index: 9;
		color: rgb(43, 36, 36);
	}
	.sub-suggest-text:hover {
		background: transparent;
		color: black;
	}
	.main-suggest li:hover ul li{
		color: rgb(43, 36, 36);
		background: transparent;
	}
	.sub-suggest-text span{
		color: rgb(43, 36, 36);
	}
</style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-54567873-6"></script>
{literal}
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-MMRDVW');</script>
<!-- End Google Tag Manager -->
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-54567873-6');
</script>
{/literal}
</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MMRDVW"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
     <div class="overlay"></div>
     <div class="background"></div>
    
<header class="d-none d-sm-block">
	<div class="container-fluid">
		<div id="header" class="">
			<div id="header-top">
				<div class="row row-no">
					<div class="col-2 d-md-none">
						<button class="btn btn-sm mt-3 navbar-toggler p-0" type="button">
							<i class="fa fa-bars"></i>
						</button>
					</div>
					<div class="col-6 col-md-2">
						<a class="logo-main" href="{$arg.url_location}"> <img
							src="{$arg.logo.image|default:$arg.noimg}" class="img-fluid">
						</a>
					</div>
					<div class="col-4 d-md-none">
						<div class="text-right mt-2">
							<a class="btn btn-sm p-1"><i class="fa fa-bell-o"></i></a> <a
								class="btn btn-sm p-1"><i class="fa fa-download"></i></a>
						</div>
					</div>
					<div class="col-md-10 d-none d-sm-none d-md-block">
						<nav class="navbar navbar-expand-lg navbar-light">
							<div id="navbar-top" class="collapse navbar-collapse">
								<ul class="navbar-nav mr-auto nav-hover d-none d-sm-block">
									{foreach from=$a_menu_top item=data}
									<li class="nav-item"><span>{$data.name}<i
											class="fa fa-angle-down fa-fw "></i></span> {if $data.submenu}
										<ul class="mega-dropdown-menu row">
											{foreach from=$data.submenu item=sub1}
											<li class="col-xl-4 col-md-3 col-sm-3 float-left">
												<ul class="m-0 p-0">
													<li class="dropdown-header">{$sub1.name}</li> {foreach
													from=$sub1.submenu item=sub2}
													<li class=""><a href="{$sub2.url}">{$sub2.name}</a></li>
													{/foreach}
												</ul>
											</li> {/foreach}
										</ul> {/if}</li> {/foreach}
								</ul>
								<ul class="navbar-nav my-2 my-lg-0 d-none d-sm-block">
									<li>
										<div id="nav-top-right" class="pt-1">
											<ul class="navbar-nav">
												<li class="nav-item"><a href="{$arg.url_sourcing}"
													class="link-black">Một yêu cầu, nhiều báo giá</a></li>
												<li class="nav-item active"><a
													href="javascript:void(0)" class="link-black">Tải ứng
														dụng</a></li>
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
			<!-- Header main-->
			<div id="header-main">
				<div class="row row-sm" id="navbarSupportedContent">
					<div class="col-xl-2 col-lg-3 col-md-3 d-none d-sm-none d-md-block">
						<a class="logo-main " href="{$arg.url_location}"> <img
							src="{$arg.logo.image|default:$arg.noimg}" class="img-fluid">
						</a>
						<div class="header-main-category">
							<h3>
								<i class="fa fa-list-ul fa-fw"></i><span class="pl-1">Categories</span><i
									class="fa fa-angle-down fa-fw "></i>
							</h3>
							<div class="dropdown-category">
								<ul class="list-unstyled">
									{foreach from=$a_main_category item=cate}
									<li><a href="{$cate.url}" class="link-black line">{$cate.name}</a><i
										class="fa fa-angle-right"></i> {if isset($cate.sub)}
										<div class="sup-dropdown-category">
											{foreach from=$cate.sub item=subparent}
											<ul class="content-sup-dropdown-category">
												<li><a href="{$subparent.url}" class="link-black">{$subparent.name}</a><i
													class="fa fa-angle-right"></i>
													<ul>
														{if isset($subparent.sub)} {foreach from=$subparent.sub
														key=k item=sub}
														<li><a href="{$sub.url}" class="link-black">{$sub.name}</a></li>
														{/foreach} {/if}
													</ul></li>
											</ul>
											{/foreach}
										</div> {/if}</li> {/foreach}
									<li class="last-li"><a
										href="?mod=product&site=allcategory">All Categories</a></li>
								</ul>
							</div>
						</div>
					</div>

					<!-- <div class="col-md-7 col-12">
						<div class="search-box pr-0" id="headsearch">
							<div class="input-group">
								<select class="d-none d-sm-none d-md-inline-block" id="Type">{$filter.type}
								</select> <input type="text" class="form-control" id="Keyword"
									oninput="LoadKeyword(this.value);"
									onkeydown="GetKeyword(event);"
									placeholder="Nhập từ khoá tìm kiếm"
									value="{$filter.key|default:''}">
								<button class="btn-search" type="button" onclick="search();">
									<i class="fa fa-fw fa-search"></i><span
										class="d-none d-sm-none d-md-inline-block"> Search</span>
								</button>
								<div id="search_suggest"></div>
							</div>
						</div>-->
					<div class="col-xl-7 col-lg-5 col-md-5 col-12">
						<div class="search-box pr-0 mr-2 ml-3 headsearch" id="headsearch">
							<div class="input-group">
								<select class="d-none d-sm-none d-md-inline-block" id="Type">{$filter.type}
								</select> 
								<input type="text" class="form-control" id="Keyword_api"
									placeholder="Nhập từ khoá tìm kiếm"
									value="{$filter.key|default:''}">
								<select class="d-none d-sm-none d-md-inline-block" id="Location_header" onchange="SetLocation('header')">
								{$s_location}
								</select> 
								<button
									class="d-none d-lg-inline-block btn-search btn text-white rounded-0"
									type="button" onclick="search();">
									<i class="fa fa-fw fa-search"></i><span
										class="d-none d-xl-inline-block"> Tìm kiếm</span>
								</button>
							</div>
							<div id="search_suggest_api" >
								
							</div>
							<!-- <div class="wrap-suggest">
								<ul class="main-suggest">
									<li>
										<a href="#" class="w-90 main-suggest-text">Text</a>
										<span class="w-10 text-right"><i class="fa fa-arrow-right" aria-hidden="true"></i></span>
										<ul class="sub-suggest">
											<li class="sub-suggest-text">
												<span class="mr-2 mt-2 mb-2 mt-lg-0 "><b>items.name:</b></span>
												<a href="/product?k=gach&amp;attribute_keyname=Loại&amp;attribute_keyword=Loại A"
													class="form-check form-check-inline mr-2 mt-2 mb-2 mt-lg-0 ">
													<div class="card" style="min-width: 55px;">
														<img class="img-attr"
															src="https://ehost.daisan.vn/site/upload/attribute/1589342253_a394af1963b37c06f334e33947818f7b.png"
															title="Loại A">
														<div class="card-body p-1 text-center">
															<span>Loại A</span>
														</div>
													</div>
												</a>
												<a href="/product?k=gach&amp;attribute_keyname=Loại&amp;attribute_keyword=Loại A"
													class="form-check form-check-inline mr-2 mt-2 mb-2 mt-lg-0 ">
													<div class="card" style="min-width: 55px;">
														<img class="img-attr"
															src="https://ehost.daisan.vn/site/upload/attribute/1589342253_a394af1963b37c06f334e33947818f7b.png"
															title="Loại A">
														<div class="card-body p-1 text-center">
															<span>Loại A</span>
														</div>
													</div>
												</a>
												<a href="/product?k=gach&amp;attribute_keyname=Loại&amp;attribute_keyword=Loại A"
													class="form-check form-check-inline mr-2 mt-2 mb-2 mt-lg-0 ">
													<div class="card" style="min-width: 55px;">
														<img class="img-attr"
															src="https://ehost.daisan.vn/site/upload/attribute/1589342253_a394af1963b37c06f334e33947818f7b.png"
															title="Loại A">
														<div class="card-body p-1 text-center">
															<span>Loại A</span>
														</div>
													</div>
												</a>
												<a href="/product?k=gach&amp;attribute_keyname=Loại&amp;attribute_keyword=Loại A"
													class="form-check form-check-inline mr-2 mt-2 mb-2 mt-lg-0 ">
													<div class="card" style="min-width: 55px;">
														<img class="img-attr"
															src="https://ehost.daisan.vn/site/upload/attribute/1589342253_a394af1963b37c06f334e33947818f7b.png"
															title="Loại A">
														<div class="card-body p-1 text-center">
															<span>Loại A</span>
														</div>
													</div>
												</a>
												<a href="/product?k=gach&amp;attribute_keyname=Loại&amp;attribute_keyword=Loại A"
													class="form-check form-check-inline mr-2 mt-2 mb-2 mt-lg-0 ">
													<div class="card" style="min-width: 55px;">
														<img class="img-attr"
															src="https://ehost.daisan.vn/site/upload/attribute/1589342253_a394af1963b37c06f334e33947818f7b.png"
															title="Loại A">
														<div class="card-body p-1 text-center">
															<span>Loại A</span>
														</div>
													</div>
												</a>
											</li>
							
										</ul>
									</li>
							
								</ul>
							</div> -->
						</div>
					</div>
					<div class="header-notify col-xl-3 col-lg-4 col-md-4 d-none d-sm-none d-md-block">
						<ul class="d-flex float-right">
							<li class="nav-item">
								<div class="nav-item-child">
									<div class="md-icon md-icon-login">
										<i class="fa fa-user-o"></i>
									</div>
									<div class="main-head__title-top">Đăng ký</div>
									<div class="main-head__title-bottom">
										<a href="?mod=account&site=index" class="link-black">Tài khoản</a>
									</div>
								</div>
								
								<div class="dropdown-menu-right">
									{if $arg.login eq 0}
									<div class="px-3">
										<h4 class="py-2">Bắt đầu ngay bây giờ</h4>
										<div class="">
											<a href="?mod=account&site=login"
												class="btn btn-main btn-sm link-white">Đăng nhập</a> <span
												class="p-2">Hoặc</span> <a href="?mod=account&site=register"
												class="btn btn-outline-main btn-sm">Đăng ký</a>
										</div>
										<p class="">Tiếp tục với:</p>
										<ul class="list-inline">
											<li class="list-inline-item"><a href="{$btn_fb_login}"><i
													class="fa fa-facebook-square cl-blue fz32"></i></a></li>
											<li class="list-inline-item"><a href=""><i
													class="fa fa-google-plus-square cl-red fz32"></i></a></li>
										</ul>
										<div class="py-3 login-terms">
											<div class="form-check">
												<label class="form-check-label disabled"> <input
													class="form-check-input" type="checkbox" value="" disabled
													checked="checked"> I agree to <a href=""
													class="link-black">Free Membership Agreement</a>
												</label>
											</div>
											<div class="form-check">
												<label class="form-check-label disabled"> <input
													class="form-check-input" type="checkbox" value="" disabled
													checked="checked"> I agree to <a href=""
													class="link-black">Receive Marketing Materials</a>
												</label>
											</div>
										</div>
									</div>
									{else}
									<div class="mydaisan">
										<a href="?mod=account&site=index"
											class="link-black px-3 first">Hi, {$user.name|default:''}</a>
										<div class="px-3">
											<a class="link-black" href="?mod=account&site=index"><i
												class="fa fa-fw fa-user-circle"></i> Thông tin hồ sơ</a> <a
												class="link-black" href="?mod=account&site=index"><i
												class="fa fa-fw fa-key"></i> Đổi mật khẩu</a> <a
												class="link-black" href="?mod=account&site=pages"><i
												class="fa fa-fw fa-globe"></i> Quản lý gian hàng</a> <a
												class="link-black" href="?mod=account&site=createpage"><i
												class="fa fa-fw fa-plus"></i> Tạo gian hàng</a>
											<div class="dropdown-divider"></div>
											<a class="link-black" href="?mod=account&site=logout"><i
												class="fa fa-fw fa-sign-out"></i> Đăng xuất</a>
										</div>
									</div>
									{/if}

								</div>
							</li>
							<li class="nav-item">
								<div class="nav-item-child">
									<div class="md-icon md-icon-order">
										<i class="fa fa-shopping-basket"></i>
									</div>

									<div class="main-head__title-top">0</div>
									<div class="main-head__title-top">
										<a href="?mod=product&site=cart" class="link-black">Giỏ
											hàng </a>
									</div>
								</div>
								<div class="dropdown-menu-right">
									<div class="p-3">
										<div class="tips-order">
											Giao dịch đảm bảo <span class="flag">FREE</span> <a href="">xem
												thêm <i class="fa fa-angle-right"></i>
											</a>
										</div>
										<div class="under-tips">
											<ul class="list-unstyled">
												<li><i class="fa fa-circle"></i> Nhiều tùy chọn thanh
													toán an toàn</li>
												<li><i class="fa fa-circle"></i> Vận chuyển nhanh chóng</li>
												<li><i class="fa fa-circle"></i> Xây dựng sự tín nhiệm
													của bạn</li>
											</ul>
										</div>
										<div class="text-center mt-3">
											<a href="?mod=product&site=cart" class="btn-cart">Xem chi
												tiết giỏ hàng</a>
										</div>
									</div>
								</div>
							</li>
							<li class="nav-item w-33">
								<div class="nav-item-child">
									<div class="md-icon md-icon-favorite">
										<i class="fa fa-heart-o"></i>
									</div>
									<div class="main-head__title-top">
										<span class="number">0</span>
									</div>
									<div class="main-head__title-bottom">
										<a class="link-black"
											href="?mod=account&site=productfavorites"> Yêu thích</a>
									</div>
								</div>
								<div class="dropdown-menu-right">
									<div class="p-4">
										<div class="text-center mb-2">
											<a class="btn btn-block"
												href="?mod=account&site=productfavorites">Xem tất cả các
												mục</a>
										</div>
										<span class="logi">Đăng nhập để quản lý và theo dõi tất
											cả các mục yêu thích.</span>
									</div>
								</div>
							</li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>
</header>
{literal}
<script>
	$(document).ready(function() {
		if ($(window).width() < 700) {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').removeClass('active');
				$('.overlay').fadeIn();
				$('a[aria-expanded=true]').attr('aria-expanded', 'false');
			});
			$('.overlay').on('click', function() {
				$('#sidebar').addClass('active');
				$('.overlay').fadeOut();
			});

		} else {
			$('#sidebarCollapse').on('click', function() {
				$("#sidebar").toggleClass('active');
				$('#content').toggleClass('active');
			});
		}
	});
	$(window).scroll(function() {
		var hetop = $(window).scrollTop();
		if (hetop > 135) {
			$("header").addClass("fixed");
			$(".top-app").css("display", "none");
			$(".header-notify").css("display","none");
		} else {
			$("header").removeClass("fixed");
			$(".top-app").css("display", "flex");
			$(".header-notify").css("display","block");
		}
	});
	function SetType(value) {
		Type = $("input#Type").val(value);
	}
</script>
{/literal}

	<div class="mains-1">
		{include file=$content}
	<div class="clearfix"></div>
	</div>

	{include file='../includes/footer.tpl'}
	
</body>
</html>