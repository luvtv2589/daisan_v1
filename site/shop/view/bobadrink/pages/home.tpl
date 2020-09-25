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
{if $a_home_supporters}
<seciton id="S-1">
    <div class="wrapper">
        <div class="container">
            <div class="owl-carousel owl-theme">
                {foreach from=$a_home_supporters item=data}
                <div class="item d-flex py-4 align-items-center">
                    <div class="icon">
                        <img src="{$data.avatar}" width="55" class="rounded-circle">
                    </div>
                    <div class="text ml-3">
                        <div class="title">{$data.name}</div>
                        <div class="description">
                            Số điện thoại :
                            <span class="cl-red">{$data.phone}</span>
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
                            items:2
                        },
                        600:{
                            items:3
                        },
                        1000:{
                            items:4
                        }
                    }
                })
            </script>
        </div>
    </div>
</seciton>
{/if}  
<section>
    <div class="container">
        <div class="row m-0">
            <div class="col-lg-12 p-0">
                <a href="" class="img-1 d-block">
                    <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
                </a>
            </div>
        </div>
    </div>
</section>
{if $a_home_product_new}
<section class="S-2">
    <div class="container">
        <h2 class="title text-center py-3">
            <a href="" class="text-uppercase font-weight-bold">Sản phẩm bán chạy</a>
        </h2>
        <div class="owl-carousel owl-theme">
            {foreach from=$a_home_product_new key=k item=data}
            <div class="item">
                <a href="{$data.url}">
                  <img src="{$data.avatar}" class="w-100" height="270">
                </a>
                <div class=" w-100 action text-center">
                    <form>
                        <a href="{$data.url}"><i class="fa  fa-search"></i></a>
                        <button class="btn btn-danger" type="button">Mua hàng</button>
                        <a href="">
                          <i class="fa fa-heart-o"></i>
                        </a>
                    </form>
                </div>
                <div class="info text-center">
                    <div class="rate">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <div class="name pt-3">
                        <a href="{$data.url}">{$data.name}</a>
                    </div>
                    <div class="price">
                        <span class="cl-red">Giá từ {$data.price|number_format}đ</span>
                        
                    </div>
                </div>
            </div>
            {/foreach}
        </div>
        <script type="text/javascript">
            $('.owl-carousel').owlCarousel({
                loop:true,
                margin:10,
                nav:true,
                navText: ["<i class='fa fa-angle-left'></i>","<i class='fa fa-angle-right'></i>"],
                        navClass:['owl-prev','owl-next'],
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
            })
        </script>
    </div>
</section>
{/if}
    
{if $a_home_product_main}
<section id="S-11" class="S-2 mt-5">
    <div class="container">
        <h2 class="title text-center py-3">
            <a href="" class="text-uppercase font-weight-bold">Danh sách sản phẩm</a>
        </h2>
        <div class="row">
            {foreach from=$a_home_product_main key=k item=data}
            <div class="col-lg-3 col-md-6">
                <div class="item">
                    <a href="{$data.url}">
                        <img src="{$data.avatar}" class="w-100" height="200">
                    </a>
                    <div class=" w-100 action text-center">
                        <form>
                            <a href="{$data.url}">
                            <i class="fa  fa-search"></i>
                            </a>
                            <button class="btn btn-danger" type="button">Mua hàng</button>
                            <a href="">
                            <i class="fa fa-heart-o"></i>
                            </a>
                        </form>
                    </div>
                    <div class="info text-center">
                        <div class="rate">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="name pt-3">
                            <a href="{$data.url}">{$data.name}</a>
                        </div>
                        <div class="price">
                            <span class="cl-red">Giá từ {$data.price|number_format}đ</span>
                            
                        </div>
                    </div>
                </div>
            </div>
            {/foreach}
            <div class="col-lg-12 text-center mt-3 mb-5">
                <a href="{$a_main_menu.product_list}" class="btn btn-warning text-white">Xem tất cả</a>
            </div>
        </div>
    </div>
</section>
{/if}
<section id="S-3" class=" mt-3">
    <div class="container">
        <h2 class="title text-center mt-2">
            <a href="">Giới thiệu</a>
        </h2>
        <blockquote>
           {$page.description|default:''}
        </blockquote>
    </div>
</section> 
<section  class="py-4 bg-light">
   
    <div class="container">
         <h3 class="sec-tit text-center ">
                <span class="bg-light">Sơ lược về công ty</span>
            </h3>
        <div class="py-4 text-left" id="cominfo">
            <div class="row bg-light py-3">
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-map-marker"></i></span>
                        <span class="title-1">Địa chỉ</span>
                        <span class="value">{$page.address|default:''}</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-history"></i></span>
                        <span class="title-1">Bắt đầu hoạt động</span>
                        <span class="value">{$page.date_start|date_format:'%Y'}</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-address-card-o"></i></span>
                        <span class="title-1">Thể loại doanh nghiệp</span>
                        <span class="value">Công ty thương mại</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-cubes"></i></span>
                        <span class="title-1">Sản phẩm chính</span>
                        <span class="value">{$page.mainproducts}</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-users"></i></span>
                        <span class="title-1">Số lượng nhân viên</span>
                        <span class="value">{$page.number_mem_show}</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-bolt"></i></span>
                        <span class="title-1">Doanh thu hàng năm</span>
                        <span class="value">{$page.revenue}</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-nm">
            {foreach from=$page.a_image item=data}
            <div class="col-md-3">
                <div class="img-zoom"><img alt="" src="{$data}" class="w-100 img-thumbnail rounded-0"></div>
            </div>
            {/foreach}
        </div>
        <div class="text-center my-4">
            <a href="{$a_main_menu.contact}" class="btn btn-danger mr-3"><i class="fa fa-fw fa-envelope-o"></i> Liên hệ với nhà cung cấp</a>
            <button class="btn btn-outline-warning mr-lg-3 mt-2 mt-md-0">Bắt đầu đặt hàng</button>
            <a href="{$a_main_menu.company_information}" class="text-info d-block d-md-inline-block mt-2 mt-md-0">Tìm hiểu thêm về chúng tôi ></a>
        </div>
    </div>
    </div>
</section>



{if $a_home_partners}
<section class="S-2 pb-5 pt-3">
    
    <div class="container">
        <h2 class="title text-center py-3">
            <a href="" class="text-uppercase font-weight-bold">Đối tác</a>
        </h2>
        <div class="owl-carousel owl-theme">
            {foreach from=$a_home_partners item=data}
            <div class="item">
                <a href="{$data.url}" title="{$data.name}">
                  <img src="{$data.logo_custom}" class="w-100" >
                </a>
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
            })
        </script>
    </div>
</section>
{/if}