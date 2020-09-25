<div class="p-3">
	<div class="card-group">
		<div class="card rounded-0">
			<div class="card-body">
				<h3 class="card-title">Thông tin doanh nghiệp</h3>
				<h5 class="mb-3">{$page.name}</h5>
				<p class="card-text"><i class="fa fa-map-marker"></i> Địa chỉ: {$page.address}</p>
				<p class="card-text"><i class="fa fa-phone"></i> Điện thoại: {$page.phone}</p>
				<p class="card-text"><i class="fa fa-globe"></i> Website: {$page.website}</p>
				<p class="card-text"><i class="fa fa-envelope-o"></i> Email: {$page.email}</p>
			</div>
		</div>
		<div class="card rounded-0">
			<div class="card-body">
				<h3 class="card-title">Danh sách nhân viên hỗ trợ</h3>
				<p>Hãy gọi ngay tới các nhân viên hỗ trợ của chúng tôi. Chúng tôi sẽ giải đáp ngay cho các thắc mắc của bạn.</p>
			</div>
			<ul class="list-group list-group-flush">
				{foreach from=$a_home_supporters item=data}
				<li class="list-group-item">
					<div class="row">
						<div class="col-md-2">
							<div class="">
								<a href="tel:{$data.phone}" class="d-block rounded-circle o-hidden bg-gray"><img alt="avatar" src="{$data.avatar}" width="100%"></a>
							</div>
						</div>
						<div class="col-md-9">
							<h5 class="">{$data.name}</h5>
							<p><a href="tel:{$data.phone}"><b>{$data.phone}</b></a></p>
						</div>
					</div>
				</li>
				{/foreach}
			</ul>
		</div>
	</div>
</div>
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