<ul class="nav nav-mobile nav-pills mb-2 py-1 bg-white" id="pills-tab"
	role="tablist">
	<li class="nav-item text-center d-inline-block"><a
		class="nav-link p-0 rounded-0 text-uppercase text-muted text-center active"
		id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
		aria-controls="pills-home" aria-selected="true"> <i
			class="icon-10 iicon"></i> <span class="d-block">TRANG CHỦ</span>
	</a></li>
	<li class="nav-item text-center d-inline-block"><a
		class="nav-link p-0 rounded-0 text-uppercase text-muted text-center"
		id="pills-profile-tab" data-toggle="pill" href="#pills-profile"
		role="tab" aria-controls="pills-profile" aria-selected="false"> <i
			class="icon-11 iicon"></i> <span class="d-block">SẢN PHẨM</span>
	</a></li>
	<li class="nav-item text-center d-inline-block"><a
		class="nav-link p-0 rounded-0 text-uppercase text-muted text-center"
		id="pills-contact-tab" data-toggle="pill" href="#pills-contact"
		role="tab" aria-controls="pills-contact" aria-selected="false"> <i
			class="icon-12 iicon"></i> <span class="d-block">HỒ SƠ</span>
	</a></li>
</ul>
<div class="tab-content" id="pills-tabContent">
	<div class="tab-pane fade show active" id="pills-home" role="tabpanel"
		aria-labelledby="pills-home-tab">
		<section>
			<div class="container">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						{foreach from=$a_home_sliders_show key=k item=img}
						<li data-target="#carouselExampleIndicators" data-slide-to="{$k}"
							{if $k eq 0}class="active"{/if}></li> {/foreach}
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
		</section>
		<section id="S-13" class="d-block d-lg-none mb-3 bg-white">
			<div class="container">
				<div class="row">
					<div class="title fz-22 border-0 px-3 py-1 col-12 text-center py-2">
						Danh mục chính</div>
					<div class="col-3 text-center pr-0">
						<span class="d-inline-block rounded-circle border text-center">
							<img src="{$arg.stylesheet}images/ic-18.png">
						</span> <span class="d-block fz-13">Tất cả các danh mục</span>
					</div>
					<div class="col-9 text-center">
						<div class="owl-carousel owl-theme">
							{foreach from=$a_main_product_category item=data}
							<div class="item">
								<span class="d-inline-block rounded-circle border text-center">
									<img src="{$data.image}">
								</span> <span class="name d-block fz-13">{$data.name}</span>
							</div>
							{/foreach}

						</div>
						<script type="text/javascript">
							$('.owl-carousel').owlCarousel({
								loop : true,
								margin : 10,
								nav : false,
								dots : false,
								responsive : {
									0 : {
										items : 3
									},
									600 : {
										items : 3
									},
									1000 : {
										items : 5
									}
								}
							})
						</script>
					</div>
				</div>
			</div>
		</section>
		{if $a_home_product_main}
		<section id="S-2" class="S-2 bg-white mt-3">
			<div class="container">
				<div class="title fz-22 border border-bottom-0 px-3 py-1 ">Sản
					phẩm Showcase</div>
				<div class="row m-0 border border-bottom-0 border-right-0">
					{foreach from=$a_home_product_main item=data}
					<div
						class="col-lg-3 col-6 py-2 px-3 px-lg-5 border-bottom border-right">
						<a href="{$data.url}" class="text-custom-u"> <img
							src="{$data.avatar}" class="w-100">
							<h3 class="fz-12 d-block name pt-3">{$data.name}</h3>
						</a> <span class="fz-12 d-block"> <span
							class="font-weight-bold"> {$data.price}</span>{if $data.price neq
							0}<span class="text-muted">/{$data.unit}</span>{/if}
						</span> <span class="fz-12 d-block"> <span
							class="font-weight-bold">{$data.minorder} {$data.unit}</span> <span
							class="text-muted">(Min. Order)</span>
						</span>
					</div>
					{/foreach}
				</div>
			</div>
		</section>
		{/if}

		<section id="S-14" class="mt-3 pb-5 mb-5 bg-white d-block d-lg-none">
			<div class="container">
				<div class="row row-sm">
					<div class="col-3 py-1">
						<img class="border w-100" src="{$page.logo_img}">
					</div>
					<div class="col-8 py-1 offset-1 align-self-end">
						<span class="d-block">{$page.name}</span>
					</div>
					<div class="col-3 py-1 text-muted">
						<span class="d-block">Điện thoại:</span>
					</div>
					<div class="col-8 py-1 offset-1">
						<span>{if $page.isphone eq 1}{$option.contact.phone}{else}{$page.phone}{/if}</span>
					</div>
					<div class="col-3 py-1 text-muted">
						<span class="d-block">Email:</span>
					</div>
					<div class="col-8 py-1 offset-1">
						<span>{if $page.isphone eq 1}{$option.contact.email}{else}{$page.email}{/if}</span>
					</div>
					<div class="col-3 py-1 text-muted">
						<span class="d-block">Địa chỉ:</span>
					</div>
					<div class="col-8 py-1 offset-1">
						<span>{$page.address}</span>
					</div>
					<div class="col-3 py-1 text-muted">
						<span class="d-block">Tỉnh/Thành phố:</span>
					</div>
					
					<div class="col-8 py-1 offset-1">
						<span>{if $page.nation_id eq 0}{$page.province},Việt Nam{else}{$page.nation}{/if}</span>
					</div>
				</div>
			</div>
		</section>
		{if $a_home_product_new}
		<section id="S-2" class="S-2 bg-white mt-3 d-block d-md-none">
			<div class="container">
				<div class="title fz-22 border border-bottom-0 px-3 py-1 ">Sản phẩm mới</div>
				<div class="row m-0 border border-bottom-0 border-right-0">
					{foreach from=$a_home_product_new key = k item=data}
					<div
						class="col-lg-3 col-6 py-2 px-3 px-lg-5 border-bottom border-right">
						<a href="{$data.url}" class="text-custom-u"> <img
							src="{$data.avatar}" class="w-100">
							<h3 class="fz-12 d-block name pt-3">{$data.name}</h3>
						</a> <span class="fz-12 d-block"> <span
							class="font-weight-bold"> {$data.price}</span>{if $data.price neq
							0}<span class="text-muted">/{$data.unit}</span>{/if}
						</span> <span class="fz-12 d-block"> <span
							class="font-weight-bold">{$data.minorder} {$data.unit}</span> <span
							class="text-muted">(Min. Order)</span>
						</span>
					</div>
					{/foreach}
				</div>
			</div>
		</section>
		{/if}
		<!-- <section id="S-3" class="S-2 mt-3 d-none d-lg-block">
			<div class="container">
				<div class="title fz-22 border border-bottom-0 px-3 py-1">Sản
					phẩm nổi bật</div>
				<div class="row border m-0 border-left-0 border-right-0">
					<div class="col-2 p-0">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							{foreach from = $a_home_category_main key=k item = data} {if
							$k<4} <a
								class="nav-link rounded-0 text-dark fz-12 align-items-center d-flex justify-content-center border-right border-bottom {if $k eq 0}active{/if}"
								id="v-pills-home-tab{$k+1}" data-toggle="pill"
								href="#v-pills-home{$k+1}" role="tab"
								aria-controls="v-pills-home{$k+1}" aria-selected="true">{$data.name}</a>
							{/if} {/foreach}
						</div>
					</div>
					<div class="col-10 p-0 border-right">
						<div class="tab-content" id="v-pills-tabContent">
							{foreach from = $a_home_category_main key=k item = data}
							<div class="tab-pane fade {if $k eq 0}show active{/if}"
								id="v-pills-home{$k+1}" role="tabpanel"
								aria-labelledby="v-pills-home-tab{$k+1}">
								{foreach from = $data.prod item = prod}
								<div class="item d-inline-block">
									<div class="box-item d-flex">
										<a href="{$prod.url}"> <img src="{$prod.avatar}"
											alt="{$prod.name}" width="120">
										</a>
										<div class="ml-2">
											<a href="{$prod.url}"
												class="fz-12 mb-2 d-block text-custom-u"> {$prod.name}</a> <span
												class="fz-12 d-block"> <span class="font-weight-bold">{$prod.price}</span>{if
												$prod.price neq 0} <span class="text-muted">/{$prod.unit}</span>{/if}
											</span> <span class="fz-12 d-block"> <span
												class="font-weight-bold">{$prod.minorder}
													{$prod.unit}</span> <span class="text-muted">(Min. Order)</span>
											</span>
										</div>
									</div>
								</div>
								{/foreach}
							</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</section> -->
		<section id="S-4" class="mt-3 d-none d-lg-block">
			<div class="container">
				<div class="wrapper text-center"
					style="background: url('{$banner}') #ff6a00">
					<div class="mask"></div>
					<div class="box-wrapper">
						<h3>Tại sao chọn chúng tôi</h3>
						<span class="fz-12"> <a href="javascript:void(0)">{$page.description}</a>
						</span>
						<div class="mt-3">
							<button class="btn btn-sm fz-12 active">Được thành lập
								vào năm {$page.date_start|date_format:'%Y'}</button>
							<button class="btn btn-sm fz-12">{$page.number_mem_show}</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="S-5" class="S-5 d-none d-lg-block">
			<div class="container">
				<div class="row">
					<div class="title text-uppercase col-12">GIỚI THIỆU CÔNG TY</div>
					<div class="col-12 text-center py-3 d-flex justify-content-center">
						Xác minh: <span class="ml-2 pr-1"> <i class="coni coni-1"></i>
						</span> <span class="align-self-center"> <a href="" class="fz-12">Đánh
								giá nhà cung cấp</a>
						</span> <span class="ml-2 pr-1"> <i class="coni coni-2"></i>
						</span> <span class="align-self-center"> <a href="" class="fz-12">Kiểm
								tra tại chỗ</a>
						</span>
					</div>
					<div class="col-lg-4 d-flex mb-4">
						<i class="icon icon-1"></i>
						<div class="fz-12 pl-2 align-self-center">
							<span class="d-block font-weight-bold">Địa chỉ</span> <span
								class="d-block">{$page.address} <img
								src="{$arg.stylesheet}images/ic-7.png"></span>
						</div>
					</div>
					<div class="col-lg-4 d-flex mb-4">
						<i class="icon icon-2"></i>
						<div class="fz-12 pl-2 align-self-center">
							<span class="d-block font-weight-bold">Năm thành lập</span> <span
								class="d-block">{$page.date_start|date_format:'%Y'}<img
								src="{$arg.stylesheet}images/ic-7.png"></span>
						</div>
					</div>
					<div class="col-lg-4 d-flex mb-4">
						<i class="icon icon-3"></i>
						<div class="fz-12 pl-2 align-self-center">
							<span class="d-block font-weight-bold">Sản phẩm chính</span> <span
								class="d-block">{$page.mainproducts}<img
								src="{$arg.stylesheet}images/ic-7.png"></span>
						</div>
					</div>
					<div class="col-lg-4 d-flex mb-4">
						<i class="icon icon-4"></i>
						<div class="fz-12 pl-2 align-self-center">
							<span class="d-block font-weight-bold">Thị trường chính</span> <span
								class="d-block">{$page.province}<img
								src="{$arg.stylesheet}images/ic-7.png"></span>
						</div>
					</div>
					<div class="col-lg-4 d-flex mb-4">
						<i class="icon icon-5"></i>
						<div class="fz-12 pl-2 align-self-center">
							<span class="d-block font-weight-bold">Tổng doanh thu hàng
								năm</span> <span class="d-block">{$page.revenue}<img
								src="{$arg.stylesheet}images/ic-7.png"></span>
						</div>
					</div>
					<div class="col-lg-4 d-flex mb-4">
						<i class="icon icon-6"></i>
						<div class="fz-12 pl-2 align-self-center">
							<span class="d-block font-weight-bold">Tổng số nhân viên</span> <span
								class="d-block">{$page.number_mem_show}<img
								src="{$arg.stylesheet}images/ic-7.png"></span>
						</div>
					</div>
					{if $Video.url_youtube neq NULL}
					<div class="col-12 text-center">
						<div class="box-img text-center d-inline-block"
							data-toggle="modal" data-target="#ModalVideo">
							<img src="{$Video.img}" height="150"> <img
								src="{$arg.stylesheet}images/ic-8.png" class="ic-play">
							<div class="video-tip d-flex">
								<i class="coni coni-3"></i> <span class="text-white">&nbsp;Video:
									{$page.name}</span>
							</div>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="ModalVideo" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLongTitle"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="ModalVideoTitle">Video:
											{$page.name}</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="embed-responsive embed-responsive-16by9">
											<iframe src="{$Video.Url}" frameborder="0"
												allow="autoplay; encrypted-media"
												allowfullscreen></iframe>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					{/if}
					<div class="col-12 text-center mt-5">
						<a href="{$a_main_menu.contact}" class="btn btn-custom text-white">
							<i class="fa fa-envelope pr-1"></i>Liên hệ với nhà cung cấp
						</a> <a href="{$a_main_menu.product_list}" class="btn btn-custom-1">Bắt
							đầu đặt hàng</a> <a href="{$a_main_menu.company_information}"
							class="fz-12">Tìm hiểu thêm về chúng tôi ></a>
					</div>
				</div>
			</div>
		</section>
		<!-- 
		<section id="S-6" class="d-none d-lg-block">
			<div class="container bg-light">
				<div class="row">
					<div class="col-lg-4 d-flex">
						<img src="{$arg.stylesheet}images/img-7.png">
						<div class="border text-center">
							<span class="fz-12 font-weight-bold d-block pt-3">Supplier
								Assessment</span> <span class="fz-12 d-block border-top pt-3">Consists
								of three parts and offer verified information.</span>
							<button class="btn btn-custom-2 fz-12 py-1 px-2 mt-3">View
								More</button>
						</div>
					</div>
					<div class="col-lg-4 d-flex">
						<img src="{$arg.stylesheet}images/img-8.png">
						<div class="border text-center">
							<span class="fz-12 font-weight-bold d-block pt-3">Assessment
								Reports</span> <span class="fz-12 d-block border-top pt-3">In-depth
								reports based on site visits.</span>
							<button class="btn btn-custom-2 fz-12 py-1 px-2 mt-3">
								<i class="fa fa-download mr-1"></i>Download
							</button>
						</div>
					</div>
					<div class="col-lg-4 d-flex">
						<img src="{$arg.stylesheet}images/img-9.png">
						<div class="border text-center">
							<span class="fz-12 font-weight-bold d-block pt-3">Verified
								Main Products</span> <span class="fz-12 d-block border-top pt-3">Consists
								of three parts and offer verified information.</span>
							<button class="btn btn-custom-2 fz-12 py-1 px-2 mt-3">
								<i class="fa fa-download mr-1"></i>Download
							</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="S-7" class="S-5 d-none d-lg-block">
			<div class="container">
				<div class="row">
					<div class="title text-uppercase col-12">COMPANY INTRODUCTION</div>
					<div class="owl-carousel owl-theme pt-4">
						<div class="item text-center">
							<div>
								<i class="icon icon-6"></i>
							</div>
							<div class="pt-2">
								<a href="" class="text-custom-u"> <span
									class="name  d-block">R&D Capability</span> <span
									class="fz-12 d-block">ODM Service: Yes</span> <span
									class="fz-12 d-block">Number of R&D Staff 5 - 10 People</span>
								</a>
							</div>
						</div>
						<div class="item text-center">
							<div>
								<i class="icon icon-7"></i>
							</div>
							<div class="pt-2">
								<a href="" class="text-custom-u"> <span
									class="name  d-block">Certifications</span> <span
									class="fz-12 d-block">Certificates : 2</span>
								</a>
							</div>
						</div>
						<div class="item text-center">
							<div>
								<i class="icon icon-8"></i>
							</div>
							<div class="pt-2">
								<a href="" class="text-custom-u"> <span
									class="name  d-block">Production Capability</span> <span
									class="fz-12 d-block">Export Experience 11 years</span> <span
									class="fz-12 d-block">Number of R&D Staff 5 - 10 People</span>
								</a>
							</div>
						</div>
						<div class="item text-center">
							<div>
								<i class="icon icon-9"></i>
							</div>
							<div class="pt-2">
								<a href="" class="text-custom-u"> <span
									class="name  d-block">Trade Capability</span> <span
									class="fz-12 d-block">Export Experience 11 years</span> <span
									class="fz-12 d-block">Number of R&D Staff 5 - 10 People</span>
								</a>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						$('.owl-carousel').owlCarousel({
							loop : true,
							margin : 10,
							nav : true,
							responsive : {
								0 : {
									items : 1
								},
								600 : {
									items : 3
								},
								1000 : {
									items : 4
								}
							}
						})
					</script>
				</div>
			</div>
		</section>-->
		<section id="S-8" class="d-none d-lg-block">
			<div class="container">
				<div class="row m-0" style="background: #ff6a00">
					<div class="col-12 text-center title">
						Hình ảnh công ty, sản phẩm, showroom <img src="{$arg.stylesheet}images/ic-7.png">
					</div>
					<div class="w-100"></div>
					{foreach from=$page.a_image item=data}
					<div class="col-lg-3">
						<div class="list-img list-1"
							style="background-image: url('{$data}')"></div>
					</div>
					{/foreach}
				</div>
			</div>
		</section>
		<section id="S-9" class="S-2 mt-4 d-none d-lg-block">
			<div class="container">
				<div class="title fz-22 border border-bottom-0 px-3 py-1">Đề
					xuất cho bạn</div>
				<div class="row m-0 border border-bottom-0 border-right-0">
					{foreach from=$a_home_product_new key = k item=data}
					<div
						class="col-lg-3 col-6 py-2 px-3 px-lg-5 border-bottom border-right">
						<a href="{$data.url}" class="text-custom-u"> <img
							src="{$data.avatar}" class="w-100">
							<h3 class="fz-12 d-block name pt-3">{$data.name}</h3>
						</a> <span class="fz-12 d-block"> <span
							class="font-weight-bold"> {$data.price}</span>{if $data.price neq
							0}<span class="text-muted">/{$data.unit}</span>{/if}
						</span> <span class="fz-12 d-block"> <span
							class="font-weight-bold">{$data.minorder} {$data.unit}</span> <span
							class="text-muted">(Min. Order)</span>
						</span> <a href="{$data.url}"
							class="btn btn-custom-2 w-100 rounded-0 mt-4"> Xem chi tiết </a>
					</div>
					{/foreach}
				</div>
			</div>
		</section>
	</div>
	<div class="tab-pane fade" id="pills-profile" role="tabpanel"
		aria-labelledby="pills-profile-tab">
		<section class="S-2 bg-white">
			<div class="container">
				<div class="row m-0 border border-bottom-0 border-right-0">
					{foreach from=$a_home_product_new item=data}
					<div
						class="col-lg-3 col-6 py-2 px-3 px-lg-5 border-bottom border-right">
						<a href="{$data.url}" class="text-custom-u"> <img
							src="{$data.avatar}" class="w-100"> <span
							class="fz-12 d-block name pb-2">{$data.name}</span>
						</a> <span class="fz-12 d-block"> <span
							class="font-weight-bold"> {$data.price}</span> {if $data.price
							neq 0}<span class="text-muted">/{$data.unit}</span>{/if}
						</span> <span class="fz-12 d-block"> <span
							class="font-weight-bold">{$data.minorder} {$data.unit}</span> <span
							class="text-muted"></span>
						</span>
					</div>
					{/foreach}
					<div class="col-12 pb-5 mb-3 text-center">
						<a href="{$a_main_menu.product_list}"
							class="text-uppercase py-3 d-block text-warning">Xem tất cả</a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div class="tab-pane fade " id="pills-contact" role="tabpanel"
		aria-labelledby="pills-contact-tab">
		<section class="mt-3 bg-white">
			<div class="container">
				<div class="row row-sm py-3">
					<div class="col-3 py-1 text-muted">
						<span class="d-block">Điện thoại:</span>
					</div>
					<div class="col-8 py-1 offset-1">
						<span>{if $page.isphone eq 1}{$option.contact.phone}{else}{$page.phone}{/if}</span>
					</div>
					<div class="col-3 py-1 text-muted">
						<span class="d-block">Email:</span>
					</div>
					<div class="col-8 py-1 offset-1">
						<span>{if $page.isphone eq 1}{$option.contact.email}{else}{$page.email}{/if}</span>
					</div>
					<div class="col-3 py-1 text-muted">
						<span class="d-block">Website:</span>
					</div>
					<div class="col-8 py-1 offset-1">
						<a href="{$page.website}">{$page.website}</a>
					</div>
					<div class="col-3 py-1 text-muted">
						<span class="d-block">Địa chỉ:</span>
					</div>
					<div class="col-8 py-1 offset-1">
						<span>{$page.address}</span>
					</div>

					<div class="col-3 py-1 text-muted">
						<span class="d-block">Quốc gia/Vùng:</span>
					</div>
					<div class="col-8 py-1 offset-1">
						<span>Việt Nam</span>
					</div>
				</div>
			</div>
		</section>
		<section class="S-2 mt-3 bg-white">
			<div class="container p-0">
				<div class="title fz-22 border border-bottom-0 px-3 py-1 text-muted">
					Giới thiệu</div>
				<div class="border p-3">{$page.description}</div>
			</div>
		</section>
	</div>
</div>
<div class="p-3 d-block d-md-none" id="A-222">
	<a href="{$page.page_contact}" class="btn btn-custom-1 fz-14 mr-1">GỬI
		LIÊN HỆ</a> <a href="tel:{if $page.isphone eq 1}{$option.contact.phone}{else}{$page.phone}{/if}"
		class="btn btn-custom text-white fz-14">GỌI NGAY</a>
</div>
<script>
	$(document).ready(function() {
		$("a[href='#top']").click(function() {
			$("html, body").animate({
				scrollTop : 0
			}, "slow");
			return false;
		});
	});
</script>