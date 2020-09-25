<header>
    <div class="top  d-none d-sm-block">
        <div class="container">
            <div class="row ">
                <div class="col-sm-6 text-left">
                    <span class="phone"><a href=""><i class="fa fa-phone-square pr-1"></i>{$page.phone}</a></span>
                    <span class="email"><a href="">{$page.email}</a></span>
                </div>
                <div class="col-sm-3 col-12 text-right search-form offset-sm-3">
                        <input type="search" name="query" value="" placeholder="Tìm kiếm sản phẩm... " id="search_key" class="" autocomplete="off">
                        <buttom class="btn btn-search border-0" type="button" onclick="search();">
                            <i class="fa fa-search"></i>
                        </buttom>
                </div>
            </div>
        </div>
    </div>
    <div class="main-menu pb-3 pb-lg-0">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-12 col-lg-4 text-center">
                    <a href="{$arg.url_page}" class="d-block">
                        <img src="{$page.logo_custom_img}" alt="{$page.name}" class="p-2 w-100" height="110">
                    </a>
                </div>
                <div class="col-12 d-block d-lg-none my-3">
                    <form action="">
                        <input type="search" name="query" value="" placeholder="Tìm kiếm sản phẩm... " class="input-group-field st-default-search-input search-text" autocomplete="off">
                        <button class="btn ">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
                <div class="col-12 col-md-12 col-lg-8">
                    <nav class="navbar navbar-expand-lg navbar-light p-0 h-100">
                        <a class="navbar-brand d-block d-sm-none" href="#">Menu</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav justify-content-center">
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
                                <a class="nav-link dropdown-toggle" href="{$a_main_menu.product_list}" >Danh mục sản phẩm</a>
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
        </div>
    </div>
</header>