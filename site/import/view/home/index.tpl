{literal}
<style>
.owl-stage {
	padding-left: 0 !important;
}
</style>
{/literal}
<section class="content-product-list py-0" id="product-list">
	<div class="container px-2">
		<div class="breadcrumbs text-nm text-msm my-2">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb mx-sm-0 my-auto">
					<li class="breadcrumb-item"><a href="./"><i
							class="fa fa-home"></i> Trang chủ</a></li> 
					<li class="breadcrumb-item"><a href="{$data.url}">Sản phẩm nhập khẩu</a></li>
				</ol>
			</nav>
		</div>
		<div>
			<div class="ads-product bg-white mb-3 p-3">
				<div class="owl-carousel owl-theme owl-ranking">
					{foreach from=$result item=data}
					<div class="product-item">
						<a href="{$data.url}"><img src="{$data.avatar}"></a>
						<h3 class="text-twoline">
							<a href="{$data.url}" class="text-dark">{$data.name}</a>
						</h3>
					</div>
					{/foreach}
				</div>
			</div>
			<div class="row row-sm">
			{foreach from=$result key=k item=data}	
				<div class="col-md-6">
					<div class="list-view">
						<div class="row row-sm" id="grid_view_mobile">
							<div class="col-sm-12">
								<div class="frame-prod-card">
									<div class="card mb-2 mt-0 m-border-0">
										<div class="card-body p-sm-2 p-1">
											<div class="image-product">
												<div class="prod-img">
													<a href="{$data.url}"><img class="card-img-top p-1"
														src="{$data.avatar}" alt="{$data.name}"></a>
												</div>
											</div>
											<div class="infor-prod">
												<h3 class="card-title mb-sm-1 mb-0">
													<a href="{$data.url}" class="text-twoline text-nm-2"
														title="">{$data.name}</a>
												</h3>
												<p
													class="price my-sm-1 mt-0 mb-sm-1 mb-0 text-nm-1 text-msm text-oneline ">
													<a href="" class="pl-3">Get Latest Price</a>
												</p>
											</div>
											<div class="information-company">
												<div class="credit-reports ">
													<div class="row no-gutters-custom">
														<div class="col-sm-12 col-12">
															<p class="mb-sm-1 mb-0 text-uppercase ">
																<a href="{$data.url_page}" class="text-msm text-nm-1 text-dark"><b>{$data.page_name}</b></a>
															</p>
															<p class="address mb-sm-0 mb-1">
																<i class="fa fa-map-marker-alt"></i>
															</p>
														</div>
													</div>
												</div>
												<div class="send-inquiry pt-sm-3 d-sm-block d-none">
													<a href="tel:{$option.contact.phone}" class="btn btn-block btn-call text-nm"><i
														class="fa fa-phone fa-fw"></i>Gọi ngay</a> <a href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
														class="btn btn-primary btn-block btn-contact text-sm">Liên hệ nhà bán<span class="d-block text-sm">Yêu cầu báo
															giá</span>
													</a>
												</div>
											</div>
										</div>
										<!-- contact on mobile -->
										<div class="send-inquiry py-2 text-center d-sm-none">
											<a href="tel:{$option.contact.phone}"
												class="btn btn-primary btn-sm-call rounded-pill w-45 mx-1"><i
												class="fa fa-phone fa-fw"></i>Call Now</a> <a href="?mod=page&site=contact&page_id={$data.page_id}&product_id={$data.id}"
												class="btn btn-primary rounded-pill btn-sm-contact w-45 mx-1">Contact
												Supplier </a>
										</div>
										<!-- end contact on mobile -->
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				{if $k eq 5}
				<div class="col-sm-4">
					<div class="card mb-2 mt-0 border-0 form-contact">
						<div class="d-flex">
							<div class="col-4 px-2 info-left d-flex align-items-center">
								<ul class="nav flex-column timeline">
									<li class="nav-item"><a class="nav-link py-0 pr-0"
										href="#">Hãy cho chúng tôi những gì bạn cần</a></li>
									<li class="nav-item"><a class="nav-link py-0 pr-0"
										href="#">Nhận chi tiết người bá</a></li>
									<li class="nav-item"><a class="nav-link py-0 pr-0"
										href="#">Thỏa thuận hợp tác</a></li>
								</ul>
							</div>
							
							<div class="col-8 px-2 info-right">
								<form class="p-3">
									<h3>Tiết kiệm thời gian! Nhận người bán xác minh cho
										chương trình</h3>
									<div class="form-group">
										<label for="exampleInputEmail1">Email</label> <input
											type="email" class="form-control form-control-sm"
											placeholder="Nhập email của bạn"> <small
											id="emailHelp" class="form-text text-muted">Người bán
											sẽ liên lạc với bạn qua email này.</small>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Tên liên lạc</label> <input
											type="text" class="form-control form-control-sm"
											placeholder="Nhập tên của bạn">
									</div>
									<button type="submit" class="btn btn-primary btn-sm btn-rfq">Yêu
										cầu gửi</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				{foreach from=$a_slider key=h item=data}
				<div class="col-sm-4 mb-2 d-flex align-items-center">
					<a href="{$data.url}"><img src="{$data.image}" class="img-fluid"></a>
				</div>
				{/foreach}
				{/if} {/foreach}
				<div class="text-nm p-2 w-100">{$paging}</div>
			</div>
		</div>
	</div>
</section>

