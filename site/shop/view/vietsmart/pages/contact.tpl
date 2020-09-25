<div class="card-group mb-3">
	<div class="card rounded-0">
		<div class="card-body">
			<h3 class="card-title">{$page.name}</h3>
			<p class="card-text">Địa chỉ: {$page.address}</p>
			<p class="card-text">Điện thoại: {$page.phone}</p>
			<p class="card-text">Email: {$page.email}</p>
			<p class="card-text">Website: {$page.website}</p>
		</div>
	</div>
	<div class="card rounded-0">
		<div class="card-body">
			<h3 class="card-title">Danh sách nhân viên hỗ trợ</h3>
			<p>Hãy gọi ngay tới các nhân viên hỗ trợ của chúng tôi. Chúng tôi sẽ mang tới cho bạn sự tư vấn chu đáo nhất cho các thắc mắc của bạn.</p>
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