<div class="p-3">
	<div class="card rounded-0">
		<div class="card-header bg-white">
			<div class="row">
				<div class="col-md-8"><h4 class="mb-0">{$page.name}</h4></div>
				<div class="col-md-4 text-right">
					<a href="{$a_main_menu.contact}" class="btn btn-danger btn-sm mt-1"><i class="fa fa-envelope fa-fw"></i> Gửi liên hệ</a>
					<button class="btn btn-primary btn-sm mt-1"><i class="fa fa-check fa-fw"></i> Đặt hàng</button>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-md-5">
					<div class="border btn-img">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								{foreach from=$profile.a_image key=k item=img}
								<li data-target="#carouselExampleIndicators" data-slide-to="{$k}" {if $k eq 0}class="active"{/if}>
									<img class="d-block w-100" src="{$img}">
								</li>
								{/foreach}
							</ol>
							<div class="carousel-inner">
								{foreach from=$profile.a_image key=k item=img}
								<div class="carousel-item {if $k eq 0}active{/if}">
									<img class="d-block w-100" src="{$img}">
								</div>
								{/foreach}
							</div>
							<a class="carousel-control-prev" href="#carouselExampleIndicators" data-slide="prev">
								<span class="carousel-control-prev-icon"></span>
								<span class="sr-only">Previous</span>
							</a> 
							<a class="carousel-control-next" href="#carouselExampleIndicators" data-slide="next">
								<span class="carousel-control-next-icon"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				
				</div>
				<div class="col-md-7">
					<table class="table table-striped table-bordered mb-1">
						<tr>
							<td colspan="2"><h5 class="card-title">Thông tin công ty</h5></td>
						</tr>
						<tr>
							<td width="35%">Thời gian làm việc</td>
							<td>{$profile.time_open}</td>
						</tr>
						<tr>
							<td>Loại hình kinh doanh</td>
							<td></td>
						</tr>
						<tr>
							<td>Vị trí</td>
							<td>{$page.district}, {$page.province}</td>
						</tr>
						<tr>
							<td>Sản phẩm chính</td>
							<td>{$page.mainproducts}</td>
						</tr>
						<tr>
							<td>Tổng số nhân viên</td>
							<td>{$page.number_mem_show}</td>
						</tr>
						<tr>
							<td>Doanh thu hàng năm</td>
							<td>{$profile.revenue}</td>
						</tr>
						<tr>
							<td>Ngày thành lập</td>
							<td>{$page.date_start|date_format:'%d-%m-%Y'}</td>
						</tr>
						<tr>
							<td>Khả năng cung cấp</td>
							<td>{$profile.supply_ability}</td>
						</tr>
						<tr>
							<td colspan="2">{$profile.description|nl2br}</td>
						</tr>
					</table>
					<p class="card-text"></p>
				</div>
			</div>
		</div>
	</div>
</div>