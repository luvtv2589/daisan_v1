1<header>
   <div class="top">
      <div class="container">
         <div class="row">
            <div class="col-2 d-block d-lg-none">
               <button class="open">
               <i class="fa fa-list fz25 cl-red lh-69"></i>
               </button>
            </div>
            <div class="col-lg-3 col-md-7 col-7 text-center">
               <div class="logo">
                  <a href="{$arg.url_page}">
                  <img src="{$page.logo_custom_img}" alt="{$page.name}" class="w-100">
                  </a>
               </div>
            </div>
            <div class="col-lg-6 col-md-12 col-12 order-12 order-lg-0 align-self-center">
               <div class="search">
                  <form>
                     <input type="text" name="query" id="search_key" value="" autocomplete="off" placeholder="Bạn đang tìm sản phẩm nào" class="input-group-field auto-search">
                     <button class="btn" type="button" onclick="search();">
                     <i class="fa fa-search"></i>
                     </button>
                  </form>
               </div>
            </div>
            <div class="col-lg-3 col-md-3 col-3 text-right align-self-center">
               <div class="wishlist d-none d-sm-inline-block">
                  <a href="" class=" text-center">
                  <i class="fa fa-heart d-block fz20"></i>
                  <span>Yêu thích</span>
                  </a>
               </div>
               <div class="wishlist d-lg-inline-block d-block">
                  <a href="" class=" text-center">
                  <i class="fa fa-shopping-cart d-block fz20"></i>
                  <span class="cout-item">0</span>
                  <span class="d-none d-sm-block">Yêu thích</span>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="menu d-none d-lg-block">
      <div class="container">
         <nav class="navbar navbar-expand-lg navbar-light p-0 justify-content-center">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse text-center justify-content-center" id="navbarSupportedContent">
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