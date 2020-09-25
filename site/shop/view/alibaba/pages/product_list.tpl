<div id="Products-detail">
	<div class="row row-sm mt-3">
		<div id="barproduct"
			class="col-lg-2 col-md-3 d-none d-sm-none d-md-block">
			<div class="filter mb-3">
				<h4 class="title py-1">Danh mục sản phẩm</h4>
				<div class="">
					<ul class="list-unstyled">
						{foreach from=$a_main_product_category item=data}
						<li><a class="text-custom" href="{$data.url}">{$data.name}</a></li>
						{/foreach}
					</ul>
				</div>
			</div>
			<div id="product-hot">
				<div class="rounded-0">
					<h4 class="title py-1">Sản phẩm liên quan</h4>
					<ul class="list-group list-group-flush">
						{foreach from=$result key=k item=data}
                                                {if $k<8}
						<li class="list-group-item px-2">
							<div class="row row-sm">
								<div class="col-md-6">
									<a href="{$data.url}"><img alt="{$data.name}"
										src="{$data.avatar}" width="100%"></a>
								</div>
								<div class="col-md-6">
									<h6>
										<a href="{$data.url}" class="fz-12 text-custom">{$data.name}</a>
									</h6>
									<p class="mb-0 mt-2 text-danger fz-12">
										<b>{$data.price}</b>
									</p>
								</div>
							</div>
{/if}
						</li> {/foreach}
					</ul>
				</div>
			</div>
            <div class="ads">
				<!-- Insert Daisan Ads size 300x600 -->
				<script type="text/javascript">$(document).ready(function(){
				var image_type = $("#1543772631_7_300x600").attr('image_type');
				var domain = 'https://ads.daisan.vn/?site=load_ads';
				if(image_type && image_type!='') domain = domain+'&image_type='+image_type;
				$("#1543772631_7_300x600").load(domain);
				});</script>
				<div id="1543772631_7_300x600" image_type="300x600"></div>
            </div>
		</div>

		<div class="col-lg-10 col-md-9 " id="Products">

			<div class="card rounded-0 mb-1 d-none d-sm-none d-md-block border-0">
				<div class="card-header pt-0">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active"><b>Danh
									sách sản phẩm</b></a></li>
						<!-- <li class="nav-item"><a href="?mod=page&site=index" class="nav-link">Người bán sỉ</a></li> -->
					</ul>
				</div>
			</div>
			<div class="row m-0 border-top border-left S-1">
				{foreach from=$result item=data}
				<div
					class="col-lg-3 col-6 py-2 border-bottom border-right product-item">
					<a href="{$data.url}" class="text-custom-u"> <img
						src="{$data.avatar}" class="w-100">
						<h3 class="fz-12 d-block name pt-3">{$data.name}</h3>
					</a> <span class="fz-12 d-block"> <span class="font-weight-bold">{$data.price}</span>
						{if $data.price neq 0}<span class="text-muted">/{$data.unit}</span>{/if}
					</span> <span class="fz-12 d-block"> <span class="font-weight-bold">{$data.minorder}
							{$data.unit}</span> <span class="text-muted">(Min. Order)</span>
					</span>
				</div>
				{/foreach}
			</div>
			<div class="mt-3">{$paging}</div>
		</div>
	</div>

</div>

<input type="hidden" value="{$out.url}" id="filter_url">

<script type="text/javascript">
	$(window).ready(
			function() {
				$(".filter input[type=checkbox]").click(
						function() {
							var arr = [];
							$(".filter input[type=checkbox]").each(function() {
								if ($(this).is(':checked')) {
									var value = $(this).val();
									arr.push(value);
								}
							});

							var filter_checkbox = arr.toString();
							console.log(filter_checkbox);
							var url = set_filter();
							url = (filter_checkbox != '') ? url
									+ "&filter_checkbox=" + filter_checkbox
									: url;
							location.href = url;
						});
			});

	function set_filter() {
		var url = $("#filter_url").val();
		var minorder = $("#filter_minorder").val();
		var minprice = $("#filter_minprice").val();
		var maxprice = $("#filter_maxprice").val();

		url = (minorder != '') ? url + "&minorder=" + minorder : url;
		url = (minprice != '') ? url + "&minprice=" + minprice : url;
		url = (maxprice != '') ? url + "&maxprice=" + maxprice : url;
		return url;
	}

	function filter() {
		var url = set_filter();
		location.href = url;
	}
</script>