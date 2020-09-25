{foreach from=$result item=data}
<div class="row row-no post_item">
	<div class="col-md-2">
		<p class="card-text">
			<span class="text-secondary">{$data.created|date_format:"%A,
				%B %e, %Y"}</span>
		</p>
	</div>
	<div class="col-md-7 col-7">
		<h3 class="post_title text-biggest text-mbig">
			<a href="{$data.url}" class="text-dark">{$data.title}</a>
		</h3>
		<p class="mb-0 text-mnm-1">{$data.description}</p>
	</div>
	<div class="col-md-3 col-5">
		<a href="{$data.url}"><img src="{$data.avatar}"
			class="img-fluid pl-2"></a>
	</div>
</div>
{/foreach}
