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