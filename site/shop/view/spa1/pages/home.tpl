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
{if $a_home_product_new}
<section class="S-2 S-1">
    <div class="container text-center">
        <h3 class="title text-white">Sản phẩm mới</h3>
        <div class="under-title my-2">
            <span>
                <i class="text-white fa fa-asterisk"></i>
            </span>
        </div>
        <span class="des text-white pb-3">Sản phẩm mới được câp nhật liện tục</span>
        <div class="row">
            {foreach from=$a_home_product_new key=k item=data}
            <div class="col-xs-12 col-sm-6 col-md-3 mb-3">
                <div class="bg-white mb-2">
                    <div class="price text-center">
                        <span class="product-price">Giá từ {$data.price|number_format}đ</span>
                    </div>
                    <div class="avt">
                        <a href="{$data.url}">
                            <img src="{$data.avatar}" class="w-100" alt="{$data.name}" height="230">
                        </a>
                    </div>
                    <div class="info text-center">
                        <h3>
                            <a href="{$data.url}">
                                {$data.name}
                            </a>
                        </h3>
                        <button class="btn btn-custom mb-3">Chọn</button>
                    </div>
                </div>
            </div>
            {/foreach}
            <div class="w-100 text-center">
                <a href="{$a_main_menu.product_list}" class="btn text-white font-wright-bold">Xem tất cả</a>
            </div>
        </div>
    </div>
</section>
{/if}

{if $a_home_supporters}
<section id="S-1" class="S-1">
        <div class="container text-center">
            <h3 class="title ">Chào mừng đến với {$page.name}</h3>
            <div class="under-title my-4 ">
                <span>
                    <i class="fa fa-asterisk"></i>
                </span>
            </div>
            <span class="des">Nhân viên hỗ trợ</span>
            <div class="row my-3">
                {foreach from=$a_home_supporters item=data}
                <div class="col-xs-12 col-sm-6 col-md-3 my-3">
                    <a href="">
                        <img src="{$data.avatar}" class="rounded-circle" alt="{$data.name}" width="200" height="200">
                        <span class="d-block text-center name-cate">{$data.name}</span>
                        <span class="d-block text-center text-danger">{$data.phone}</span>
                    </a>
                </div>
                {/foreach}
            </div>
        </div>
</section>
{/if}		

{if $a_home_product_main}
<section class="S-2 S-1">
    <div class="container text-center">
        <h3 class="title text-white">Danh sách sản phẩm</h3>
        <div class="under-title my-2">
            <span>
                <i class="text-white fa fa-asterisk"></i>
            </span>
        </div>
        <span class="des text-white pb-3">Sản phẩm mới được câp nhật liện tục</span>
        <div class="row">
            {foreach from=$a_home_product_main key=k item=data}
            <div class="col-xs-12 col-sm-6 col-md-3 mb-3">
                <div class="bg-white mb-2">
                    <div class="price text-center">
                        <span class="product-price">Giá từ {$data.price|number_format}đ</span>
                    </div>
                    <div class="avt">
                        <a href="{$data.url}">
                            <img src="{$data.avatar}" class="w-100" alt="{$data.name}" height="230">
                        </a>
                    </div>
                    <div class="info text-center">
                        <h3>
                            <a href="{$data.url}">
                                {$data.name}
                            </a>
                        </h3>
                        <button class="btn btn-custom mb-3">Chọn</button>
                    </div>
                </div>
            </div>
            {/foreach}
            <div class="w-100 text-center">
                <a href="{$a_main_menu.product_list}" class="btn font-weight-bold text-white">Xem tất cả</a>
            </div>
        </div>
    </div>
</section>
{/if}
<section class="mt-5">
        <div class="row">
            <div class="col-lg-12">
                <a href="" class="img-1 d-block">
                    <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
                </a>
            </div>
    </div>
</section> 



<div class="py-4 px-5 S-1 bg-light text-center">
	<h3 class="title">Giới thiệu</h3>
    <div class="under-title my-2 ">
        <span>
            <i class="fa fa-asterisk"></i>
        </span>
    </div>
	<div class="py-4 text-left" id="cominfo">
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

{if $a_home_product_new}


{/if}

{if $a_home_partners}
<section id="S-6" class="S-4 S-1">
    <div class="mask"></div>
    <div class="wrapper">
        <div class="container text-center">
           <h3 class="title text-danger py-3">Đối tác</h3>
          
             <div class="owl-carousel owl-theme pb-3">
                {foreach from=$a_home_partners item=data}
                <div class="item text-center bg-white">
                    <img src="{$data.logo_custom}" class="w-100">
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
                            items:1
                        },
                        600:{
                            items:2
                        },
                        1000:{
                            items:2,
                        },
                        1200:{
                            items:5,
                        }
                    }
                })
            </script>
        </div>
    </div>
</section>
{/if}
