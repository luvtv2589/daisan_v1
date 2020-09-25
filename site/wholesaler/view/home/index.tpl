<div {if $is_mobile}class="bg-white"{/if}>
	<div class="slider">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
			{foreach from=$a_slider key=k item=data}
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="{if $k eq 0}active{/if}"></li>
			{/foreach}
			</ol>
			<div class="carousel-inner">
			{foreach from=$a_slider key=k item=data}
				<div class="carousel-item {if $k eq 0}active{/if}">
					<img class="d-block w-100"
						src="{$data.image}">
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
	<div class="daisanmall-top-banner">
		<div class="container">
			<div class="row">
				<div class="col-4 align-self-center d-none d-sm-block">
					<img
						src="{$arg.stylesheet}images/wholesaler.png"
						height="35px">
				</div>
				<div class="col-xl-8 align-self-center d-none d-sm-block">
					<ul class="nav">
						<li class="nav-item"><img
							src="https://laz-img-cdn.alicdn.com/images/ims-web/TB1l94fgMZC2uNjSZFnXXaxZpXa.png">Chính
							hãng</li>
						<li class="nav-item"><img
							src="https://laz-img-cdn.alicdn.com/images/ims-web/TB1GDNfgMZC2uNjSZFnXXaxZpXa.png">15
							Ngày trả hàng</li>
						<li class="nav-item"><img
							src="https://laz-img-cdn.alicdn.com/images/ims-web/TB1.SqKmQomBKNjSZFqXXXtqVXa.png">Nhận
							hàng ngay hôm sau</li>
					</ul>
				</div>
				<div class="col-12 align-self-center d-block d-sm-none">
					<ul class="nav">
						<li class="nav-item"><img
							src="https://laz-img-cdn.alicdn.com/images/ims-web/TB1hhPotHZnBKNjSZFhXXc.oXXa.png_1200x1200q80.jpg">Chính
							hãng</li>
						<li class="nav-item"><img
							src="https://laz-img-cdn.alicdn.com/images/ims-web/TB1jmHvtRjTBKNjSZFuXXb0HFXa.png_1200x1200q80.jpg">15
							Ngày trả hàng</li>
						<li class="nav-item"><img
							src="https://laz-img-cdn.alicdn.com/images/ims-web/TB1TUrvtRjTBKNjSZFuXXb0HFXa.png_1200x1200q80.jpg">Nhận
							hàng ngay hôm sau</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- end daisanmall -->
	<div class="d-block d-sm-none">
		<img
			src="https://laz-img-cdn.alicdn.com/images/ims-web/TB1jvKHaMaH3KVjSZFpXXbhKpXa.gif"
			class="img-fluid">
	</div>
	<div class="">
		<div class="container">
			<h3 class="py-3">Khuyến mãi từ Thương hiệu</h3>
			<div class="row row-sm">
				{foreach from=$event item=data}
				<div class="col-4 mb-2 d-none d-sm-block">
					<a href="{$data.url}"><img src="{$data.desktop}" class="img-fluid rounded"
						alt="{$data.name}"></a>
				</div>
				<div class="col-12 mb-2 d-block d-sm-none">
					<a href="{$data.url}"><img src="{$data.mobile}" class="img-fluid rounded"
						alt="{$data.name}"></a>
				</div>
				{/foreach}
			</div>

			<h3 class="py-3">Hệ thống cửa hàng bán sỉ dành cho bạn</h3>
			<div class="box-tab-category d-none d-sm-block">
				<ul class="owl-tab-category nav nav-pills mb-3" id="pills-tab"
					role="tablist">
					{foreach from=$a_main_category key=k item=data} {if $k<9}
					<li class="item nav-item text-center"><a
						class="nav-link p-1 py-3 {if $k eq 0}active show{/if}"
						id="pills-home-tab{$data.id}" data-toggle="pill"
						href="#tax{$data.id}" role="tab" aria-controls="tax{$data.id}"
						aria-selected="true" onmouseup="LoadPage({$data.id});"><i
							class="fa {$data.icon}"></i><p>{$data.name}</p></a></li>{/if} {/foreach}
				</ul>
			</div>

			<div class="box-tab-category d-block d-sm-none">
				<ul class="owl-tab-category nav nav-pills mb-3" id="pills-tab"
					role="tablist">
					{foreach from=$a_main_category key=k item=data}
					<li class="item nav-item text-center"><a class="nav-link p-1"
						data-toggle="pill" href="#tax{$data.id}" role="tab"
						onmouseup="LoadPage({$data.id});">{$data.name}</a></li>{/foreach}
				</ul>
			</div>
			<div class="tab-content" id="pills-tabContent">
				{foreach from=$a_main_category key=k item=data}
				<div class="tab-pane fade {if $k eq 0}active show{/if}"
					id="tax{$data.id}" role="tabpanel">
					<div class="row row-sm" id="loadPage{$data.id}">
						{foreach from=$result item=page}
						<div class="col-xl-6 col-12 mb-2">
							<div class="card card-page border-0">
								<div class="card-header p-2 bg-white">
									<div class="media">
										<a href="{$page.url}" class="logo-page"><img
											src="{$page.logo}" class="mr-3" alt="{$page.name}"></a>
										<div class="media-body">
											<h5 class="mt-0">
												<a href="{$page.url}">{$page.name}</a>
											</h5>
										</div>
										<div class="d-block d-sm-none">
											<a href="{$page.url}" class="btn-link-page">Đến cửa hàng</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end col 6 -->
						{/foreach}
					</div>
					<!-- end row -->
					<div class="w-100 text-center">
						<button type="button" class="btn btn-outline-dark" id="LoadMore"
							onclick="LoadMore({$data.id})">Tải thêm</button>
						<div id="showalert" class="alert alert-light hide" role="alert">
							Bạn đã kết thúc<br> Tìm kiếm thêm để tiếp tục khám phá
						</div>
					</div>

				</div>
				{/foreach}
			</div>
			<h3 class="py-3">Dành riêng cho bạn</h3>
			<div class="load_product_recommen"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var all_page = '{$all_page}';
</script>
{literal}
<script>
	$('.owl-carousel').owlCarousel(
			{
				loop : false,
				margin : 10,
				nav : true,
				navText : [ "<i class='fa fa-chevron-left'></i>",
						"<i class='fa fa-chevron-right'></i>" ],
				responsiveClass : true,
				dots : false,
				responsive : {
					0 : {
						items : 4
					},
					600 : {
						items : 6
					},
					1000 : {
						items : 10
					}
				}
			});
</script>
<script>
	var page = 1;
	function LoadMore(tax_id) {
		loading();
		page = page + 1;
		limit = 20;
		number = page * limit;
		console.log(number);
		console.log(all_page);
		$.post('?mod=home&site=ajax_loadmore_page', {
			'page' : page, 'tax_id':tax_id
		}).done(function(e) {
			if (number>all_page){
				$("#LoadMore").hide();
				$("#showalert").removeClass("hide");
				$("#loadPage"+tax_id).append(e);
			}else {
				$("#loadPage"+tax_id).append(e);
			}
			endloading();
		});
	}
</script>
<script>
function LoadPage(tax_id){
console.log(tax_id);
$("#loadPage"+tax_id).load('?mod=home&site=ajax_load_page_tax&tax_id='+tax_id, function(){
});
}
</script>
{/literal}
