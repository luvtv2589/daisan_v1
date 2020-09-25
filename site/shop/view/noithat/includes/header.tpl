
        <header>
        <div id="header-top" class=" bg-dark">
            <div class="container py-2">
                <div class="row">
                    <div class="col-lg-6 text-sm-left text-center">
                        <span>{$page.address}</span>
                    </div>
                    <div class="col-6 text-right d-none d-sm-block">
                        <ul>
                            <li class="inline-block">
                                <a href="" data-toggle="tooltip" data-placement="bottom" title="Tooltip on bottom">
                                    <i class="fa fa-envelope"></i>
                                    <span class="ml-1">{$page.phone}</span>
                                </a>
                            </li>
                            <span class="px-1">|</span>
                            <li class="inline-block">
                                <a href="" data-toggle="tooltip" data-placement="bottom" title="Tooltip on bottom">
                                    <i class="fa fa-envelope"></i>
                                    <span class="ml-1">{$page.email}</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="header-bot" class="align-self-center">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-3 col-12">
                        <a href="{$arg.url_page}" alt="{$page.name}">
                            <img class="w-100" src="{$page.logo_custom_img}" >
                        </a>
                    </div>
                   
                </div>
            </div>
        </div>
       
        <div id="menu-main" class=" bg-dark">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light ">
                    <button class="navbar-toggler bg-white" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse bg-dark" id="navbarSupportedContent">
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
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" id="search_key" placeholder="Search" aria-label="Search">
                            <button class=" my-2 my-sm-0" type="submit" onclick="search();"><i class="fa fa-search text-dark"></i></button>
                        </form>
                    </div>
                </nav>
            </div>
        </div>
    </header>