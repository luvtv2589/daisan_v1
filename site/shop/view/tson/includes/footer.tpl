

<footer>
		<div class="mask">
			<div class="container">
				<div class="px-3">
			<div class="row">
				<div class="col-md-12 col-lg-5">
					<h4 class="pt-4 mb-3 text-uppercase font-weight-bold">{$page.name}</h4>
					<p><i class="fa fa-fw fa-map-marker"></i> Địa chỉ: {$page.address}</p>
					<p><i class="fa fa-fw fa-phone"></i> Điện thoại: {$page.phone}</p>
					<p><i class="fa fa-fw fa-envelope-o"></i> Email: {$page.email}</p>
				</div>
				<div class="col-md-6 col-lg-3">
					<h4 class="pt-4 mb-3">Thông tin</h4>
					<ul class="list-unstyled">
						{foreach from=$a_main_product_category key=k item=data}
						<li>
							<i class="fa fa-angle-right float-left mt-1 pr-2"></i>
							<a href="{$data.url}">{$data.name}</a>
						</li>
						{/foreach}
					</ul>
				</div>
				<div class="col-md-6 col-lg-4">
					<h4 class="pt-4 mb-3">Hỗ trợ thanh toán</h4>
					<img alt="payment" src="{$arg.stylesheet}images/payment.png">
				</div>
			</div>
			</div>
		
			<div class="text-center pb-2" id="foot-btn">
				<h5 class="mt-3 text-center text-white"><a href="http://hodine.com/">Daisan</a> © 2017-2018 Sàn TMĐT DAISAN. All rights reserved.</h5>
				<p class="text-center">Website <a href="http://vietsmart.net">Daisan.vn</a> | Hotline: 0964.36.8282 | Email: info@daisangroup.vn</p>
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