<header class="d-none d-lg-block py-2">
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<a href="{$arg.url_location}"><img src="{$arg.logo.image}"
					height="35"> </a>
			</div>
			<div class="col-lg-5 menu-left">
				<nav class="navbar navbar-expand-lg navbar-light p-0">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							{foreach from=$a_menu_top item=data}
							<li class="nav-item dropdown px-1"><a
								class="nav-link text-custom" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <span>{$data.name} <i
										class="icon icon-1"></i></span> <span class="mask"></span>
							</a> {if $data.submenu}
								<div class="dropdown-menu rounded-0 border-0 m-0 row"
									aria-labelledby="navbarDropdown">
									{foreach from=$data.submenu item=sub1}
									<div class="col-4 d-inline-block align-top">
										<a class="dropdown-item bg-white font-weight-bold text-dark"
											href="#">{$sub1.name}</a> {foreach from=$sub1.submenu
										item=sub2} <a class="dropdown-item bg-white text-custom"
											href="{$sub2.url}">{$sub2.name}</a> {/foreach}
									</div>
									{/foreach}
								</div> {/if}</li> {/foreach}
						</ul>
					</div>
				</nav>
			</div>
			<div class="col-lg-5 justify-content-end d-flex">
				<nav class="navbar navbar-expand-lg navbar-light p-0">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item pl-1"><i class="icon icon-2"></i> <a
								class="nav-link pl-0" id="open-search">Trên Daisan </a>
								<div id="form-search">
									<div>
										<div class="form-group">
											<i class="icon icon-2"></i> <input type="text"
												class="form-control"
												placeholder="Bạn đang tìm kiếm cái gì..." id="Keyword">
											<button class="btn bg-light fz-12 border" onclick="search();">Tìm
												kiếm</button>
											<i class="icon icon-101 close-search"></i>
										</div>
									</div>
								</div></li>
							<li class="nav-item dropdown px-1"><a class="nav-link "
								href="?mod=account&site=index"> <i class="icon icon-3"></i>
									<span class="text-custom">Đăng nhập</span> <i
									class="icon icon-4"></i> <span class="text-custom">Đăng
										ký</span> <span class="mask"></span>
							</a>
								<div
									class="dropdown-menu dropdown-menu-1 dropdown-menu-right rounded-0 border-0 m-0"
									aria-labelledby="navbarDropdown">
									<div class="title">Bắt đầu ngay bây giờ</div>
									<div class="M-1">
										<a href="?mod=account&site=login"
											class="btn btn-sm btn-custom text-white px-3">Đăng nhập</a> <span
											class="px-2">or</span> <a href="?mod=account&site=register"
											class="btn btn-sm btn-custom-1 px-3">Đăng ký</a>
									</div>
									<div class="M-2 text-center">
										<span>Đăng nhập với:</span>
										<div class="pt-2">
											<a href="" class="d-inline-block mr-1"> <img
												src="{$arg.stylesheet}images/fb.svg" width="32" height="32">
											</a> <a href="" class="d-inline-block mr-1"> <img
												src="{$arg.stylesheet}images/g.svg" width="32" height="32">
											</a>
											<!-- <a href="" class="d-inline-block mr-1">
                                       <img src="{$arg.stylesheet}images/in.svg" width="32" height="32">
                                       </a>
                                       <a href="" class="d-inline-block mr-1">
                                       <img src="{$arg.stylesheet}images/tw.svg" width="32" height="32">
                                       </a> -->
										</div>
										<div class="M-3">
											<input class="sc-hd-ck" type="checkbox" disabled="disabled"
												checked="checked"> <span class="fz-12 "> <span
												class="text-muted">Tối đồng ý</span> <a href="#"
												class="text-custom">Thỏa thuận thành viên miễn phí</a>
											</span>
										</div>
										<div class="M-3">
											<input class="sc-hd-ck" type="checkbox" disabled="disabled"
												checked="checked"> <span class="fz-12 "> <span
												class="text-muted">Tối đồng ý</span> <a href="#"
												class="text-custom">Nhận quảng cáo, tiếp thị</a>
											</span>
										</div>
									</div>

								</div></li>
							<li class="nav-item dropdown px-1"><a class="nav-link "
								href="#" id="navbarDropdown" role="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="icon icon-5"></i> <span
									class="text-custom">Giỏ hàng</span> <span class="mask"></span>
							</a>
								<div
									class="dropdown-menu dropdown-menu-2 dropdown-menu-right rounded-0 border-0 m-0"
									aria-labelledby="navbarDropdown">
									<a href="" class="text-custom"> <i class="icon icon-8"></i>
										<span class="text-dark"> Giao dịch đảm bảo <span
											class="free">Miễn phí</span>
									</span> <span class="fz-12 text-info pl-1">Tìm hiểu thêm <i
											class="fa fa-angle-right text-muted"></i></span>
									</a>
									<ul class="list-unstyled">
										<li class="fz-12 text-muted pb-1"><i
											class="icon icon-9 mr-1"></i>Nhiều tùy chọn thanh toán an
											toàn</li>
										<li class="fz-12 text-muted pb-1"><i
											class="icon icon-9 mr-1"></i>Vận chuyển nhanh chóng</li>
										<li class="fz-12 text-muted pb-1"><i
											class="icon icon-9 mr-1"></i>Xây dựng sự tín nhiệm của bạn</li>
									</ul>
									<a href="?mod=product&site=cart"
										class="btn btn-sm btn-custom fz-12 text-white w-100">Xem
										chi tiết giỏ hàng</a>
								</div></li>
							<li class="nav-item dropdown px-1"><a class="nav-link "
								href="#" id="navbarDropdown" role="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="icon icon-6"></i> <span
									class="mask"></span>
							</a>
								<div
									class="dropdown-menu dropdown-menu-3 dropdown-menu-right rounded-0 border-0 m-0"
									aria-labelledby="navbarDropdown">
									<a href="?mod=account&site=productfavorites"
										class="btn btn-sm btn-custom fz-12 text-white w-100">Xem
										tất cả danh mục</a> <span class="fz-12 d-block mt-3"
										style="white-space: pre-wrap;"><a
										href="?mod=account&site=login">Đăng nhập</a> để quản lý và
										theo dõi tất cả các mục yêu thích.</span>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<section id="S-1" class="S-1 d-none d-lg-block">
	<div class="top">
		<div class="container d-flex">
			<a href="" class="M-1 d-inline-block align-self-center d-flex"> <i
				class="icon icon-1"></i> <span
				class="text-dark font-weight-bold pr-1 SP">{$page.yearexp}</span> <span
				class="year text-dark font-weight-bold pl-1">YEAR</span>
			</a> <a href="javascript:void(0)"
				class="d-inline-block align-self-center pl-1"> <i
				class="icon icon-2"></i>
			</a> <a href="javascript:void(0)"
				class="d-inline-block align-self-center pl-1"> <i
				class="icon icon-3"></i>
			</a> <a href="javascript:void(0)"
				class="d-inline-block align-self-center pl-1"> <i
				class="icon icon-4"></i>
			</a> <a href="javascript:void(0)"
				class="d-inline-block align-self-center pl-1"> <i
				class="icon icon-5"></i>
			</a>
			<div class="name">
				<span>{$page.name}</span> <i class="fa fa-angle-down mt-1"></i>
				<div class="dropdown bg-white">
					<a href="" class="tit d-block d-flex"> <i class="icon icon-2"></i>
						<span class="align-top pl-1 text-dark t">Đảm bảo thương mại</span>
					</a>
					<div class="px-2 pt-2">
						<span class="fz-12 info pb-2 d-block">{$info_page_location.province},
							Việt Nam</span> <span class="fz-12 py-2 d-block border-top d-flex">
							<span class="pr-1">Cấp độ giao dịch:</span> <span
							class="icon icon-6 pl-1"></span> <span class="icon icon-6 pl-1"></span>
							<span class="icon icon-6 pl-1"></span> <span
							class="icon icon-6 pl-1"></span>
						</span> <span class="fz-12 py-2 d-block border-bottom d-flex"> <span
							class="pr-1">Đánh giá nhà cung cấp:</span> <span
							class="icon icon-3 mr-1"></span> <span class="icon icon-4 mr-1"></span>
							<span class="icon icon-5 mr-1"></span>
						</span>
						<div class="fz-12 py-2 d-block oran-hover border-bottom d-flex">
							<div class="pr-1 info w-50">
								<b>{$access_month}</b><br> Truy cập
							</div>
							<div class="pr-1 info d-flex">
								<b class="ml-1">{$page.revenue}</b>
							</div>
							<div class="drop-down bg-white p-3 text-dark">Các giao dịch
								của nhà cung cấp được đưa ra thông qua Daisan trong 6 tháng qua.</div>
						</div>
						<div class="info-item performance">
							<table class="card-table">
								<tbody>
									<tr class="py-2 d-block">
										<th class="pr-4"><a href="" class="link-black">Thời
												gian đáp ứng</a></th>
										<td><span>&lt;24h</span></td>
									</tr>
									<tr class="py-2 d-block">
										<th class="pr-4"><a href="" class="link-black">Tỷ lệ
												tương tác</a></th>
									</tr>
								</tbody>
							</table>
						</div>
						<span class="fz-12 py-3 d-block text-center"> <a
							href="{$page.page_contact}" class="text-info ">Liên hệ nhà
								cung cấp</a>
						</span>
					</div>
				</div>
				<!-- end info-page -->
			</div>
			<span class="d-flex ml-3 fz-13 pt-1"> <i
				class="fa fa-heart mr-1"></i>Nhà cung cấp yêu thích
			</span>
		</div>
	</div>
	<div class="container">
		<div class="content" style="background: url('{$banner}') #ff6a00">
			<div class="wrapper">
				<div class="box-wrapper">
					<div class="logo">
						<img src="{$page.logo_custom_img}">
					</div>
					<h1 class="text-white pt-3">{$page.name}</h1>
					<span
						class="d-inline-block bg-white rounded px-2 align-self-center">
						<a href="" class="M-1 d-inline-block"> <i class="icon icon-1"></i>
							<span class="text-dark font-weight-bold align-top">{$page.yearexp}</span>
							<span class="year text-dark font-weight-bold align-top">YEAR</span>
					</a> <a href=""
						class="d-inline-block align-self-center pl-1 d-inline-flex mt-1">
							<i class="icon icon-2"></i>
					</a> <a href=""
						class="d-inline-block align-self-center pl-1 d-inline-flex mt-1">
							<i class="icon icon-3"></i>
					</a> <a href=""
						class="d-inline-block align-self-center pl-1 d-inline-flex mt-1">
							<i class="icon icon-4"></i>
					</a> <a href=""
						class="d-inline-block align-self-center pl-1 d-inline-flex mt-1">
							<i class="icon icon-5"></i>
					</a>
					</span> <span class="fz-12 font-weight-bold">{if
						$info_page_location.name}{$info_page_location.province}{else}{$page.province}{/if},
						Việt Nam</span>
				</div>
			</div>
		</div>
	</div>
	<div class="menu">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light p-0">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a
							class="nav-link text-white fz-13 px-4 py-3"
							href="{$a_main_menu.home}">Trang chủ <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link text-white fz-13 px-4 py-3" href="#"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Về chúng tôi </a>
							<div class="dropdown-menu border-0 rounded-0"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item fz-13 text-custom-u"
									href="{$a_main_menu.company_information}">Thông tin tổng
									quan</a> <a class="dropdown-item fz-12 text-custom-u"
									href="{$a_main_menu.company_profile}">Hồ sơ công ty</a> <a
									class="dropdown-item fz-13 text-custom-u"
									href="{$a_main_menu.company_capacity}">Khả năng của công ty</a>
								<a class="dropdown-item fz-13 text-custom-u"
									href="{$a_main_menu.company_partners}">Các đối tác chiến
									lược</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link text-white fz-13 px-4 py-3"
							href="{$a_main_menu.product_list}" id="navbarDropdown">Danh
								mục sản phẩm </a> {if $a_main_product_category}
							<div class="dropdown-menu border-0 rounded-0"
								aria-labelledby="navbarDropdown">
								{foreach from=$a_main_product_category item=data} <a
									class="dropdown-item fz-13 text-custom-u" href="{$data.url}">{$data.name}</a>
								{/foreach}
							</div> {/if}</li>
						<li class="nav-item"><a
							class="nav-link text-white fz-13 px-4 py-3"
							href="{$a_main_menu.contact}">Liên hệ</a></li>
					</ul>
					<div class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2 rounded-0" id="searchpage_key"
							type="search" placeholder="Tìm kiếm" aria-label="Search">
						<button class="btn btn-link my-2 my-sm-0" onclick="searchpage();"
							type="button">
							<i class="fa fa-search text-muted"></i>
						</button>
					</div>
				</div>
			</nav>
		</div>
	</div>
</section>
<section id="menu-mobile" class="d-block d-lg-none">
	<div class="mask"></div>
	<div class="row py-3">
		<div class="col-2 text-center">
			<a href="javascript:void(0)" class="btn btn-link p-0"> <img
				src="{$arg.stylesheet}images/ic-10.png" height="19" width="11"
				onclick="goBackHistory()">
			</a>
		</div>
		<div class="col-8 align-self-center">
			<input type="text" id="searchmobile" class="w-100"
				placeholder="Nhập từ khóa tìm kiếm"> <span
				class="text-white d-flex"> <img class="mt-1"
				src="{$arg.stylesheet}images/ic-12.png" width="14" height="14">
			</span>
		</div>
		<div class="col-2 text-center Open-S">
			<button class="btn btn-link p-0">
				<img src="{$arg.stylesheet}images/ic-11.png" height="19" width="30">
			</button>
		</div>
	</div>
</section>
<section id="Open-S">
	<div class="bg-white">
		{if $a_main_product_category} {foreach from=$a_main_product_category
		item=data} <a class="dropdown-item fz-12 text-custom-u d-block py-2"
			href="{$data.url}">{$data.name}</a> {/foreach} {/if}
	</div>
</section>
<section id="S-12"
	class="S-1 d-block d-lg-none border-bottom pb-3 bg-transparent">
	<div class="container">
		<div class="row">
			<div class="col-3 logo">
				<a href="{$a_main_menu.home}"><img src="{$page.logo_img}"
					class="w-100"></a>
			</div>
			<div class="col-9 pl-0">
				<span class="d-block M-2 text-white">{$page.name}</span>
				<div class="page_info">
					<div class="d-inline text-dark font-weight-bold">
						<i class="icon icon-1"></i> {$page.yearexp}<span
							class="year text-dark font-weight-bold align-top pl-1">YEAR</span>
					</div>
					<div class="d-inline">
						<img src="{$arg.stylesheet}images/vn.png" height="12"> <span
							class="text-muted fz-12 pl-1">VN</span>
					</div>
				</div>
				<div class="M-3">
					<a href=""> <img src="{$arg.stylesheet}images/ic-14.png"
						width="44" height="44">
					</a> <a href=""> <img src="{$arg.stylesheet}images/ic-13.png"
						width="44" height="44">
					</a>
				</div>

			</div>
		</div>
	</div>
</section>
<script>
	$(document).ready(function() {
		$("#open-search").click(function() {
			$("#form-search").show();
		});
		$(".close-search").click(function() {
			$("#form-search").hide();
		});
		$(".Open-S").click(function() {
			$("#Open-S").show();
		});
	});
</script>