<div {if $is_mobile}class="bg-white"{/if}>
	<div class="slider">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				{foreach from=$a_slider key=k item=data}
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="{if $k eq 0}active{/if}"></li> {/foreach}
			</ol>
			<div class="carousel-inner">
				{foreach from=$a_slider key=k item=data}
				<div class="carousel-item {if $k eq 0}active{/if}">
					<img class="d-block w-100" src="{$data.image}">
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
		<div class="container-small">
			<div class="row">
				<div class="col-xl-4 col-md-3 align-self-center d-none d-sm-block">
					<img
						src="{$arg.stylesheet}images/logo-evietbuild.png"
						height="35px">
				</div>
				<div class="col-xl-8 col-md-9 align-self-center d-none d-sm-block">
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
	<!-- 
	<div class="d-block d-sm-none">
		<img
			src="https://laz-img-cdn.alicdn.com/images/ims-web/TB1jvKHaMaH3KVjSZFpXXbhKpXa.gif"
			class="img-fluid">
	</div>
	 -->
	<div class="">
		<div class="container-small">
			<h2 class="text-center my-3 text-mbig d-sm-block d-none text-danger">KHUYẾN MÃI TỪ EVIETBUILD</h2>
			<div class="row row-sm">
				{foreach from=$a_ad.adhome item=data}
				<div class="col-4 mb-2 d-none d-sm-block">
					<a href="{$data.alias}" target="_blank"><img src="{$data.image}" class="img-fluid rounded"
						alt="{$data.image}"></a>
				</div>
				{/foreach} {foreach from=$a_ad.admhome item=data}
				<div class="col-12 mb-2 d-block d-sm-none">
					<a href="{$data.alias}"><img src="{$data.image}" class="img-fluid rounded"
						alt="{$data.image}"></a>
				</div>
				{/foreach}
			</div>
			<div class="bg_event_feature py-3">
				<h2 class="text-center my-3 text-mbig d-sm-block d-none text-danger">SỰ KIỆN EVIETBUILD</h2>
				{foreach from=$result key=k item=data} {if $k % 2 eq 0}
				<div class="bg-transparent" id="event_feature">
					<div class="row row-no mb-3">
						<div class="col-sm-6 shadow-sm">
							<a href="{$data.url}"><img class="img-fluid w-100 h-100"
								src="{$data.avatar}" class="card-img-top"></a>
						</div>
						<div class="col-sm-6 shadow-sm">
							<div class="card rounded-0 border-0 h-100">
								<div class="px-3 py-3">
									<h5 class="card-title mb-1 text-b">
										<a href="{$data.url}" class="red">{$data.title}</a>
									</h5>
									<p class="card-text text-nm mb-1">{$data.description}</p>
									<p class="card-text text-nm mt-1 text-danger mb-1">
										<i class="far fa-calendar-check fa-fw"></i>
										{$data.time_start|date_format:'%d/%m/%Y'} -
										{$data.time_finish|date_format:'%d/%m/%Y'}
									</p>
									<p class="card-text text-nm mb-1">
										<i class="fas fa-map-marker-alt fa-fw"></i> {$data.category}
									</p>
									<div class="ml-0 mr-5">
										<div id="countdown" class="countdown-custom"
											data-date="{$data.time_finish|date_format:'%Y-%m-%d %H:%M:%S'}"></div>
									</div>
									<a href="{$data.url}" class="text-primary text-nm">Xem chi tiết <i
										class="fa fa-angle-right text-nm"></i></a>
								</div>
							</div>
						</div>
					</div>
					{/if} {if $k % 2 eq 1}
					<div class="bg-transparent" id="event_feature">
						<div class="row row-no mb-3">
							<div class="col-sm-6 shadow-sm">
								<div class="card rounded-0 border-0 h-100">
									<div class="px-3 py-3">
										<h5 class="card-title mb-1 text-b">
											<a href="{$data.url}" class="red">{$data.title}</a>
										</h5>
										<p class="card-text text-nm mb-1">{$data.description}</p>
										<p class="card-text text-nm mt-1 text-danger mb-1">
											<i class="far fa-calendar-check fa-fw"></i>
											{$data.time_start|date_format:'%d/%m/%Y'} -
											{$data.time_finish|date_format:'%d/%m/%Y'}
										</p>
										<p class="card-text text-nm mb-1">
											<i class="fas fa-map-marker-alt fa-fw"></i> {$data.category}
										</p>
										<div class="ml-0 mr-5">
											<div id="countdown" class="countdown-custom"
												data-date="{$data.time_start|date_format:'%Y-%m-%d %H:%M:%S'}"></div>
										</div>
										<a href="#" class="text-primary text-nm">Xem chi tiết <i
											class="fa fa-angle-right text-nm"></i></a>
									</div>
								</div>
							</div>
							<div class="col-sm-6 shadow-sm">
								<a href="{$data.url}"><img class="img-fluid w-100 h-100"
									src="{$data.avatar}" class="card-img-top"></a>
							</div>
						</div>
						{/if} {/foreach}
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
				var post_id = $("#post_id").val();
				function LoadMore(tax_id) {
					loading();
					page = page + 1;
					limit = 2;
					number = page * limit;
					console.log(number);
					console.log(all_page);
					$.post('?mod=home&site=ajax_loadmore_page', {
						'page' : page,
						'tax_id' : tax_id,
						'post_id' : post_id
					}).done(function(e) {
						if (number > all_page) {
							$("#LoadMore").hide();
							$("#showalert").removeClass("hide");
							$("#loadPage" + tax_id).append(e);
						} else {
							$("#loadPage" + tax_id).append(e);
						}
						endloading();
					});
				}
			</script>
			<script>
				function LoadPage(tax_id) {
					var post_id = $("#post_id").val();
					console.log(post_id);
					$("#loadPage" + tax_id).load(
							'?mod=home&site=ajax_load_page_tax&tax_id='
									+ tax_id + '&post_id=' + post_id,
							function() {
							});
				}
			</script>
			{/literal}
			<script type="text/javascript">
				$(window).resize(function() {
					$(".countdown-custom").TimeCircles().rebuild();
				});
				$(".countdown-custom").TimeCircles({
					"animation" : "smooth",
					"bg_width" : 0.5,
					"fg_width" : 0.011333333333333334,
					"circle_bg_color" : "#60686F",
					"time" : {
						"Days" : {
							"text" : "Ngày",
							"color" : "#FFCC66",
							"show" : true
						},
						"Hours" : {
							"text" : "Giờ",
							"color" : "#99CCFF",
							"show" : true
						},
						"Minutes" : {
							"text" : "Phút",
							"color" : "#BBFFBB",
							"show" : true
						},
						"Seconds" : {
							"text" : "Giây",
							"color" : "#FF9999",
							"show" : true
						}
					}
				});
			</script>