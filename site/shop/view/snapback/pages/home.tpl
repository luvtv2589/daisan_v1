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
<section id="S-2" class="S-2">
        <div class="container">
            <div class="row">
                <div class="slogan text-center col-12 mt-5">
                    <h2>Hỗ trợ theo yêu cầu</h2>
                </div>
            {foreach from=$a_home_supporters item=data}
                <div class="col-lg-3 col-md-6 pt-4 mt-3 mt-lg-0 pt-lg-0">
                    <div class="list-pro">
                        <div class="wrapper">
                            <div class="avt">
                                <a href="#">
                                    <img src="{$data.avatar}" alt="{$data.name}" class="w-100">
                                </a>
                            </div>
                            <div class="info">
                                <div class="icon">
                                    <a href="">
                                        <i class="fa fa-asterisk"></i>
                                    </a>
                                </div>
                                <h2>
                                    <svg width="100%" height="100%">
                                        <line class="top" x1="0" y1="0" x2="600" y2="0"></line>
                                        <line class="left" x1="0" y1="200" x2="0" y2="-400"></line>
                                        <line class="bottom" x1="100%" y1="100%" x2="-700" y2="100%"></line>
                                        <line class="right" x1="100%" y1="0" x2="100%" y2="1000"></line>
                                    </svg>
                                    <a href="" class="cl-red">{$data.name}</a>
                                </h2>
                                <span>Hotline :{$data.phone}</span>
                            </div>
                        </div>
                    </div>
                </div>
        {/foreach}
                    
            </div>
            
        </div>
</section>
{/if}       
<section id="S-3" class="S-3">
        <div class="container">
                <div class="title text-center col-12">
                    <span>GIới <span class="cl-1">thiệu</span></span>
                    <div class="line-1"></div>
                    <div class="line-2"></div>
                </div>
                <div class="py-4 text-left" id="cominfo">
        <div class="row">
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
    <section class="mt-5">
        <div class="row">
            <div class="col-lg-12">
                <a href="" class="img-1 d-block">
                    <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
                </a>
            </div>
    </div>
</section>
{if $a_home_product_new}
<section id="S-4" class="S-4 S-3">
        <div class="container">
            <div class="title text-center col-12">
                    <span>Sản <span class="cl-1">phẩm</span></span>
                    <div class="line-1"></div>
                    <div class="line-2"></div>
                </div>
            <div class="row">
            {foreach from=$a_home_product_new key=k item=data}
                <div class="col-lg-2 col-6 text-center pt-3 pt-lg-0 mb-4">
                    <div class="card">
                        <a href="{$data.url}">
                            <img src="{$data.avatar}" alt="{$data.name}" class="w-100" height="168">
                            <span class="name">
                            <h3>{$data.name}</h3>
                        </span>
                        </a>
                    </div>
                </div>
            {/foreach}
            </div>
            <div class="col-lg-12 text-center mt-3">
                <a href="{$a_main_menu.product_list}" class="btn btn-success text-white">Xem tất cả</a>
            </div>
        </div>
    </section>
{/if}

{if $a_home_partners}
<section id="S-5" class="S-4 S-3 pb-3">
        <div class="mask"></div>
        <div class="container">
            <div class="title text-center col-12">
                    <span>Đối <span class="cl-1">tác</span></span>
                    <div class="line-1"></div>
                    <div class="line-2"></div>
                </div>
            <div class="owl-carousel owl-theme">
            {foreach from=$a_home_partners item=data}
                <div class="item">
                    <a href="#">
                        <img src="{$data.logo_custom}" alt="{$data.name}" class="w-100">
                    </a>
                </div>
            {/foreach}
            </div>
            <script>
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
                            items:5
                        },
                        1000:{
                            items:5
                        }
                    }
                })
                $('.play').on('click',function(){
                    owl.trigger('play.owl.autoplay',[1000])
                })
                $('.stop').on('click',function(){
                    owl.trigger('stop.owl.autoplay')
                })
            </script>
        </div>
    </section>
{/if}
