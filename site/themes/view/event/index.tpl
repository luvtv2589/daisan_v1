<div id="Deal" class="S-2" style="background-color: #ce110f !important;">
	<div class="header-deal">
	<img src="{$arg.stylesheet}images/banner-deal.jpg" class="img-fluid">
	<p class="text-center"><img src="{$arg.stylesheet}images/background-h3.jpg" class="img-fluid"></p>
		<div class="container">
			<div class="content_deal">
				<div class="row row-sm">
					{foreach from=$result item=data}
					<div class="col-sm-3 col-12 mb-2">
						<div class="card">
							<div class="card-body pb-0">
								<h3 style="font-size: 16px">
									<a href="{$data.url}" class="text-dark">{$data.name}</a>
								</h3>
								<p class="countdown btn btn-primary btn-block"
									data-countdown="{$data.date_finish}"></p>
							</div>
							<a href="{$data.url}"><img src="{$data.avatar}"
								alt="Card image cap" class="d-block w-100"></a>

						</div>
					</div>
					{/foreach}
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"
	src="{$arg.stylesheet}js/jquery.countdown.min.js"></script>
<script>
	$('[data-countdown]').each(function() {
		var $this = $(this), finalDate = $(this).data('countdown');
		$this.countdown(finalDate, function(event) {
			$this.html(event.strftime('%D:%H:%M:%S'));
		});
	});
</script>
