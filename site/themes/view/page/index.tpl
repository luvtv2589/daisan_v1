{if $is_mobile}
<div class="header-mobile cate-mobile fixed">
	<div class="container">
		<div class="row">
			<div class="col-7">
				<span onclick="goBackHistory()"><i class="fa fa-arrow-left"></i></span>
				<span class="title" onclick="showSearch()">{$filter.key|default:''}</span>
				<span onclick="showSearch()"
					style="position: absolute; right: -45px;"><i
					class="fa fa-search fa-fw"></i></span>
			</div>
			<div class="col-5 text-right">
				<span><i class="fa fa-cloud-download fa-fw"></i></span>
				<div class="dropdown dropdown-tools-right">
					<span class="dropdown-toggle" id="dropdownMenuButton"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
						class="fa fa-bars"></i></span>
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
		</div>
	</div>
</div>

<section id="content-search">
	<div class="search-bar-header">
		<div class="container">
			<div class="row">
				<div class="col-1" onclick="goBack()">
					<span class="icon-back"><img
						src="http://daisannews.com/site/themes/webroot/images/back.png"
						class="img-fluid"></span>
				</div>
				<div class="col-10">
					<input class="form-control" id="Keyword"
						value="{$filter.key|default:''}"
						placeholder="Nhập vào từ khóa tìm kiếm...">
				</div>
			</div>
			<nav>
				<div class="nav nav-pill" id="pills-tab" role="tablist">
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
						href="./product?k={$data.name}">{$data.keyword_name}</a>
					{/foreach}
				</div>
			</div>
		</div>
	</div>

</section>
{/if}
<div class="container">
	<div class="row row-sm mt-3">
		<div id="barproduct" class="col-md-2 d-md-block d-none">
			<div class="filter memnumber mb-3">
				<h4 class="title">
					<i class="fa fa-users fa-fw"></i> Số lượng nhân viên
				</h4>
				<div class="">{$out.checkbox_memnumber}</div>
			</div>
			<div class="filter revenue mb-3">
				<h4 class="title">
					<i class="fa fa-usd fa-fw"></i> Doanh thu
				</h4>
				<div class="">{$out.checkbox_revenue}</div>
			</div>
		</div>

		<div class="col-md-8" id="Suppliers">

			<div class="card rounded-0 mb-1">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active"><b>Nhà
									cung cấp</b></a></li>
						<li class="nav-item"><a href="?mod=product&site=index"
							class="nav-link">Sản phẩm</a></li>
					</ul>
				</div>
				<div class="card-body">

					<div class="row row-sm">
						<div class="col-md-2">
							<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="checkbox"
									id="inlineCheckbox1" value="option1"> <label
									class="custom-control-label" for="inlineCheckbox1">Gold
									Supplier</label>
							</div>
						</div>
						<div class="col-md-7">
							<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="checkbox"
									id="inlineCheckbox2" value="option2"> <label
									class="custom-control-label" for="inlineCheckbox2">Giao
									dịch đảm bảo</label>
							</div>
						</div>
						<div class="col-md-3">
							<select class="form-control rounded-0 form-control-sm"
								onchange="filter();" id="location_id">{$out.location}
							</select>
						</div>
					</div>

				</div>
			</div>

			{foreach from=$result item=data}
			<div class="card mb-1 rounded-0">
				<div class="card-body">
					<h3 class="mb-2">
						<a href="{$data.url}"><i class="fa fa-diamond"></i>
							{$data.name}</a>
					</h3>
					<p class="mb-1 d-md-block d-none">
						<a class="text-sm" href="{$data.pagelink.contact}"><i
							class="fa fa-caret-square-o-right"></i> Chi tiết liên hệ</a>
					</p>
					<div class="row row-nm">
						<div class="col-md-2 col-5">
							<a href="{$data.url}"><img class="img-thumbnail"
								src="{$data.logo}" width="100%"></a>
						</div>
						<div class="col-md-10 col-7">
							<p class="mb-1 d-md-block d-none text-oneline">
								<span class="col-gray"><i class="fa fa-cubes "></i> Văn phòng:</span> {$data.subname|default:''}
							</p>
							<p class="mb-1">
								<span class="col-gray"><i class="fa fa-map-marker text-danger"></i>
									Địa chỉ:</span> {$data.address}
							</p>
							<p class="mb-1 d-md-block d-none">
								<span class="col-gray"><i class="fa fa-users"></i> Quy mô
									công ty:</span> {$data.number_mem}
							</p>
							<!--<p class="mb-1 d-md-block d-none">Số điện thoại: {$data.phone}</p>-->
							<!-- <p class="mb-2 d-md-block d-none col-gray"><b>25</b> Đơn hàng (Trong vòng 6 tháng) &nbsp;&nbsp;&nbsp; <i class="fa fa-usd"></i> Tổng giá trị <b>5.000.000</b></p> -->
							<p class=" d-md-block d-none">
								<a href="{$data.url_contact}" class="btn btn-sm btncontact">
									<i class="fa fa-fw fa-envelope-o"></i> Gửi liên hệ
								</a> {if $data.isfavorite eq 0}
								<button type="button" id="BtnFavorite{$data.id}"
									class="btn btn-success btn-sm"
									onclick="SetPageFavorite({$data.id});">
									<i class="fa fa-fw fa-heart-o"></i> Yêu thích
								</button>
								{/if}
							</p>
						</div>
					</div>
					<span class="yearexp"><i class="fa fa-star"></i>
						{$data.yearexp} Năm</span>
				</div>
			</div>
			{/foreach}

			<div class="mt-3">{$paging}</div>

		</div>

		<div class="col-md-2 d-md-block d-none" id="product-hot">
			<div class="card rounded-0">
				<div class="card-header p-2">Sản phẩm nổi bật</div>
				<ul class="list-group list-group-flush">
					{foreach from=$product_ads item=data}
					<li class="list-group-item px-2">
						<div class="row row-sm">
							<div class="col-md-6">
								<a href="{$data.url}"><img alt="{$data.name}"
									src="{$data.avatar}" width="100%"></a>
							</div>
							<div class="col-md-6">
								<h6>
									<a href="{$data.url}"><span class="badge badge-success">QC</span>
										{$data.name}</a>
								</h6>
								<p class="mb-0 mt-2 text-danger">
									<b>{$data.price}</b>
								</p>
							</div>
						</div>
					</li> {/foreach}
				</ul>
			</div>
		</div>

	</div>
</div>
<input type="hidden" value="{$out.url}" id="filter_url">

<script type="text/javascript">
$(window).ready(function(){
	$(".memnumber input[type=checkbox]").click(function(){
		var arr = [];
		$(".memnumber input[type=checkbox]").each(function () {
			if ($(this).is(':checked')) {
				var value = $(this).val();
				arr.push(value);
			}
		});
		
		var filter_checkbox = arr.toString();
		console.log(filter_checkbox);
		var url = set_filter();
		url = (filter_checkbox!='') ? url+"&memnumber="+filter_checkbox : url;
		location.href = url;
	});

	$(".revenue input[type=checkbox]").click(function(){
		var arr = [];
		$(".revenue input[type=checkbox]").each(function () {
			if ($(this).is(':checked')) {
				var value = $(this).val();
				arr.push(value);
			}
		});
		
		var filter_checkbox = arr.toString();
		console.log(filter_checkbox);
		var url = set_filter();
		url = (filter_checkbox!='') ? url+"&revenue="+filter_checkbox : url;
		location.href = url;
	});
});

function filter(){
	var url = set_filter();
	location.href = url;
}

function set_filter(){
	var url = $("#filter_url").val();
	var location_id = $("#location_id").val();
	var k = $("#Keyword").val();
	
	url = (location_id!=0) ? url+"&location_id="+location_id : url;
	url = (k!='') ? url+"&k="+k : url;
	return url;
}

function SetPageFavorite(id){
	if(arg.login==0){
		noticeMsg('System Message', 'Vui lòng đăng nhập trước khi thực hiện chức năng này.', 'warning');
		return false;
	}
	var data = {};
	data['id'] = id;
	data['ajax_action'] = 'set_page_favorite';
	loading();
	$.post('?mod=page&site=ajax_handle', data).done(function(e){
		data = JSON.parse(e);
		if(data.code==1){
			$("#BtnFavorite"+id).remove();
			noticeMsg('System Message', data.msg, 'success');
		}else noticeMsg('System Message', data.msg, 'error');
		
		endloading();
	});
}
</script>