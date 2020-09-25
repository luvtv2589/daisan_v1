<div class="row row-sm">
	{foreach from=$result item=data}
	<div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-6 mb-xl-3 box_product">
		<div class="card rounded-0 item_product mb-2">
				<a href="{$data.url}" class="img"><img class="img-fluid"
					src="{$data.avatar}" alt="{$data.name}" width="100%"></a>
				<div class="px-2">
				   <img src="{$arg.stylesheet}images/evietbuild.png" height="15">
					<h2 class="card-title">
						<a href="{$data.url}">{$data.name}</a>
					</h2>
					<div class="card-text price">
						<b>{$data.price}{if $data.pricemax gt 0}-{$data.pricemax|number_format}{/if}</b>
						{if $data.price neq 0}<span class="unit">/ {$data.unit}</span>{/if}
					</div>
					<div class="card-text">{$data.minorder} {$data.unit} (Min.Order)</div>
				</div>
		</div>
	</div>
	{/foreach}
</div>
