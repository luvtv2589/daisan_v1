<div class="container d-none d-sm-block">
	<div class="row row-sm pt-3">
		<!-- <div id="barproduct"
			class="col-lg-2 col-md-3 d-none d-sm-none d-md-block">
			<div class="filter mb-3">
				<h4 class="title">
					<i class="fa fa-list-ul fa-fw"></i> Danh mục liên quan
				</h4>
				<div class="">
					<ul>
						{foreach from=$a_category item=data}
						<li><a href="{$data.url}" target="_blank">{$data.name}</a></li>
						{/foreach}
					</ul>
				</div>
			</div>
			<h4 class="title">
				<i class="fa fa-cubes fa-fw"></i> Thuộc tính sản phẩm
			</h4>
			{foreach from=$a_metas key=k item=data}
			<div class="filter mb-3">
				<h4>{$data.parent}</h4>
				<div class="">
					{foreach from=$data.sub key=sk item=sub} {$ckid="$k-$sk"}
					<div class="custom-control custom-checkbox">
						<input class="custom-control-input" type="checkbox"
							value="{$ckid}" name="{$data.parent}" id="ckeck{$ckid}"{if $ckid|in_array:$out.a_checkbox }checked{/if}>
						<label class="custom-control-label line-1" for="ckeck{$ckid}">
							{$sub}</label>
					</div>
					{/foreach}
				</div>
			</div>
			{/foreach}
		</div> -->
		<div class="col-xl-10 col-lg-9 col-md-9" id="Products">
			<div class="card rounded-0 d-none d-xl-block">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active"><b>Sản
									phẩm</b></a></li>
						<li class="nav-item"><a href="?mod=page&site=index"
							class="nav-link">Nhà cung cấp</a></li>
					</ul>
				</div>
				<div class="card-body">
					<div class="form-inline">
						<span class="mr-2">Loại nhà cung cấp:</span>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox1" value="option1"> <label
								class="form-check-label" for="inlineCheckbox1">Đảm bảo
								thương mại</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox2" value="option2"> <label
								class="form-check-label" for="inlineCheckbox2">Nhà cung
								cấp vàng</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox3" value="option2"> <label
								class="form-check-label" for="inlineCheckbox3">Nhà cung
								cấp đã đánh giá</label>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<div class="d-flex bd-highlight">
						<div class="py-2 flex-grow-1 bd-highlight">
							<div class="form-inline">
								<!-- <span class="mr-2">Xem <b>{$out.number|number_format}</b>
							sản phẩm
						</span> -->
								<span class="mr-2 mt-2 mt-lg-0">Tối thiểu <input
									type="text" id="filter_minorder" value="{$out.filter_minorder}"
									class="form-control form-control-sm" style="width: 60px;"></span>
								<span class="mr-2 mt-2 mt-lg-0">Giá bán <input
									type="text" id="filter_minprice" value="{$out.filter_minprice}"
									class="form-control form-control-sm" style="width: 100px;">
									- <input type="text" id="filter_maxprice"
									value="{$out.filter_maxprice}"
									class="form-control form-control-sm" style="width: 100px;"></span>
								<span class="mr-2 mt-2 mt-lg-0">Nơi bán <select
									class="form-control rounded-0 form-control-sm" id="location_id">{$out.location}
								</select></span> <span><button type="button"
										class="btn btn-primary btn-sm mt-2 mt-lg-0"
										onclick="filter();">Tìm</button></span>
							</div>
						</div>
						<div class="bd-highlight">
							<ul class="nav view-as">
								<li class="nav-item"><a class="nav-link active"
									href="{$out.url_grid}"><i class="fa fa-th-large"></i></a></li>
								<li class="nav-item"><a class="nav-link"
									href="{$out.url_list}"><i class="fa fa-list-ul"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<p class="mb-0 py-2">
				<span class="mr-2"><b>{$out.number|number_format}</b> kết quả
					cho "{if $taxonomy.id neq
					0}{$taxonomy.name}{else}{$filter.key|default:''}{/if}"</span>
			</p>
			<div id="procontent" class="procontent row m-0">
				<div class="row row-sm py-2 m-0 grid">
					{foreach from=$product_ads_index key=k item=data}
					<div class="col-xl-3 col-lg-4 col-md-4 col-6 fz-16 mb-2">
						<div class="item p-3">
							<a href="{$data.url}" target="_blank" class="img"> <img
								data-src="{$data.avatar}" width="100%" alt="{$data.name}"
								class="zoom-in lazy">
							</a>
							<div class="prod-info mb-3">
								<div class="title">
									<h3>
										<a href="{$data.url}" title="{$data.name}" target="_blank"><span
											class="badge badge-success">QC</span> {$data.name}</a>
									</h3>
								</div>
								<div class="price font-weight-bold">
								{$data.showprice}
									<!-- {if $data.price neq 0}VNĐ{/if} {$data.price|number_format}{if $data.pricemax
									gt 0}-{$data.pricemax|number_format}{/if}{if $data.price neq 0}<span
										class="unit">/ {$data.unit}</span>{/if}-->
								</div>
								<div class="moq">
									<span class="font-weight-bold">{$data.minorder}
										{$data.unit}</span> (Min. Order)
								</div>
								{if $arg.id_location}
								<div class="moq">
									<i class="fa fa-map-marker fa-fw text-danger"></i>{$arg.this_location.Name}
								</div>
								{/if}
								<div class="py-2 ncc">
									<div class="yearexp mr-2">
										{$data.yearexp}<span>YR</span>
									</div>
									<a href="{$data.url_page}" target="_blank">{$data.pagename}</a>
								</div>
							</div>
							<div class="hr">
								<span></span>
							</div>
							<div class="d-block">
								<a
									href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
									class="btn btn-sm btn-contact"><i
									class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a> <a
									href="tel:{if $data.package_id neq 0 AND $data.isphone eq 0}{$data.phone}{else}{$option.contact.phone}{/if}"
									class="btn btn-sm btn-phone"><i class="fa fa-phone"></i>
									Call</a>
							</div>
						</div>
					</div>
					{/foreach} {foreach from=$result item=data}
					<div class="col-xl-3 col-lg-4 col-md-4 col-6 fz-16 mb-2">
					
						<div class="item p-3" {if $data.ismain eq 1}style="background:#f9f974"{/if}>
							<a href="{$data.url}" target="_blank" class="img"> <img
								data-src="{$data.avatar}" width="100%" alt="{$data.name}"
								class="zoom-in lazy">
							</a>
							<div class="prod-info mb-3">
								<div class="title">
									<h3>
										<a href="{$data.url}" title="{$data.name}" target="_blank">{$data.name}</a>
									</h3>
								</div>
								<div class="price font-weight-bold">
								{$data.showprice}
									<!-- {if $data.price neq 0}VNĐ{/if} {$data.price}{if $data.pricemax
									gt 0}-{$data.pricemax|number_format}{/if}{if $data.price neq 0}<span
										class="unit">/ {$data.unit}</span>{/if}-->
								</div>
								<div class="moq">
									<span class="font-weight-bold">{$data.minorder}
										{$data.unit}</span> (Min. Order)
								</div>
								{if $arg.id_location}
								<div class="moq">
									<i class="fa fa-map-marker fa-fw text-danger"></i>{$arg.this_location.Name}
								</div>
								{/if}
								<div class="py-2 ncc">
									<div class="yearexp mr-2">
										{$data.yearexp}<span>YR</span>
									</div>
									<a href="{$data.url_page}" target="_blank">{$data.pagename}</a>
								</div>
							</div>
							<div class="hr">
								<span></span>
							</div>
							<div class="d-block">
								<a
									href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
									class="btn btn-sm btn-contact"><i
									class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a> <a
									href="tel:{if $data.package_id neq 0 AND $data.isphone eq 0}{$data.phone}{else}{$option.contact.phone}{/if}"
									class="btn btn-sm btn-phone"><i class="fa fa-phone"></i>
									Call</a>
							</div>
						</div>
					</div>
					{/foreach}
				</div>
				<div class="d-flex justify-content-center w-100">
				<div class="mt-3">{$paging}</div>
				</div>
				<div class="bg-white border w-100" id="P-1">
					<div class="row p-3 grid">
						<div class="col-12 fz-16 font-weight-bold text-dark pb-3">
							Sản phẩm đã xem</div>
						{if $a_product_views neq NULL}

						<div class="owl-carousel owl-theme">
							{foreach from=$a_product_views item=data}
							<div class="item">
								<a href="{$data.url}" target="_blank"> <img
									data-src="{$data.avatar}" class="w-100 zoom-in lazy" alt="{$data.name}"></a>
							</div>
							{/foreach}
						</div>
						{literal}
						<script>
							$('.owl-carousel').owlCarousel({
								loop : false,
								margin : 10,
								nav : false,
								dots : false,
								responsive : {
									0 : {
										items : 3
									},
									600 : {
										items : 5
									},
									1000 : {
										items : 8
									}
								}
							});
							//	var stickyOffset = $('.stickyOffset').offset().top;
							//	$(window).scroll(function() {
							//		scroll = $(window).scrollTop();
							//		if (scroll >= stickyOffset) {
							//			$('.fixed_left').addClass('fixed');
							//		} else {
							//			$('.fixed_left').removeClass('fixed');
							//		}
							//	});
						</script>
						{/literal}{/if}
						<div class="col-12 border-top text-right pt-3">
							<a href="" class="text-custom-link">Xem thêm</a> <span>trên</span>
							<a href="" class="font-weight-bold text-uppercase text-dark">
								<img src="{$arg.stylesheet}images/ic-8.png" width="22"
								height="22"> Daisan
							</a>
						</div>
					</div>
				</div>
				<div class="bg-white border mt-4 p-3 fz-16" id="P-2">
					<div class="row">
						<div class="col-lg-8 col-12 order-12 order-lg-0">
							<span class="d-block text-muted"> Chưa tìm được nhà cung
								cấp phù hợp? Hãy để các nhà cung cấp được xác minh phù hợp tìm
								thấy bạn.</span> <span class="d-block mt-2 "> <a
								href="{$arg.url_sourcing}?site=createRfq"
								class="btn btn-sm btn-outline-secondary py-1 d-inline-block">Nhận
									báo giá ngay bây giờ</a> <i class="name">Miễn phí</i>
							</span>
						</div>
						<div
							class="col-lg-4 col-12 d-flex align-self-center justify-content-lg-end justify-content-center my-4 my-lg-0">
							<i class="icon-1"></i> <span class="pt-1 font-weight-bold pl-1">Yêu
								cầu báo giá</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-2 col-lg-3 col-md-3 d-none d-lg-block" id="product-hot">
			<div class="card rounded-0">
				<div class="card-header p-2">Đề xuất cho bạn</div>
				<ul class="list-group list-group-flush">
					{foreach from=$product_ads key=k item=data}
					<li class="list-group-item px-2">
						<div class="row row-sm">
							<div class="col-md-6">
								<a href="{$data.url}"><img alt="{$data.name}"
									data-src="{$data.avatar}" width="100%" class="lazy"></a>
							</div>
							<div class="col-md-6">
								<h6 class="line-3">
									<a href="{$data.url}"><span class="badge badge-success">QC</span>
										{$data.name}</a>
								</h6>
								<p class="mb-0 text-danger">
									<b>{if $data.price neq 0}VNĐ{/if} {$data.price}</b>
								</p>
							</div>
						</div>
					</li>{/foreach}
				</ul>
			</div>
		</div>
	</div>
</div>
<input type="hidden" value="{$out.url}" id="filter_url">
{if $is_mobile}
<div class="header-mobile cate-mobile fixed d-block d-sm-none">
	<div class="container">
		<div class="row">
			<div class="col-7">
				<span onclick="goBackHistory()"><i class="fa fa-arrow-left"></i></span>
				<span class="title" onclick="showSearch()">{if $taxonomy.id
					neq 0}{$taxonomy.name}{else}{$filter.key|default:''}{/if}</span> <span
					onclick="showSearch()" style="position: absolute; right: -45px;"><i
					class="fa fa-search fa-fw"></i></span>
			</div>
			<div class="col-5 text-right">
				<span><i class="fa fa-heart fa-fw"></i></span>
				<div class="dropdown dropdown-tools-right">
					<span  id="dropdownMenuButton"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
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
			<div class="tab-content p-2 bg-white w-100" id="pills-tabContent">
				<div class="tab-pane fade" id="pills-home" role="tabpanel"
					aria-labelledby="pills-home-tab">
					<div class="box-tag">
						<a href="./product?k=gạch+thẻ&t=0">gạch thẻ</a> <a
							href="./product?k=keo+dán+đá&t=0">kéo dán đá</a> <a href="./product?k=gạch+trang+trí&t=0">gạch trang trí</a> <a href="./product?k=gạch+lát+nền&t=0">Gạch lát nền</a> <a
							href="./product?k=gạch+inax&t=0">gạch inax</a> <a href="./product?k=đá+ốp+lát&t=0">đá
							ốp lát</a> <a href="./product?k=keo+dán+gạch">keo dán gạch</a>
					</div>
				</div>
				<div class="tab-pane fade" id="pills-profile" role="tabpanel"
					aria-labelledby="pills-profile-tab">...</div>
				<div class="tab-pane fade" id="pills-contact" role="tabpanel"
					aria-labelledby="pills-contact-tab">...</div>
			</div>
		</div>
	</div>
</div>

<section id="content-search">
	<div class="search-bar-header">
		<div class="container">
			<div class="row">
				<div class="col-1" onclick="goBack()">
					<span class="icon-back"><img
						data-src="{$arg.stylesheet}images/back.png"
						class="img-fluid"></span>
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

<div class="main-category-hot mt-5 mb-2 d-bock d-sm-none">
	<div class="p-3" style="line-height: 24px">
		<div class="product-list-grid" id="Products">
			<div class="row">
				<div class="col-6">
					<span>{$out.number}</span> {if $taxonomy.id neq
					0}{$taxonomy.name}{else}{$filter.key|default:''}{/if}
				</div>
				<div class="col-6">
					<div class="view-as text-right">
						<a href="{$out.url_list}"><i class="fa fa-th-large"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product grid">
		<ul class="list-inline">
			{foreach from=$product_ads_index key=k item=data}
			<li class="w-50 float-left"><a href="{$data.url}"><img
					data-src="{$data.avatar}" class="img-fluid lazy"></a>
				<div class="prod-info">
					<div class="title">
						<h3 class="pt-2">
							<span class="badge badge-success">QC</span><a href="{$data.url}">{$data.name}</a>
						</h3>
					</div>
					<div class="price">{$data.price}{if $data.pricemax gt
						0}-{$data.pricemax|number_format}{/if}</div>
					<div class="moq">Tối thiểu: {$data.minorder} {$data.unit}</div>
					{if $arg.id_location}
								<div class="moq">
									<i class="fa fa-map-marker fa-fw text-danger"></i>{$arg.this_location.Name}
								</div>
								{/if}
					<div class="d-block">
						<a
							href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
							class="btn btn-sm btn-contact"><i
							class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a> <a
							href="tel:{if $data.package_id neq 0 AND $data.isphone eq 0}{$data.phone}{else}{$option.contact.phone}{/if}"
							class="btn btn-sm btn-phone"><i class="fa fa-phone"></i> Call</a>
					</div>
				</div></li>{/foreach} {foreach from=$result item=data}
			<li class="w-50 float-left"><a href="{$data.url}"><img
					data-src="{$data.avatar}" class="img-fluid lazy"></a>
				<div class="prod-info">
					<div class="title">
						<h3 class="pt-2">
							<a href="{$data.url}">{$data.name}</a>
						</h3>
					</div>
					<div class="price">{$data.showprice}</div>
					<div class="moq">Tối thiểu: {$data.minorder} {$data.unit}</div>
					{if $arg.id_location}
								<div class="moq">
									<i class="fa fa-map-marker fa-fw text-danger"></i>{$arg.this_location.Name}
								</div>
								{/if}
					<div class="mx-1">
						<a
							href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
							class="btn btn-sm btn-contact"><i
							class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a> <a
							href="tel:{if $data.package_id neq 0 AND $data.isphone eq 0}{$data.phone}{else}{$option.contact.phone}{/if}"
							class="btn btn-sm btn-phone"><i class="fa fa-phone"></i> Call</a>
					</div>
				</div></li> {/foreach}
		</ul>
		<div class="clearfix"></div>
	</div>
</div>
<div class="d-flex justify-content-end w-100">
				<div class="mt-3">{$paging}</div>
				</div>
{/if}

<script type="text/javascript">
	$(window).ready(
			function() {
				$(".filter input[type=checkbox]").click(
						function() {
							var arr = [];
							$(".filter input[type=checkbox]").each(function() {
								if ($(this).is(':checked')) {
									var value = $(this).val();
									arr.push(value);
								}
							});

							var filter_checkbox = arr.toString();
							alert(filter_checkbox);
							console.log(filter_checkbox);
							var url = set_filter();
							url = (filter_checkbox != '') ? url
									+ "&filter_checkbox=" + filter_checkbox
									: url;
							location.href = url;
						});
			});

	function set_filter() {
		var url = $("#filter_url").val();
		var minorder = $("#filter_minorder").val();
		var minprice = $("#filter_minprice").val();
		var maxprice = $("#filter_maxprice").val();
		var location_id = $("#location_id").val();
		var k = $("#Keyword").val();

		url = (minorder != '') ? url + "&minorder=" + minorder : url;
		url = (minprice != '') ? url + "&minprice=" + minprice : url;
		url = (maxprice != '') ? url + "&maxprice=" + maxprice : url;
		url = (location_id != '') ? url + "&location_id=" + location_id : url;
		url = (k != '') ? url + "&k=" + k : url;
		return url;
	}

	function filter() {
		var url = set_filter();
		location.href = url;
	}
	function SetType(value) {
		Type = $("input#Type").val(value);
	}
</script>