<div class="{if !$is_mobile}container{/if} boxRfq">
	<div class="card rounded-0">
		<nav class="navbar navbar-expand-lg navbar-light">
			<button class="navbar-toggler border-0" type="button"
				data-toggle="collapse" data-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fa fa-search"></i> Tìm kiếm
			</button>
			<span class="pull-right navbar-toggler border-0"
				data-toggle="collapse" data-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation"><i class="fa fa-angle-down"></i>
			</span>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="list-group list-group-flush w-100">
					<li class="list-group-item px-0">Thời gian đăng: <a
						href="javascript:void(0);" class="mx-2"
						onclick="Setintime(12*60*60);">12 giờ trước</a> <a
						href="javascript:void(0);" class="mx-2"
						onclick="Setintime(24*60*60);">24 giờ trước</a> <a
						href="javascript:void(0);" class="mx-2"
						onclick="Setintime(3*24*60*60);">3 ngày trước</a> <a
						href="javascript:void(0);" class="mx-2"
						onclick="Setintime(7*24*60*60);">7 ngày trước</a> <a
						href="javascript:void(0);" class="mx-2"
						onclick="Setintime(15*24*60*60);">15 ngày trước</a> <a
						href="javascript:void(0);" class="mx-2"
						onclick="Setintime(30*24*60*60);">30 ngày trước</a> <a
						href="javascript:void(0);" class="mx-2" onclick="Setintime(0);">Tất
							cả thời gian</a> <input type="hidden" value="{$out.intime|default:0}"
						id="intime">
					</li>
					<li class="list-group-item px-0">
						<div class="form-inline">
							<div class="form-group mb-2 mr-2">
								<label for="staticEmail2">Thể loại:</label>
							</div>
							<div class="form-group mr-sm-2 mb-2" id="Cate0">
								<select class="form-control form-control-sm rounded-0"
									onchange="LoadCategory(this.value, 0);">{$out.product_cate_lv0}
								</select>
							</div>
							<div class="form-group mr-sm-2 mb-2" id="Cate1">
								<select class="form-control form-control-sm rounded-0"
									onchange="LoadCategory(this.value, 1);">{$out.product_cate_lv1}
								</select>
							</div>
							<div class="form-group mr-sm-2 mb-2" id="Cate2">
								<select class="form-control form-control-sm rounded-0"
									onchange="LoadCategory(this.value, 2);">{$out.product_cate_lv2}
								</select>
							</div>
						</div>
					</li>
					<li class="list-group-item px-0">
						<div class="form-inline">
							<div class="form-group mr-sm-2 mb-2">
								<select class="form-control form-control-sm rounded-0"
									id="location">{$out.location}
								</select>
							</div>
							<div class="form-group mx-sm-2 mb-2">
								<input type="text"
									class="form-control form-control-sm rounded-0" id="min_number"
									placeholder="Min number" value="{$out.min_number|default:''}">
							</div>
							<div class="form-group mx-sm-2 mb-2">
								<input type="text"
									class="form-control form-control-sm rounded-0" id="max_number"
									placeholder="Max number" value="{$out.max_number|default:''}">
							</div>
							<button type="button" class="btn btn-primary btn-sm ml-sm-2 mb-2"
								onclick="filter();">Tìm yêu cầu</button>
						</div>
					</li>
				</ul>
			</div>
	</div>
	</nav>
	<div class="card rounded-0">
		<ul class="list-group list-group-flush" id="Rfq">
			{foreach from=$rfq item=data}
			<li class="list-group-item">
				<div class="row row-nm">
					<div class="col-md-10">
						<div class="item line">
							{if $data.image}
							<div class="row row-nm">
								<div class="col-md-2 col-2">
									<a href="{$data.url}"><img class="w-100"
										src="{$data.avatar}"></a>
								</div>
								<div class="col-md-10 col-10">
									<h3 class="mb-1">
										<a href="{$data.url}">{$data.title}</a>
									</h3>
									{if $data.description}
									<p class="mb-2 line-2 d-none d-sm-block">{$data.description}</p>
									{/if}
									<p class="mb-0 col-gray">
										<span class="mb-0 pb-1 pr-2"><i class="fa fa-clock-o"></i>
											Thời gian đăng: {$data.created|date_format:'%H:%M %d/%m/%Y'}</span>
										<span class="mb-0 pb-1 pr-2"><span class=""><i
												class="fa fa-cubes"></i> Số lượng cần:<b
												class="number-quotation">{$data.number}</b>&nbsp;{$data.unit}</span>
										</span> {if $data.location}<span class="mb-0"><span
											class="mb-0 pb-1 pr-2"><i class="fa fa-map-marker"></i>
												Địa điểm: {$data.location}, Việt Nam</span> </span>{/if}
									</p>
								</div>
							</div>
							{else}
							<h3 class="mb-1">
								<a href="{$data.url}">{$data.title}</a>
							</h3>
							{if $data.description}
							<p class="mb-2 line-2 d-none d-sm-block">{$data.description}</p>
							{/if} <span class="mb-0 pb-1 pr-2"><i
								class="fa fa-clock-o"></i> Thời gian đăng:
								{$data.created|date_format:'%H:%M %d/%m/%Y'}</span> <span
								class="mb-0 pb-1 pr-2"><span class=""><i
									class="fa fa-cubes"></i> Số lượng cần:<b
									class="number-quotation">{$data.number}</b>&nbsp;{$data.unit}</span>
							</span> {if $data.location}<span class="mb-0"><span
								class="mb-0 pb-1 pr-2"><i class="fa fa-map-marker"></i>
									Địa điểm: {$data.location}, Việt Nam</span> </span>{/if} {/if}
						</div>
					</div>
					
					<div class="col-md-2 {if !$is_mobile}text-right{else}text-left{/if}">
						<p class="mt-2 mb-2">
							<a href="{$data.url}" class="btn btn-quotation btn-sm">Xem chi tiết</a>
							</n>
						<!-- <p class="mb-2">
							Còn lại <b class="number-quotation">{10-$data.number_quotation}</b>
							báo giá
						</p> -->
					</div>
				</div>
			</li> {/foreach}
		</ul>

		{if $paging}
		<div class="p-3">{$paging}</div>
		{/if}
	</div>
</div>

<script type="text/javascript">
	function Setintime(number) {
		$("#intime").val(number);
		filter();
	}

	function filter() {
		var key = $.trim($("#keyword").val());
		var location = $("#location").val();
		var intime = $("#intime").val();
		var min_number = $("#min_number").val();
		var max_number = $("#max_number").val();
		var cat_level_0 = $("#Cate0 select").val();
		var cat_level_1 = $("#Cate1 select").val();
		var cat_level_2 = $("#Cate2 select").val();
		var url = "?site=index";
		if (cat_level_0 != 0)
			url = url + "&cat_level_0=" + cat_level_0;
		if (cat_level_1 != 0)
			url = url + "&cat_level_1=" + cat_level_1;
		if (cat_level_2 != 0)
			url = url + "&cat_level_2=" + cat_level_2;
		if (intime != 0)
			url = url + "&intime=" + intime;
		if (location != 0)
			url = url + "&location=" + location;
		if (min_number != '')
			url = url + "&min_number=" + min_number;
		if (max_number != '')
			url = url + "&max_number=" + max_number;
		if (key != '')
			url = url + "&key=" + key;
		window.location.href = url;
	}
</script>