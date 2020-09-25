<header>
	<div id="head-top" class="d-none d-md-block">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<ul>
						<li><a href="{$arg.domain}">Daisan.vn</a></li>
						<li><a href="{$a_main_menu.home}">Trang chủ</a></li>
						<li><a href="{$a_main_menu.company_information}">Giới thiệu</a></li>
						<li><a href="{$a_main_menu.contact}">Liên hệ</a></li>
					</ul>
				</div>
				<div class="col-md-6">
					<div class="text-right">
						<span><i class="fa fa-fw fa-history"></i>Mở cửa: {$page.time_open|default:''}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="bg-white">
			<div class="row">
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-5">
							<a href="{$arg.url_page}" class="pr-4 d-block">
								<img class="my-2" alt="{$page.name}" src="{$page.logo_custom_img}" width="100%">
							</a>
						</div>
						<div class="col">
							<div class="input-group mt-4 mb-3" id="search">
								<input type="text" class="form-control" id="search_key" placeholder="Nhập từ khóa tìm kiếm...">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button" onclick="search();"><i class="fa fa-search fa-fw"></i></button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col d-none d-md-block">
					<div id="head-hotline" class="text-right mt-3 pr-3">
						<h5 class="text-uppercase">Hỗ trợ khách hàng</h5>
						<h4><a href="tel:{$page.phone|default:''}"><i class="fa fa-phone fa-fw"></i>{$page.phone|default:''}</a></h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="menu">
		<div class="container">
			<nav class="navbar navbar-expand-lg">
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
					<span class="navbar-toggler-icon"></span>
				</button>
		
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item"><a class="nav-link" href="{$a_main_menu.home}">Trang chủ</a></li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="{$a_main_menu.company_information}"> Về chúng tôi </a>
							<div class="dropdown-menu rounded-0">
								<a class="dropdown-item" href="{$a_main_menu.company_information}">Thông tin tổng quan</a> 
								<a class="dropdown-item" href="{$a_main_menu.company_profile}">Hồ sơ công ty</a>
								<a class="dropdown-item" href="{$a_main_menu.company_capacity}">Khả năng của công ty</a>
								<a class="dropdown-item" href="{$a_main_menu.company_partners}">Các đối tác chiến lược</a>
							</div>
						</li>
						<!-- <li class="nav-item"><a class="nav-link" href="{$a_main_menu.service_list}"> Danh mục dịch vụ</a></li> -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="{$a_main_menu.product_list}">Danh mục sản phẩm</a>
							{if $a_main_product_category}
							<div class="dropdown-menu rounded-0">
								{foreach from=$a_main_product_category item=data}
								<a class="dropdown-item" href="{$data.url}">{$data.name}</a>
								{/foreach}
							</div>
							{/if}
						</li>
						<!-- <li class="nav-item"><a class="nav-link" href="{$a_main_menu.jobpost}">Tuyển dụng</a></li> -->
						<li class="nav-item"><a class="nav-link" href="{$a_main_menu.contact}">Liên hệ</a></li>
					</ul>

					<ul class="nav justify-content-end menu-right">
						{if $page.url_facebook}
						<li class="nav-item"><a class="nav-link" href="{$page.url_facebook}"><i class="fa fa-fw fa-facebook"></i></a></li>
						{/if}
						{if $page.url_google}
						<li class="nav-item"><a class="nav-link" href="{$page.url_google}"><i class="fa fa-fw fa-google-plus"></i></a></li>
						{/if}
						{if $page.url_youtube}
						<li class="nav-item"><a class="nav-link" href="{$page.url_youtube}"><i class="fa fa-fw fa-youtube"></i></a></li>
						{/if}
					</ul>
					
				</div>
			</nav>
		</div>
	</div>
</header>