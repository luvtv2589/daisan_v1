{if $is_mobile}
<div class="header-mobile cate-mobile fixed">
	<div class="container">
		<div class="row">
			<div class="col-7">
				<span onclick="goBackHistory()"><i class="fa fa-arrow-left"></i></span>
				<span class="title" onclick="showSearch()">Nhà cung cấp uy
					tín</span> <span onclick="showSearch()"
					style="position: absolute; right: -45px;"><i
					class="fa fa-search fa-fw"></i></span>
			</div>
			<div class="col-5 text-right">
				<span><i class="fa fa-cloud-download fa-fw"></i></span>
				<div class="dropdown dropdown-tools-right">
					<span class="" id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"><i
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

<section id="List-4" class="List-4 bg-white" style="padding-top: 52px">

	<!-- <div id="fat">
		<img src="{$arg.stylesheet}images/img-12.jpg" class="w-100">
	</div>
	<nav id="navbar-example4"
		class="navbar navbar-light bg-light navbar-example-1">
		<ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link"
				href="{$smarty.server.REQUEST_URI}#Trends">Top1</a></li>
			<li class="nav-item"><a class="nav-link"
				href="{$smarty.server.REQUEST_URI}#Trends-1">Top2</a></li>
		</ul>
	</nav>-->
	<div>
		<a href="javascript:void(0)"><img src="{$arg.stylesheet}images/banhangcungds.jpg" class="w-100"></a>
	</div>
	<div data-spy="scroll" data-target="#navbar-example4" data-offset="0"
		class="mt-3">
		{foreach from = $pages item = data}
		<div class="L-2" id="Trends">
			<a href="{$data.url}"><img src="{$data.logo}" class="Img-1 border" width="50" height="46"></a>
			<div class="L-3">
				<div class="d-flex">
					<a href="{$data.url}"><span>{$data.name}</span></a>
				</div>
			</div>
		</div>
		<div class="S-2 pb-3">
			<div class="p-0 main-category-hot">
				<div class="product">
					<ul class="row m-0 bg-white">
						{foreach from=$data.product item=data1}
						<li class="col-5th col-sm-5th"><a href="{$data1.url}" class="d-block">
								<img class="d-block w-100" src="{$data1.avatar}"
								alt="{$data.name}">
						</a>
							<div class="prod-info">
								<div class="title">
									<span class="kind">Gian hàng tiêu chuẩn</span>
									<h3>
										<a href="{$data1.url}">{$data1.name}</a>
									</h3>
								</div>
								<div class="price">{$data1.price}{if
									$data1.pricemax gt 0}-{$data1.pricemax|number_format}{/if}</div>
								<div class="moq">Tối thiểu: {$data1.minorder} {$data1.unit}</div>
							</div></li> {/foreach}
					</ul>
				</div>
			</div>
		</div>
		{/foreach}
	</div>
</section>
