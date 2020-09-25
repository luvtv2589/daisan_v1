<div class="homepage">
	<section class="section_list_post">
		<div class="d-flex nav_category_menu">
			<ul class="nav align-items-end">
				<li class="nav-item"><h2 class="text-b pt-2 pb-0">{$out.taxonomy_name}</h2></li>
				{foreach from=$a_category_submenu item=data}
				<li class="nav-item pb-2"><a class="pr-2 text-dark"
					href="?mod=posts&site=index&cid={$data.id}">{$data.name}</a></li> {/foreach}
			</ul>
		</div>
		<div class="row">
			<div class="col-sm-7">
				<div class="row">
					{foreach from=$result key=k item=data} {if $k le 1}
					<div class="col-md-6 border-right">
						<div class="py-2">
							<a href="{$data.url}"><img src="{$data.avatar}" width="100%"></a>
							<div class="pt-2">
								<h3 class="text-lg text-mbiggest text-b post_title">
									<a href="{$data.url}" class="text-dark">{$data.title}</a>
								</h3>
								<p class="mb-1 text-mbiggest text-threeline">{$data.description}</p>
								<p class="card-text">
									<small class="text-muted"><i class="far fa-clock fa-fw"
										aria-hidden="true"></i>{$data.created|date_format:'%d-%m-%Y
										%H:%M'}</small>

								</p>
							</div>
						</div>
					</div>
					{/if} {/foreach}
				</div>
			</div>
			<div class="col-sm-5">
				<ul class="list-unstyled">
					{foreach from=$result key=k item=data} {if $k ge 2 && $k le 3}
					<li class="post_item">
						<div class="media">
							<div class="media-body">
								<h3 class="text-lg text-mbiggest text-b post_title">
									<a href="{$data.url}" class="text-dark">{$data.title}</a>
								</h3>
								{if $data.description}
								<p class="mb-1 text-threeline d-none d-sm-block ">{$data.description}</p>
								{/if}
								<p class="card-text">
									<small class="text-muted"><i class="far fa-clock fa-fw"
										aria-hidden="true"></i>{$data.created|date_format:'%d-%m-%Y
										%H:%M'}</small>

								</p>
							</div>
							<a href="{$data.url}"><img src="{$data.avatar}" class="ml-3"
								alt="{$data.name}" height="140"></a>
						</div>
					</li> {/if} {/foreach}
				</ul>
			</div>
		</div>
	</section>
	<section class="section_list_post border-top">
		<div class="row">
			{foreach from=$result key=k item=data} {if $k gt 3 && $k le 8}
			<div class="col-2-5 post_item_5 a">
				<div class="py-sm-2 py-0">
					<a href="{$data.url}"><img src="{$data.avatar}"
						class="img-fluid" alt="..."></a>
					<div class="pt-2">
						<h3 class="text-lg text-mbiggest text-b post_title">
							<a href="{$data.url}" class="text-dark">{$data.title}</a>
						</h3>
						<p class="card-text">
							<small class="text-muted"><i class="far fa-clock fa-fw"
								aria-hidden="true"></i>{$data.created|date_format:'%d-%m-%Y
								%H:%M'}</small>
						</p>
					</div>
				</div>
				
			</div>
			{/if} {/foreach}
		</div>
	</section>
	<section class="section_list_post border-top pt-3">
		<div class="row">
			<div class="col-sm-9">
				{foreach from=$result key=k item=data} {if $k gt 8}
				<div class="row row-no post_item">
					<div class="col-md-2 pr-2">
						<p class="card-text">
							<span class="text-secondary">{$data.created|date_format:"%A,
								%B %e, %Y"}</span>
						</p>
					</div>
					<div class="col-md-7 col-7">
						<h3 class="post_title text-lg text-mbig text-b">
							<a href="{$data.url}" class="text-dark">{$data.title}</a>
						</h3>
						<p class="mb-0 text-mnm-1">{$data.description}</p>
					</div>
					<div class="col-md-3 col-5">
						<a href="{$data.url}"><img src="{$data.avatar}"
							class="img-fluid pl-2"></a>
					</div>
				</div>
				{/if}{/foreach}
				<div id="resulPost"></div>
				<div class="row mt-4 view_more">
					<button type="button" class="btn btn-light text-nm"
						onclick="loadMore()" id="loadMore">Xem thêm</button>
				</div>
			</div>

			<div class="col-sm-3">
				<div class="">
					<a href=""><img
						src="{$arg.stylesheet}images/48522b52393bc5659c2a.jpg"
						class="img-fluid d-block mb-2"></a> <a
						href="http://xahang.daisan.vn/" class="d-block mb-1"><img
						class="img-fluid w-100"
						src="http://news.daisanplus.vn/site/upload/media/images/x1589776765_7123614f6da136d8fd4770c023d56d3c.png.pagespeed.ic.KFWFy4hBuh.webp"></a>
					<a href="https://daisan.vn/" class="d-block mb-1"><img
						class="img-fluid w-100"
						src="http://news.daisanplus.vn/site/upload/media/images/x1589776770_d8b35ae959da524ad0cf0db5d3fd5930.png.pagespeed.ic.n308n-QYJ2.webp"></a>
					<a href="https://daisan.vn/" class="d-block mb-1"><img
						class="img-fluid w-100"
						src="http://news.daisanplus.vn/site/upload/media/images/x1589777520_400a8330652e96c74aa24c748147c3a7.png.pagespeed.ic.1jgcI_9DSW.webp""></a>
				</div>
			</div>
		</div>
	</section>
</div>