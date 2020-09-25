<div class="p-3">
	<div class="card rounded-0">
		<div class="card-header"><h4 class="mb-0">Các đối tác của chúng tôi</h4></div>
		<ul class="list-group list-group-flush">
			{foreach from=$partners item=data}
			<li class="list-group-item">
				<div class="row">
					<div class="col-md-2">
						<a href="{$data.url}" title="{$data.name}">
							<img alt="{$data.name}" src="{$data.logo}" width="100%">
						</a>
					</div>
					<div class="col-md-10">
						<h6 class="mb-1"><a href="{$data.url}" title="{$data.name}">{$data.name}</a></h6>
						<p>Từ {$data.year_start} đến {$data.year_finish}</p>
						<div>{$data.description}</div>
					</div>
				</div>
			</li>
			{/foreach}
		</ul>
	</div>
</div>