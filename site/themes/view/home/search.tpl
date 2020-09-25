<div class="container-fluid">

	<div class="row row-small">
		<div class="col-md-10 col-md-offset-2">

			<div class="row row-small">
				<div class="col-md-6">

					{if $result}
					{foreach from=$result key=k item=data}
					<div class="itemsearch">
						<h3><a href="{$data.Url}" title="{$data.Title}">{$data.Title}</a></h3>
						<p class="url">{$data.Url|truncate:'80'}</p>
						<hr class="hidden-md hidden-lg">
						<p class="desc">{$data.Description}</p>
						<div class="clearfix"></div>
					</div>
					{/foreach}
					{if $result|@count >= 20}
					<div id="NewContent"></div>
					<div id="LoadMore">
						<button type="button" class="btn btn-default" onclick="LoadMore();">
							<i class="fa fa-angle-double-down fa-fw"></i>Tải thêm kết quả
						</button>
					</div>
					{/if}
					{else}
					<div class="itemsearch">
						<h4>Daisanplus thông báo</h4>
						<p>
							<i class="fa fa-hand-o-right fa-fw"></i> Không tìm thấy kết quả
							nào cho từ khóa <b>"{$out.keyword}"</b>.
						</p>
					</div>
					<h4>Đề xuất</h4>
					<ul>
						<li>Xin bạn chắc chắn rằng tất cả các từ đều đúng chính tả.</li>
						<li>Hãy thử những từ khóa khác.</li>
						<li>Hãy thử những từ khóa chung hơn.</li>
					</ul>
					{/if}
					
					<div id="tag_keyword">
						<h3>Các từ khóa tìm kiếm liên quan đến <b>{$out.keyword}</b></h3>
						<div class="row">
							<div class="col-md-6">
								<ul class="list-unstyled">
								{foreach from = $out.keyword_other key = k item = data}
								{if $k<4}
									<li><a href="{$data.Url}">{$data.Keyword}</a></li>
								{/if}
								{/foreach}
								</ul>
							</div>
							<div class="col-md-6">
								<ul class="list-unstyled">
									{foreach from = $out.keyword_other key = k item = data}
								{if $k > 3}
									<li><a href="{$data.Url}">{$data.Keyword}</a></li>
								{/if}
								{/foreach}
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var key = '{$out.keyword}';
</script>

{literal}
<script>
	var page = 1;
	function LoadMore() {
		loading();
		page = page + 1;
		console.log(page);
		$.post('?mod=home&site=ajax_loadmore', {
			'page' : page,
			'key' : key
		}).done(function(e) {
			if (e == '' || e == null) {
				notiMsg('Thông báo',
						'Kết quả tìm kiếm đã được tải hết', 'error');
				$("#LoadMore").hide();
			} else {
				$("#NewContent").append(e);
			}
			endloading();
		});
	}
</script>

{/literal}
