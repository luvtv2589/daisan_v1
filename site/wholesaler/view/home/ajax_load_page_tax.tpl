	{foreach from=$result item=page}
	<div class="col-xl-6 col-12 mb-2">
		<div class="card card-page border-0">
			<div class="card-header p-2 bg-white border-0">
				<div class="media">
					<a href="{$page.url}" class="logo-page"><img src="{$page.logo}"
						class="mr-3" alt="{$page.name}"></a>
					<div class="media-body">
						<h5 class="mt-0">
							<a href="{$page.url}">{$page.name}</a>
						</h5>
					</div>
					<div class="d-block d-sm-none">
						<a href="{$page.url}" class="btn-link-page">Đến cửa hàng</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end col 6 -->
	{/foreach}

