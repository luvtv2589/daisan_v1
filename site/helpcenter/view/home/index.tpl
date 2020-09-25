
<ul class="posts">
	{foreach from=$result item=data}
	<li><a href="{$data.url}"><i class="fa fa-circle"></i> {$data.title}</a></li>
	{/foreach}
</ul>
<div class="mt-3 pull-right">{$paging}</div>
