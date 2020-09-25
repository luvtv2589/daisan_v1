<div class="row" id="newshot">
	<div class="col-md-8">
		<div class="item">
			{foreach from=$postnew key=k item=data}
			{if $k eq 0}
			<div class="row row-nomal newshotbig">
				<div class="col-md-6">
					<a href="{$data.Url}" title="{$data.Title}"><img alt="{$data.Title}" src="{$data.Avatar}" width="100%"></a>
				</div>
				<div class="col-md-6">
					<h3><a href="{$data.Url}" title="{$data.Title}" target="_blank">{$data.Title}</a></h3>
					<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
					<p>{$data.Description}</p>
				</div>
			</div>
			{/if}
			{/foreach}
			<hr>
			<div class="">
				{foreach from=$postnew key=k item=data}
				{if $k neq 0}
				{if $data.Avatar}
				<div class="row row-small newlist">
					<div class="col-md-3 col-lg-3 col-xs-4 col-sm-4 img">
						<a href="{$data.Url}" title="{$data.Title}" target="_blank"><img alt="{$data.Title}" src="{$data.Avatar}" width="100%"></a>
					</div>
					<div class="col-md-9 col-lg-9 col-xs-8 col-sm-8">
						<h3><a href="{$data.Url}" title="{$data.Title}" target="_blank">{$data.Title}</a></h3>
						<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
						<p class="desc hidden-sm hidden-xs">{$data.Description}</p>
					</div>
				</div>
				{else}
				<div class="newlist">
					<h3><a href="{$data.Url}" title="{$data.Title}" target="_blank">{$data.Title}</a></h3>
					<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
					<p class="desc hidden-sm hidden-xs">{$data.Description}</p>
				</div>
				{/if}
				{/if}
				{/foreach}
			</div>

			{if $out.show_paging}
			<div>{$paging}</div>
			{/if}
		</div>
	</div>
	<div class="col-md-4 hidden-sm hidden-xs">
		<div class="item newsbarlist">
			<h3 class="boxtitle"><span>Tiêu điểm tin</span></h3>
			<div class="row row-small">
				{foreach from=$posthot key=k item=data}
				<div class="col-md-6">
					<div class="img">
						<a href="{$data.Url}" title="{$data.Title}" target="_blank"><img alt="{$data.Title}" src="{$data.Avatar}" width="100%"></a>
					</div>
					<div class="">
						<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
						<h4><a href="{$data.Url}" title="{$data.Title}" target="_blank">{$data.Title}</a></h4>
					</div>
				</div>
				{/foreach}
			</div>
		</div>
	</div>
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