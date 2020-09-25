{$params_taxonomy_id = ''}
{if $smarty.get.taxonomy_id != ''}
	{$taxonomy_id = $smarty.get.taxonomy_id}
	{$params_taxonomy_id = "&taxonomy_id=$taxonomy_id"}
{/if}

{$params_minorder = ''}
	{if $smarty.get.minorder != ''}
	{$minorder = $smarty.get.minorder}
	{$params_minorder = "&minorder=$minorder"}
{/if}

{$params_minprice = ''}
{if $smarty.get.minprice != ''}
	{$minprice = $smarty.get.minprice}
	{$params_minprice = "&minprice=$minprice"}
{/if}

{$params_maxprice = ''}
{if $smarty.get.maxprice != ''}
	{$maxprice = $smarty.get.maxprice}
	{$params_maxprice = "&maxprice=$maxprice"}
{/if}

{$params_location_id = ''}
{if $smarty.get.location_id != ''}
	{$location_id = $smarty.get.location_id}
	{$params_location_id = "&location_id=$location_id"}
{/if}

{$params_package_id = ''}
{if $smarty.get.package_id != ''}
	{$package_id = $smarty.get.package_id}
	{$params_package_id = "&package_id=$package_id"}
{/if}

{$params_attribute_keyword = ''}
{if $smarty.get.attribute_keyword != ''}
	{$attribute_keyword = $smarty.get.attribute_keyword}
	{$params_attribute_keyword = "&attribute_keyword=$attribute_keyword"}

	{$expl = explode(",",$attribute_keyword)}

{/if}
{$url_params_full = "$params_minorder$params_minprice$params_maxprice$params_location_id$params_package_id$params_taxonomy_id$params_attribute_keyword"}
{$url_params_1 = "$params_minorder$params_minprice$params_maxprice$params_location_id$params_package_id$params_attribute_keyword"}
{$url_params_2 = "$params_minorder$params_minprice$params_maxprice$params_location_id$params_package_id$params_taxonomy_id"}
<style>
	.fa-custom{
		font-size: 1.25em;
		margin-right: 7px;
	}
</style>
<div class="container d-none d-sm-block">
	<div class="row row-sm pt-3">
		<div id="barproduct" class="col-lg-2 col-md-3 d-none d-sm-none d-md-block">
			<div class="filter mb-3">
				<h4 class="title">
					<i class="fa fa-list-ul fa-fw"></i> Danh mục liên quan
				</h4>
				<div class="">
					<ul>
						{foreach from=$a_category item=data}
						<li><a href="{$data.url}">{$data.name}</a></li> {/foreach}
					</ul>
				</div>
			</div>
			<h4 class="title">
				<i class="fa fa-cubes fa-fw"></i> Thuộcs tính sản phẩm
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
			<!-- bộ lọc list -->
			<div class="filter mb-3">
				<h4 class="title">
					<i class="fa fa-filter fa-fw"></i> Bộ lọc
				</h4>
				<div class="">
					<span class="mr-2 mt-2 mb-2 mt-lg-0">
						Tối thiểu <input type="text" id="filter_minorder" value="{$smarty.get.minorder}" class="form-control form-control-sm">
					</span>
					<span class="mr-2 mt-2 mb-2 mt-lg-0">
						Giá bán thấp nhất <input type="text" id="filter_minprice" value="{$smarty.get.minprice}" class="form-control form-control-sm">
						Giá bán cao nhất <input type="text" id="filter_maxprice" value="{$smarty.get.maxprice}" class="form-control form-control-sm">
					</span>
					<span class="mr-2 mt-2 mb-2 mt-lg-0">Gói gian hàng
						<select id="package_id" class="form-control rounded-0 form-control-sm" name="package_id">
							<option value="0">Tất cả gói</option>
							{foreach from=$package_all key=k item=data}
							<option value="{$data.id}" {if $data.id==$smarty.get.package_id}selected{/if}>{$data.name}</option>
							{/foreach}
						</select>
					</span>
					<span class="mr-2 mt-2 mb-2 mt-lg-0">Nơi bán
						<select class="form-control rounded-0 form-control-sm" id="location_id">
							{$out.location}
						</select>
					</span>
					<div class="mt-2">
						<button type="button" class="btn btn-primary btn-sm mt-2 mt-lg-0 w-100" onclick="filter();">
							<span class="px-4">Tìm kiếm</span>
						</button>
					</div>
				</div>
			</div>

			{if count($groupattribute)>0}
			<h4 class="title">
				<i class="fa fa-list fa-fw"></i> Bộ lọc thuộc tính
			</h4>

			<!-- <div class="filter mb-3" style="display: none;">
				<div class="attr-filter-list">
					{foreach from=$groupattribute key=k item=v}
					{if $v.name!="" && count($v.contents) > 0}
					<p class="w-100 collapse-click" title="{$v.name}" data-toggle="collapse" data-target="#show-coll-{$k}">
						{$v.name}:
						<i class="fa fa-arrow-down fa-fw text-right" ></i>
					</p>
					
					<ul id="show-coll-{$k}" class="collapse">
						{foreach from=$v.contents key=k2 item=v2}
						{if $v2.isShow != 'false'}
							{$attr_key = $v2.name}
							{if $smarty.get.attribute_keyword != '' }
								{$v2name = $v2.name}
								{$old_key = $smarty.get.attribute_keyword}
								{$attr_key = "$old_key,$v2name"}
							{/if}
						<li>
							<a href="/product?k={$smarty.get.k}&type=list&attribute_keyword={$attr_key}{$url_params_2}" class="form-check form-check-inline mr-2 mt-2 mb-2 mt-lg-0 ">
								{if $v2.img_name != ''}
								<img class="img-attr" src="{$folder}{$v2.img_name}" title="{$v2.name}">
								{else}
								<i class="fa fa-plus fa-fw"></i>
								{/if}
								<span>{$v2.name}</span>
							</a>
						</li>
						{/if}
						{/foreach}
					</ul>
					{/if}
					{/foreach}
				</div>
			</div> -->

				{foreach from=$groupattribute key=k item=v}
					{if $v.name!="" && count($v.contents) > 0}
					<div class="filter mb-3">
						<h4 title="{$v.name}">{$v.name}</h4>
						<div class="">
							{foreach from=$v.contents key=k2 item=v2}
								{if $v2.isShow != 'false'}
									{$attr_key = $v2.name}
									{if $smarty.get.attribute_keyword != '' }
										{$v2name = $v2.name}
										{$old_key = $smarty.get.attribute_keyword}
										{$attr_key = "$old_key,$v2name"}
									{/if}
									<div class="">
										<a href="/product?k={$smarty.get.k}&type=list&attribute_keyword={$attr_key}{$url_params_2}" class="form-check form-check-inline mr-2 mt-2 mb-2 mt-lg-0">
											<i class="fa fa-square-o fa-2 fa-custom" aria-hidden="true"></i>
											{if $v2.img_name != ''}
											<img class="img-attr" src="{$folder}{$v2.img_name}" title="{$v2.name}" width="24px">
											{/if}
											<span>{$v2.name}</span>
										</a>
									</div>
								{/if}
							{/foreach}
						</div>
					</div>
					{/if}
				{/foreach}
			{/if}		

		</div>
		<div class="col-lg-8 col-md-9 " id="Products">
			<div class="card rounded-0 d-none d-none d-xl-block">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active"><b>Sản
									phẩm</b></a></li>
						<li class="nav-item"><a href="?mod=page&site=index"
							class="nav-link">Nhà cung cấp</a></li>
					</ul>
				</div>
				<!-- e_category -->
				{if count($e_category)>0}
				<div class="card-body">
					<div class="form-inline">
						<span class="mr-2"><b>Danh mục:</b></span>
						<!-- e_category -->
						{foreach from=$e_category key=k item=data}
						<a href="/product?k={$smarty.get.k}&type=list&taxonomy_id={$data.id}{$url_params_1}" class="form-check form-check-inline {if $smarty.get.taxonomy_id==$data.id && $smarty.get.taxonomy_id!= ''}text-warning{/if}">
							{$data.name}
						</a>
						{/foreach}
					</div>
				</div>
				{/if}
				<!-- e_filter -->
				<div class="card-footer">
					<div class="d-flex bd-highlight">
						
						<div class="bd-highlight">
							<ul class="nav view-as">
								<li class="nav-item"><a class="nav-link " href="/product?k={$smarty.get.k}&type=grid{$url_params_full}"><i
											class="fa fa-th-large"></i></a></li>
								<li class="nav-item"><a class="nav-link active" href="/product?k={$smarty.get.k}&type=list{$url_params_full}"><i class="fa fa-list-ul"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				{if count($expl)>0}
				<div class="card-footer">
					<div class="d-flex bd-highlight">
						<span class="mr-2 mt-2 mb-2 mt-lg-0"><b>Lọc thuộc tính:</b></span>
						{foreach from=$url_suggested key=k item=v}
						<span class="mr-2 mt-2 mb-2 mt-lg-0 sugested-filter bg-warning">
							{$v.name} 
							<a href="/product?k={$smarty.get.k}&type=list{$url_params_2}&attribute_keyword={$v.url}">
								<i class="fa fa-close"></i>
							</a>
						</span>
						{/foreach}
						<span class="mr-2 mt-2 mb-2 mt-lg-0">
							<a href="/product?k={$smarty.get.k}&type=list{$url_params_2}" class="text-primary">
								Xóa tất cả
							</a>
						</span>
					</div>
				</div>
				{/if}
			</div>
			<p class="mb-0 py-2">
				<span class="mr-2"><b>{$total_hits}</b> kết quả
					cho "{if $taxonomy.id neq
					0}{$taxonomy.name}{else}{$filter.key|default:''}{/if}"</span>
			</p>
			<div id="procontent">
				{foreach from=$product_ads_index key=k item=data}
				<div class="item mb-2">
					<div class="row row-nm p-2 m-0">
						<div class="col-md-3 col-5 pl-0">
							<a href="{$data.url}" target="_blank"><img
								data-src="{$data.avatar}" width="100%" alt="{$data.name}"
								class="lazy"></a>
						</div>
						<div class="col-md-9 col-7 pl-0">
							<h3>
								<a href="{$data.url}" target="_blank"><span
									class="badge badge-success">QC</span>{$data.name}</a>
							</h3>
							<div class="row row-sm">
								<div class="col-md-4">
									<p class="mb-2 SS-11">
										<a href="{$data.url}" target="_blank"><span class="price">{$data.price}{if
												$data.pricemax}-{$data.pricemax}{/if}</span><span class="des-price"></span></a>
									</p>
									<p class="d-none d-sm-none d-md-block">
										<b>{$data.minorder}</b> {$data.unit} (Min. Order)
									</p>
									<p class="mb-2 d-block d-md-none">
										<span class="year mr-3"> <i></i> <span class="num">11</span>
										</span> <span> <img src="{$arg.stylesheet}images/in.png"
											width="24" height="14"> Việt Nam
										</span>
									</p>
								</div>
								<div class="col-md-4 d-none d-sm-none d-md-block">
									<p class="mb-1">
										<span class="col-gray"><i class="fa fa-bars"></i> Danh
											mục:</span> {$data.category}
									</p>
									<p class="mb-1">
										<span class="col-gray"><i class="fa fa-trademark"></i>
											Thương hiệu:</span> {$data.trademark}
									</p>
									<p class="mb-1">
										<span class="col-gray"><i class="fa fa-clock-o"></i>
											Giao hàng:</span> {$data.ordertime}
									</p>
									<p class="mb-1">
										<span class="col-gray"><i class="fa fa-trophy"></i>
											Năng lực:</span> {$data.ability}
									</p>
								</div>
								<div class="col-md-4">
									<h6 class="d-none d-sm-none d-md-block font-weight-bold">
										<a
											href="{if $data.info_page}{$data.info_page.url_page}{else}{$data.url_page}{/if}">{$data.pagename}</a>
									</h6>
									<p class="mb-1">{if $data.info_page}{$data.info_page.name}</p>
									{/if}
									<p class="mb-1 d-none d-sm-none d-md-block">
										<i class="fa fa-map-marker text-danger"></i> Địa chỉ: {if
										$data.info_page}{$data.info_page.address}{else}{$data.pageaddress}{/if}
									</p>
									{if $data.countpage>1}
									<p>
										<a
											href="{$data.url_page}?site=company_capacity&pn=kha-nang-cua-cong-ty"
											class="tipay-pulse">{$data.countpage} Đại lý cùng hệ
											thống</a>
									</p>
									{/if}
								</div>
							</div>
						</div>
					</div>
					<div class="row row-nm p-2">
						<div class="col-md-12">
							<div class="row row-sm justify-content-between">
								<div class="col-md-3">
									<button class="btn btn-sm w-100"
										onclick="SetFavorites({$data.id});">
										<i class="fa fa-fw fa-heart-o"></i> Yêu thích
									</button>
								</div>
								<div class="col-md-3">
									<a
										href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
										class="btn btn-sm btn-contact"><i
										class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a> <a
										href="javascript:void(0)" class="btn btn-sm btn-phone"
										onclick="SaveInfoCall({$data.id},0)"><i
										class="fa fa-phone"></i> Call</a> <input type="hidden"
										class="phonenumber{$data.id}" value="{$data.phone}"> <input
										type="hidden" class="url{$data.id}" value="{$data.url}">
								</div>
							</div>
						</div>
					</div>
				</div>
				{/foreach} {foreach from=$result key=k item=data}
				<div class="item mb-2">
					<div class="row row-nm p-2 m-0">
						<div class="col-md-3 col-5 pl-0">
							<a href="{$data.url}" target="_blank"><img
								data-src="{$data.avatar}" width="100%" alt="{$data.name}"
								class="lazy"></a>
						</div>
						<div class="col-md-9 col-7 pl-0">
							<h3>
								<a href="{$data.url}" target="_blank">{$data.name}</a>
							</h3>
							<div class="row row-sm">
								<div class="col-md-4">
									<p class="mb-2 SS-11">
										<a href="{$data.url}" target="_blank"><span class="price">{$data.showprice}</span><span class="des-price"></span></a>
									</p>
									<!-- <p class="mb-2 SS-11">
										<a href="{$data.url}" target="_blank"><span class="price">{$data.price}{if
												$data.pricemax}-{$data.pricemax}{/if}</span><span class="des-price"></span></a>
									</p> -->
									<p class="d-none d-sm-none d-md-block">
										<b>{$data.minorder}</b> {$data.unit} (Min. Order)
									</p>
									<p class="mb-2 d-block d-md-none">
										<span class="year mr-3"> <i></i> <span class="num">11</span>
										</span> <span> <img src="{$arg.stylesheet}images/in.png"
											width="24" height="14"> Việt Nam
										</span>
									</p>
								</div>
								<div class="col-md-4 d-none d-sm-none d-md-block">
									<p class="mb-1">
										<span class="col-gray"><i class="fa fa-bars"></i> Danh
											mục:</span> {$data.category}
									</p>
									<p class="mb-1">
										<span class="col-gray"><i class="fa fa-trademark"></i>
											Thương hiệu:</span> {$data.trademark}
									</p>
									<p class="mb-1">
										<span class="col-gray"><i class="fa fa-clock-o"></i>
											Giao hàng:</span> {$data.ordertime}
									</p>
									<p class="mb-1">
										<span class="col-gray"><i class="fa fa-trophy"></i>
											Năng lực:</span> {$data.ability}
									</p>
								</div>
								<div class="col-md-4">
									<h6 class="d-none d-sm-none d-md-block font-weight-bold">
										<a
											href="{if $data.info_page}{$data.info_page.url_page}{else}{$data.url_page}{/if}">{$data.pagename}</a>
									</h6>
									<p class="mb-1">{if $data.info_page}{$data.info_page.name}</p>
									{/if}
									<p class="mb-1 d-none d-sm-none d-md-block">
										<i class="fa fa-map-marker text-danger"></i> Địa chỉ: {if
										$data.info_page}{$data.info_page.address}{else}{$data.pageaddress}{/if}
									</p>
									{if $data.countpage>1}
									<p>
										<a
											href="{$data.url_page}?site=company_capacity&pn=kha-nang-cua-cong-ty"
											class="tipay-pulse">{$data.countpage} Đại lý cùng hệ
											thống</a>
									</p>
									{/if}
								</div>
							</div>
						</div>
					</div>
					<div class="row row-nm p-2">
						<div class="col-md-12">
							<div class="row row-sm justify-content-between">
								<div class="col-md-3">
									<button class="btn btn-sm w-100"
										onclick="SetFavorites({$data.id});">
										<i class="fa fa-fw fa-heart-o"></i> Favorites
									</button>
								</div>
								<div class="col-md-3">
									<a
										href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
										class="btn btn-sm btn-contact"><i
										class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a> <a
										href="javascript:void(0)" class="btn btn-sm btn-phone"
										onclick="SaveInfoCall({$data.id},0)"><i
										class="fa fa-phone"></i> Call</a> <input type="hidden"
										class="phonenumber{$data.id}" value="{$data.phone}"> <input
										type="hidden" class="url{$data.id}" value="{$data.url}">
								</div>
							</div>
						</div>
					</div>
				</div>
				{if $k eq 2 OR $k eq 15 OR $k eq 30}
				<div class="" id="exampleModal">
					<div class="modal-dialog  modal-lg" role="document">
						<div class="modal-content rounded-0">
							<div class="modal-body mt-0">
								<div class="row" id="FormSendContact">
									<div
										class="col-md-5 col-12 text-center bg-col-left d-none d-sm-block">

										{if isset($smarty.get.pid)}
										<div class=py-4>
											<img src="{$info.avatar}" id="ShowImg" width="100%">
											<p id="ProductName" class="pt-3">{$info.name}</p>
											<input value="{$info.taxonomy_id}" Id="TaxId" type="hidden">
										</div>
										{else}
										<div class=pt-4>
											<img src="{$arg.stylesheet}images/Img_From_Rfq.jpg">
										</div>
										{/if}
										<div>
											<h4>Liên hệ tới chúng tôi</h4>
											<ul class="timeline">
												<li class="text-left">
													<p>Cho chúng tôi biết những gì bạn cần bằng cách điền
														vào biểu mẫu</p>
												</li>
												<li class="text-left">
													<p>Nhận chi tiết nhà cung cấp đã được xác minh</p>
												</li>
												<li class="text-left">
													<p>So sánh Báo giá và niêm phong thỏa thuận</p>
												</li>
											</ul>
										</div>
									</div>
									<div class="col-md-7 col-12">
										<div class="py-4">
											<select class="custom-select mb-3 rounded-0"
												name="location_id" required> {$s_location}
											</select>
											<textarea class="form-control rounded-0 mb-3"
												name="description" placeholder="Nội dung yêu cầu" required></textarea>
											<input type="number" class="form-control rounded-0"
												name="phone" placeholder="Nhập số điện thoại" required>
										</div>
										<button type="button"
											class="btn btn-primary btn-block btn-sendcontact"
											onclick="SendPhoneContact()">Gửi thông tin yêu cầu</button>

										<div class="pt-4">
											<h4 class="d-none d-sm-block">Tổng đài hỗ trợ trực tuyến</h4>
											<ul class="timeline d-none d-sm-block">
												<li class="text-left">
													<p>
														Hotline đặt hàng: 1900 9898 36<br> <small>(Tư
															vấn, báo giá sản phẩm 8-21h kể cả T7, CN)</small>
													</p>
												</li>
												<li class="text-left">
													<p>
														Phòng IT: 0964.36.8282<br> <small>(Hỗ trợ
															24/7. Đăng ký mở gian hàng trên hê thống)</small>
													</p>
												</li>
											</ul>
											<p class="text-center">
												<span>Hoặc gọi</span>
											</p>
											<a href="tel:1900989836" class='hotline'> 1900 9898 36</a>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				{/if} {/foreach}
			</div>

			<div class="mt-3">{$paging}</div>
			<div class="bg-white border w-100" id="P-1">
				<div class="row p-3 grid">
					<div class="col-12 fz-16 font-weight-bold text-dark pb-3">
						Sản phẩm đã xem</div>
					{if $a_product_views neq NULL}

					<div class="owl-carousel owl-theme">
						{foreach from=$a_product_views item=data}
						<div class="item">
							<a href="{$data.url}" target="_blank"> <img
								data-src="{$data.avatar}" class="w-100 zoom-in lazy"
								alt="{$data.name}"></a>
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
							href="?mod=page&site=contact"
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

		<div class="col-lg-2 d-none d-lg-block" id="product-hot">
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
<input type="hidden" value="{$taxonomy_id}" id="taxonomy_id">
<input type="hidden" value="{$attribute_keyword}" id="attribute_keyword">
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
				<span><i class="fa fa-cloud-download fa-fw"></i></span> <span><i
					class="fa fa-bars"></i></span>
			</div>
		</div>
	</div>
</div>

<section id="content-search" class="">
	<div class="search-bar-header">
		<div class="container">
			<div class="row">
				<div class="col-1" onclick="goBack()">
					<span class="icon-back"><img
						src="http://daisannews.com/site/themes/webroot/images/back.png"
						class="img-fluid"></span>
				</div>
				<div class="col-10">
					<input class="form-control" id="mKeyword"
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
						href="./product?k={$data.name}&type=list">{$data.name}</a> {/foreach}
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="history-keyword">
				<h3 class="keyword-title">Lịch sử tìm kiếm:</h3>
				<div class="box-tag">
					{foreach from = $keyword.history item = data} <a
						href="./product?k={$data.name}&type=list">{$data.keyword_name}</a>
					{/foreach}
				</div>
			</div>
		</div>
	</div>

</section>

<div class="main-category-hot mt-5 mb-2 d-block d-sm-none">
	<div class="p-3" style="line-height: 24px">
		<div class="product-list-grid" id="Products">
			<div class="row">
				<div class="col-6">
					<span>{$out.number}</span> {if $taxonomy.id neq
					0}{$taxonomy.name}{else}{$filter.key|default:''}{/if}
				</div>
				<div class="col-6">
					<div class="view-as text-right">
						<a href="{$out.url_grid}"><i class="fa fa-list-ul"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product list">
		<ul class="list-inline">
			{foreach from=$product_ads_index key=k item=data}
			<li class="product-item">
				<div class="row row-nm">
					<div class="col-5">
						<a href="{$data.url}"><img data-src="{$data.avatar}"
							alt="{$data.name}" class="img-fluid lazy"></a>
					</div>
					<div class="col-7">
						<h3 class="mt-0">
							<span class="badge badge-success">QC</span><a href="{$data.url}">{$data.name}</a>
						</h3>
						<div class="price-info">
							<div class="price">
								<b>{$data.price}{if $data.pricemax}-{$data.pricemax}{/if}</b><span>/
									{$data.unit}</span>
							</div>
							<div class="min_order">
								<b>{$data.minorder}</b> {$data.unit} (Min. Order)
							</div>
							<div>
								<i class="fa fa-map-marker text-danger pr-1"></i>{$data.Location}
							</div>
							<div class="ncc">
								<a href="{$data.url_page}" target="_blank"><i
									class="fa fa-diamond pr-1"></i>{$data.pagename}</a>
							</div>
						</div>
					</div>
					<div class="col-12">
						<div class="contact-button pt-2">
							<div class="row row-sm">
								<div class="col-6">
									<a
										href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
										class="btn btn-sm btn-contact"><i
										class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a>
								</div>
								<div class="col-6">
									<a href="tel:{$data.phone}" class="btn btn-sm btn-phone"
										onclick="SaveInfoCall({$data.id},1)"><i
										class="fa fa-phone"></i> Gọi ngay</a> <input type="hidden"
										class="phonenumber{$data.id}" value="{$data.phone}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</li> {/foreach} {foreach from=$result item=data}
			<li class="product-item">
				<div class="row row-nm">
					<div class="col-5">
						<a href="{$data.url}"><img data-src="{$data.avatar}"
							alt="{$data.name}" class="img-fluid lazy"></a>
					</div>
					<div class="col-7">
						<h3 class="mt-0">
							<a href="{$data.url}">{$data.name}</a>
						</h3>
						<div class="price-info">
							<div class="price">
								<b>{$data.price}{if $data.pricemax}-{$data.pricemax}{/if}</b><span>/
									{$data.unit}</span>
							</div>
							<div class="min_order">
								<b>{$data.minorder}</b> {$data.unit} (Min. Order)
							</div>
							<div>
								<i class="fa fa-map-marker text-danger pr-1"></i>{$data.Location}
							</div>
							<div class="ncc">
								<a href="{$data.url_page}" target="_blank"><i
									class="fa fa-diamond pr-1"></i>{$data.pagename}</a>
							</div>
						</div>
					</div>
					<div class="col-12">
						<div class="contact-button pt-2">
							<div class="row row-sm">
								<div class="col-6">
									<a
										href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
										class="btn btn-sm btn-contact"><i
										class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a>
								</div>
								<div class="col-6">
									<a href="tel:{$data.phone}" class="btn btn-sm btn-phone"
										onclick="SaveInfoCall({$data.id},1)"><i
										class="fa fa-phone"></i> Gọi ngay</a> <input type="hidden"
										class="phonenumber{$data.id}" value="{$data.phone}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</li> {/foreach}
		</ul>
		<div class="clearfix"></div>
	</div>
</div>
<div class="d-flex justify-content-end w-100">
	<div class="mt-3">{$paging}</div>
</div>
{/if}
<div class="modal fade" id="PopupCall" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-0">
			<div class="p-3 bg-primary">
				<h5 class="modal-title text-center">
					<img src="{$arg.stylesheet}images/icon-phone.png">
				</h5>
				<h3 class="text-white text-center fz-18">Nhập vào email hoặc số
					điện thoại của bạn</h3>
				<p class="text-white text-center">Để được chăm sóc tốt nhất</p>
			</div>
			<div class="modal-body text-center">
				<input type="hidden" class="setphonenumber" name="callphone"
					value=""> <input type="hidden" class="seturl"
					name="callurl" value="">
				<div class="input-group mb-3 w-75 mx-auto">
					<input type="text" class="form-control" name="email"
						placeholder="Email hoặc số điện thoại"
						style="border: 0; border-radius: 0; border-bottom: 2px solid #ccc">
				</div>
				<div class="input-group mb-3 w-75 mx-auto text-center">
					<button type="button" class="btn btn-danger btn-block rounded-pill"
						onclick="GetInfoCall()">Gọi ngay</button>
				</div>
				<p data-dismiss="modal" aria-label="Close">Đóng và tiếp tục tham
					khảo sản phẩm</p>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	$('.collapse-click').click(function () {
		$("i", this).toggleClass("fa-arrow-up fa-arrow-down");
	});

	$(window).ready(
		// function() {
		// 	$(".filter input[type=checkbox]").click(
		// 		function() {
		// 			var arr = [];
		// 			$(".filter input[type=checkbox]").each(function() {
		// 				if ($(this).is(':checked')) {
		// 					var value = $(this).val();
		// 					arr.push(value);
		// 				}
		// 			});

		// 			var filter_checkbox = arr.toString();
		// 			console.log(filter_checkbox);
		// 			var url = set_filter();
		// 			url = (filter_checkbox != '') ? url
		// 					+ "&filter_checkbox=" + filter_checkbox
		// 					: url;
		// 			location.href = url;
		// 		}
		// 	);
		// }
	);

	function set_filter() {
		var url = $("#filter_url").val();
		var minorder = $("#filter_minorder").val();
		var minprice = $("#filter_minprice").val();
		var maxprice = $("#filter_maxprice").val();
		var location_id = $("#location_id").val();
		var package_id = $("#package_id").val();
		var taxonomy_id = $("#taxonomy_id").val();
		var attribute_keyword = $("#attribute_keyword").val();
		var k = $("#Keyword").val();

		url = (minorder != '') ? url + "&minorder=" + minorder : url;
		url = (minprice != '') ? url + "&minprice=" + minprice : url;
		url = (maxprice != '') ? url + "&maxprice=" + maxprice : url;
		url = (location_id != '') ? url + "&location_id=" + location_id : url;
		url = (package_id != '') ? url + "&package_id=" + package_id : url;
		url = (taxonomy_id != '') ? url + "&taxonomy_id=" + taxonomy_id : url;
		url = (attribute_keyword != '') ? url + "&attribute_keyword=" + attribute_keyword : url;

		return url;
	}

	function filter() {
		var url = set_filter();
		location.href = url;
	}
	function SetType(value) {
		Type = $("input#Type").val(value);
	}
	function SaveInfoCall(id,ismobile){
		var data = {};
		data.phone=$('.phonenumber'+id).val();
		data.url= $('.url'+id).val();
		data.ajax_action='get_info_call';
		$.post('?mod=product&site=index', data).done(function(e){
			if(ismobile==0)
		 		$(".show_phone").html('<i class="fa fa-fw fa-phone"></i>&nbsp;'+data.phone);
		});
	}
	function GetPhoneNumber(id){
		 var PhoneNumber = $('.phonenumber'+id).val();
		 var Url = $('.url'+id).val();
		 $('.setphonenumber').val(PhoneNumber);
		 $('.seturl').val(Url);
		 $("#PopupCall").modal({
				show : true,
				//backdrop: 'static',
				//keyboard: false  // to prevent closing with Esc button (if you want this too)
			});
	}
	function GetInfoCall(){
		loading();
		var PhoneNumber = $('.setphonenumber').val();
		var data = {};
		data.email = $("#PopupCall input[name=email]").val();
		data.phone=$("#PopupCall input[name=callphone]").val();
		data.url=$("#PopupCall input[name=callurl]").val();
		data.ajax_action='get_info_call';
		if(data.email==''){
			noticeMsg('Thông báo', 'Vui lòng nhập vào email của bạn.',
			'error');
			$("#PopupCall input[name=email]").focus();
			return false;
		}
		$.post('?mod=product&site=index', data).done(function(e){
			endloading();	
     		window.location.href="tel://"+PhoneNumber;
		});
	}
</script>