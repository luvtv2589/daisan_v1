<p>Url: {$data.url|default:''}</p>
<div class="row row-sm">
	<div class="col-md-4">
		<img src="{$data.image|default:$arg.noimg}" width="100%" class="thumbnail">
	</div>
	<div class="col-md-8">
		<h3>{$data.name|default:''}</h3>
		<p>Mã: {$data.code|default:'none'}</p>
		<p>Thương hiệu: {$data.trademark|default:'none'}
	</div>
</div>

<table class="table table-bordered">
	{foreach from=$data.a_metas key=k item=cont}
	<tr>
		<td width="25%">{$k}</td>
		<td>{$cont}</td>
	</tr>
	{/foreach}
</table>
<div class="row row-sm">
<div class="col-md-12">
{$data.content}
</div>
</div>