<div class="home-item">
	<h1 style="margin-top: 10px; font-size: 30px;">Chào mừng bạn truy
		cập vào trang quản trị nội dung website !</h1>
	<h5>
		DAISAN,JSC &copy; 2018, truy cập trang chủ của chúng tôi <a
			href="http://daisan.vn" target="_blank">Daisan.vn</a>
	</h5>
	<hr>
	<!-- <div class="">
		<h4>
			Thống kê truy cập <a href="./?site=accesslog_ip">theo IP</a> hoặc <a
				href="./?site=accesslog_location">theo địa điểm</a>, <a
				href="./?site=accesslogs">tất cả địa điểm</a>
		</h4>
		<table class="highchart table hidden-lg hidden-md hidden-sm"
			data-graph-container-before="1" data-graph-type="column">
			<thead>
				<tr>
					<th>Date</th>
					<th class="text-right">Member onlines</th>
				</tr>
			</thead>
			<tbody>
				{foreach from=$chart item=data}
				<tr>
					<td width="70%">{$data.date_log|date_format:"%d/%m"}</td>
					<td class="text-right">{$data.number}</td>
				</tr>
				{/foreach}
			</tbody>
		</table>
		<div class="row">
			<div class="col-md-6">
				<h2>Top nhà cung cấp truy cập nhiều</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>#ID</th>
								<th>Shop</th>
								<th>Truy cập</th>
							</tr>
						</thead>
						<tbody>
						{foreach from=$pages item=data}
							<tr>
								<td>{$data.id}</td>
								<td><a href="{$data.url_page}" target="_blank">{$data.name}</a></td>
								<td>{$data.number}</td>
						 	</tr>
						 {/foreach}	
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-6">
				<h2>Top sản phẩm xem nhiều</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>#</th>
								<th>Sản phẩm</th>
								<th>Lượt xem</th>
							</tr>
						</thead>
						<tbody>
						{foreach from=$products item=data}
							<tr>
								<td>{$data.id}</td>
								<td><a href="{$data.url}" target="_blank">{$data.name}</a></td>
								<td>{$data.views}</td>
							</tr>
						{/foreach}	
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div> -->
	<script src="{$arg.stylesheet}custom/js/highcharts.js"></script>
	<script src="{$arg.stylesheet}custom/js/highchartTable.js"></script>
	<script>
		$(document).ready(function() {
			$('table.highchart').highchartTable();
			$("#PopupLocation").modal({
				show : true,
				backdrop: 'static',
				keyboard: false  // to prevent closing with Esc button (if you want this too)
			});
		});
	</script>