<div class="homepage">
	<!-- <ul class="nav">
		<li class="nav-item"><a class="nav-link text-dark" href="#">Date:04/13/2020
				– 05/13/2020 </a></li>
		<li class="nav-item"><a class="nav-link text-dark" href="#">Section:Arts,Books,Business</a></li>
		<li class="nav-item"><a class="nav-link text-dark" href="#">Type:Article</a></li>
	</ul> -->
	<div class="my-4">
		<div class="my-4">
			<div class="row">
				<div class="col-sm-8">
					<div id="resulPost">
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
								<p class="mb-0 text-mnm-1 text-threeline">{$data.description}</p>
							</div>
							<div class="col-md-3 col-5">
								<a href="{$data.url}"><img src="{$data.avatar}"
									class="img-fluid pl-2"></a>
							</div>
						</div>
						{/foreach}
					</div>
					<div class="view_more">
						<button type="button" class="btn btn-light text-nm"
							onclick="loadMore()" id="loadMore">Xem thêm</button>
					</div>
				</div>
				<div class="col-sm-4">
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var all_post = '{$out.number}';
</script>
<script>
	var page = 1;
	limit = 10;
	number = page * limit;
	if (number > all_post) {
		$(".view_more").addClass("hide");
	}
	function loadMore() {
		page = page + 1;
		number = page * limit;
		$.post('?mod=posts&site=ajax_loadmore', {
			'page' : page,
		}).done(function(e) {
			if (number > all_post) {
				$(".view_more").addClass("hide");
			} else {
				$("#resulPost").append(e);
			}
		});
	}
</script>