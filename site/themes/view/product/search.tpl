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

{assign var='sugget_add' value=array()}
{append var='sugget_add' value=$package_id}
{append var='sugget_add' value=$location_id}
{append var='sugget_add' value=$taxonomy_id}
	
{$url_params_full = "$params_minorder$params_minprice$params_maxprice$params_location_id$params_package_id$params_taxonomy_id$params_attribute_keyword"}
{$url_params_1 = "$params_minorder$params_minprice$params_maxprice$params_location_id$params_package_id$params_attribute_keyword"}
{$url_params_2 = "$params_minorder$params_minprice$params_maxprice$params_location_id$params_package_id$params_taxonomy_id"}
{$url_params_3 = "$params_minorder$params_minprice$params_maxprice"}

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
			<div class="tab-content bg-white w-100" id="pills-tabContent">
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
{/if}
<div class="search-result" {if $is_mobile}style="padding-top:50px;"{/if}>
	<div class="container m-container">
		{if !$is_mobile}
		<div class="ads my-2">
			<a href=""><img
				src="https://sc01.alicdn.com/kf/H627f31b58b274cf5a9854ad96b9c9369D.jpg"
				class="img-fluid w-100"></a>
		</div>
		{/if}
		<div class="row row-nm" id="procontent">
			<div class="col-12 d-block d-sm-none">
				<div class="d-flex search_info p-3">
					<div class="flex-grow-1">
						<strong>{$out.number}</strong> kết quả với "{$filter.key|default:''}"
					</div>
					<div class="">
						<ul class="nav justify-content-center">
							<li class="nav-item text-nm-1"><i
								class="fa fa-th-large fa-fw"></i></li>
							<li class="nav-item text-nm-1" id="collapse_filter"><i
								class="fa fa-filter fa-fw" aria-hidden="true"></i></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-sm-2 left-sidebar no-padding-right hidden-xs">
				<div class="p-3 bg-white filter">
					<div class="category-child">
						<h3>Category</h3>
						<ul class="nav flex-column">
							{foreach from=$e_category key=k item=data}
							<li><a
								href="./product?k={$smarty.get.k}&taxonomy_id={$data.id}{$url_params_1}">{$data.name}</a></li>
							{/foreach}
						</ul>
					</div>
					<div class="">
						<h3>Các loại nhà cung cấp</h3>
						<ul class="nav flex-column">
							{foreach from=$package_all key=k item=data}
							<li><a
								href="./product?k={$smarty.get.k}{$url_params_full}&package_id={$data.id}">
									<input type="checkbox" name="radio"> <span
									class="checkmark"></span><label class="wm-checkbox">{$data.name}</label>
							</a></li> {/foreach}
						</ul>
					</div>
					<div class="">
						<h3>Tối thiểu</h3>
						<div class="price-range">
							<form>
								<div class="row row-sm">
									<div class="col-9">
										<input type="number" id="filter_minorder"
											value="{$smarty.get.minorder|default:1}"
											class="form-control form-control-sm" placeholder="Min">
									</div>

									<div class="col-3 text-right">
										<button type="button" class="btn btn-primary btn-sm"
											onclick="filter()">Go</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="">
						<h3>Khoảng giá</h3>
						<div class="price-range">
							<form>
								<div class="row row-sm">
									<div class="col">
										<input type="text" class="form-control form-control-sm"
											id="filter_minprice" value="{$smarty.get.minprice}"
											placeholder="Min">
									</div>
									-
									<div class="col">
										<input type="text" class="form-control form-control-sm"
											placeholder="Max">
									</div>
									<div class="col text-right">
										<button type="button" class="btn btn-primary btn-sm"
											onclick="filter()">Go</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse" href="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne" class="">
										<i class="more-less fa pull-right fa-minus"></i> Khu vực

									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in show"
								role="tabpanel" aria-labelledby="headingOne"
								aria-expanded="true" style="">
								<div class="panel-body">
									<ul class="left-sidebar-ul">
										{foreach from=$locations item=data}
										<li><a href="./product?k={$smarty.get.k}{$url_params_full}&location_id={$data.Id}"> <input type="checkbox" name="radio">
												<span class="checkmark"></span><label class="wm-checkbox">{$data.Name}</label>
										</a></li> {/foreach}
									</ul>
								</div>
							</div>
						</div>
						{foreach from=$groupattribute key=k item=v} {if $v.name!="" &&
						count($v.contents) > 0}
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="heading{$k}">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										href="#collapse{$k}" aria-expanded="false"
										aria-controls="collapse{$k}"> <i
										class="more-less fa fa-minus pull-right"></i> {$v.name}
									</a>
								</h4>
							</div>
							<div id="collapse{$k}" class="panel-collapse collapse in show"
								role="tabpanel" aria-labelledby="heading{$k}">
								<div class="panel-body">
									<ul class="left-sidebar-ul">
										{foreach from=$v.contents key=k2 item=v2}
										{if $v2.isShow != 'false'}
											{$attr_key = $v2.name} 
										{if $smarty.get.attribute_keyword != '' }
											{$v2name = $v2.name}
											{$old_key = $smarty.get.attribute_keyword}
											{$attr_key = "$old_key,$v2name"}
										{/if}
										<li><a
											href="./product?k={$smarty.get.k}&attribute_keyword={$attr_key}{$url_params_2}">
												<i class="fa fa-square-o text-lg" aria-hidden="true"></i> <span
												class="checkmark"></span><label class="wm-checkbox">{$v2.name}</label>
										</a></li> {/if} {/foreach}
									</ul>
								</div>
							</div>
						</div>
						{/if} {/foreach}
					</div>
				</div>
				<!-- panel-group -->
			</div>
			<div class="col-sm-10">
			<!-- 
				<div class="p-3 bg-white">
					<div class="">
						<div class="owl-carousel owl-theme owl-category-hot">
						{foreach from=$e_category key=k item=data}
							<div class="item text-center">
								<a href="./?mod=product&site=search&k={$smarty.get.k}&taxonomy_id={$data.id}{$url_params_1}" class="d-block"><img
									src="https://sc01.alicdn.com/kf/HTB1gQq8OpYqK1RjSZLeq6zXppXar.jpg_100x100.jpg"
									width="80" class="rounded-circle"></a>
								<p>{$data.name}</p>
							</div>
						 {/foreach}
						</div>
					</div>
				</div>
			 -->
				{if !$is_mobile}
				<div class="d-flex bd-highlight py-2">
					<div class="flex-grow-1 bd-highlight filter-result">
						<p class="mb-0 list-filter">
							{foreach from=$add_suggested key=k item=v}
							{if $v.param == 'package_id' && isset($smarty.get.package_id)}
									<a href="./product?k={$smarty.get.k}{$url_params_3}{$params_attribute_keyword}{$params_location_id}{$params_taxonomy_id}" class="btn btn-sm list-filter-item border-0 bg-white">
										{$v.name}<i class="fa fa-remove fa-fw"></i>
									</a>
							{elseif $v.param == 'location_id' && isset($smarty.get.location_id)}
									<a href="./product?k={$smarty.get.k}{$url_params_3}{$params_attribute_keyword}{$params_package_id}{$params_taxonomy_id}" class="btn btn-sm list-filter-item border-0 bg-white">
										{$v.name}<i class="fa fa-remove fa-fw"></i>
									</a>
							{elseif $v.param == 'taxonomy_id' && isset($smarty.get.taxonomy_id)}
									
							<a href="./product?k={$smarty.get.k}{$url_params_3}{$params_attribute_keyword}{$params_package_id}{$params_location_id}" class="btn btn-sm list-filter-item border-0 bg-white">
								{$v.name}<i class="fa fa-remove fa-fw"></i>
							</a>
							{/if}
						    {/foreach}
						     {if count($expl)>0}
							{foreach from=$url_suggested key=k item=v} <a
								href="./product?k={$smarty.get.k}{$url_params_2}&attribute_keyword={$v.url}"
								class="btn btn-sm list-filter-item border-0 bg-white">
								{$v.name}<i class="fa fa-remove fa-fw"></i>
							</a> {/foreach}
								<span class=""><a
								href="/product?k={$smarty.get.k}{$url_params_3}"
								class="btn btn-sm">Xoá tất cả</a></span>
							{/if}
							
						</p>
					</div>

					<div class="destop-bar-right destop-bar-cm">
						<ul class="nav">
							<li class="nav-item px-2 py-1">Sắp xếp:</li>
							<li class="nav-item px-2"><div class="dropdown-wm">
									<select name="" class="custom-select custom-select-sm"
										id="sort-product">
										<option value="">Lựa chọn</option>
										<option value="">Sản phẩm phổ biến</option>
										<option value="">Sản phẩm mới nhất</option>
									</select>
								</div></li>
							<li class="nav-item"><a href=""
									class="nav-link px-1"><i class="fa fa-th-list fa-fw"></i></a></li>
							<li class="nav-item"><a href="" class="nav-link px-1"><i
									class="fa fa-th-large fa-fw"></i></a></li>

						</ul>
					</div>
				</div>
				{/if}
				<div class="">
					<div class="row row-sm">
					    
					    {foreach from=$product_ads_index item=data}
						<div class="col-xl-3 col-lg-4 col-md-4 col-6 fz-16 mb-2">
							<div class="item bg-white p-3">
								<a
									href="{$data.url}"
									{if !$is_mobile}target="_blank"{/if} class="img"> <img
									alt="{$data.name}" class="zoom-in img-fluid"
									src="{$data.avatar}">
								</a>
								<div class="prod-info my-3">
									<div class="title">
										<h3>
											<a
												href="{$data.url}"
												title="{$data.name}"
												{if !$is_mobile}target="_blank"{/if} class="text-twoline">{$data.name}</a>
										</h3>
									</div>
									<!--  
									<div class="tags">
										<span class="badge-tag">Gạch ngoại thất</span><span
											class="badge-tag">Gạch trang trí</span><span
											class="badge-tag">gạch inax</span>
									</div>-->
									<div class="price">
										{$data.showprice}
									</div>
									<div class="moq">
										<span class="font-weight-bold">{$data.minorder}
										{$data.unit} </span> (Min. Order)
									</div>
									
									<div class="py-2 ncc">
										<div class="yearexp mr-2">
											{$data.yearexp}<span>YR</span>
										</div>
										<a href="{$data.url_page}"
											target="_blank" title="{$data.pagename}">{$data.pagename}</a>
									</div>
								</div>
								<div class="hr">
									<span></span>
								</div>
								<div class="d-block">
									<a
										href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
										class="btn btn-sm btn-contact"><i
										class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a> <a href="tel:"
										class="btn btn-sm btn-phone"><i class="fa fa-phone"></i>
										Call</a>
									<span class="label-ads">Ad</span>
								</div>
							</div>
							<!-- end item product -->
						</div>
						<!-- end col-3 -->
						{/foreach}
						{foreach from=$result item=data}
						<div class="col-xl-3 col-lg-4 col-md-4 col-6 fz-16 mb-2">
							<div class="item bg-white p-3">
								<a
									href="{$data.url}"
									{if !$is_mobile}target="_blank"{/if} class="img"> <img
									alt="{$data.name}" class="zoom-in img-fluid"
									src="{$data.avatar}">
								</a>
								<div class="prod-info my-3">
									<div class="title">
										<h3>
											<a
												href="{$data.url}"
												title="{$data.name}"
												{if !$is_mobile}target="_blank"{/if} class="text-twoline">{$data.name}</a>
										</h3>
									</div>
									<!--  
									<div class="tags">
										<span class="badge-tag">Gạch ngoại thất</span><span
											class="badge-tag">Gạch trang trí</span><span
											class="badge-tag">gạch inax</span>
									</div>-->
									<div class="price">
										{$data.showprice}
									</div>
									<div class="moq">
										<span class="font-weight-bold">{$data.minorder}
										{$data.unit} </span> (Min. Order)
									</div>
									
									<div class="py-2 ncc">
										<div class="yearexp mr-2">
											{$data.yearexp}<span>YR</span>
										</div>
										<a href="{$data.url_page}"
											target="_blank" title="{$data.pagename}">{$data.pagename}</a>
									</div>
								</div>
								<div class="hr">
									<span></span>
								</div>
								<div class="d-block">
									<a
										href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
										class="btn btn-sm btn-contact"><i
										class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a> <a href="tel:"
										class="btn btn-sm btn-phone"><i class="fa fa-phone"></i>
										Call</a>
								</div>
							</div>
							<!-- end item product -->
						</div>
						<!-- end col-3 -->
						{/foreach}
						{foreach from=$product_ads item=data}
						<div class="col-xl-3 col-lg-4 col-md-4 col-6 fz-16 mb-2">
							<div class="item bg-white p-3">
								<a
									href="{$data.url}"
									{if !$is_mobile}target="_blank"{/if} class="img"> <img
									alt="{$data.name}" class="zoom-in img-fluid"
									src="{$data.avatar}">
								</a>
								<div class="prod-info my-3">
									<div class="title">
										<h3>
											<a
												href="{$data.url}"
												title="{$data.name}"
												{if !$is_mobile}target="_blank"{/if} class="text-twoline">{$data.name}</a>
										</h3>
									</div>
									<!--  
									<div class="tags">
										<span class="badge-tag">Gạch ngoại thất</span><span
											class="badge-tag">Gạch trang trí</span><span
											class="badge-tag">gạch inax</span>
									</div>-->
									<div class="price">
										{$data.showprice}
									</div>
									<div class="moq">
										<span class="font-weight-bold">{$data.minorder}
										{$data.unit} </span> (Min. Order)
									</div>
									
									<div class="py-2 ncc">
										<div class="yearexp mr-2">
											{$data.yearexp}<span>YR</span>
										</div>
										<a href="{$data.url_page}"
											target="_blank" title="{$data.pagename}">{$data.pagename}</a>
									</div>
								</div>
								<div class="hr">
									<span></span>
								</div>
								<div class="d-block">
									<a
										href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
										class="btn btn-sm btn-contact"><i
										class="fa fa-fw fa-envelope-o"></i> Lấy giá mới</a> <a href="tel:"
										class="btn btn-sm btn-phone"><i class="fa fa-phone"></i>
										Call</a>
									<span class="label-ads">Ad</span>
								</div>
							</div>
							<!-- end item product -->
						</div>
						<!-- end col-3 -->
						{/foreach}
					</div>
				</div>
				<!-- end -->
				<div class="mt-3">{$paging}</div>
			</div>
		</div>
	</div>

</div>
<input type="hidden" value="{$out.url}" id="filter_url">
<input type="hidden" value="{$taxonomy_id}" id="taxonomy_id">
<input type="hidden" value="{$attribute_keyword}" id="attribute_keyword">
<script>
	$('.owl-category-hot')
			.owlCarousel(
					{
						loop : false,
						margin : 10,
						nav : true,
						dots : false,
						navText : [
								"<img src='"+arg.stylesheet+"images/icons/arrow-l.png'>",
								"<img src='"+arg.stylesheet+"images/icons/arrow-r.png'>" ],
						responsive : {
							0 : {
								items : 3
							},
							600 : {
								items : 8
							},
							1000 : {
								items : 12
							}
						}
					});
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
		url = (attribute_keyword != '') ? url + "&attribute_keyword="
				+ attribute_keyword : url;

		return url;
	}

	function filter() {
		var url = set_filter();
		location.href = url;
	}
	$(document).ready(function() {
		$('#collapse_filter').on('click', function() {
			$('.overlay').fadeIn();
			$(".filter").addClass("active");
		});
		$('.overlay').on('click', function() {
			$(".filter").removeClass("active");
			$('.overlay').fadeOut();
		});
	});
</script>
</script>