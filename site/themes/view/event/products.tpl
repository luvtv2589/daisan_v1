<style>
.zone-header {
	    /* background: #ff4d39; */
    position: relative;
    width: 100%;
    height: 140px;
    color: #fff;
    height: 380px;
}

.zone-header span {
	align-items: center;
	width: 30px;
	height: 30px;
	margin: 0px 4px;
	border: 1px solid rgba(255, 255, 255, .6);
	border-radius: 2px;
	font-size: 16px;
	padding: 5px;
	color: #fff;
}

.box-tab-category {
	position: relative;
	top: -40px;
}

.box-tab-category .owl-tab-category {
	display: -ms-flexbox;
	-ms-flex-pack: justify;
	justify-content: space-between;
	-ms-flex-align: center;
	align-items: center;
	width: 1200px;
	margin: 0 auto;
	padding: 27px 21px 17px 21px;
	border-radius: 10px;
	color: #333;
	background-color: #fdb516;
}

.box-tab-category .owl-tab-category li {
	width: 88px
}

.box-tab-category .owl-tab-category li p {
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.box-tab-category ul.owl-tab-category li img {
	background: #f5f5f5;
	border-radius: 50%;
	width: 100%;
	height: 80px;
}

.product-deal h3 {
	font-size: 16px;
	text-align: center;
	padding-bottom: 10px;
}

.product-deal ul li .item-product {
	margin-bottom: 12px;
	border-radius: 8px;
	box-shadow: 0 2px 8px 0 rgba(0, 0, 0, .05);
	background-color: #fff;
}

.product-deal ul li .item-product .prod-info h3 {
	height: 50px;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.product-deal ul li .price-sale {
	font-size: 14px;
	font-weight: bold;
}

.product-deal ul li .price-promo {
	margin-right: 6px;
	font-size: 14px;
	color: #999;
	text-decoration: line-through;
}

@media ( max-width :768px) {
	.zone-header .zone-title, .countdown {
		width: 100%;
		text-align: center;
	}
	.box-tab-category {
		position: relative;
	}
	.box-tab-category .nav {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap;
		padding-bottom: 1rem;
		margin-top: -1px;
		overflow-x: auto;
		text-align: center;
		white-space: nowrap;
		-webkit-overflow-scrolling: touch;
	}
	.box-tab-category .nav li {
		padding: 0;
		margin-right: 15px;
	}
	.box-tab-category .nav li a {
		color: #fff
	}
	.owl-tab-category .item a {
		background: #f8f9fa;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
		overflow: hidden;
	}
}
</style>
{if $is_mobile}
<div class="header-mobile cate-mobile fixed d-block d-sm-none">
	<div class="container">
		<div class="row">
			<div class="col-7">
				<span onclick="goBackHistory()"><i class="fa fa-arrow-left"></i></span>
				<span class="title" onclick="showSearch()">Khuyến mãi</span> <span
					onclick="showSearch()" style="position: absolute; right: -45px;"><i
					class="fa fa-search fa-fw"></i></span>
			</div>
			<div class="col-5 text-right">
				<span><i class="fa fa-heart fa-fw"></i></span>
				<div class="dropdown dropdown-tools-right">
					<span id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"><i
						class="fa fa-bars fa-fw"></i></span>
					<div class="dropdown-menu rounded-0"
						aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#"><i class="fa fa-home"></i>Trang
							chủ</a> <a class="dropdown-item"
							href="?mod=account&amp;site=messages"><i
							class="fa fa-envelope-o"></i>Tin nhắn liên hệ</a> <a
							class="dropdown-item" href="{$arg.url_sourcing}"><i
							class="fa fa-bullhorn"></i>Yêu cầu báo giá</a> <a
							class="dropdown-item" href="?mod=account&site=pagefavorites"><i
							class="fa fa-star"></i>Gian hàng theo dõi</a> <a
							class="dropdown-item" href="?mod=account&site=productfavorites"><i
							class="fa fa-heart-o"></i>Sản phẩm yêu thích</a>
					</div>
				</div>
			</div>
			<!-- 
			<div class="nav-scroller bg-white">
				<ul class="nav mb-3" id="pills-tab" role="tablist">
					<li class="nav-item"><a class="nav-link" id="pills-home-tab"
						data-toggle="pill" href="#pills-home" role="tab"
						aria-controls="pills-home" aria-selected="true">LOCATION<i
							class="fa fa-caret-down fa-fw"></i></a></li>
					<li class="nav-item"><a class="nav-link"
						id="pills-profile-tab" data-toggle="pill" href="#pills-profile"
						role="tab" aria-controls="pills-profile" aria-selected="false">CATEGORY<i
							class="fa fa-caret-down fa-fw"></i></a>
					</li>
					<li class="nav-item"><a class="nav-link"
						id="pills-contact-tab" data-toggle="pill" href="#pills-contact"
						role="tab" aria-controls="pills-contact" aria-selected="false">MATERIAL<i
							class="fa fa-caret-down fa-fw"></i></a>
					</li>
					<li class="nav-item"><a class="nav-link"
						id="pills-contact-tab" data-toggle="pill" href="#pills-contact"
						role="tab" aria-controls="pills-contact" aria-selected="false">APPEARANCE<i
							class="fa fa-caret-down fa-fw"></i></a>
					</li>
					<li class="nav-item"><a class="nav-link"
						id="pills-contact-tab" data-toggle="pill" href="#pills-contact"
						role="tab" aria-controls="pills-contact" aria-selected="false">MATERIAL<i
							class="fa fa-caret-down fa-fw"></i></a>
					</li>
				</ul>
			</div>
			-->
		</div>
	</div>
</div>

<section id="content-search">
	<div class="search-bar-header">
		<div class="container">
			<div class="row">
				<div class="col-1" onclick="goBack()">
					<span class="icon-back"><img
						src="{$arg.stylesheet}images/back.png" class="img-fluid"></span>
				</div>
				<div class="col-10">
					<input class="form-control" id="mKeyword"
						value="{$filter.key|default:''}"
						placeholder="Nhập vào từ khóa tìm kiếm...">
				</div>
			</div>
			<nav>
				<div class="nav nav-pill tab-search" id="pills-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-home-tab"
						data-toggle="tab" href="#nav-home" role="tab"
						aria-controls="nav-home" aria-selected="true" onclick="SetType(0)">SẢN
						PHẨM</a> <a class="nav-item nav-link" id="nav-profile-tab"
						data-toggle="tab" href="#nav-profile" role="tab"
						aria-controls="nav-profile" onclick="SetType(1)">NHÀ CUNG CẤP</a>
				</div>
			</nav>
		</div>
	</div>
	<div class="search-bar-content">
		<input type="hidden" id="Type" value="0">
		<div class="container">
			<div class="popular-keyword">
				<h3 class="keyword-title">Từ khóa phổ biến</h3>
				<div class="box-tag">
					{foreach from = $keyword.hot item = data} <a
						href="./product?k={$data.name}">{$data.name}</a> {/foreach}
				</div>

				<div class="clearfix"></div>
			</div>
			<div class="history-keyword">
				<h3 class="keyword-title">Lịch sử tìm kiếm:</h3>
				<div class="box-tag">
					{foreach from = $keyword.history item = data} <a
						href="./product?k={$data.keyword_name}">{$data.keyword_name}</a>
					{/foreach}
				</div>
			</div>
		</div>
	</div>
</section>
{/if}
<div class="zone-header mt-md-0 mt-5 pt-2" style="background:url('{$event.banner}');">
	<div class="container">
		<div class="zone-header-main-content">
			<div class="zone-title float-left py-md-3 pt-2">SẢN PHẨM KHUYẾN
				MÃI</div>
			<div class="float-left py-3 countdown"
				data-countdown="{$event.date_finish}">Card title</div>
		</div>
	</div>
</div>
<div class="box-tab-category">
	<div class="container">
		<div class="box-tab-category d-none d-sm-block">
			<ul class="owl-tab-category nav nav-pills mb-3" id="pills-tab"
				role="tablist">
				<li class="item nav-item text-center"><a
					class="nav-link p-1 active" data-toggle="pill" href="#tab-all"
					role="tab"><img src="{$arg.stylesheet}images/ALL_100x100.png">
						<p>Tất cả khuyến mãi</p></a></li> {foreach from=$a_main_category key=k
				item=data} {if $k < 9}
				<li class="item nav-item text-center"><a class="nav-link p-1"
					data-toggle="pill" href="#tax{$data.id}" role="tab"
					onmouseup="LoadProduct({$data.id});"><img src="{$data.thumb}">
						<p>{$data.name}</p></a></li>{/if}{/foreach}
			</ul>
		</div>
		<div class="d-block d-sm-none">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="item nav-item text-center"><a
					class="nav-link p-2 active" data-toggle="pill" href="#tab-all"
					role="tab">Tât cả</a></li> {foreach from=$a_main_category key=k
				item=data}
				<li class="item nav-item text-center"><a class="nav-link p-2"
					data-toggle="pill" href="#tax{$data.id}" role="tab"
					onmouseup="LoadProduct({$data.id});">{$data.name}</a></li>{/foreach}
			</ul>
		</div>
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade active show" id="tab-all" role="tabpanel">
				<div class="product-deal">
					<h3>TẤT CẢ KHUYẾN MÃI</h3>
					<ul class="row row-sm" id="NewContent">
						{foreach from=$result item=data} {if $data.price neq 0}
						<li class="col-xl-2 col-6">
							<div class="item-product p-3">
								<a href="{$data.url}" class="d-block"> <img
									class="d-block w-100" src="{$data.avatar}" alt="{$data.name}">
								</a>
								<div class="prod-info">
									<div class="title">
										<h3 class="py-2 fz-14">
											<a href="{$data.url}">{$data.name}</a>
										</h3>
									</div>
									<div class="card-text fz-18">
										<div class="price-sale mr-2">{$data.promo|number_format}
											đ / {$data.unit}</div>
										<div class="price-promo">
											{$data.price|number_format} đ<span
												class="badge badge-danger ml-3">{$data.percent}</span>
										</div>

									</div>
								</div>
							</div>
						</li>{/if}{/foreach}
					</ul>
					<div class="mt-3">{$paging}</div>
				</div>
				<!-- end product -->
			</div>
			{foreach from=$a_main_category key=k item=data}
			<div class="tab-pane fade" id="tax{$data.id}" role="tabpanel">
				<div class="product-deal">
					<h3>{$data.name}</h3>
					<ul class="row row-sm" id="LoadProduct{$data.id}">

					</ul>
					<div class="mt-3">{$paging}</div>
				</div>
				<!-- end product -->
			</div>
			{/foreach}
		</div>
	</div>
</div>


<script type="text/javascript"
	src="https://deal.daisan.vn/site/themes/view/vsctheme/webroot/js/jquery.countdown.min.js"></script>
<script>
	$('[data-countdown]').each(function() {
		var $this = $(this), finalDate = $(this).data('countdown');
			$this.countdown(finalDate,function(event) {
			$this.html(event.strftime('<span>%D</span>:<span>%H</span>:<span>%M</span>:<span>%S</span>'));
			});
		});
</script>
{literal}
<script>
function LoadProduct(tax_id){
console.log(tax_id);
$("#LoadProduct"+tax_id).load('?mod=event&site=ajax_load_product_tax&tax_id='+tax_id, function(){});
}
</script>
{/literal}
