<div class="bg-white mb-4">
	<div class="container">
		<div class="text-center pt-2 pb-4">
			<div class="row justify-content-center mt-4" id="services">
				{foreach from=$services key=k item=data}
				<div class="col-md-3">
					<div class="card mb-4 rounded-0">
						<a href="{$data.url}" class="o-hidden"><img class="card-img-top" src="{$data.avatar}" alt="{$data.name}"></a>
						<div class="card-body">
							<h5 class="card-title">
								<a href="{$data.url}">{$data.name}</a>
							</h5>
							<p class="card-text price mb-1">Giá từ {$data.price|number_format}đ</p>
							<p class="desc mb-0"><small>{$data.description}</small></p>
						</div>
						<div class="card-footer">
							<small>374 lượt xem</small>
						</div>
					</div>
				</div>
				{/foreach}
			</div>
		</div>
	</div>
</div>
