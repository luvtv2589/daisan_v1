<div class="row">
	<div class="col-md-8">
		<div class="card mt-3 rounded-0">
			<div class="card-header">
				<h4 class="mb-0">Danh sách tin tuyển dụng</h4>
			</div>
				
			{if !$result}
			<div class="card-body">
				<p>Hiện tại công ty chưa có tin tuyển dụng</p>
			</div>
			{else}
			<ul class="list-group list-group-flush">
				{foreach from=$result item=data}
				<li class="list-group-item">
					<h3><a href="{$data.url}">{$data.title}</a></h3>
					<p><i class="fa fa-fw fa-tags"></i>{$data.category}</p>
					<div>
						<span class="mr-3"><i class="fa fa-fw fa-usd"></i>Lương: <b>{$data.salary}</b></span>
						<span class="mr-3"><i class="fa fa-fw fa-map-marker"></i>Khu vực: <b>{$data.places}</b></span>
						<span><i class="fa fa-fw fa-clock-o"></i>Hạn nộp hồ sơ: <b>{$data.date_finish|date_format:'%d-%m-%Y'}</b></span>
					</div>
				</li>
				{/foreach}
			</ul>
			{/if}
		</div>	
	</div>
	<div class="col-md-4">
		<div class="card mt-3 rounded-0">
			<div class="card-body">
				<div class="text-center">
					<img alt="{$page.name}" class="mb-3" src="{$page.logo_custom_img}">
					<h3>{$page.name}</h3>
				</div>
				<hr>
				<p>Điện thoại: {$page.phone}</p>
				<p>Email: {$page.email}</p>
				<p>Website: {$page.website}</p>
				<p>Địa chỉ: {$page.address}</p>
			</div>
		</div>	
	</div>
</div>
