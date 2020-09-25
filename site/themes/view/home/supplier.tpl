<div class="container-fluid">

	<div class="row row-sm mt-3">
		<div class="col-md-2">
			<div class="filter mb-3">
				<h4>Số lượng nhân viên</h4>
				<div class="">
					{$out.checkbox_memnumber}
				</div>
			</div>
			<div class="filter mb-3">
				<h4>Doanh thu</h4>
				<div class="">
					{$out.checkbox_revenue}
				</div>
			</div>
		</div>
		<div class="col-md-8" id="Suppliers">

			<div class="card rounded-0 mb-1">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active"><b>Nhà cung cấp</b></a></li>
					</ul>
				</div>
				<div class="card-body">

					<div class="row">
						<div class="col-md-8">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"> 
								<label class="form-check-label" for="inlineCheckbox1">Gold Supplier</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> 
								<label class="form-check-label" for="inlineCheckbox2">Giao dịch đảm bảo</label>
							</div>
						
						</div>
						<div class="col-md-4">
							
						</div>
					</div>

				</div>
			</div>

			{foreach from=$result item=data}
			<div class="card mb-1 rounded-0">
				<div class="card-body">
					<h3 class="mb-2"><a href="{$data.url}"><i class="fa fa-diamond"></i> {$data.name}</a></h3>
					<p class="mb-1"><a class="text-sm" href=""><i class="fa fa-caret-square-o-right"></i> Chi tiết liên hệ</a></p>
					<div class="row row-nl">
						<div class="col-md-2">
							<a href="{$data.url}"><img class="img-thumbnail" src="{$data.logo}" width="100%"></a>
						</div>
						<div class="col-md-10">
							<p class="mb-1"><span class="col-gray"><i class="fa fa-map-marker"></i> Địa chỉ:</span> {$data.address}</p>
							<p class="mb-1"><span class="col-gray"><i class="fa fa-users"></i> Quy mô công ty:</span> {$data.number_mem}</p>
							<p class="mb-1"><span class="col-gray"><i class="fa fa-cubes"></i> Sản phẩm chính:</span></p>
							<p class="mb-2 col-gray"><b>25</b> Đơn hàng (Trong vòng 6 tháng) &nbsp;&nbsp;&nbsp; <i class="fa fa-usd"></i> Tổng giá trị <b>29.000.000đ</b></p>
							<p>
								<button class="btn btn-sm btn-danger"><i class="fa fa-fw fa-envelope-o"></i> Gửi liên hệ</button>
								<button class="btn btn-sm"><i class="fa fa-fw fa-heart-o"></i> Favorites</button>
							</p>
						</div>
					</div>
					<span class="yearexp"><i class="fa fa-star"></i> {$data.yearexp} Năm</span>
				</div>
			</div>
			{/foreach}

		</div>
	</div>
	
</div>
