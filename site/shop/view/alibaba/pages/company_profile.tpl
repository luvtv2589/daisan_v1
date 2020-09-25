<!--  <div class="p-3">
   <h5 class="card-title">Thông tin hồ sơ doanh nghiệp</h5>
   <table class="table table-bordered table-striped mb-0">
   	<tr>
   		<td>Loại hình doanh nghiệp</td>
   		<td>Công ty Thương mại</td>
   	</tr>
   	<tr>
   		<td>Giấy phép kinh doanh</td>
   		<td>
   			<p>Tên công ty: <b>{$page.name}</b></p>
   			<p>Mã doanh nghiệp: {$page.code}</p>
   			<p>Ngày bắt đầu hoạt động: {$page.date_start|date_format:'%d-%m-%Y'}</p>
   			<p>Địa chỉ đăng ký kinh doanh: {$page.address}</p>
   			<p>Số lượng nhân viên: {$page.number_mem_show}</p>
   		</td>
   	</tr>
   	{foreach from=$address item=data}
   	<tr>
   		<td><h6>{$data.name}</h6></td>
   		<td>
   			<p>Địa chỉ: {$data.address}</p>
   			<p>Hotline: {$data.phone}</p>
   			<p>Email: {$data.email}</p>
   		</td>
   	</tr>
   	{/foreach}
   </table>
  -->
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
		<div class="S-1 company_information" id="company_information">
			<div class="rounded-0">
				<div class="bg-white pb-2">
					<div class="row">
						<div class="col-md-8">
							<h4 class="mb-0 font-weight-bold d-inline-block">Hồ sơ công
								ty</h4>
						</div>
						<div class="col-md-4 text-right">
							<a href="" class="fz-10 mr-2"> <i class="icon-chat"></i>Chat
								Now!
							</a> <a href="{$info.url_contact}"
								class="btn btn-custom-3 text-white font-weight-bold px-3 fz-12 btn-sm mt-1"><i
								class="fa fa-envelope fa-fw"></i> Gửi liên hệ</a> <a
								href="{$a_main_menu.product_list}"
								class="btn btn-custom-4 text-white btn-sm mt-1 fz-12"><i
								class="fa fa-check fa-fw"></i> Đặt hàng</a>
						</div>
					</div>
				</div>
				<div class="p-3">
					<div class="fz-12 font-weight-bold">Kiểm tra tại chỗ</div>
					<div class="d-flex mt-2 fz-12">
						<img src="{$arg.stylesheet}images/ic-25.gif" width="47"
							height="47"> <span class="ml-2"> Cơ sở công ty của
							nhà cung cấp đã được nhân viên Daisan kiểm tra để xác minh
							các hoạt động tại chỗ tồn tại ở đó. Công ty xác minh của bên thứ
							ba đã xác nhận sự tồn tại hợp pháp của nhà cung cấp. Tìm hiểu
							thêm về đại lý xác minh của bên thứ ba <a href=""> thông tin
								ZD</a>.<a href="">Trách nhiệm pháp lý được kiểm tra tại chỗ</a>.
						</span>
					</div>
					<div class="fz-12 text-right border-bottom pb-2">
						<a href="">Giới thiệu về dịch vụ xác minh</a>
					</div>
					<div class="fz-12 font-weight-bold mt-3">Thông tin được xác
						minh bởi Kiểm tra tại chỗ</div>
					<table class="fz-12 mt-2">
						<tbody>
							<tr>
								<td width="30%">Tên công ty:</td>
								<td>{$page.name}</td>
							</tr>
							<tr>
								<td>Mã số thuế:</td>
								<td>{$page.code}</td>
							</tr>
							<tr>
								<td>Ngày bắt đầu hoạt động:</td>
								<td>{$page.date_start|date_format:'%d-%m-%Y'}</td>
							</tr>
							<tr>
								<td>Địa chỉ đăng ký kinh doanh:</td>
								<td>{$page.address}</td>
							</tr>
							<tr>
								<td>Số lượng nhân viên:</td>
								<td>{$page.number_mem_show}</td>
							</tr>
						</tbody>
					</table>
					<table class="fz-12 mt-4">
						<tbody>
							{foreach from=$address item=data}
							<tr class="mt-4">
								<td class="font-weight-bold" width="28%">{$data.name}</td>
								<td>Địa chỉ: {$data.address}</td>
							</tr>
							<tr class="mt-4">
								<td class="font-weight-bold"></td>
								<td>Hotline: {$data.phone}</td>
							</tr>
							<tr class="mt-4">
								<td class="font-weight-bold"></td>
								<td>Email: {$data.email}</td>
							</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>