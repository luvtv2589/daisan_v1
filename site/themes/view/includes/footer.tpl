<footer id="footer">
	<div class="foot-main pt-2">
		<div class="container-small">
			<div class="row row-sm">
				{foreach from=$a_menu_foot item=data}
				<div class="col-5th col-sm-5th">
					<ul>
						<li><a href="{$data.url}">{$data.name}</a></li> {foreach
						from=$data.submenu item=sub1}
						<li><a href="{$sub1.url}">{$sub1.name}</a></li> {/foreach}
					</ul>
				</div>
				{/foreach}
			</div>
		</div>
	</div>
	<!-- <div class="footer-sociality clearfix">
		<div class="container">
			<div class="row">
				<div class="footer-col app col-12 col-lg-4 d-none d-md-block">
					<span>Download:</span> <a href="" class="ios"></a> <a href=""
						class="android"></a>
				</div>
				<div class="footer-col atm col-12 col-lg-4 d-none d-md-block">
					<span>CÔNG TY ĐẠI SÀN - DAISAN.,JSC</span>
				</div>
				<div class="footer-col share col-12 col-lg-4">
					<span>Liên kết:</span> <a href="{$option.link.youtube}" class="fb"></a>
					<a href="{$option.link.twitter}" class="tw"></a> <a
						href="{$option.link.facebook}" class="yt"></a> <a
						href="{$option.link.google}" class="in"></a>
				</div>
			</div>
		</div>
	</div> -->
	<div class="footer-seo p-2">
		<div class="container-small">
			<!-- <p class="footer-seo-language">
				<i class="fa fa-globe" aria-hidden="true"></i> DaisanGroup: <a
					href="http://daisan.com.vn" target="_blank"> Daisan.com.vn</a> <a
					href="http://daisanplus.com" target="_blank">Daisanplus.com</a> - <a
					href="http://thegioioplat.com" target="_blank">Thegioioplat.com</a>
				- <a href="http://duantoanquoc.com" target="_blank">Duantoanquoc.com</a>
				- <a href="http://daisanexpress.com" target="_blank">Daisanexpress.com</a>
				- <a href="http://mosaicthanglong.com" target="_blank">Mosaicthanglong.com</a>
				- <a href="#">Saigonmosaic.com</a> - <a href="#">Gachinax.com.vn</a>
				- <a href="#">Daisaninax.com</a> - <a href="#">Daisannews.com</a>
			</p>-->
			<div class="row row-sm">
				<div class="col-xl-6">{$option.contact.description}</div>
				<div class="col-xl-6">
					<p>
						<strong>© 2009 DAISAN.</strong> Công Ty Cổ phần Xây dựng SX & TM
						Đại Sàn. GPĐKKD: 0103884103 do sở KH &amp; ĐT TP Hà Nội cấp lần
						đầu ngày 29/06/2009.
					</p>
					<p>Trụ sở chính: Số 10, ngõ 1194, đường Láng, P. Láng Thượng,
						Q. Đống Đa, Tp. Hà Nội.</p>
					<p>
						<a href="http://online.gov.vn/Home/WebDetails/54203"><img
							src="{$arg.stylesheet}images/dang-ky-bo-cong-thuong-daisan.png"></a>
					</p>
					<p>
						<a href="http://online.gov.vn/Home/WebDetails/54203"><img
							src="{$arg.stylesheet}images/da-thong-bao-bo-cong-thuong-daisan.png"
							height="45"></a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="foot-link pt-4">
		<div class="container-small">
			<div class="card-columns">
				<ul class="list-unstyled">
					<li><a href="" target="_blank">DAISAN</a></li>
					<li><a href="http://daisangroup.vn/" target="_blank">www.daisangroup.vn</a></li>
					<li><a href="http://daisan.com.vn/" target="_blank">www.daisan.com.vn</a></li>
					<li><a href="http://thegioioplat.com/" target="_blank">www.thegioioplat.com</a></li>
					<li><a href="http://daisanexpress.com/" target="_blank">www.daisanexpress.com</a></li>
					<li><a href="https://daisanexport.com/" target="_blank">www.daisanexport.com</a></li>
					<li><a href="https://daisanmart.com/" target="_blank">www.daisanmart.com</a></li>
				</ul>
				<ul class="list-unstyled">
					<li><a href="" target="_blank">Tìm kiếm nâng cao</a></li>
					<li><a href="http://daisanplus.com/" target="_blank">www.daisanplus.com</a></li>
					<li><a href="http://daisanplus.net/" target="_blank">www.daisanplus.net</a></li>
				</ul>
				<ul class="list-unstyled">
					<li><a href="http://gachbong.daisan.com.vn/" target="_blank">Gạch
							Bông</a></li>

					<li><a
						href="https://daisan.vn/product?k=g%E1%BA%A1ch+b%C3%B4ng&t=0"
						target="_blank">www.phanphoigachbong.com</a></li>
					<li><a href="http://thegioigachbong.com/" target="_blank">www.thegioigachbong.com</a></li>
				</ul>
				<ul class="list-unstyled">
					<li><a href="" target="_blank">Mosaic</a></li>
					<li><a href="http://mosaicthanglong.com/" target="_blank">www.mosaicthanglong.com</a></li>
					<li><a href="http://mosaic.daisan.vn/" target="_blank">www.mosaic.daisan.vn</a></li>
					<li><a href="https://daisan.vn/product?k=mosaic&t=0"
						target="_blank">www.daisanmosaic.com</a></li>
					<li><a href="http://mosaicthanglong.com/" target="_blank">www.thanglongmosaic.com</a></li>
					<li><a href="https://daisan.vn/product?k=mosaic&t=0"
						target="_blank">www.vinamosaic.net</a></li>
					<li><a href="https://daisan.vn/product?k=mosaic&t=0"
						target="_blank">www.vietnammosaic.com</a></li>
					<li><a href="https://daisan.vn/product?k=mosaic&t=0"
						target="_blank">www.saigonmosaic.net</a></li>
					<li><a href="https://daisan.vn/product?k=mosaic&t=0"
						target="_blank">www.vietmosaic.net</a></li>
				</ul>
				<ul class="list-unstyled">
					<li><a href="" target="_blank">INAX</a></li>
					<li><a href="http://gachinax.com.vn/" target="_blank">www.gachinax.com.vn</a></li>
				</ul>
				<ul class="list-unstyled">
					<li><a href="" target="_blank">PRIME</a></li>
					<li><a href="http://gachprime.vn/" target="_blank">www.gachprime.vn</a></li>
				</ul>
				<ul class="list-unstyled">
					<li><a href="" target="_blank">Dự báo 360</a></li>
					<li><a href="http://daisannews.com/" target="_blank">www.daisannews.com</a></li>
				</ul>
				<ul class="list-unstyled">
					<li><a href="" target="_blank">Thông tin dự án</a></li>
					<li><a href="http://duantoanquoc.com" target="_blank">www.duantoanquoc.com</a></li>
				</ul>
				<ul class="list-unstyled">
					<li><a href="" target="_blank">SLCMART</a></li>
					<li><a href="http://songluc.com.vn/" target="_blank">www.songluc.com.vn</a></li>
				</ul>
				<!--<ul class="list-unstyled">
					<li><a href="" target="_blank">Nhập Chung</a></li>
					<li><a href="http://nhapchung.com/" target="_blank">www.nhapchung.com</a></li>
				</ul>
				-->
			</div>
		</div>
		<div class="text-center">
			<span>© 2009 DAISAN. All Rights Reserved. Degin by Niceweb.vn
			</span>
		</div>
	</div>
</footer>

<!-- 
<div id="totop">
	<div class="gotop">
		<i class="fa fa-angle-up"></i>
		<div class="text">TOP</div>
	</div>
</div> -->

<div id="loading">
	<i class="fa fa-spinner fa-pulse fa-5x fa-fw"></i>
</div>
{if $is_mobile}
<section class="box-service">
	<div class=""
		style="position: fixed; bottom: 195px; right: 15px; z-index: 9;">
		<div class="helpdesk-online rounded-circle bg-success">
			<a href="tel:0986.25.8282" class="btn rounded-circle w-100"
				title="0986.25.8282"><span
				class="text-center text-lg text-mnm text-white"><i
					class="fa fa-comments"></i></span></a>
		</div>
		<div class="rounded-circle bg-info mt-4">
			<a href="tel:028.226.59.888" class="btn rounded-circle w-100"
				title="028.226.59.888"><span
				class="text-center text-lg text-mnm text-white"><i
					class="fa fa-phone"></i></span></a>
		</div>
		<div class="rounded-circle bg-danger mt-4">
			<a href="tel:1900 9898 36" class="btn rounded-circle w-100"
				title="1900 9898 36"><span
				class="text-center text-lg text-mnm text-white"><i
					class="fa fa-support"></i></span></a>
		</div>
		<div class="rounded-circle bg-warning mt-4">
			<a href="tel:0988.03.2468" class="btn rounded-circle w-100"
				title="0988.03.2468"><span
				class="text-center text-lg text-mnm text-white"><i
					class="fa fa-heart"></i></span></a>
		</div>
		<div class="rounded-circle bg-primary mt-4">
			<a href="javascript:void(0)" data-toggle="modal"
				data-target="#exampleModal" class="btn rounded-circle w-100"
				title="0986.25.8282"><span
				class="text-center text-lg text-mnm text-white"><i
					class="fa fa-comment"></i></span></a>
		</div>
		<div class="rounded-circle bg-warning mt-4">
			<a href="https://m.me/daisangroups" class="btn rounded-circle w-100"
				title="0986.25.8282"><span
				class="text-center text-lg text-mnm text-white"><i
					class="fa fa-comments"></i></span></a>
		</div>
	</div>
	<div class=""
		style="position: fixed; bottom: 195px; right: 65px; z-index: 9;">
		<div class=" ">
			<a href="tel:1800 6464 98" class="btn btn-warning w-100 a"
				title="1800 6464 98"><span class="text-center text-nm text-mnm">Tư
					vấn mua hàng (Miễn phí)<br><font color="#d0021b" class="text-b">1800 6464 98</font>
			</span></a>
		</div>
		<div class="mt-4">
			<a href="tel:02473092999" class="btn btn-outline-dark w-100"
				title="02473092999"><span class="text-center text-nm text-mnm">DaiSan HN: 02473092999</span></a>
		</div>
		<div class="mt-4">
			<a href="tel:02367309996" class="btn btn-outline-dark w-100"
				title="02367309996"><span class="text-center text-nm text-mnm">DaiSan Đà Nẵng: 02367309996</span></a>
		</div>
		<div class="mt-4">
			<a href="tel:02873093959" class="btn btn-outline-dark w-100"
				title="02873093959"><span class="text-center text-nm text-mnm">DaiSan HCM: 02873093959</span></a>
		</div>
		<div class="mt-4">
			<a href="javascript:void()" data-toggle="modal"
				data-target="#exampleModal" class="btn btn-outline-dark w-100"
				title=""><span class="text-center text-nm text-mnm">Yêu
					cầu báo giá</span></a>
		</div>
		<div class="mt-4">
			<a href="https://m.me/daisanvn" class="btn btn-outline-dark w-100"><span
				class="text-center text-nm text-mnm">Chat Trực Tuyến</span></a>
		</div>
	</div>
</section>
<div class="button_more rounded-circle bg-success">
	<i class="fa fa-plus fa-2x"></i>
</div>
<script>
	$(document).ready(function() {
		$('.button_more').click(function() {
			$(this).toggleClass("active");
			$(".box-service").toggleClass("show");
			$('.background').fadeToggle("fast", "linear");
		});
	});
</script>
{/if}
<div class="call_phone d-none d-sm-block">
	<div class="call_big"></div>
	<div class="call_lag"></div>
	<div class="call_tiny" data-toggle="modal" data-target="#exampleModal"></div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog  modal-lg" role="document">
		<div class="modal-content rounded-0">
			<div class="modal-header">
				<h5>Để lại số điện thoại, chúng tôi sẽ gọi lại tư vấn ngay</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
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
									<p>Cho chúng tôi biết những gì bạn cần bằng cách điền vào
										biểu mẫu</p>
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
							<select class="custom-select mb-3 rounded-0" name="location_id"
								required> {$s_location}
							</select>
							<textarea class="form-control rounded-0 mb-3" name="description"
								placeholder="Nội dung yêu cầu" required></textarea>
							<input type="number" class="form-control rounded-0" name="phone"
								placeholder="Nhập số điện thoại" required>
						</div>
						<button type="button"
							class="btn btn-primary btn-block btn-sendcontact"
							onclick="SendPhoneContact()">Gửi thông tin yêu cầu</button>

						<div class="pt-4">
							<h4 class="d-none d-sm-block">Tổng đài hỗ trợ trực tuyến</h4>
							<ul class="timeline d-none d-sm-block">
								<li class="text-left">
									<p>
										Tư vấn mua hàng (Miễn phí): 1800 6464 98<br> <small>(Tư
											vấn, báo giá sản phẩm 8-21h kể cả T7, CN)</small>
									</p>
								</li>
								<li class="text-left">
									<p>
										Phòng IT: 0964.36.8282<br> <small>(Hỗ trợ 24/7.
											Đăng ký mở gian hàng trên hê thống)</small>
									</p>
								</li>
							</ul>
							<p class="text-center">
								<span>Hoặc gọi</span>
							</p>
							<a href="tel:1800 6464 98" class='hotline'>1800 6464 98<br>(Tư vấn mua hàng miễn phí)</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<script>
	function SendPhoneContact() {
		var data = {};
		data.name = $("#FormSendContact #ProductName").text();
		data.image = $("#FormSendContact #ShowImg").attr("src");
		data.taxonomy_id = $("#FormSendContact #TaxId").val();
		data.location_id = $("#FormSendContact select[name=location_id]").val();
		data.description = $("#FormSendContact textarea[name=description]")
				.val();
		data.phone = $("#FormSendContact input[name=phone]").val();
		data.ajax_action = 'send_phone_contact';
		loading();
		if (data.location_id == 0) {
			noticeMsg('Message System', 'Vui lòng chọn khu vực', 'error');
			$("#FormSendContact select[name=location_id]").focus();
			endloading();
			return false;
		} else if (data.description == '') {
			noticeMsg('Message System', 'Nhập vào nội dung yêu cầu', 'error');
			$("#FormSendContact textarea[name=description]").focus();
			endloading();
			return false;
		} else if (data.phone == '') {
			noticeMsg('Message System', 'Bạn chưa nhập vào số điện thoại',
					'error');
			$("#FormSendContact input[name=phone]").focus();
			endloading();
			return false;
		}
		$.post('?mod=home&site=index', data).done(
				function(e) {
					var rt = JSON.parse(e);
					noticeMsg('Message System', 'Gửi thông tin thành công.',
							'success');
					setTimeout(function() {
						location.reload();
					}, 1000);
				});
	}
</script>