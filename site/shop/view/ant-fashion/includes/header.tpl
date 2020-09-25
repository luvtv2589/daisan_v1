<header>
    <div class="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    {if $page.url_facebook}
                    <span>
                        <a href="{$page.url_facebook}" class="d-inline-block px-2">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </span>
                    {/if}
                  
                    {if $page.url_youtube}
                    <span>
                        <a href="{$page.url_youtube}" class="d-inline-block px-2">
                            <i class="fa fa-youtube"></i>
                        </a>
                    </span>
                    {/if}
                  
                    {if $page.url_google}
                    <span>
                        <a href="{$page.url_google}" class="d-inline-block px-2">
                            <i class="fa fa-google-plus"></i>
                        </a>
                    </span>
                    {/if}
                    <span class="top-slogan d-none d-sm-inline-block">
                    Chào mừng bạn đến với <strong class="cl-red">{$page.name}</strong>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div class="center">
        <div class="container">
            <div class="row text-center justify-content-center">
                <div class="col-lg-3 col-12 text-center align-self-center">
                    <a href="{$arg.url_page}" class="logo">
                    <img src="{$page.logo_custom_img}" class="w-100">
                    </a>
                </div>
                <div class="col-lg-4 offset-lg-2 col-9 align-self-center">
                    <div class="search">
                        <input type="search" name="query" value="" placeholder="Tìm kiếm sản phẩm... " class="input-group-field st-default-search-input search-text" autocomplete="off" id="search_key">
                        <button class="btn" type="button"  onclick="search();">
                        <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <div class="col-lg-3 d-none d-sm-block align-self-center mt-3 mt-lg-0">
                    {foreach from=$a_home_supporters item=data key=k}
                    {if $k eq 1}
                    <div class="hotline d-inline-block pr-3 ">
                        <img src="images/hotline_header_1.svg" alt="">
                        <div class="text d-inline-block ml-2">
                            <span class="d-block">Hỗ trợ trực tuyến</span>
                            <span class=" text-1">Gọi:<span class="cl-red">{$data.phone}</span></span>
                        </div>
                    </div>
                    {/if}
                    {/foreach}
                    {foreach from=$a_home_supporters item=data key=k}
                    {if $k eq 2}
                    <div class="hotline d-inline-block ">
                        <img src="images/hotline_header_1.svg" alt="">
                        <div class="text d-inline-block ml-2">
                            <span class="d-block">Hỗ trợ trực tuyến</span>
                            <span class=" text-1">Gọi:<span class="cl-red">{$data.phone}</span></span>
                        </div>
                    </div>
                    {/if}
                    {/foreach}
                </div>
                <div class="col-3 d-block d-sm-none">
                    <button class="btn h-100 open" type="button">
                    <i class="fa fa-list"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="menu bg-light d-none d-sm-block">
        <div class="container">
            <nav class="navbar navbar-expand-md navbar-light p-0">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active"><a class="nav-link font-weight-bold" href="{$a_main_menu.home}">Trang chủ</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdown" data-toggle="dropdown"> Về chúng tôi </a>
                            <div class="dropdown-menu rounded-0 p-0">
                                <a class="dropdown-item" href="{$a_main_menu.company_information}">Thông tin tổng quan</a> 
                                <a class="dropdown-item" href="{$a_main_menu.company_profile}">Hồ sơ công ty</a>
                                <a class="dropdown-item" href="{$a_main_menu.company_capacity}">Khả năng của công ty</a>
                                <a class="dropdown-item" href="{$a_main_menu.company_partners}">Các đối tác chiến lược</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle font-weight-bold" href="{$a_main_menu.product_list}">Danh mục sản phẩm</a>
                                    {if $a_main_product_category}
                                    <div class="dropdown-menu rounded-0 p-0">
                                        {foreach from=$a_main_product_category item=data}
                                        <a class="dropdown-item" href="{$data.url}">{$data.name}</a>
                                        {/foreach}
                                    </div>
                                    {/if}
                                </li>
                        <li class="nav-item"><a class="nav-link font-weight-bold" href="{$a_main_menu.contact}">Liên hệ</a></li>
                    </ul>
                </div>
            </nav>
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
                <a href="#">Về chúng tôi <i class="fa fa-angle-right float-right mt-1"></i></a>
                <ul class="sub pl-3">
                    <li><a href="{$a_main_menu.company_information}">Thông tin tổng quan</a></li>
                    <li><a href="{$a_main_menu.company_profile}">Hồ sơ công ty</a></li>
                    <li><a href="{$a_main_menu.company_capacity}">Khả năng của công ty</a></li>
                    <li><a href="{$a_main_menu.company_partners}">Các đối tác chiến lược</a></li>
                </ul>
            </li>
            <li>
                <a href="{$a_main_menu.product_list}">Danh mục sản phẩm</a>
                <ul class="sub pl-3">
                {foreach from=$a_main_product_category item=data}
                    <li><a href="{$data.url}">{$data.name}</a> </li>
                    {/foreach}
                </ul>
            </li>
            <li><a href="{$a_main_menu.contact}">Liên hệ</a></li>
        </ul>
    </div>
</section>