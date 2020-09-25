<div class="pt-3">
	<div class="row row-sm">
		<div class="col-md-10">
	
			<div class="card-group">
				<div class="card" style="flex-grow: 0.75">
					<div class="card-body">
						<img alt="{$service.name}" src="{$service.avatar}" width="100%">
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<h3 class="mb-0">{$service.name}</h3>
					</div>
					<div class="card-header">Bảng giá dịch vụ, <a href="">xem thêm báo giá trên hodine</a></div>
					<div class="card-body">
						<h5>{$service.price} / <a href="{$arg.thislink}#price"><small>Bảng giá chi tiết</small></a></h5>
						
					</div>
					<div class="card-header">
						<p class="mb-1"><i class="fa fa-bookmark text-warning"></i> Ưu đãi của chúng tôi</p>
						<ul>
							{foreach from=$service.promos item=data}
							<li>{$data.content}</li>
							{/foreach}
						</ul>
						<button class="btn btn-danger"><i class="fa fa-fw fa-envelope-open-o"></i> Liên Hệ Nhà Cung Cấp</button>
						<button class="btn btn-warning col-white"><i class="fa fa-fw fa-shopping-cart"></i> Đặt Hàng Ngay</button>
					</div>
					<div class="card-body">
						<p class="mb-1"><i class="fa fa-bookmark text-danger"></i> Thông tin dịch vụ</p>
						<table class="table mb-2">
							<tr>
								<td width="25%">Thời gian</td>
								<td>{$service.timework}</td>
							</tr>
							<tr>
								<td>Bảo hành</td>
								<td>{$service.warranty}</td>
							</tr>
							<tr>
								<td>Địa điểm</td>
								<td>Toàn quốc</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="card mt-2 mb-3">
				<div class="card-header">Thông tin chi tiết dịch vụ</div>
				<div class="card-body">
					<h5>Thông tin thêm về dịch vụ</h5>
					<table class="table table-bordered mb-0">
						{foreach from=$service.metas item=data}
						<tr>
							<td>{$data.meta_key}</td>
							<td>{$data.meta_value}</td>
						</tr>
						{/foreach}
					</table>
					
					<h5 class="mt-4" id="price">Bảng giá chi tiết</h5>
					<table class="table table-bordered">
						{foreach from=$service.prices item=data}
						<tr>
							<td>{$data.version}</td>
							<td class="text-right">{$data.price|number_format}đ</td>
						</tr>
						{/foreach}
					</table>
					
					<h5 class="mt-4">Quy trình/ các đầu mục công việc</h5>
					<ul>
						{foreach from=$service.steps item=data}
						<li>{$data.content}</li>
						{/foreach}
					</ul>
				</div>
			</div>

	
		</div>
		<div class="col-md-2">

			<div class="card text-center mb-3">
				<div class="card-header p-2"><h5 class="mb-0">Dịch vụ khác</h5></div>

				<ul class="list-group list-group-flush">
					{foreach from=$other item=data}
					<li class="list-group-item px-2">
						<h6><a href="{$data.url}">{$data.name}</a></h6>
						<a href="{$data.url}"><img alt="{$data.name}" src="{$data.avatar}" width="100%"></a>
						<p class="mb-0 mt-2 text-danger">Giá từ {$data.price|number_format}đ</p>
					</li>
					{/foreach}
				</ul>

			</div>

		</div>
	</div>
</div>