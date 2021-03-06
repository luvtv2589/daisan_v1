    <header>
            <div class="top">
                <div class="container">
                    <div class="row">
                        <div class="col-2 d-block d-lg-none align-self-center">
                            <button class="btn open">
                                <i class="fa fa-list"></i>
                            </button>
                        </div>
                        <div class="col-lg-3 align-self-center d-none d-lg-block">
                            <span class="icon">
                                <i class="fa fa-phone"></i>
                            </span>
                            <span>
                                <a href="" class="font-weight-bold">{$page.phone}</a>
                            </span>
                        </div>
                        <div class="col-lg-2 col-md-7 offset-lg-1 col-6">
                            <div class="logo text-center">
                                <a href="{$arg.url_page}" alt="{$page.name}">
                                    <img src="{$page.logo_custom_img}"  class="w-100">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-1 col-2 align-self-center text-right order-12 order-lg-0">
                            <div class="search d-inline-block">
                                <button class="btn" type="btn" onclick="search();">
                                    <i class="fa fa-search"></i>
                                </button>
                                    <input type="text" class="form-control" id="search_key" name="q" placeholder="Tìm kiếm...">
                            </div>
                       
                             <div class="cart d-inline-block">
                                <i class="fa fa-shopping-cart"></i>
                                <span class="cart-count">0</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="menu d-none d-lg-block">
                <div class="container">
                    <nav class="navbar navbar-expand-lg navbar-light p-0">
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                    <ul class="navbar-nav ">
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
                        <a href="{$a_main_menu.product_list}">Danh mục sản phẩm <i class="fa fa-angle-right float-right mt-1"></i></a>
                             {if $a_main_product_category}
                        <ul class="sub pl-3">
                                {foreach from=$a_main_product_category item=data}
                                <li><a class="dropdown-item" href="{$data.url}">{$data.name}</a></li>
                                {/foreach}
                        </ul>
                            {/if}
                        
                    </li>
                    <li><a href="{$a_main_menu.contact}">Liên hệ</a></li>
                </ul>
            </div>
        </section>