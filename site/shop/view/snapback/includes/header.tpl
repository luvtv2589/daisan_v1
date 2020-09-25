<header>
        <div class="top pb-3 pb-lg-0">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-12 align-self-center">
                        <a href="{$arg.url_page}" class="logo">
                            <img src="{$page.logo_custom_img}" alt="{$page.name}" class="w-100">
                        </a>
                    </div>
                    <div class="col-lg-5"></div>
                    <div class="col-md-4  align-self-center">
                        <div class="phone">
                            <i class="fa fa-phone cl-red"></i>
                            <span>
                                <a href="" class="font-weight-bold">{$page.phone}</a>
                            </span>
                        </div>
                        <div class="search w-100 mb-3">
                                <input type="text" class="field" name="s" value=""  id="search_key" placeholder="Search …">
                                <button class="btn" ttype="button" onclick="search();"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="menu py-3 py-lg-0">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light p-0">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
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