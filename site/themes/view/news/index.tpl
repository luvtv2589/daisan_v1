<div class="row" id="newshot">
	<div class="col-md-8">
		<div class="item">
			{foreach from=$posthot key=k item=data}
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
			<div class="row row-nomal">
				{foreach from=$posthot key=k item=data}
				{if $k neq 0}
				{if $arg.mobile_show eq 1}
				<div class="col-md-4 newshotsmall">
					<div class="row row-small">
						<div class="col-md-12 col-lg-12 col-xs-4 col-sm-4 img">
							<a href="{$data.Url}" title="{$data.Title}"><img alt="{$data.Title}" src="{$data.Avatar}" width="100%"></a>
						</div>
						<div class="col-md-12 col-lg-12 col-xs-8 col-sm-8">
							<h3><a href="{$data.Url}" title="{$data.Title}">{$data.Title}</a></h3>
							<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
							<p class="desc hidden-sm hidden-xs">{$data.Description}</p>
						</div>
					</div>
				</div>
				{else}
				<div class="col-md-4 newshotsmall">
					<div class="row row-small">
						<div class="img">
							<a href="{$data.Url}" title="{$data.Title}"><img alt="{$data.Title}" src="{$data.Avatar}" width="100%"></a>
						</div>
						<div class="">
							<h3><a href="{$data.Url}" title="{$data.Title}">{$data.Title}</a></h3>
							<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
							<p class="desc hidden-sm">{$data.Description}</p>
						</div>
					</div>
				</div>
				{/if}
				{/if}
				{/foreach}
			</div>
		</div>
	</div>
	<div class="col-md-4 hidden-sm hidden-xs">
		<div class="item newshotlist">
			<h3 class="boxtitle"><span>Tiêu điểm tin</span></h3>
			<div>
				<ul class="ulblock ">
					{foreach from=$postlist key=k item=data}
					<li>
						<a href="{$data.Url}" title="{$data.Title}"><i class="fa fa-angle-double-right fa-fw"></i> {$data.Title}</a>
					</li>
					{/foreach}
				</ul>
			</div>
		</div>
	</div>
</div>


<div class="row">
	<div class="col-md-8">
		<div class="item">
			<div class="row row-nomal">
				{foreach from=$postnew key=k item=data}
				{if $arg.mobile_show eq 1}
				<div class="col-md-6">
					<div class="newsnew">
						<div class="row row-small">
							<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
								<a href="{$data.Url}" title="{$data.Title}"><img alt="{$data.Title}" src="{$data.Avatar}" width="100%"></a>
							</div>
							<div class="col-lg-8 col-md-8 col-xs-8 col-sm-8">
								<h3><a href="{$data.Url}" title="{$data.Title}">{$data.Title}</a></h3>
								<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
							</div>
						</div>
						<p class="desc hidden-sm hidden-xs">{$data.Description}</p>
					</div>
				</div>
				{else}
				<div class="col-md-6">
					<div class="newsnew">
						<div class="row row-small">
							<div class="col-lg-4 col-md-4">
								<a href="{$data.Url}" title="{$data.Title}"><img alt="{$data.Title}" src="{$data.Avatar}" width="100%"></a>
							</div>
							<div class="col-lg-8 col-md-8">
								<h3><a href="{$data.Url}" title="{$data.Title}">{$data.Title}</a></h3>
								<p class="url"><a href="{$data.Url_domain}">{$data.Name|truncate:'70'}</a> | <time class="timeago" datetime="{$data.Created|date_format:'%Y-%m-%d %H:%M'}"></time></p>
							</div>
						</div>
						<p class="desc">{$data.Description}</p>
					</div>
				</div>
				{/if}
				{/foreach}
			</div>
			
			<div class="text-center">
				<button class="btn btn-primary">Xem thêm tin mới nhất</button>
			</div>
			
		</div>
	</div>
	<div class="col-md-4 hidden-xs">
		<div class="item">
			<h3 class="boxtitle"><span>Nguồn cấp dữ liệu</span></h3>
			<div class="row row-nomal">
				{foreach from=$domains item=data}
				<div class="col-md-6">
					<a href="{$data.Url}" title="{$data.Name}"><img alt="" src="{$arg.dirimg}home4.png" class="img"></a>
					<a href="{$data.Url}" title="{$data.Name}">
						{$data.DomainName}
					</a>
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