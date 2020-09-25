<div class="p-3">
	<h5 class="card-title">Khả năng cung cấp dịch vụ</h5>
	<table class="table table-bordered table-striped mb-0">
		<tr>
			<td>Số lượng nhân viên</td>
			<td>{$page.number_mem_show}</td>
		</tr>
		<tr>
			<td>Khả năng cung cấp</td>
			<td>{$profile.supply_ability}</td>
		</tr>
	</table>
	
	<h5 class="card-title mt-5">Danh sách các trụ sở/ chi nhánh làm việc</h5>
	<table class="table table-bordered table-striped mb-0">
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
