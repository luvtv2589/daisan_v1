{if $a_home_sliders_show}
<div class="p-3">
    <div class="container">
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
</div>
{/if}
{if $a_home_supporters}
<section id="S-1" class="mt-5  mb-2 d-none d-sm-block">
    <div class="container">
        <div class="row">
            {foreach from=$a_home_supporters item=data}
            <div class="col-lg-3 col-md-6 text-center">
                <img src="{$data.avatar}" width="80" height="80">
                <div class="title mt-2">{$data.name}</div>
                <div class="des">Hotline :{$data.phone}</div>
            </div>
            {/foreach}
        </div>
    </div>
</section>
{/if}       
<section id="S-3" class="S-2 py-4">
    <div class="container">
        <div class="title text-center col-12">
                <div class="wrap-content">
                    <h2>Giới thiệu</h2>
                </div>
            </div>
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
            <button class="btn btn-outline-warning mr-3">Bắt đầu đặt hàng</button>
            <a href="{$a_main_menu.company_information}" class="text-info">Tìm hiểu thêm về chúng tôi ></a>
        </div>
    </div>
    </div>
</section>
{if $a_home_product_new}
<section id="S-3" class="S-2 mt-5">
    <div class="container">
        <div class="row">
            <div class="title text-center col-12">
                <div class="wrap-content">
                    <h2>
                        Sản phẩm mới
                    </h2>
                </div>
            </div>
            {foreach from=$a_home_product_new key=k item=data}
            <div class="col-lg-3 col-md-6 my-3 col-6">
                <div class="item">
                    <a href="{$data.url}" class="d-block avt">
                    <img src="{$data.avatar}" class="w-100" height="200">
                        <button class="btn btn-success">Xem nhanh</button>
                    </a>
                    <div class="sale">-21%</div>
                    <h3 class="name pt-2">
                        <a href="{$data.url}">{$data.name}</a>
                    </h3>
                    <span class="price">Giá từ {$data.price} đ</span>
                </div>
            </div>
            {/foreach}
        </div>
    </div>
</section>
{/if}
<section class="mt-5">
            <div class="col-lg-12">
                <a href="" class="img-1 d-block">
                    <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
                </a>
            </div>
</section> 
{if $a_home_product_main}
<section class="S-2 mt-5">
    <div class="container">
        <div class="row">
            <div class="title text-center col-12">
                <div class="wrap-content">
                    <h2>Tất cả sản phẩm</h2>
                </div>
            </div>
         {foreach from=$a_home_product_main key=k item=data}
            <div class="col-lg-3 col-md-6 my-3 col-6">
                <div class="item">
                    <a href="{$data.url}" class="d-block avt">
                    <img src="{$data.avatar}" class="w-100" height="200">
                    <button class="btn btn-success">Xem nhanh</button>
                    </a>
                    <div class="sale">-21%</div>
                    <h3 class="name pt-2">
                        <a href="{$data.url}">{$data.name}</a>
                    </h3>
                    <span class="price">Giá từ {$data.price} đ</span>
                </div>
            </div>
            {/foreach}
            <div class="col-lg-12 text-center mt-2">
                <a href="{$a_main_menu.product_list}" class="btn btn-success">Xem tất cả</a>
            </div>
        </div>
    </div>
</section>
{/if}

{if $a_home_partners}
<section id=S-5 class="S-2 mt-5">
    <div class="container">
        <div class="row">
            <div class="title text-center col-12">
                <div class="wrap-content">
                    <h2>Các đối tác</h2>
                </div>
            </div>
            <div class="owl-carousel owl-theme pt-4">
                {foreach from=$a_home_partners item=data}
                <div class="item">
                    <a href="">
                    <img src="{$data.logo_custom}">
                    </a>
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
                        items:3
                    },
                    600:{
                        items:3
                    },
                    1000:{
                        items:8
                    }
                }
                })
            </script>
        </div>
    </div>
</section>
{/if}