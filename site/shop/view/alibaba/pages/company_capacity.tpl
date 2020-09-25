
<section class=" S-1 company_information">
	<div class="row m-0">
		<div class="col-md-2 d-none d-lg-block SS-99">
			<div class="border-right">
				<div class="fz-12 text-left border-bottom pb-2 mb-2">
					<div class="font-weight-bold p-1">Thông tin tổng quan</div>
					<div class="p-1 active">
						<a href="" class="text-dark">Thông tin tổng quan</a>
					</div>
				</div>
				<div class="fz-12 text-left border-bottom pb-2 mb-2">
					<div class="font-weight-bold p-1">Hồ sơ công ty</div>
					<div class="p-1">
						<a href="{$a_main_menu.company_profile}" class="text-dark">Hồ
							sơ công ty</a>
					</div>
				</div>
				<div class="fz-12 text-left pb-2 mb-2">
					<div class="font-weight-bold p-1">Khả năng của công ty</div>
					<div class="p-1">
						<a href="{$a_main_menu.company_capacity}" class="text-dark">Khả
							năng của công ty</a>
					</div>
					<div class="p-1">
						<a href="{$a_main_menu.company_capacity}" class="text-dark">Khả
							năng sản xuất</a>
					</div>
					<div class="p-1">
						<a href="{$a_main_menu.company_capacity}" class="text-dark">Kiểm
							soát chất lượng</a>
					</div>
					<div class="p-1">
						<a href="{$a_main_menu.company_capacity}" class="text-dark">Công
							suất R & D</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-10 col-12">

			<div class="bg-white-1 pb-2 mt-3">
				<div class="row">
					<div class="col-md-8">
						<h4 class="mb-0 font-weight-bold d-inline-block">Khả năng
							cung cấp dịch vụ</h4>

					</div>
					<div class="col-md-4 text-right">
						<a href="" class="fz-10 mr-2">View More ></a> <a
							href="{$info.url_contact}"
							class="btn btn-custom-3 text-white font-weight-bold px-3 fz-12 btn-sm mt-1"><i
							class="fa fa-envelope fa-fw"></i> Gửi liên hệ</a> <a
							href="{$a_main_menu.product_list} "
							class="btn btn-custom-4 text-white btn-sm mt-1 fz-12"><i
							class="fa fa-check fa-fw"></i> Đặt hàng</a>
					</div>
				</div>
			</div>
			<div class="p-3 fz-12">
				<span>Số lượng nhân viên trong mỗi dây chuyền sản xuất</span> <span
					class="d-inline-flex ml-2 SS-1"> <img
					src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
					class="cl-oran">Đã xác nhận</span> <span class="SSS-1"> <span>xác
							nhận qua</span> <a href=""> <img
							src="{$arg.stylesheet}/images/ic-24.png" width="50" height="30">
							<span class="fz-12">SGS Group</span>
					</a>
				</span>
				</span>
				<table class="table mt-3 table-striped table-bordered">
					<thead class="table-primary">
						<tr>
							<th>#</th>
							<th>#</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Số lượng nhân viên</td>
							<td>{$page.number_mem_show}</td>
						</tr>
						<tr>
							<td>Khả năng cung cấp</td>
							<td>{$profile.supply_ability}</td>
						</tr>
					</tbody>
				</table>
				<span>Danh sách các trụ sở/ chi nhánh làm việc</span>
				<table class="table mt-3">
					<thead class="table-primary">
						<tr>
							<th>Chi nhánh</th>
							<th>Thông tin</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$address item=data}
						<tr>
							<td>
								<h6>{$data.name}</h6>
							</td>
							<td>
								<p>Địa chỉ: {$data.address}</p>
								<p>Hotline: {$data.phone}</p>
								<p>Email: {$data.email}</p>
							</td>
							<td><span class="d-inline-flex ml-2 SS-1"> <img
									src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
									class="cl-oran">Đã xác nhận</span>
							</span></td>
						</tr>
						{/foreach}

					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
