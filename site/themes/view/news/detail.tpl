<div class="row" id="newshot">
	<div class="col-md-8">
		<h1>{$post.Title}</h1>
		<p class="url">
			<a href="{$post.Url_domain}">{$post.Name|truncate:'70'}</a>
			<span> | </span>
			<time class="timeago" datetime="{$post.Created|date_format:'%Y-%m-%d %H:%M'}"></time>
			</p>
		<h3>{$post.Description}</h3>
		<div id="HodineContent">
			{$post.Content|default:'Nội dung đang được cập nhật.'}
		</div>
	</div>
	<div class="col-md-4 hidden-sm hidden-xs">
		<div class="item newshotlist">
			<h3 class="boxtitle"><span>Tiêu điểm tin</span></h3>
		</div>
	</div>
</div>

{if $postother}
<div class="">
	<h3 class="boxtitle"><span>Tin liên quan</span></h3>
	{foreach from=$postother key=k item=data}
	{if $k neq 0}
	{if $data.Avatar}
	<div class="row row-small newlist">
		<div class="col-md-3 col-lg-3 col-xs-4 col-sm-4 img">
			<a href="{$data.Url_onpage}"><img alt="{$data.Title}" src="{$data.Avatar}" width="100%"></a>
		</div>
		<div class="col-md-9 col-lg-9 col-xs-8 col-sm-8">
			<h3><a href="{$data.Url_onpage}">{$data.Title}</a></h3>
			<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
			<p class="desc hidden-xs">{$data.Description}</p>
		</div>
	</div>
	{else}
	<div class="newlist">
		<h3><a href="{$data.Url_onpage}">{$data.Title}</a></h3>
		<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
		<p class="desc hidden-xs">{$data.Description}</p>
	</div>
	{/if}
	{/if}
	{/foreach}
</div>
{/if}

<div class="">
	<h3 class="boxtitle"><span>Tin mới cập nhật</span></h3>
	{foreach from=$postnew key=k item=data}
	{if $k neq 0}
	{if $data.Avatar}
	<div class="row row-small newlist">
		<div class="col-md-3 col-lg-3 col-xs-4 col-sm-4 img">
			<a href="{$data.Url_onpage}"><img alt="{$data.Title}" src="{$data.Avatar}" width="100%"></a>
		</div>
		<div class="col-md-9 col-lg-9 col-xs-8 col-sm-8">
			<h3><a href="{$data.Url_onpage}">{$data.Title}</a></h3>
			<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
			<p class="desc hidden-xs">{$data.Description}</p>
		</div>
	</div>
	{else}
	<div class="newlist">
		<h3><a href="{$data.Url_onpage}">{$data.Title}</a></h3>
		<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
		<p class="desc hidden-xs">{$data.Description}</p>
	</div>
	{/if}
	{/if}
	{/foreach}
</div>

<script src="{$arg.stylesheet}js/timeago.js"></script>
{literal}
<script type="text/javascript">
function GotoUrl(Id){
	$.post('?mod=home&site=ajax_goto_url', {'Id':Id}).done(function(e){});
}

$(document).ready(function() {
	  jQuery("time.timeago").timeago();
});
</script>
{/literal}