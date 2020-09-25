{if $a_home_sliders_show}
<div>
    <div id="carouselExampleIndicators" class="carousel slide"
        data-ride="carousel">
        <ol class="carousel-indicators">
            {foreach from=$a_home_sliders_show key=k item=img}
            <li data-target="#carouselExampleIndicators" data-slide-to="{$k}" {if $k eq 0}class="active"{/if}></li>
            {/foreach}
        </ol>
        <div class="carousel-inner">
            {foreach from=$a_home_sliders_show key=k item=img}
            <div class="carousel-item {if $k eq 0}active{/if}">
                <img class="d-block w-100" src="{$img}">
            </div>
            {/foreach}
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators"
            data-slide="prev"> <span class="carousel-control-prev-icon"></span>
        <span class="sr-only">Previous</span>
        </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
            data-slide="next"> <span class="carousel-control-next-icon"></span>
        <span class="sr-only">Next</span>
        </a>
    </div>
</div>
{/if}
<section id="about-us">
    <div class="container">
        <div class="sec-title text-center">
            <h2>Về chúng tôi</h2>
        </div>
        <div class="row">
            <div class="col-md-7 col-sm-7 col-xs-12">
                <div class="about-info">
                    <h3>{$page.name}</h3>
                    <br>
                    <div class="text">
                        <p>{$page.description}</p>
                    </div>
                    <ul class="benifit-list">
                        <li><i class="fa fa-angle-right"></i>Công nghệ kỹ thuật tiên tiến nhất</li>
                        <li><i class="fa fa-angle-right"></i>Chế độ hậu mãi tuyệt với</li>
                        <li><i class="fa fa-angle-right"></i>Hỗ trợ tư vấn 24/7</li>
                        <li><i class="fa fa-angle-right"></i>Phục vụ tận tình tại nhà</li>
                    </ul>
                    <div class="link-btn">
                        <a href="{$a_main_menu.company_information}" class="btn btn-warning thm-btn">Xem thêm</a>
                    </div>
                </div>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-12">
                <div class="video-image-box">
                    <figure class="image">
                        <img src="{$page.img_intro}" alt="" class="w-100">
                        <a href="https://www.youtube.com/watch?v=nfP5N9Yc72A&amp;t=28s" class="">
                        <span class="icon fa fa-play"></span>
                        </a>
                    </figure>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="row m-0">
        <div class="col-lg-12 p-0">
            <a href="" class="img-1 d-block">
            <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
            </a>
        </div>
    </div>
</section>
<section>
    <div class="py-4 px-lg-5 px-3 S-1 bg-light">
    <h2 class="page-title text-center">Giới thiệu công ty</h2>
    <div class="py-4" id="cominfo">
        <div class="row">
            <div class="col-md-4 pb-2">
                <div class="item">
                    <span class="icon pr-2"><i class="fa fa-fw fa-map-marker"></i></span>
                    <span class="title">Địa chỉ</span>
                    <span class="value">{$page.address|default:''}</span>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-4 pb-2">
                <div class="item">
                    <span class="icon pr-2"><i class="fa fa-fw fa-history"></i></span>
                    <span class="title">Bắt đầu hoạt động</span>
                    <span class="value">{$page.date_start|date_format:'%Y'}</span>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-4 pb-2">
                <div class="item">
                    <span class="icon pr-2"><i class="fa fa-fw fa-address-card-o"></i></span>
                    <span class="title">Thể loại doanh nghiệp</span>
                    <span class="value">Công ty thương mại</span>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-4 pb-2">
                <div class="item">
                    <span class="icon pr-2"><i class="fa fa-fw fa-cubes"></i></span>
                    <span class="title">Sản phẩm chính</span>
                    <span class="value">{$page.mainproducts}</span>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-4 pb-2">
                <div class="item">
                    <span class="icon pr-2"><i class="fa fa-fw fa-users"></i></span>
                    <span class="title">Số lượng nhân viên</span>
                    <span class="value">{$page.number_mem_show}</span>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-4 pb-2">
                <div class="item">
                    <span class="icon pr-2"><i class="fa fa-fw fa-bolt"></i></span>
                    <span class="title">Doanh thu hàng năm</span>
                    <span class="value">{$page.revenue}</span>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row row-nm">
        {foreach from=$page.a_image item=data}
        <div class="col-md-3">
            <div class="img-zoom mb-3"><img alt="" src="{$data}" class="w-100 img-thumbnail rounded-0"></div>
        </div>
        {/foreach}
    </div>
    <div class="text-center mt-4">
        <a href="{$a_main_menu.contact}" class="btn btn-warning text-white mr-3"><i class="fa fa-fw fa-envelope-o"></i> Liên hệ với nhà cung cấp</a>
        <button class="btn btn-outline-warning mr-3 mt-3 mt-lg-0">Bắt đầu đặt hàng</button>
        <a href="{$a_main_menu.company_information}" class="text-info d-block mt-3 d-md-inline-block">Tìm hiểu thêm về chúng tôi ></a>
    </div>
</div>
</section>
{if $a_home_product_new}
<section class="new-product">
    <div class="mt-40 mb-20">
        <div class="container">
            <div class="sec-title text-center">
                <h2>Sản phẩm mới</h2>
            </div>
            <div class="sec-content">
                <div class="row">
                    {foreach from=$a_home_product_new key=k item=data}
                    <div class="col-6 col-md-4 col-lg-3">
                        <div class="wrapper">
                            <div class="product-avt">
                                <a href="{$data.url}" alt="{$data.name}" class="d-block py-3">
                                <img src="{$data.avatar}" alt="{$data.name}" class="w-100" height="280">
                                </a>
                                <div class="product-action text-center">
                                    <form action="">
                                        <button class="btn-circle">
                                        <i class="fa fa-shopping-basket"></i>
                                        </button>
                                        <a href="{$data.url}" class="btn-circle">
                                        <i class="fa fa-search-plus"></i>
                                        </a>
                                    </form>
                                </div>
                            </div>
                            <div class="product-info text-center mt-3">
                                <h3 class="product-name mb-2 text-dark font-weight-bold">
                                    <a href="{$data.url}" alt="{$data.name}">{$data.name}</a>
                                </h3>
                                <span class="product-price">Giá từ {$data.price}đ</span>
                            </div>
                            <div class="text-center pb-3">
                                <a href="{$data.url}" class="btn btn-warning text-white btn-sm rounded-0 font-weight-bold">Chi tiết >></a>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                    <div class="w-100 text-center">
                        <a class="btn btn-warning cl-white" href="{$a_main_menu.product_list}">Xem tất cả</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{/if}

{if $a_home_partners}
<section id="S-7">
    <div class="container py-4">
        <div class="owl-carousel owl-theme">
            {foreach from=$a_home_partners item=data}
            <div class="item text-center">
                <div class="rounded-circle d-inline-block w-50">
                    <img src="{$data.logo_custom}" alt="{$data.name}" class="w-100">
                </div>
                <div class="title-1 text-warning text-uppercase font-weight-bold mt-3">{$data.name}</div>
                <p class="text-white mx-3 text-left mx-lg-5 px-lg-5 font-weight-bold mt-4">" {$data.description}"</p>
            </div>
            {/foreach}
        </div>
        <script type="text/javascript">
            $('.owl-carousel').owlCarousel({
            loop:true,
            margin:10,
            nav:true,
            navText:["<i class='fa fa-caret-left'></i>","<i class='fa fa-caret-right'></i>"],
            navClass:['owl-prev','owl-next'],
            dots:false,
            responsive:{
               0:{
                   items:1
               },
               600:{
                   items:2
               },
               1000:{
                   items:3
               }
            }
            });
        </script>
    </div>
</section>
{/if}
{if $a_home_product_main}
<section class="new-product">
    <div class="mt-40 mb-20">
        <div class="container">
            <div class="sec-title text-center">
                <h2>Sản phẩm chính</h2>
            </div>
            <div class="sec-content">
                <div class="row">
                    {foreach from=$a_home_product_main key=k item=data}
                    <div class="col-6 col-md-4 col-lg-3">
                        <div class="wrapper">
                            <div class="product-avt">
                                <a href="{$data.url}" alt="{$data.name}">
                                <img src="{$data.avatar}" alt="{$data.name}" class="w-100 py-3" height="280">
                                </a>
                                <div class="product-action text-center">
                                    <form action="">
                                        <button class="btn-circle">
                                        <i class="fa fa-shopping-basket"></i>
                                        </button>
                                        <a href="{$data.url}" class="btn-circle">
                                        <i class="fa fa-search-plus"></i>
                                        </a>
                                    </form>
                                </div>
                            </div>
                            <div class="product-info text-center mt-3">
                                <h3 class="product-name mb-2 text-dark font-weight-bold">
                                    <a href="{$data.url}" alt="{$data.name}">{$data.name}</a>
                                </h3>
                                <span class="product-price">Giá từ {$data.price}đ</span>
                            </div>
                            <div class="text-center pb-3">
                                <a href="{$data.url}" class="btn btn-warning text-white btn-sm rounded-0 font-weight-bold">Chi tiết >></a>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                    <div class="w-100 text-center">
                        <a class="btn btn-warning cl-white" href="{$a_main_menu.product_list}">Xem tất cả</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{/if}

{if $a_home_supporters}
<section id="S-4" class="S-1 bg-light">
    <div class="container">
        <div class="sec-title text-center">
            <h2 class="">Bạn đang cần trợ giúp ?
                <Br/>
                <span>Hãy liên hệ tới nhân viên của chúng tôi để nhận được sự hỗ trợ tốt nhất cho những thắc mắc của bạn</span>
            </h2>
        </div>
        <div class="clearfix"></div>
        <div class="sec-content ">
            <div class="container">
                <div class="owl-carousel owl-theme">
                    {foreach foreach from=$a_home_supporters item=data}
                    <div class="item text-center">
                        <div class="wrapper">
                            <div class="service-avt">
                                <a href="">
                                <img src="{$data.avatar}" alt="" class="w-100" height="255">
                                </a>
                                <div class="service-overlay">
                                    <ul class="social">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="author-info text-left border-top">
                                <a href="">
                                    <h4>{$data.name}</h4>
                                </a>
                                <ul>
                                    <li>
                                        <i class="fa fa-phone"></i>
                                        ĐT: <a href="tel:{$data.phone}">{$data.phone}</a>
                                    </li>
                                    <li>
                                        <i class="fa fa-envelope"></i>
                                        <a href="">{$data.email}</a>
                                    </li>
                                    <li>
                                        <i class="fa fa-skype"></i>
                                        <a href="">{$data.skype}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                </div>
                <script type="text/javascript">
                    $('.owl-carousel').owlCarousel({
                    loop:true,
                    margin:10,
                    nav:false,
                    dots:false,
                    responsive:{
                       0:{
                           items:1
                       },
                       600:{
                           items:3
                       },
                       1000:{
                           items:4
                       }
                    }
                    });
                </script>
            </div>
        </div>
    </div>
</section>
{/if}