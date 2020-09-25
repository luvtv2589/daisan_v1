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
<div class="text-center py-4 bg-gray">
	<h3 class="page-title">Chăm sóc khách hàng</h3>
	<div class="row row-sm justify-content-md-center mt-4">
		{foreach from=$a_home_supporters item=data}
		<div class="col-md-2 col-6">
			<div class="card supporter">
			<div class="p-3 pl-4 pr-4">
				<a href="tel:{$data.phone}" class="d-block rounded-circle o-hidden bg-gray avatar"><img alt="avatar" src="{$data.avatar}" width="100%"></a>
			</div>
			<p class="mb-1"><b>{$data.name}</b></p>
			<p><a href="tel:{$data.phone}"><b>{$data.phone}</b></a></p>
			</div>
		</div>
		{/foreach}
	</div>
</div>
{/if}

{if $a_home_product_main}
<div class="text-center p-3 pt-4 pb-4" id="mainproduct">
	<h3 class="page-title">Sản phẩm chính</h3>
	<div class="row row-tn justify-content-center mt-4">
		{foreach from=$a_home_product_main key=k item=data}
		<div class="col-md-3">
			<div class="card mb-1 rounded-0">
				<a href="{$data.url}" class="img-zoom"><img class="card-img-top rounded-0" src="{$data.avatar}" alt="{$data.name}"></a>
				<div class="content">
					<h5 class="p-3"><a href="{$data.url}">{$data.name}</a></h5>
				</div>
			</div>
		</div>
		{/foreach}
	</div>
</div>
{/if}

<div id="comdesc">
	<div class="item">
		<h2>{$page.name}</h2>
		<div class="px-3 line-4">{$page.description}</div>
	</div>
</div>

<div class="py-4 px-5">
	<h3 class="page-title text-center">Giới thiệu công ty</h3>
	<div class="py-4" id="cominfo">
		<div class="row">
			<div class="col-md-4">
				<div class="item">
					<span class="icon"><i class="fa fa-fw fa-map-marker"></i></span>
					<span class="title">Địa chỉ</span>
					<span class="value">{$page.address|default:''}</span>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="item">
					<span class="icon"><i class="fa fa-fw fa-history"></i></span>
					<span class="title">Bắt đầu hoạt động</span>
					<span class="value">{$page.date_start|date_format:'%Y'}</span>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="item">
					<span class="icon"><i class="fa fa-fw fa-address-card-o"></i></span>
					<span class="title">Thể loại doanh nghiệp</span>
					<span class="value">Công ty thương mại</span>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="item">
					<span class="icon"><i class="fa fa-fw fa-cubes"></i></span>
					<span class="title">Sản phẩm chính</span>
					<span class="value">{$page.mainproducts}</span>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="item">
					<span class="icon"><i class="fa fa-fw fa-users"></i></span>
					<span class="title">Số lượng nhân viên</span>
					<span class="value">{$page.number_mem_show}</span>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="item">
					<span class="icon"><i class="fa fa-fw fa-bolt"></i></span>
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
		<a href="{$a_main_menu.company_information}">Tìm hiểu thêm về chúng tôi ></a>
	</div>
</div>

{if $a_home_product_new}
<div class="text-center px-3 pt-4">
	<h3 class="page-title">Sản phẩm mới</h3>
	<div class="row row-nm justify-content-center mt-4" id="services">
		{foreach from=$a_home_product_new key=k item=data}
		<div class="col-md-3">
			<div class="card mb-4 rounded-0">
				<a href="{$data.url}" class="o-hidden"><img class="card-img-top rounded-0" src="{$data.avatar}" alt="{$data.name}"></a>
				<div class="card-body px-2">
					<h5 class="card-title">
						<a href="{$data.url}">{$data.name}</a>
					</h5>
					<p class="card-text price mb-1">Giá từ {$data.price}đ</p>
				</div>
			</div>
		</div>
		{/foreach}
	</div>
</div>
{/if}

{if $a_home_partners}
<div class="text-center p-3 pt-4 pb-4 bg-gray">
	<h3 class="page-title">Đối tác của chúng tôi</h3>
	<div class="row justify-content-center row-sm">
		{foreach from=$a_home_partners item=data}
		<div class="col-2">
			<div class="card mb-2 rounded-0 pt-2 pb-2 p-1">
				<a href="{$data.url}" title="{$data.name}"><img alt="{$data.name}" src="{$data.logo_custom}" width="100%"></a>
			</div>
		</div>
		{/foreach}
	</div>
</div>
{/if}