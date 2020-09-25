<div class="main-first-floor d-none d-sm-block">
	<div class="home-background" {if $arg.background.image
		neq 'https://daisan.vn/site/upload/generals/noimg.jpg'}style="background: url('{$arg.background.image}') no-repeat center 0{/if}">
		<!--<a class="face-top" href="./?mod=event&site=index">COUNT DOWN<span
		class="countdown" data-countdown="2018/12/30"></span></a>-->
		<section id="S-1" class="">
			<div class="container">
				<div class="wrapper m-0">
					<div class="row">
						<div class="col-xl-3 col-lg-4 col-md-4 d-none d-sm-block">
							<div class="sec-title ">
								<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="pills-home-tab" data-toggle="pill" href="#pills-home"
										role="tab" aria-controls="pills-home" aria-selected="true"><span>Danh
												mục</span></a></li>
									<li class="nav-item"><a class="nav-link"
										id="pills-profile-tab" data-toggle="pill"
										href="#pills-category-2" role="tab"
										aria-controls="pills-profile" aria-selected="false"><span>Tiện
												ích</span></a></li>

								</ul>
							</div>
							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="pills-home"
									role="tabpanel" aria-labelledby="pills-home-tab">
									<ul class="sec-content mb-0">
										{foreach from=$a_main_category key=k item=data} {if $k lt 8}
										<li class="link-black"><a href="{$data.url}"
											target="_blank"> <i class="fa fa-circle"></i>
												{$data.name}
										</a></li> {/if} {/foreach}
									</ul>
								</div>
								<div class="tab-pane fade" id="pills-category-2" role="tabpanel"
									aria-labelledby="pills-profile-tab">
									<ul class="row">
										<li class="col-6 text-center"><a
											href="https://duan.daisan.vn" target="_blank"><i
												class="fa fa-home"></i><br>Thông tin dự án toàn quốc</a></li>
										<li class="col-6 text-center"><a
											href="http://dubao360.daisannews.com" target="_blank"><i
												class="fa fa-bell"></i><br>Tin tức dự báo 360</a></li>
										<li class="col-6 text-center"><a
											href="https://app.logivan.com/shipments/new" target="_blank"><i
												class="fa fa-car"></i><br>Tìm xe tải chở hàng nhanh
												nhất</a></li>
										<li class="col-6 text-center"><a
											href="https://thuvienphapluat.vn/" target="_blank"><i
												class="fa fa-address-book"></i><br>Thư viện pháp luật</a></li>
										<li class="col-6 text-center"><a
											href="http://daisanerp.com" target="_blank"><i
												class="fa fa-spotify"></i><br>ERPOnline quản lý doanh
												nghiệp</a></li>
										<li class="col-6 text-center"><a
											href="{$arg.url_sourcing}" target="_blank"><i
												class="fa fa-user"></i><br>Thông tin yêu cầu báo giá</a></li>
										<li class="col-6 text-center"><a
											href="http://daisanplus.com" target="_blank"><i
												class="fa fa-search-plus"></i><br>Tìm kiếm mở rộng</a></li>
										<li class="col-6 text-center"><a
											href="http://muaban.daisan.vn" target="_blank"><i
												class="fa fa-bullhorn"></i><br>Rao vặt xây dựng</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-xl-9 col-lg-8 col-md-8">
							<div class="row row-sm">
								<div class="col-xl-9 col-lg-12 col-md-12 col-12">
									<div id="carouselExampleIndicators" class="carousel slide"
										data-ride="carousel" style="height: 400px">
										<ol class="carousel-indicators">
											{foreach from=$a_slider key=k item=data}
											<li data-target="#carouselExampleIndicators"
												data-slide-to="{$k}" {if $k eq 0}class="active"{/if}>
												{/foreach}
										</ol>
										<div class="carousel-inner h-100">
											{foreach from=$a_slider key=k item=data}
											<div class="carousel-item h-100 {if $k eq 0}active{/if}">
												<a href="{$data.alias}" target="_blank"><img
													class="d-block h-100" src="{$data.image}"></a>
											</div>
											{/foreach}
										</div>
										<a class="carousel-control-prev"
											href="#carouselExampleIndicators" role="button"
											data-slide="prev"> <span class="text-danger"> <i
												class="fa fa-angle-left text-white"></i>
										</span> <span class="sr-only">Previous</span>
										</a> <a class="carousel-control-next"
											href="#carouselExampleIndicators" role="button"
											data-slide="next"> <span class=""> <i
												class="fa fa-angle-right text-white"></i>
										</span> <span class="sr-only">Next</span>
										</a>
									</div>
								</div>
								<div class="col-xl-3 d-none d-sm-block">
									<div class="pl-xl-2 mt-2">
										<div class="row row-sm mx-0 ex-product">
											<div class="col-xl-12 col-lg-3 col-md-3 ml-0 pl-0">
												<div class="ex-title">
													<h3 class="">Sản phẩm được lựa chọn</h3>
													<div class="box-body">
														<button class="d-none d-lg-block d-xl-none">
															<a href="?mod=product&site=mainproduct&id={$data.id}">Xem
																ngay</a>
														</button>
													</div>
												</div>
											</div>
											{foreach from = $a_home_sidebar item = data}
											<div class="col-xl-12 col-lg-3 col-md-3">
												<div class="box-p">
													<h3>
														<a href="?mod=product&site=mainproduct&id={$data.id}">{$data.name}</a>
													</h3>
													<div class="box-body">
														<button class="d-none d-xl-block">
															<a href="?mod=product&site=mainproduct&id={$data.id}">Xem
																ngay</a>
														</button>
														<img class="ml-3" src="{$data.avatar}" alt="{$data.name}">
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
											{/foreach}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- 
	<div class="NavMain">
		<div class="container">
			<ul class="nav justify-content-center">
			{foreach from=$a_menu_main name=check_pn item=data}
				<li class="nav-item"><a class="nav-link"
					href="{$data.url}" target="_blank"><img
						src="{$data.image}">
						<p>{$data.name}</p></a></li>
			{/foreach}
			</ul>
		</div>
	</div> -->
	{if isset({$a_ad.adhome.p1.image})}
	<section id="S-2" class="d-none d-sm-none d-md-block mt-4">
		<div class="container">
		<div class="row row-sm">
			{foreach from=$a_ad.adhome.p1 item=data}
				<div class="col-3">
					<a href="{$data.alias}"><img src="{$data.image}"
						class="img-fluid"></a>
				</div>
				{/foreach}
		</div>
	</div>
	</section>
	{/if} {if $event}
	<section>
		<div class="container">
			<div class="title">
				<h2>
					<a href="/event/" target="_blank"><i
						class="fa fa-life-ring"></i>&nbsp;Ưu đãi và khuyến mãi</a>
				</h2>
			</div>
			<div class="row row-nm">
				{foreach from=$event item=data}
				<div class="col-md-3">
					<div class="card mb-4 rounded-0 border-0">
						<a href="{$data.url}" target="_blank"><img
							class="" src="{$data.avatar}" alt="{$data.name}"></a>
						<!-- <div class="card-body">
							<h5 class="card-title line-2 font-weight-bold fz-14 h-25">
								<a href="{$data.url}" target="_blank">{$data.name}</a>
							</h5>
						</div> -->
					</div>
				</div>
				{/foreach}
			</div>
		</div>
	</section>
	{/if}
	<div class="stickyOffset "></div>
	{if $a_home_toplogo}
	<section class="BrandHome mt-4">
		<div class="container">
			<div class="bg-white" style="position: relative;">
				<ul class="nav" id="LoadMore">
					{foreach from=$a_home_toplogo item=data}
					<li class="nav-item border-right border-bottom"><a
						href="javascript:void(0)"><img src="{$data.logo}"
							class="w-100 p-3"></a> <a class="brand-mask" href="{$data.url}">
							<span>Vào Shop</span>
					</a></li>{/foreach}
				</ul>
				<div id="BtnLoadMore">
					<a href="javascript:void(0)" onclick="LoadMore();"><i
						class="fa fa-history"></i><br>Xem thêm </a> <a class="brand-mask"
						href="javascript:void(0)" onclick="LoadMore();"><i
						class="fa fa-history"></i><br>Xem thêm </a>
				</div>
			</div>
		</div>
	</section>
	{/if}
	<section class="HomeCate">
		{foreach from=$a_home_category key=k item=data}
		<div class="container">
			<div class="title" id="Tax{$data.id}">
				<h2>
					<a href="?mod=product&site=mainproduct&id={$data.id}"
						target="_blank">{$data.name}</a>
				</h2>
			</div>
			<div class="row m-0">
				<div class="col-xl-3 col-lg-3 col-md-4 col-12 p-0 d-none d-md-block"
					style="height: 320px">
					<img class="w-100 h-100" src="{$data.image}" alt="{$data.name}">
					<!-- <div class="sec-content">
						<div class="content">
							<h2>{$data.description}</h2>
							<span> <a
								href="?mod=product&site=mainproduct&id={$data.id}"
								target="_blank">Xem thêm</a></span>
						</div>
					</div> -->
				</div>
				<div class="col-xl-9 col-lg-9 col-md-8 col-12 p-0">
					<div class="border-group">
						<div class="row">
							{foreach from=$data.sub item=sub}
							<div class="col-lg-3 col-md-3 col-6 h-50">
								<div class="card h-100">
									<a href="?mod=product&site=mainproduct&id={$sub.id}"
										class="block card-body" target="_blank"> <span
										class="d-block wrapper">{$sub.name}</span> <img
										class="zoom-in" src="{$sub.thumb}" alt="{$sub.name}">
									</a>
								</div>
							</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
			<!-- 
			<div class="pt-2">
				<ul class="nav">
					{foreach from = $data.keyword item = key}
					<li class="nav-item"><a class="nav-link py-0 px-1 btn btn-outline-secondary mr-2 mb-2"
						href="{$key.url}">{$key.keyword}</a></li> {/foreach}
				</ul>
			</div>
			-->
		</div>
		{/foreach}
	</section>
</div>
<section id="Rfq" class="d-none d-sm-block">
	<div class="container">
		<div class="title">
			<h2>
				<a href="javascript:void(0)"><i class="fa fa-life-ring"></i> Yêu
					cầu báo giá</a>
			</h2>
		</div>

		<div class="row row-nm">
			<div class="col-md-8">
				<a href="{$arg.url_sourcing}?site=createRfq"> <img alt=""
					src="{$arg.stylesheet}images/Rfq.jpg" class="w-100">
				</a>
			</div>
			<div class="col-md-4">
				<div class="card h-100" id="RfqForm">
					<div class="card-body">
						<h3>Gửi yêu cầu để nhận được các báo giá</h3>
						<input type="hidden" name="user_id" value="{$arg.login}">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Bạn đang cần gì?" name="title">
						</div>
						<div class="row row-tn">
							<div class="col-md-5">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Số lượng"
										name="number">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<select class="form-control" name="unit">{$out.product_unit}
									</select>
								</div>
							</div>
						</div>
						<div class="">
							<button class="btn btn-danger" onclick="SaveRfq();">Gửi
								yêu cầu báo giá</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	function SaveRfq() {
		var data = {};
		data['user_id'] = $("#RfqForm input[name=user_id]").val();
		data['title'] = $("#RfqForm input[name=title]").val();
		data['number'] = $("#RfqForm input[name=number]").val();
		data['unit'] = $("#RfqForm select[name=unit]").val();
		if (data.user_id == 0) {
			noticeMsg('System Message',
					'Vui lòng đăng nhập trước khi thực hiện chức năng', 'error');
			location.href = "?mod=account&site=login";
			return false;
		}
		var url = arg.url_sourcing + "?site=createRfq";
		url = url + "&title=" + data.title + "&number=" + data.number
				+ "&unit=" + data.unit;
		location.href = url;

	}
</script>
<!-- 
<section class="d-none d-sm-block">
	<div class="container">
		<div class="title">
			<h2>
				<a href="./nations" target="_blank">Nhà cung cấp
					theo khu vực</a>
			</h2>
		</div>
		<div class="row row-nm">
			{foreach from = $locations key=k item = data}
				{if $k lt 8}
				<div class="col">
					<a href="javascript:void(0)" onclick="SetLocationMobile({$data.Id})"><img src="{$data.logo}"
						class="pr-2" width="40">{$data.Name}</a>
				</div>
				{/if}
			{/foreach}
			<div class="col pull-right text-right">
				<a href="./nations/" target="_blank">Xem thêm</a>
			</div>
		</div>
	</div>
</section>
 -->
<section id="S-4" class="HomeProduct d-none d-sm-block">
	<div class="container">
		<div class="title">
			<h2>
				<a href="javascript:void(0)">SẢN PHẨM GỢI Ý CHO BẠN</a>
			</h2>
		</div>
		<div class="load_product_recommen"></div>
	</div>
</section>

{if $a_product_views neq NULL}
<section id="S-4" class="HomeCate mb-4 d-none d-sm-block">
	<div class="container">
		<div class="title">
			<h2>
				<span>Sản phẩm bạn vừa xem</span>
			</h2>
		</div>
		<div class="owl-carousel owl-theme">
			{foreach from=$a_product_views item=data}
			<div class="item">
				<a href="{$data.url}"> <img src="{$data.avatar}"
					class="w-100 zoom-in " alt="{$data.name}"></a>
			</div>
			{/foreach}
		</div>
	</div>
</section>
{literal}
<script>
	$('.owl-carousel').owlCarousel({
		loop : false,
		margin : 10,
		nav : true,
		dots : false,
		responsive : {
			0 : {
				items : 3
			},
			600 : {
				items : 5
			},
			1000 : {
				items : 10
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
{/literal}{/if} {if isset({$a_ad.adhome.p2.image})}
<section id="S-2" class="d-none d-sm-none d-md-block mb-3">
	<div class="container pt-0">
		<a href="{$a_ad.adhome.p2.alias}" target="_blank"><img
			class="w-100 " src="{$a_ad.adhome.p2.image}"
			alt="{$a_ad.adhome.p2.title}"></a>
	</div>
</section>
{/if}
<div class="fixed_left">
	<ul class="nav flex-column" id="horizontalmenu">
		{foreach from = $a_home_category item = data}
		<li class="nav-item"><a href="#Tax{$data.id}"><i
				class="fa {$data.icon}"></i></a></li> {/foreach}
	</ul>
</div>
<script>
	//$('.fixed_left').stickynav();
	var page = 1;
	function LoadMore() {
		page = page + 1;
		console.log(page);
		$.post('?mod=home&site=ajax_loadmore', {
			'page' : page,
		}).done(function(e) {
			console.log(e);
			if (e == '' || e == null) {
				$("#LoadMore").append(e);
			} else {
				$("#LoadMore").html(e);
			}
		});
	}
</script>
<script type="text/javascript"
	src="{$arg.stylesheet}js/jquery.countdown.min.js"></script>
<script>
	$('[data-countdown]').each(function() {
		var $this = $(this), finalDate = $(this).data('countdown');
		$this.countdown("2018/12/30", function(event) {
			$this.html(event.strftime('%D:%H:%M:%S'));
		});
	});
</script>
{if $is_mobile}
<section class="d-sm-none w-100" id="bottom_page">
	<div class="row row-no">
		<div class="col-5th text-center">
			<a href="./" class="link_active"><span class="text-big"><i
					class="fa fa-home text-white mt-1"></i></span></a>
			<p class="mb-1">
				<a href="./" class="text-msml text-white link_active">Trang chủ</a>
			</p>
		</div>
		<div class="col-5th text-center">
			<a href="javascript:void(0)" onclick="showAllCategory();"><span
				class="text-big"><i class="fa fa-th text-white mt-1"></i></span></a>
			<p class="mb-1">
				<a href="javascript:void(0)" class="text-msml text-white"
					onclick="showAllCategory();">Danh mục</a>
			</p>
		</div>
		<div class="col-5th text-center">
			<div class="back_to_top_mobile rounded-circle d-sm-none d-block">
				<button type="button" class="btn rounded-circle bg-white"
					data-original-title="" title="">
					<i class="fa fa-arrow-up"></i>

				</button>
			</div>
		</div>
		<div class="col-5th text-center">
			<a href="?mod=event&site=index"><span class="text-big"><i
					class="fa fa-bullhorn text-white mt-1"></i></span></a>
			<p class="mb-1">
				<a href="?mod=event&site=index" class="text-msml text-white">Khuyến
					mãi</a>
			</p>
		</div>
		<div class="col-5th text-center">
			<a href="?mod=account&site=index"><span class="text-big"><i
					class="fa fa-user text-white mt-1"></i></span></a>
			<p class="mb-1">
				<a href="?mod=account&site=index" class="text-msml text-white">Tài
					khoản</a>
			</p>
		</div>
	</div>
</section>
<script>
	$(document).ready(function() {
		$('.back_to_top_mobile button').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 500);
		});
	});
</script>

<div id="Slider" class="d-block d-sm-none">
    <div class="slider-bg"></div>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				{foreach from=$a_slider key=k item=data}
				<li data-target="#carouselExampleIndicators" data-slide-to="{$k}"
					{if $k eq 0}class="active"{/if}>{/foreach}
			</ol>
			<div class="carousel-inner h-100">
				{foreach from=$a_slider key=k item=data}
				<div class="carousel-item h-100 {if $k eq 0}active{/if}">
					<a href="{$data.alias}"><img class="d-block w-100"
						src="{$data.image}"></a>
				</div>
				{/foreach}
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span class="text-danger">
					<i class="fa fa-angle-left text-white"></i>
			</span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span class=""> <i
					class="fa fa-angle-right text-white"></i>
			</span> <span class="sr-only">Next</span>
			</a>
	</div>
</div>
<div class="main-home d-block d-sm-none">
     <div class="main-category mb-3">
		<ul class="row list-inline">
			<li class="col-3 text-center"><a href="javascript:void(0)" onclick="showAllCategory();"> <span style="background: #1892de">
						<i class="fa fa-bars"></i>
				</span>
			</a>
				<div class="">
					<a href="javascript:void(0)" class="link-black">Tất cả<br>danh
						mục
					</a>
				</div></li>
			<li class="col-3 text-center">
				<div class="">
					<a href="/event/"><span style="background: #fcd541"><i class="fa fa-gift fa-fw"></i>
					</span></a>
				</div>
				<div class="">
					<a href="/event/" class="link-black">Ưu đãi<br>từ
						đối tác
					</a>
				</div>
			</li>
			<li class="col-3 text-center">
				<div class="">
					<span style="background: #ff7210"> <i class="fa fa-bullhorn"></i></span>
				</div>
				<div class="">
					<a href="sourcing/" class="link-black">Yêu cầu<br>báo
						giá
					</a>
				</div>
			</li>
			<li class="col-3 text-center">
				<div class="">
					<a href="/store/finder"><span style="background: #3cb9e9"><i class="fa fa-map-marker" aria-hidden="true"></i></span></a>
				</div>
				<div class="">
					<a href="/store/finder" class="link-black">Bản đồ<br>nhà cung cấp
					</a>
				</div>
			</li>
		</ul>
	</div>
	<!-- 
	<div class="mhead_menu pt-3 bg-white">
	  <div class="container">
	<div class="row">
		<div class="col-5th">
				<div class="menu_item text-center" onclick="showAllCategory();">
					<img src="{$arg.stylesheet}images/icons/menu_home.png"
						class="ico_bubble img-fluid p-1">
					<p>
						<a href="javascript:void(0)" class="text-oneline">Danh mục</a>
					</p>
				</div>
		</div>
		
		{foreach from=$a_menu_main name=check_pn item=data}
			<div class="col-5th">
				<div class="menu_item text-center">
					<a href="{$data.url}"><img src="{$data.image}"
						class="ico_bubble img-fluid p-1"></a>
					<p>
						<a href="{$data.url}" class="text-oneline">{$data.name}</a>
					</p>
				</div>
			</div>
			{/foreach}
		</div>
	</div> -->
	<!-- 
	<div class="mhead_menu mt-3">
		<div class="owl-carousel owl-menu">
			{foreach from=$a_menu_main name=check_pn item=data} {if
			$smarty.foreach.check_pn.iteration mod 2 eq 1}
			<div class="nav-item">
				{/if}
				<div class="text-center px-2">
					<div class="mhead_menu_item">
						<a href="{$data.url}"><img src="{$data.image}"
							class="ico_bubble img-fluid"></a>
					</div>
					<p>
						<a href="{$data.url}" class="text-oneline">{$data.name}</a>
					</p>
				</div>
				{if $smarty.foreach.check_pn.iteration mod 2 eq 0 or
				$smarty.foreach.check_pn.iteration eq count($a_menu_main)}
			</div>
			{/if} {/foreach}
		</div>
	</div> -->
</div>
<!-- 
<script>
$('.owl-menu').owlCarousel({
	 loop:false,
    margin:0,
    nav:false,
    dots:false,
    autoplay: false,
    responsive:{
   	    0:{
   	        items:4,
   	    }
    }
  });
</script>
-->
{foreach from=$a_ad.admhome key=k item=data}
  {if $k eq 0}
	{if $data.image neq $arg.noimg}
		<div class="main-adhome mb-3 bg-white">
			<a href="{$data.alias}"><img
				src="{$data.image}" class="img-fluid "
				alt="{$data.url}"></a>
		</div>
	{/if}
  {/if}
{/foreach}
<div class="main-category-hot mb-2">
	<h3 class="p-2 text-left">Nhà cung cấp tiêu biểu</h3>
	<ul class="list-inline owl-carousel owl-theme slider_brand">
		{foreach from=$a_home_toplogo name=check_pn item =data} {if
		$smarty.foreach.check_pn.iteration mod 3 eq 1}
		<li class="nav-item">{/if} <a href="{$data.url}"><img class=""
				src="{$data.logo_custom}"></a> {if
			$smarty.foreach.check_pn.iteration mod 3 eq 0 or
			$smarty.foreach.check_pn.iteration eq count($a_home_toplogo)}
		</li> {/if} {/foreach}
	</ul>
	<div class="clearfix"></div>
</div>

<!--  Danh mục 
<div class="main-category-hot mb-2">
	<h3 class="p-2 text-left ">Tìm kiếm sản phẩm theo danh mục</h3>
	<div class="list-inline owl-carousel owl-theme slider_cate_all">
		{foreach from=$a_home_category item = data}
		<div class="item card rounded-0">
			<div class="card-header p-2 bg-white">
				<i class="fa {$data.icon} fa-fw"></i>&nbsp;{$data.name}
			</div>
			<ul class="list-unstyled p-0 m-0">
				{foreach from=$data.sub key=k item=sub} {if $k < 4}
				<li class="media p-1"><a href="{$sub.url}"><img
						src="{$sub.image}" class="mx-3 " alt="{$sub.name}"></a>
					<div class="media-body align-self-center">
						<a href="{$sub.url}">{$sub.name}</a>
					</div></li> {/if} {/foreach}
			</ul>
		</div>
		{/foreach}

	</div>
	<div class="clearfix"></div>
</div>
<!-- End Danh mục -->

{foreach from=$a_ad.admhome key=k item=data}
  {if $k eq 1}
	{if $data.image neq $arg.noimg}
		<div class="main-adhome mt-3 mb-3">
			<a href="{$data.alias}"><img
				src="{$data.image}" class="img-fluid "
				alt="{$data.url}"></a>
		</div>
	{/if}
  {/if}
{/foreach}
<div class="main-category-hot mb-2">
	<h3 class="p-3 text-center ">Sản phẩm showcase</h3>
	<ul class="list-inline owl-carousel owl-theme slider_cate_hot">
		{foreach from = $a_home_category item = data}
		<li><a href="?mod=product&site=mainproduct&id={$data.id}"
			><img src="{$data.image}"
				></a>
			<p class="text-left">{$data.name}
			</h3></li> {/foreach}
	</ul>
	<div class="clearfix"></div>
</div>
<div class="main-category-hot mb-2">
	<h3 class="p-3 text-left ">Chương trình khuyến mãi</h3>
	<ul class="list-inline owl-carousel owl-theme slider_prod_hot">
		{foreach from = $event item = data}
		<li><a href="{$data.url}"><img src="{$data.avatar}"
				class="img-fluid "></a>
			<p class="text-center">{$data.name}</p>
			</li> {/foreach}
	</ul>
	<div class="clearfix"></div>
</div>
	
{foreach from=$a_ad.admhome key=k item=data}
  {if $k eq 2}
	{if $data.image neq $arg.noimg}
		<div class="main-adhome mt-3 mb-3">
			<a href="{$data.alias}"><img
				src="{$data.image}" class="img-fluid "
				alt="{$data.url}"></a>
		</div>
	{/if}
  {/if}
{/foreach}
<!-- 
	<div class="main-category-hot mb-2">
		<h3 class="p-3 text-center ">Dịch vụ tiện ích</h3>
		<div class="list-inline owl-carousel owl-theme slider_prod_hot">
			{foreach from=$a_post_service item=data}
			<div class="item item-prod">
				<a href="{$data.description}"><img class="card-img-top "
					src="{$data.avatar}" alt="{$data.name}"></a>
				<div class="card-body px-0">
					<h3 class="card-title font-weight-bold text-center">
						<a href="{$data.description}">{$data.name}</a>
					</h3>
				</div>
			</div>
			{/foreach}
		</div>
		<div class="clearfix"></div>
	</div>
 -->
<!-- 
	<div class="main-category-hot mb-2">
		<h3 class="p-3 text-center ">Tìm theo khu vực</h3>
		<div class="list-inline owl-carousel owl-theme slider_nation">
			{foreach from = $locations item = data}
			<div class="item item-prod">
				<div class="card-body px-0">
					<h3 class="card-title font-weight-bold text-center">
						<a href="javascript:void(0)" onclick="SetLocationMobile({$data.Id})">{$data.Name}</a>
					</h3>
				</div>
			</div>
			{/foreach}
		</div>
		<div class="clearfix"></div>
	</div>
 -->
	<div class="main-category-hot mb-2">
		<h3 class="p-3 text-left ">Sản phẩm gợi ý cho bạn</h3>
		<div class="product">
			<div class="load_product_recommen"></div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<div id="mobi-category"></div>


{literal}

<script type="text/javascript">
	function showAllCategory(parent_id) {
		if (parent_id == -1) {
			$("#mobi-category").hide();
			return false;
		}
		loading();
		$("#mobi-category").load('?mod=home&site=load_category', {
			'parent_id' : parent_id
		}, function() {
			$("#mobi-category").show();
			endloading();
		});
	}
</script>
{/literal} {/if}{if $out.popup.image neq $arg.noimg}
<div class="modal fade" id="PopupHome" role="dialog">
	<div class="modal-dialog">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<div class="content-popuphome1">
			<a href="{$out.popup.alias}" target="_blank" class=""><img
				src="{$out.popup.image}" class="img-fluid""></a>
		</div>
	</div>
</div>
{/if}

{if $out.location eq 0}
<!-- Modal -->
<div class="modal fade" id="PopupLocation" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center w-100" id="exampleModalCenterTitle"><i class="fa fa-map-marker text-danger fa-fw"></i>CHỌN KHU VỰC GẦN BẠN NHẤT</h5>
      </div>
      <div class="modal-body">
      <p>Hãy chọn tỉnh thành của bạn. Bạn có thể thay đổi tỉnh thành tại đầu trang.</p>
     <select class="form-control" id="Location_popup" name="">
		{$s_location}
	</select> 
    </div>
    <div class="modal-footer border-0 pt-0">
       <button type="button" class="btn btn-primary btn-block" onclick="SetLocation('popup')">Đồng ý</button> 
    </div>
    </div>
  </div>
</div>
{/if}
<script> 
	$(document).ready(function() {
		setTimeout(function() {
			$("#PopupHome").modal({
				show : true
			});
		}, 1000);
		/*setTimeout(function() {
		$("#PopupLocation").modal({
			show : true,
			//backdrop: 'static',
			//keyboard: false  // to prevent closing with Esc button (if you want this too)
		});
		},10000);*/
	});
</script>

