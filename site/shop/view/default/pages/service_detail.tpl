<div class="p-3">
		<p class="">Hiển thị <b>{$out.number}</b> sản phẩm</p>
	
	<div class="text-center">
		<div class="row row-nm" id="services">
			{foreach from=$result key=k item=data}
			<div class="col-md-3">
				<div class="card mb-4 rounded-0">
					<a href="{$data.url}" class="o-hidden"><img class="card-img-top" src="{$data.avatar}" alt="{$data.name}"></a>
					<div class="card-body">
						<h5 class="card-title">
							<a href="{$data.url}">{$data.name}</a>
						</h5>
						<p class="card-text price mb-0">Giá từ {$data.price} đ</p>
					</div>
				</div>
			</div>
			{/foreach}
		</div>
		
		<div class="d-inline-block">{$paging}</div>
		
	</div>
</div>