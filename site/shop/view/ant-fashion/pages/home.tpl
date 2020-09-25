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

{if $a_home_product_new}
<section id="S-1" class="S-1">
    <div class="container">
        <h2 class="title text-center py-5">
            <span>Sản phẩm mới</span>
        </h2>
        <div class="owl-carousel owl-theme">
            {foreach from=$a_home_product_new key=k item=data}
            <div class="item">
                <a href="{$data.url}">
                <img src="{$data.avatar}" class="w-100" height="210">
                </a>
                <div class="actions">
                    <form action="" method="post">
                        <a class="fa fa-shopping-basket add_to_cart" data-toggle="tooltip" data-placement="top" title="" data-original-title="Mua ngay"></a>
                        <a href="{$data.url}" data-toggle="tooltip" data-placement="top" title="{$data.name}" class="fa fa-search quick-view" data-original-title="Xem nhanh"></a>
                    </form>
                </div>
                <div class="info pb-5 pt-3 text-center px-3">
                    <h3 class="name"><a href="{$data.url}" title="{$data.name}">{$data.name}</a></h3>
                    <span>Giá từ {$data.price|number_format}đ</span>
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
</section>
{/if}
{if $a_home_product_main}
<section class="S-1 mt-5 bg-light">
    <div class="container">
        <div class="row">
            <h2 class="title text-center col-12 py-5">
                <span class="bg-light">Danh sách sản phẩm</span>
            </h2>
            {foreach from=$a_home_product_main key=k item=data}
            <div class="col-lg-3 col-md-6 col-12">
                <div class="item bg-white mb-4 pos-rel">
                    <a href="{$data.url}">
                    <img src="{$data.avatar}" class="w-100" height="210">
                    </a>
                    <div class="actions">
                        <form action="" method="post">
                            <a class="fa fa-shopping-basket add_to_cart" data-toggle="tooltip" data-placement="top" title="" data-original-title="Mua ngay"></a>
                            <a href="{$data.url}" data-toggle="tooltip" data-placement="top" title="{$data.name}" class="fa fa-search quick-view" data-original-title="Xem nhanh"></a>
                        </form>
                    </div>
                    <div class="info pb-5 pt-3 text-center px-3">
                        <h3 class="name"><a href="{$data.url}" title="{$data.name}">{$data.name}</a></h3>
                        <span>Giá từ {$data.price|number_format}đ</span>
                    </div>
                </div>
            </div>
            {/foreach}
            <div class="col-12 text-center my-4">
                <a href={$a_main_menu.product_list}"" class="btn btn-outline-danger ">Xem tất cả</a>
            </div>
        </div>
    </div>
</section>
{/if}

{if $a_home_supporters}
<section id="S-3" class="S-1 my-5">
    <div class="container">
        <div class="row">
            <h2 class="title text-center col-12">
                <span>Tổng đài viên</span>
            </h2>
            {foreach from=$a_home_supporters item=data}
            <div class="col-lg-3 col-md-6 col-12 mt-3 mt-lg-0">
                <div class="support bg-light">
                    <div class="avt">
                        <img src="{$data.avatar}" class="w-100" height="255">
                    </div>
                    <div class="info">
                        <h2>{$data.name}</h2>
                        <p>{$data.phone}</p>
                    </div>
                </div>
            </div>
            {/foreach}
        </div>
    </div>
</section>
{/if} 
<section class="mt-5">
        <div class="row m-0">
            <div class="col-lg-12 p-0">
                <a href="" class="img-1 d-block">
                    <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
                </a>
            </div>
    </div>
</section>    


<section  class="py-4 mt-4">
   
    <div class="container">
         <h3 class="sec-tit text-center ">
                <span>Sơ lược về công ty</span>
            </h3>
        <div class="py-4 text-left" id="cominfo">
            <div class="row py-3">
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
            <button class="btn btn-outline-warning mr-3 mt-3 d-inline-block mt-lg-0">Bắt đầu đặt hàng</button>
            <a href="{$a_main_menu.company_information}" class="text-info d-block d-md-inline-block mt-2">Tìm hiểu thêm về chúng tôi ></a>
        </div>
    </div>
    </div>
</section>



{if $a_home_partners}
</section>
<section id="S-4" class="S-1">
    <div class="container">
        <h2 class="title text-center">
            <span>Đối tác</span>
        </h2>
        <div class="owl-carousel owl-theme">
            {foreach from=$a_home_partners item=data}
            <div class="item">
                <a href="">
                <img src="{$data.logo_custom}" class="w-100">
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
                        items:2
                    },
                    600:{
                        items:3
                    },
                    1000:{
                        items:5
                    }
                }
            })
        </script>
    </div>
</section>
{/if}