
    <header>
         <div class="top d-none d-sm-block">
            <div class="container">
               <div class="row">
                  <div class="col-lg-4 col-md-4 col-xs-4 h-100">
                     <strong><i class="fa fa-phone text-white"></i>
                     <a href="">{$page.phone}</a>
                     </strong>
                     <span>|</span>
                     <strong><i class="fa fa-envelope text-white"></i>
                     <a href="">{$page.email}</a>
                     </strong>
                  </div>
                  <div class="col-lg-4 col-md-3">
                     <form class="sreach">
                        <input type="text" name="q" placeholder="Bạn tìm gì..." autocomplete="off" id="search_key">
                        <button class="btn" type="button" onclick="search();"><i class="fa fa-search"></i></button>
                     </form>
                  </div>
                  <div class="col-lg-4 col-md-5 col-xs-8">
                     <ul>
                        <li><a href="{$arg.domain}">Hodine</a></li>
                        <li><a href="{$a_main_menu.home}">Trang chủ</a></li>
                        <li><a href="{$a_main_menu.company_information}">Giới thiệu</a></li>
                        <li><a href="{$a_main_menu.contact}">Liên hệ</a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <div class="menu">
            <div class="container">
               <div class="row">
                  <div class="col-lg-8 col-3 d-block d-sm-none align-self-center">
                     <button class="open">
                        <i class="fa fa-bars fz30 h-100 lh-100 "></i>
                     </button>
                  </div>
                  <div class="col-lg-3 col-7  text-center ">
                     <a href="{$arg.url_page}" class="d-block" >
                        <img src="{$page.logo_custom_img}" class="w-100 py-3" height="105" alt="{$page.name}">
                     </a>
                  </div>
                  <div class="col-lg-7 col-3 d-none d-sm-block align-self-center">
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
                  <div class="col-lg-2 col-2 align-self-center text-right">
                     <a href="" class=" h-100 mr-2 lh-100 d-none d-sm-inline-block">
                     <i class="fa fa-user cl-black fz30"></i>
                     </a>
                     <a href="" class="d-inline-block h-100 lh-100" id="cart">
                     <i class="fa fa-shopping-cart cl-black fz30"></i>
                     <span class="number text-center">0</span>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <section id="menu-mobi">
         <div class="wrapper">
            <a class="close">
            <i class="fa fa-arrow-left"></i>
            </a>
            <div class="search">
               <form action="/search" class="nomargin">
                  <input type="hidden" name="type" value="product" >
                  <input type="text" name="q" class="form-control noboxshadow noradius" placeholder="Bạn muốn tìm gì..." id="search_key">
                  <button class="button nomargin" onclick="search();"><i class="fa fa-search"></i></button>
               </form>
            </div>
            <ul class="list-menu">
            <li>
                <a href="{$a_main_menu.home}">Trang chủ</a>
            </li>
            <li>
                <a href="#">Về chúng tôi <i class="fa fa-angle-down float-right"></i></a>
                <ul class="sub ">
                    <li><a href="{$a_main_menu.company_information}">Thông tin tổng quan</a> </li>
                    <li><a href="{$a_main_menu.company_profile}">Hồ sơ công ty</a></li> 
                     <li><a  href="{$a_main_menu.company_capacity}">Khả năng của công ty</a></li>
                      <li><a  href="{$a_main_menu.company_partners}">Các đối tác chiến lược</a></li>                  
                </ul>
            </li>
            <li>
                <a href="{$a_main_menu.product_list}">Danh mục sản phẩm</a>
                <ul class="sub ">
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