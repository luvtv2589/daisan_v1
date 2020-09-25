
      <header>
    <div class="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 d-none d-lg-block">
                    <span>{$page.address}</span>
                    <span  class="px-3">|</span>
                    <span>Hotline: {$page.phone}</span>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <input type="text" id="search_key" placeholder="Nhập từ khóa tìm kiếm...">
                    <button class="btn" type="button" onclick="search();">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="menu">
        <div class="container align-self-center">
            <div class="row align-self-center">
                <div class="logo col-lg-3 col-6 py-2">
                    <a href="{$arg.url_page}" alt="{$page.name}" class="d-block">
                    <img src="{$page.logo_custom_img}" class="w-100">
                    </a>
                </div>
                <div class="menu col-lg-8 col-3 order-first order-lg-6 align-self-center">
                    <nav class="navbar navbar-expand-lg navbar-light p-0 d-none d-sm-block align-self-center">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto ">
                                <li class="nav-item"><a class="nav-link" href="{$a_main_menu.home}">Trang chủ</a></li>
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
                            <a class="nav-link dropdown-toggle" href="{$a_main_menu.product_list}">Danh mục sản phẩm</a>
                            {if $a_main_product_category}
                            <div class="dropdown-menu rounded-0">
                                {foreach from=$a_main_product_category item=data}
                                <a class="dropdown-item" href="{$data.url}">{$data.name}</a>
                                {/foreach}
                            </div>
                            {/if}
                        </li>
                                <li class="nav-item"><a class="nav-link" href="{$a_main_menu.contact}">Liên hệ</a></li>
                            </ul>
                        </div>
                    </nav>
                    <button class="open d-block d-sm-none">
                    <i class="fa fa-list"></i>
                    </button>
                </div>
                <div class="col-lg-1 col-3 order-lg-12 align-self-center text-right">
                    <button>
                    <i class="fa fa-shopping-cart"></i>
                    <span class="cart-num">2</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</header>
<section id="menu-mobi" >
    <button class="close">
    <i class="fa fa-times"></i>
    </button>
    <div class="wrapper">
        <div class="logo w-100 py-3 text-center">
            <img src="{$page.logo_custom_img}" class="w-100 p-1">
        </div>
        <ul class="list-menu">
            <li>
                <a href="{$a_main_menu.home}">Trang chủ</a>
            </li>
            <li>
                <a href="#">Về chúng tôi <i class="fa fa-angle-down float-right mt-2"></i></a>
                <ul class="sub pl-3">
                    <li><a href="{$a_main_menu.company_information}">Thông tin tổng quan</a> </li>
                    <li><a href="{$a_main_menu.company_profile}">Hồ sơ công ty</a></li> 
                     <li><a  href="{$a_main_menu.company_capacity}">Khả năng của công ty</a></li>
                      <li><a  href="{$a_main_menu.company_partners}">Các đối tác chiến lược</a></li>                  
                </ul>
            </li>
            <li>
                <a href="{$a_main_menu.product_list}">Danh mục sản phẩm</a>
                <ul class="sub pl=3">
                    {foreach from=$a_main_product_category item=data}
                    <li><a href="{$data.url}">{$data.name}</a> </li>
                    {/foreach}
                </ul>
            </li>
            <li>
                <a href="{$a_main_menu.contact}">Liên hê</a>
            </li>
        </ul>
    </div>
</section>