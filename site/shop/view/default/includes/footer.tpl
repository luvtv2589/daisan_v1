<section id="contact" class="">
	<div class="container">
		<div class="p-3 bg-white">
		<div class="card rounded-0">
			<div class="card-header">
				<h5 class="mb-0"><i class="fa fa-fw fa-envelope-o"></i> Gửi liên hệ tới chúng tôi</h5>
			</div>
			<div class="card-body">
				
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10"><i class="fa fa-fw fa-diamond"></i> {$page.name}</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Nội dung liên hệ</label>
					<div class="col-sm-9">
						<input type="hidden" name="page_id" value="{$page.pid}">
						<textarea class="form-control rounded-0" name="message" rows="5"></textarea>
						<small>( * Vui lòng nhập nội dung liên hệ có khoảng 20 tới 2000 ký tự)</small>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck1">
							<label class="form-check-label" for="gridCheck1"> Đồng ý gửi liên hệ tới nhà cung cấp </label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"></label>
					<div class="col-sm-7">
						<button type="button" onclick="SendContact();" class="btn btn-primary"><i class="fa fa-fw fa-envelope-o"></i> Gửi liên hệ ngay</button>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</section>

<footer>
	<div class="bg-black pt-2">
		<div class="container">
		
			<div class="row">
				<div class="col-md-8">
					<ul class="nav nav-pills menu-left">
						<li class="nav-item"><a href="{$arg.domain}" class="nav-link">Daisan.vn</a></li>
						<li class="nav-item"><a href="{$a_main_menu.home}" class="nav-link">Trang chủ</a></li>
						<li class="nav-item"><a href="{$a_main_menu.company_information}" class="nav-link">Giới thiệu</a></li>
						<li class="nav-item"><a href="{$a_main_menu.contact}" class="nav-link">Liên hệ</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<ul class="nav justify-content-end menu-right">
						{if $page.url_facebook}
						<li class="nav-item"><a class="nav-link" href="{$page.url_facebook}"><i class="fa fa-fw fa-facebook"></i></a></li>
						{/if}
						{if $page.url_google}
						<li class="nav-item"><a class="nav-link" href="{$page.url_google}"><i class="fa fa-fw fa-google-plus"></i></a></li>
						{/if}
						{if $page.url_youtube}
						<li class="nav-item"><a class="nav-link" href="{$page.url_youtube}"><i class="fa fa-fw fa-youtube"></i></a></li>
						{/if}
					</ul>
				</div>
			</div>		
		
			{if $page.description neq NULL}
			<div class="card rounded-0 mt-2">
				<div class="card-body">
					{$page.description|nl2br}
				</div>
			</div>
			{/if}
			<div class="pb-2" id="foot-btn">
				<div class="row">
					<div class="col-md-9">
						<h5 class="mt-3"><a href="https://daisan.vn/">Daisan</a> Copyright © 2017 Daisan JSC. All Rights Reserved</h5>
						<p class="">Website <a href="https://daisanv.n">daisan.vn</a> | Hotline: {$option.contact.phone} | Email: {$option.contact.email}</p>
					</div>
					<div class="col-md-3">
					
					</div>
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