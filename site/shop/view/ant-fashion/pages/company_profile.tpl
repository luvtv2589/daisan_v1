<div class="p-3">
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
</div>
