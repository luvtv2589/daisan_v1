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
												<li class="nav-item"><a href="/store/finder" class="link-black"><i class="fa fa-map-marker fa-fw" aria-hidden="true"></i>Bản đồ nhà cung cấp</a></li>
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
								</select> <input type="text" class="form-control" id="Keyword"
									placeholder="Nhập từ khoá tìm kiếm"
									value="{$filter.key|default:''}"> <select
									class="d-none d-sm-none d-md-inline-block" id="Location_header"
									onchange="SetLocation('header')"> {$s_location}
								</select>
								<button
									class="d-none d-lg-inline-block btn-search btn text-white rounded-0"
									type="button" onclick="search();">
									<i class="fa fa-fw fa-search"></i><span
										class="d-none d-xl-inline-block"> Tìm kiếm</span>
								</button>
							</div>
							<div id="search_suggest"></div>
						</div>
					</div>
					<div class="header-notify col-xl-3 col-lg-4 col-md-4">
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

									<div class="main-head__title-top"><span class="number">0</span></div>
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

{if $is_mobile}
<style>
#fsService .modal-dialog, #fsModal .modal-dialog{
	position: fixed;
	margin: 0;
	width: 100%;
	height: 100%;
	padding: 0;
}

#fsModal {
	z-index: 999999999999;
}

#fsModal ul li a {
	position: relative;
	padding: 10px 15px 10px 30px;
	border-bottom: 1px solid #eee;
	display: block;
	color: #424242;
	font-weight: 700;
	font-size: 14px;
}

#fsModal ul li a.active:before {
	border: 2px solid #0086e0;
	border-right: 0;
	border-top: 0;
	content: "";
	height: .5em;
	-webkit-transform: translate(-50%, -75%) rotate(-45deg);
	-ms-transform: translate(-50%, -75%) rotate(-45deg);
	transform: translate(-50%, -75%) rotate(-45deg);
	width: .9em;
	position: absolute;
	left: 15px;
	top: 48%;
}

#fsService .nav-pills .nav-link {
	font-size: 14px
}

#fsService .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	background: transparent;
	color: rgba(0, 0, 0, .8);
	border-bottom: 2px #f00 solid;
	border-radius: 0;
}

.discover-service-list li font {
	font-size: 12px;
	padding-left: 7px;
	font-weight: bold
}

.v--modal-overlay.scrollable {
	height: 100%;
	min-height: 100vh;
	overflow-y: auto;
	-webkit-overflow-scrolling: touch;
}

.v--modal-overlay {
	position: fixed;
	box-sizing: border-box;
	left: 0;
	top: 45px;
	width: 100%;
	height: 100vh;
	background: rgb(255, 255, 255);
	z-index: 999;
	opacity: 1;
}
</style>
<!-- <div class="top-app bd-highlight py-1 bg-white d-sm-none">
	<div class="p-2 py-4 bd-highlight">
		<button type="button" class="close" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="p-2 bd-highlight">
		<div class="media">
			<img class="mr-3"
				src="https://daisan.vn/site/upload/generals/favicon.ico"
				alt="Generic placeholder image" width="50">
			<div class="media-body">
				<h5 class="mt-0" style="font-size: 13px">DAISAN For Android</h5>
				<p class="mb-0" style="color: #febe14">
					<i class="fa fa-star fa-fw"></i><i class="fa fa-star fa-fw"></i><i
						class="fa fa-star fa-fw"></i><i class="fa fa-star-half fa-fw"></i>
				</p>
				20.000+ nhà cung cấp
			</div>
		</div>
	</div>
	<div class="p-2 bd-highlight pull-right">
		<a class="btn btn-primary"
			href="https://play.google.com/store/apps/details?id=com.appteng.android5b9b83a438099">Install</a>
	</div>
</div> -->
<header class="d-block d-sm-none">
	<section id="header">
		<div id="mheader-top" class="d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-1 d-flex align-items-center">
						<div class="mmenu" id="sidebarCollapse">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
					</div>
					<div class="col-5">
						<div id="logo">
							<a href="{$arg.url_location}"><img
								src="{$arg.logo.image|default:$arg.noimg}" height="30px"></a>
						</div>
					</div>
					<div class="col-4">
						<a href="tel:1800 6464 98" class="hdcall"><span>Gọi miễn phí</span><strong>1800
								6464 98</strong></a>
					</div>
					<div class="col-md-6 col-2 text-right">
						<a href="javascript:void(0)" onclick="showService()"><img
							src="{$arg.stylesheet}images/menu-head.png" height="20"></a>
					</div>
				</div>
			</div>
		</div>
		
		<div id="mheader-main">
			<div class="container">
				<div class="row">
					<div class="container">
						<div id="headsearch">
							<div class="input-group">
								<input class="form-control"
									placeholder="Tìm kiếm sản phẩm or nhà cung cấp"
									onclick="showSearch()"> <a class="p-2 font-weight-bold"
									style="background: #f2f3f7;" onclick="showLocation()">{if
									$arg.id_location neq 0}{$arg.this_location.Name}{else}Địa
									điểm{/if}</a>
								<div class="input-group-append">
									<span class="input-group-text" id="btn-search"><i
										class="fa fa-search"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- modal -->
	<div id="fsService" class="modal animated bounceInDown" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<!-- dialog -->
		<div class="modal-dialog">
			<!-- content -->
			<div class="modal-content rounded-0 border-0 h-100">
				<!-- header -->
				<div class="modal-header py-2 bg-light border-0 rounded-0">
					<h5 class="modal-title text-center w-100">Dịch vụ DaiSan</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- header -->
				<div class="modal-header px-2 py-0 bg-light rounded-0">
					<ul class="nav nav-pills" id="pills-tab" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="pills-home-tab" data-toggle="pill" href="#pills-home"
							role="tab" aria-controls="pills-home" aria-selected="true">Mua
								sắm</a></li>
						<li class="nav-item"><a class="nav-link"
							id="pills-profile-tab" data-toggle="pill" href="#pills-profile"
							role="tab" aria-controls="pills-profile" aria-selected="false">Tiện
								ích</a></li>
						<li class="nav-item"><a class="nav-link"
							id="pills-contact-tab" data-toggle="pill" href="#pills-contact"
							role="tab" aria-controls="pills-contact" aria-selected="false">Tin
								tức & dự báo</a></li>
					</ul>
				</div>
				<!-- body -->
				<div class="modal-body px-2">
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<ul class="row discover-service-list">
								<li class="col-6"><a
									href="https://daisan.vn/products/gach-op-lat"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#009688">Tiles</font>
										<p class="card-text">Hệ thống sản phẩm gạch ốp lát tại
											DaiSan</p></a></li>
								<li class="col-6"><a
									href="https://daisan.vn/products/da-op-lat"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#2196F3">Stone</font>
										<p class="card-text">Hệ thống sản phẩm đá ốp lát tại
											DaiSan</p></a></li>
								<li class="col-6"><a
									href="https://shops.daisan.vn/rubimienbac"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#cf0000">Rubi</font>
										<p class="card-text">Rubi Tây Ban Nha phân phối độc quyền
											bởi DaiSan</p></a></li>
								<li class="col-6"><a href=""><img
										src="{$arg.logo.image}" height="20px"><font
										color="#0be814">Medici</font>
										<p class="card-text">Dòng sản phẩm gạch thẻ trang trí PP
											bởi DaiSan</p></a></li>
								<li class="col-6"><a href="https://mosaic.daisan.vn"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#1561f0">Mosaic</font>
										<p class="card-text">Chuyên sản phẩm mosaic ốp bể bơi</p></a></li>
								<li class="col-6"><a href="https://mall.daisan.vn"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#cf0000">Mall</font>
										<p class="card-text">DaiSanMall là hệ thống nhà cung cấp
											sản phẩm chính hãng</p></a></li>
							</ul>
						</div>
						<div class="tab-pane fade" id="pills-profile" role="tabpanel"
							aria-labelledby="pills-profile-tab">
							<ul class="row discover-service-list">
								<li class="col-6"><a href="http://daisanplus.com"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#FFC107">Plus</font>
										<p class="card-text">Hệ thống tìm kiếm mở rộng</p></a></li>
								<li class="col-6"><a href="http://daisanplus.com"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#00bed3">Search</font>
										<p class="card-text">Tìm kiếm chuyên biệt lĩnh vực XD & CN</p></a></li>
								<li class="col-6"><a href="https://evietbuild.daisan.vn"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#22829a">Evietbuild</font>
										<p class="card-text">Hệ thống sản phẩm đá ốp lát tại
											DaiSan</p></a></li>
								<li class="col-6"><a href="https://erp.daisan.vn/"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#a200d5">Erp</font>
										<p class="card-text">Phần mềm quản lý doanh nghiệp</p></a></li>
								<li class="col-6"><a href="https://duan.daisan.vn/"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#0be814">Project</font>
										<p class="card-text">Nguồn dự án tiềm năng nhanh và tốt
											nhất</p></a></li>
								<li class="col-6"><a href="https://sourcing.daisan.vn"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#1561f0">Sourcing</font>
										<p class="card-text">Hệ thống yêu cầu báo giá</p></a></li>
								<li class="col-6"><a
									href="https://app.logivan.com/user/login"><img
										src="{$arg.logo.image}" height="20px"><font color="#f60">Logivan</font>
										<p class="card-text">Tìm xe tải chở hàng nhanh nhất</p></a></li>
								<li class="col-6"><a href=https://thuvienphapluat.vn /><img
									src="{$arg.logo.image}" height="20px"><font
									color="#795548">Law</font>
									<p class="card-text">Hệ thống tra cứu, nắm bắt Pháp Luật
										Việt Nam</p> </a></li>
							</ul>
						</div>
						<div class="tab-pane fade" id="pills-contact" role="tabpanel"
							aria-labelledby="pills-contact-tab">
							<ul class="row discover-service-list">
								<li class="col-6"><a href="http://daisannews.com/"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#0555ff">News</font>
										<p class="card-text">Hệ thống tin tức tự động cập nhật
											hàng ngày</p></a></li>
								<li class="col-6"><a href="http://dubao360.daisannews.com/"><img
										src="{$arg.logo.image}" height="20px"><font
										color="#ea0000">Dubao360</font>
										<p class="card-text">Tổng hợp dự báo, xu hướng, nhu cầu</p></a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- body -->
			</div>
			<!-- content -->

		</div>
		<!-- dialog -->
	</div>
	<!-- modal -->
	<div id="fsModal" class="modal animated bounceIn" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<!-- dialog -->
		<div class="modal-dialog">
			<!-- content -->
			<div class="modal-content rounded-0 border-0">
				<!-- header -->
				<div class="modal-header py-2 bg-warning">
					<h5 class="modal-title" id="exampleModalLabel">Chọn địa điểm</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- header -->
				<!-- body -->
				<div class="modal-body px-2 pt-0 v--modal-overlay scrollable">
					<ul class="nav flex-column">
						{foreach from=$locations item=data}
						<li class="nav-item"><a
							class="nav-link {if $data.Id eq $arg.id_location}active{/if}"
							href="#" onclick="SetLocationMobile({$data.Id})"
							id="Location_mheader">{$data.Name}</a></li> {/foreach}
					</ul>
				</div>
				<!-- body -->
			</div>
			<!-- content -->

		</div>
		<!-- dialog -->
	</div>
	<!-- modal -->
</header>
<nav id="sidebar" class="active d-block d-sm-none">
	<div class="sidebar-header">
		{if $arg.login eq 0}
		<div class="avatar mb-2">
			<a href="#"><img src="{$arg.loginimg}" class="img-fluid"></a>
		</div>
		<a href="?mod=account&site=login">Đăng nhập</a><span
			class="split-line">|</span><a href="?mod=account&site=register">Đăng
			ký</a> {else}
		<div class="avatar mb-2">
			<a href="#"><img src="{$user.avatar}" class="img-fluid"></a>
		</div>
		<a href="?mod=account&site=index">{$user.name|default:''}</a> <span
			class="px-1">|</span> <a href="?mod=account&site=logout"
			class="link-black">Thoát</a>{/if}
	</div>
	<ul class="list-unstyled components">
		<li><a href="./"><i class="fa fa-home fa-fw"></i>Trang chủ</a></li>
		<div class="dropdown-divider"></div>
		{if $arg.login neq 0}
		<li><a href="?mod=account&site=index"><i
				class="fa fa-user-o fa-fw"></i><span> Tài khoản</span></a></li> {/if}
		<li><a href="{$arg.url_sourcing}?site=createRfq"><i
				class="fa fa-envelope-o fa-fw"></i><span> Tạo yêu cầu báo giá</span></a></li>
		<li><a href="?mod=account&site=rfq"> <i
				class="fa fa-heart-o fa-fw"></i><span> Danh sách nhu cầu</span></a></li>
		<li><a href="?mod=account&site=pages"><i
				class="fa fa-fw fa-diamond"></i> Quản lý gian hàng</a></li>
		<li><a href="?mod=account&site=messages"><i
				class="fa fa-envelope-o fa-fw"></i><span> Tin nhắn liên hệ</span></a></li>
		<li><a href="?mod=product&site=cart"> <i
				class="fa fa-shopping-basket fa-fw"></i><span> Giỏ hàng</span></a></li>
		<li><a href="?mod=account&site=orders"> <i
				class="fa fa-file-o fa-fw"></i><span> Đơn đặt hàng</span></a></li>
		<li><a href="?mod=account&site=pagefavorites"> <i
				class="fa fa-heart-o fa-fw"></i><span> Gian hàng theo dõi</span></a></li>
		<li><a href="?mod=account&site=productfavorites"> <i
				class="fa fa-heart-o fa-fw"></i><span> Sản phẩm yêu thích</span></a></li>
	</ul>
</nav>
<section id="content-search" class="d-sm-none">
	<div class="search-bar-header">
		<div class="container">
			<div class="row row-sm mt-1">
				<div class="col-2" onclick="goBack()">
					<span class="icon-back"><img
						src="{$arg.stylesheet}images/back.png" class="img-fluid"></span>
				</div>
				<div class="col-10">
					<div class="input-group">
						<input class="form-control" id="mKeyword"
							value="{$filter.key|default:''}"
							placeholder="Nhập vào từ khóa tìm kiếm...">
						<div class="input-group-prepend">
							<span class="input-group-text" onclick="msearch()">Tìm</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<nav>
			<div class="nav nav-pill" id="pills-tab" role="tablist">
				<a class="nav-item nav-link active" id="nav-home-tab"
					data-toggle="tab" href="#nav-home" role="tab"
					aria-controls="nav-home" aria-selected="true" onclick="SetType(0)">SẢN
					PHẨM</a> <a class="nav-item nav-link" id="nav-profile-tab"
					data-toggle="tab" href="#nav-profile" role="tab"
					aria-controls="nav-profile" onclick="SetType(1)">NHÀ CUNG CẤP</a>
			</div>
		</nav>
	</div>
	<div class="search-bar-content">
		<input type="hidden" id="Type" value="0">
		<div class="container">
			<div class="popular-keyword">
				<h3 class="keyword-title">Từ khóa phổ biến</h3>
				<div class="box-tag">
					{foreach from = $keyword.hot item = data} <a
						href="./product?k={$data.name}">{$data.name}</a> {/foreach}
				</div>

				<div class="clearfix"></div>
			</div>
			<div class="history-keyword">
				<h3 class="keyword-title">Lịch sử tìm kiếm:</h3>
				<div class="box-tag">
					
				</div>
			</div>
		</div>
	</div>
</section>
<script>
function showLocation(){
	$("#fsModal").modal('show');
	$('.modal-backdrop').remove();
}
function showService(){
	$("#fsService").modal('show');
	$('.modal-backdrop').remove();
}
</script>
{/if} {literal}
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
