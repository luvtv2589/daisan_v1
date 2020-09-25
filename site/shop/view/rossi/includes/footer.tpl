<section id="contact" class="my-3">
	<div class="container">
		<div class="card rounded-0">
			<div class="card-header">
				<h4 class="mb-0"><i class="fa fa-fw fa-envelope-o"></i> Gửi liên hệ tới chúng tôi</h4>
			</div>
			<div class="card-body">
				
		
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="email@example.com">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Nội dung</label>
					<div class="col-sm-7">
						<input type="hidden" name="product_id" value="{$info.id|default:0}">
						<textarea class="form-control rounded-0" rows="5" name="message"></textarea>
						<small>Nhập nội dung liên hệ từ 30 tới 1000 ký tự</small>
					</div>
					<div class="col-sm-3">
						<div class="card rounded-0">
							<div class="p-2">
								<h5>Liên hệ khi</h5>
								<p class="mb-2">- Cần giải đáp thắc mắc</p>
								<p>- Có yêu cầu đặc biệt</p>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"></label>
					<div class="col-sm-7">
						<button type="button" onclick="SendContact();" class="btn btn-success"><i class="fa fa-fw fa-envelope-o"></i> Gửi liên hệ</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<footer class="pt-5">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-lg-6">
                        <img src="{$page.logo_custom_img}" class="w-50">
                        <ul class="list-menu">
                            <li>
                                <a href=""> <i class="fa fa-map-marker pr-3"></i>Địa chỉ: {$page.address}</a>
                            </li>
                            <li>
                                <a href=""> <i class="fa fa-phone pr-3"></i>Điện thoại: {$page.phone}</a>
                            </li>
                            <li>
                                <a href=""><i class="pr-3 fa fa-envelope"></i>Email: {$page.email}</a>
                            </li>
                         
                        </ul>
                    </div>
                    <div class="col-12 col-lg-3">
                        <h4 class="title mt-5">
                            <a href="" class="text-white">
                            Thông tin
                            </a>
                        </h4>
                        <ul class="list-menu pl-2">
                            <li><a href="{$a_main_menu.home}"><i class="fa fa-angle-right pr-2"></i>Trang chủ</a></li>
						<li><a href="{$a_main_menu.company_information}"><i class="fa fa-angle-right pr-2"></i>Về chúng tôi</a></li>
						<li><a href=""><i class="fa fa-angle-right pr-2"></i>Tất cả dịch vụ</a></li>
						<li><a href=""><i class="fa fa-angle-right pr-2"></i>Tuyển dụng</a></li>
						<li><a href="{$a_main_menu.contact}"><i class="fa fa-angle-right pr-2"></i>Liên hệ</a></li>
                        </ul>
                    </div>
                    <div class="col-12 col-lg-3">
                        <h4 class="title mt-5">
                            <a href="" class="text-white mb-3">
                            Hỗ trợ thanh toán
                            </a>
                            <img alt="payment" src="{$arg.stylesheet}images/payment.png">
                        </h4>
                        
                    </div>
                </div>
			</div>
            </div>
        </footer>

<section id="helptool" class="d-none">
	<ul>
		<li><a href="">Hodine</a></li>
	</ul>
	<a></a>
</section>