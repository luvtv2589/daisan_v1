<header>
    <div id="header-main" class="shadow-sm">
        <div class="container">
            <div class="row ">
                <div class="col-lg-3 col-md-6 col-12 text-center text-md-left order-md-6 order-lg-0">
                    <div id="logo">
                        <a href="{$arg.url_page}">
                        <img src="{$page.logo_custom_img}" alt="{$page.name}" width="100%">
                        </a>
                    </div>
                </div>
                <div class="col-lg-7 col-md-3 col-6 bg-blue-mobile align-self-center align-self-center align-self-lg-end">
                    <button class="btn btn-warning open d-block d-lg-none" type="button" >
                    <i class="fa fa-bars fz30 text-white"></i>
                    </button>
                    <nav class="navbar navbar-expand-lg navbar-light main-menu d-none d-lg-block">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active"><a class="nav-link" href="{$a_main_menu.home}">Trang chủ</a></li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown"> Về chúng tôi </a>
									<div class="dropdown-menu rounded-0">
										<a class="dropdown-item" href="{$a_main_menu.company_information}">Thông tin tổng quan</a> 
										<a class="dropdown-item" href="{$a_main_menu.company_profile}">Hồ sơ công ty</a>
										<a class="dropdown-item" href="{$a_main_menu.company_capacity}">Khả năng của công ty</a>
										<a class="dropdown-item" href="{$a_main_menu.company_partners}">Các đối tác chiến lược</a>
									</div>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle"  href="{$a_main_menu.product_list}">Danh mục sản phẩm</a>
									{if $a_main_product_category}
									<div class="dropdown-menu rounded-0">
										{foreach from=$a_main_product_category item=data}
										<a class="dropdown-item" href="{$data.url}">{$data.name}</a> 
										{/foreach}
									</div>
									{/if}
								</li>
								<li class="nav-item">
									<a class="nav-link" href="{$a_main_menu.contact}">Liên hệ</a>
								</li>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="col-lg-2 col-md-2 offset-md-1 offset-lg-0 col-6 bg-blue-mobile order-md-12 align-self-center text-right">
                	<div id="search" class="search d-inline-block">
                		<input type="text" class="form-control" id="search_key" placeholder="Nhập từ khóa tìm kiếm...">
                        <button type="button" class="btn btn-link" onclick="search();">
                         	<i class="fa fa-search"></i>
                        </button>
                    </div>
                    <div class="cart d-inline-block">
                        <button type="button" href="" class="btn btn-warning">
                         	<i class="fa fa-shopping-cart	"></i>
                         	<span class="cout">20</span>
                        </button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</header>
<section id="menu-mobi">
            <div class="wrapper">
                <button class="btn close" type="button">
                <i class="fa fa-times"></i>
                </button>
                <div class="account  text-center">
                    <div class="w-100 pb-2">
                        <i class="fa fa-user-circle"></i>
                    </div>
                    <div class="clearfix"></div>
                    <a href="">Đăng ký</a>
                    <span>|</span>
                    <a href="">Đăng ký</a>
                </div>
                <ul class="list-menu">
                    <li><a href="{$a_main_menu.home}">Trang chủ</a></li>
                    <li>
                        <a href="#">Về chúng tôi <i class="fa fa-angle-down float-right"></i></a>
                        <ul class="sub pl-3">
                            <li><a  href="{$a_main_menu.company_information}">Thông tin tổng quan</a></li>
                            <li><a  href="{$a_main_menu.company_profile}">Hồ sơ công ty</a></li>
                            <li><a  href="{$a_main_menu.company_capacity}">Khả năng của công ty</a></li>
                            <li><a  href="{$a_main_menu.company_partners}">Các đối tác chiến lược</a></li>
                        </ul>
                    </li>
                    <li>
                    	<a href="#">Danh mục sản phẩm<i class="fa fa-angle-down float-right"></i></a>
                    		{if $a_main_product_category}
		                    	<ul class="sub pl-3">
									<div class="dropdown-menu rounded-0">
										{foreach from=$a_main_product_category item=data}
										<li><a  href="{$data.url}">{$data.name}</a></li>
										{/foreach}
									</div>
		                    	</ul>
							{/if}
                    </li>
                    <li><a href="{$a_main_menu.contact}">Liên hệ</a></li>
                </ul>
            </div>
        </section>
