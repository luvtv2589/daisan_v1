<div class="p-3">
	
	<div class="card-group mb-3">
		<div class="card rounded-0" style="flex-grow: 0.75">
			<div class="card-body">
				
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators showimg">
						{foreach from=$info.a_images key=k item=data}
						<li data-target="#carouselExampleIndicators" data-slide-to="{$k}" class="{if $k eq 0}active{/if}">
							<img class="d-block w-100" src="{$data}">
						</li>
						{/foreach}
					</ol>
					<div class="carousel-inner">
						{foreach from=$info.a_images key=k item=data}
						<div class="carousel-item {if $k eq 0}active{/if}">
							<img class="d-block w-100" src="{$data}">
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
		<div class="card rounded-0">
			<div class="card-body">
				<h3 class="mb-0">{$info.name}</h3>
			</div>
			<div class="card-header"><b>Giá bán sản phẩm</b>, <a href="{$arg.thislink}#price">xem bảng giá chi tiết</a></div>
			<div class="card-body">
				<h5><b>{$info.price}</b> | <small>{$info.minorder} {$info.unit} (Min. Order)</small></h5>
			</div>
			<div class="card-header">
				<p class="mb-1">Xử lý đơn hàng: <b>{$info.ordertime|default:''}</b></p>
				<p class="mb-2">Khả năng cung cấp: <b>{$info.ability|default:''}</b></p>
				<div class="mt-3">
					<a class="btn btn-danger mb-2" href="{$info.url_contact}">
						<i class="fa fa-fw fa-envelope-open-o"></i> Liên Hệ Nhà Cung Cấp
					</a>
					{if $info.order}
					<a class="btn btn-warning col-white mb-2" href="{$info.url_addcart}">
						<i class="fa fa-fw fa-shopping-cart"></i> Đặt Hàng Ngay
					</a>
					{/if}
				</div>
			</div>
			<div class="card-body">
				<p class="mb-1"><i class="fa fa-bookmark text-danger"></i> Thông tin sản phẩm</p>
				<p class="mb-1"><span class="col-gray">Mã:</span> {$info.code} &nbsp;|&nbsp; <span class="col-gray">Thương hiệu:</span> {$info.trademark}</p>
				<p>{$info.keyword|default:''}</p>
			</div>
		</div>
	</div>

	<div class="row row-nm">
		<div class="col-md-8">
			<div class="card mb-3 rounded-0">
				<div class="card-header"><h5 class="mb-0">Thông tin chi tiết sản phẩm</h5></div>
				<div class="card-body">
					<h5 class="w-100">Thông tin thêm về sản phẩm</h5>
					<table class="table table-bordered mb-0">
						{foreach from=$info.metas item=data}
						<tr>
							<td width="40%">{$data.meta_key}</td>
							<td>{$data.meta_value}</td>
						</tr>
						{/foreach}
					</table>
					
					<h5 class="mt-4 w-100" id="price">Bảng giá chi tiết</h5>
					<table class="table table-bordered">
						{foreach from=$info.prices item=data}
						<tr>
							<td width="40%">{$data.version}</td>
							<td class="text-right">{$data.price|number_format}đ</td>
						</tr>
						{/foreach}
					</table>
					
					<h5 class="mt-4 w-100">Mô tả sản phẩm</h5>
					<div>{$info.description}</div>
					
					<h5 class="mt-4 w-100">Quy cách đóng gói</h5>
					<div>{$info.package|nl2br}</div>

					<h5 class="mt-4 w-100">Câu hỏi thường gặp</h5>
					<div>{$info.qa|nl2br}</div>
					
				</div>
			</div>
		</div>
		<div class="col-md-4">
			{if $other}
			<div class="card mb-3 rounded-0">
				<div class="card-header"><h5 class="mb-0">Sản phẩm khác</h5></div>

				<ul class="list-group list-group-flush">
					{foreach from=$other item=data}
					<li class="list-group-item">
						<div class="row row-sm">
							<div class="col-md-4">
								<a href="{$data.url}"><img alt="{$data.name}" src="{$data.avatar}" class="w-100"></a>
							</div>
							<div class="col-md-8">
								<h6><a href="{$data.url}">{$data.name}</a></h6>
								<p class="mb-0 mt-2 text-danger">Giá từ {$data.price} đ</p>
							</div>
						</div>
					</li>
					{/foreach}
				</ul>

			</div>
			{/if}
		</div>
	</div>
</div>