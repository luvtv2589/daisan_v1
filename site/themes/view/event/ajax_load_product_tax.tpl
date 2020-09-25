{foreach from=$result item=data}
<li class="col-xl-2 col-6">
	<div class="item-product p-3">
		<a href="{$data.url}" class="d-block"> <img class="d-block w-100"
			src="{$data.avatar}" alt="{$data.name}">
		</a>
		<div class="prod-info">
			<div class="title">
				<h3 class="py-2 fz-14">
					<a href="{$data.url}">{$data.name}</a>
				</h3>
			</div>
			<div class="card-text fz-18">
				<div class="price-sale mr-2">{$data.promo|number_format} đ /
					{$data.unit}</div>
				<div class="price-promo">
					{$data.price|number_format} đ<span class="badge badge-danger ml-3">{$data.percent}</span>
				</div>

			</div>
		</div>
	</div>
</li>
{/foreach}
