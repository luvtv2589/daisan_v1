{if $a_home_sliders_show}
<div class="p-3">
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
<section id="S-1">
    <div class="container">
        <div class="owl-carousel owl-theme">
            {foreach from=$a_home_supporters item=data}
            <div class="item ">
                <span class="icon">
                <img src="{$data.avatar}" alt="{$data.name}" class="w-100">
                </span>
                <div class="content">
                    <span class="title">{$data.name}</span>
                    <span class="des">SĐT {$data.phone}</span>
                </div>
            </div>
            {/foreach}
        </div>
        <script type="text/javascript">
            $('.owl-carousel').owlCarousel({
                loop:true,
                margin:10,
                nav:false,
                navText: ["<i class='fa fa-angle-right'></i>","<i class='fa fa-angle-left'></i>"],
                navClass:['owl-prev','owl-next'],
                dots:false,
                responsive:{
                    0:{
                        items:2
                    },
                    600:{
                        items:2
                    },
                    1000:{
                        items:2,
                    },
                    1200:{
                        items:4,
                    }
                }
            })
        </script>
    </div>
</section>
{/if}


{if $a_home_product_new}

<section id="S-9" class="S-2 mt-4">
    <div class="container">
        <div class="row">
            <div class="heading w-100">
                <h2 class="title">
                    <a href="">Top sản phẩm hot nhất</a>
                </h2>
            </div>
            <div class="owl-carousel owl-theme">
                {foreach from=$a_home_product_new key=k item=data}
                <div class="item p-2">
                    <div class="list-product">
                        <div class="thumnail">
                            <div class="sale">Sale</div>
                                <a href="{$data.url}" class="d-block">
                                    <img src="{$data.avatar}" class="w-100" height="200">
                                </a>
                            <div class="action">
                                <form>
                                    <button class="btn-cart btn-custom" title="Chọn sản phẩm" type="button">Chọn sản phẩm</button>
                                    <a href="{$data.url}" class="btn-custom"><i class="fa fa-search" aria-hidden="true"></i></a>
                                </form>
                            </div>
                        </div>
                        <div class="info text-center">
                            <h3 class="name">
                                <a href="{$data.url}">{$data.name}</a>
                            </h3>
                            <p>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </p>
                            <div >
                                <span class="price">Giá từ {$data.price|number_format}đ</span>
                            </div>
                        </div>
                    </div>
                </div>
                {/foreach}
            </div>
            <script type="text/javascript">
                $('.owl-carousel').owlCarousel({
                    loop:true,
                    margin:10,
                    navText: ["<i class='fa fa-angle-right'></i>","<i class='fa fa-angle-left'></i>"],
                navClass:['owl-prev','owl-next'],
                    responsive:{
                        0:{
                            items:2,
                    dots:true,
                nav:false,
                        },
                        600:{
                            items:3
                        },
                        1000:{
                            items:4,
                    dots:false,
                nav:true,
                        }
                    }
                })
            </script>
        </div>
    </div>
</section>
{/if}

{if $a_home_product_main}
<section class="S-2 mt-4">
    <div class="container">
        <div class="row">
            <div class="heading w-100">
                <h2 class="title">
                    <a href="">Danh sách sản phẩm</a>
                </h2>
            </div>
                {foreach from=$a_home_product_main key=k item=data}
            <div class="col-lg-3">
                <div class="item p-2">
                    <div class="list-product">
                        <div class="thumnail">
                            <div class="sale">Sale</div>
                                <a href="{$data.url}" class="d-block">
                                    <img src="{$data.avatar}" class="w-100" height="200">
                                </a>
                            <div class="action">
                                <form>
                                    <button class="btn-cart btn-custom" title="Chọn sản phẩm" type="button">Chọn sản phẩm</button>
                                    <a href="{$data.url}" class="btn-custom"><i class="fa fa-search" aria-hidden="true"></i></a>
                                </form>
                            </div>
                        </div>
                        <div class="info text-center">
                            <h3 class="name">
                                <a href="{$data.url}">{$data.name}</a>
                            </h3>
                            <p>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </p>
                            <div >
                                <span class="price">Giá từ {$data.price|number_format}đ</span>
                            </div>
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
<section>
        <a href="" class="img-1 d-block">
            <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
        </a>
</section>
<div class="py-4 px-5 S-1 bg-light">
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
            <div class="img-zoom"><img alt="" src="{$data}" class="w-100 img-thumbnail rounded-0"></div>
        </div>
        {/foreach}
    </div>
    
    <div class="text-center mt-4">
        <a href="{$a_main_menu.contact}" class="btn btn-danger mr-3"><i class="fa fa-fw fa-envelope-o"></i> Liên hệ với nhà cung cấp</a>
        <button class="btn btn-outline-warning mr-3">Bắt đầu đặt hàng</button>
        <a href="{$a_main_menu.company_information}" class="text-info">Tìm hiểu thêm về chúng tôi ></a>
    </div>
</div>



{if $a_home_partners}
<section id="S-4" class="S-2 my-4">
    <div class="container">
        <div class="heading w-100">
            <h2 class="title">
                <a href="">Đối tác</a>
            </h2>
        </div>
        <div class="owl-carousel owl-theme px-4">
            {foreach from=$a_home_partners item=data}
            <div class="item">
                <a href="{$data.url}">
                <img src="{$data.logo_custom}">
                </a>
            </div>
            {/foreach}
           
        </div>
        <script>
            $('.owl-carousel').owlCarousel({
                loop:true,
                margin:10,
                nav:true,
                navText: ["<i class='fa fa-angle-right'></i>","<i class='fa fa-angle-left'></i>"],
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
                        items:5
                    }
                }
            })
        </script>
    </div>
</section>
{/if}
