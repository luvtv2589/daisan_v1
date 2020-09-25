<header>
            <div id="top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-12">
                            <a href="" class="text-white d-flex">
                                <img src="{$arg.stylesheet}images/ic.png" height="20" class="align-self-center pr-2">
                                <span>{$page.address}</span>
                            </a>
                        </div>
                        <div class="col-lg-4 col-4 text-right d-none d-sm-block">
                            <ul class="m-0 p-0">
                                <li class="d-inline-block"><a href="{$a_main_menu.company_information}" class="text-white px-2">Giới thiệu</a></li>
                                <li class="d-inline-block"><a href="" class="text-white px-2">Tin tức</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mid" class="pb-4 pb-lg-0">
                <div class="container">
                    <div class="row">
                        <div class="col-lg col-12">
                            <a href="{$arg.url_page}" alt="{$page.name}" class="jusitfy-content-end logo d-block my-lg-4 pl-lg-4">
                                <img src="{$page.logo_custom_img}" class="d-block d-lg-none w-100">
                                <span class="d-none d-lg-block">
                                    <span class="title-1 d-block text-uppercase mb-2">đơn vị sản xuất</span>
                                    <span class="name font-weight-bold text-uppercase text-warning">
                                        {$page.name}
                                    </span>
                                </span>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-12 text-center text-lg-right align-self-center">
                            <img  class="d-inline-block" src="{$arg.stylesheet}images/ic-1.png" width="32" height="32">
                            <span class="align-middle text-warning phone pl-2 font-weight-bold">{$page.phone}</span>
                        </div>
                    </div>
                </div>
            </div>
            <div id="bot" class="border-top bg-white">
                <div class="container">
                    <nav class="navbar navbar-expand-md navbar-light p-lg-0 py-1 px-0">
                         <form class="form-inline my-2 my-lg-0 d-block d-md-none">
                                <input class="form-control mr-sm-2" type="search" placeholder="Nhập từ khóa ..." id="search_key" aria-label="Search">
                                <button class="btn bg-transparent my-sm-0" onclick="search();" type="submit">
                                    <i class="fa fa-search text-muted"></i>
                                </button>
                            </form>
                        <button class="navbar-toggler rounded-0 bg-white p-1" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <a class="nav-link text-uppercase font-weight-bold" href="{$a_main_menu.home}">
                                    <span>trang chủ</span> </a>
                                </li>
                               
                                <li class="nav-item dropdown">
                                    <a class="nav-link text-uppercase font-weight-bold" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span>Về chúng tôi</span>
                                    </a>
                                    <div class="dropdown-menu p-0 border rounded-0" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item bg-white" href="{$a_main_menu.company_information}">Thông tin tổng quan</a> 
                                        <a class="dropdown-item bg-white" href="{$a_main_menu.company_profile}">Hồ sơ công ty</a>
                                        <a class="dropdown-item bg-white" href="{$a_main_menu.company_capacity}">Khả năng của công ty</a>
                                        <a class="dropdown-item bg-white" href="{$a_main_menu.company_partners}">Các đối tác chiến lược</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                            <a class="nav-link text-uppercase font-weight-bold" href="{$a_main_menu.product_list}">
                                <span>Danh mục sản phẩm</span>
                            </a>
                            {if $a_main_product_category}
                            <div class="dropdown-menu p-0 border rounded-0">
                                {foreach from=$a_main_product_category item=data}
                                <a class="dropdown-item" href="{$data.url}">{$data.name}</a>
                                {/foreach}
                            </div>
                            {/if}
                        </li>
                                <li class="nav-item">
                                    <a class="nav-link text-uppercase font-weight-bold" href="{$a_main_menu.contact}"><span>Liên hệ</span></a>
                                </li>

                            </ul>
                            <form class="form-inline my-2 my-lg-0 d-none d-md-block">
                                <input class="form-control mr-sm-2" type="search" placeholder="Nhập từ khóa ..." id="search_key" aria-label="Search">
                                <button class="btn bg-transparent my-2 my-sm-0" onclick="search();" type="submit">
                                    <i class="fa fa-search text-muted"></i>
                                </button>
                            </form>
                        </div>
                    </nav>
                </div>
            </div>
        </header>