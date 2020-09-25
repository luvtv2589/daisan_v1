<div class="row">
	<div class="col-md-8">
		<div class="card mt-3 rounded-0">
			<div class="card-header">
				<h4 class="mb-0">Danh sách tin tuyển dụng</h4>
			</div>
				
			<div class="card-body">
				<h1>{$post.title}</h1>
				<div class="mb-2 mt-4">
					<button class="btn"><i class="fa fa-fw fa-star-o"></i>Lưu việc làm</button>
					<button class="btn"><i class="fa fa-fw fa-check"></i>Ứng tuyển</button>
					<span><i class="fa fa-fw fa-clock-o"></i>Hạn nộp hồ sơ: {$post.date_finish|date_format:'%d-%m-%Y'}</span>
				</div>
				<div>
					<small class="mr-2">Lượt xem: 629</small>
					<small class="mr-2">Mã: PID1</small>
					<small>Ngày làm mới: {$post.created|date_format:'%d-%m-%Y'}</small>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-6">
						<p><i class="fa fa-fw fa-usd"></i>Mức lương: {$post.salary}</p>
					</div>
					<div class="col-md-6">
						<p><i class="fa fa-fw fa-map-marker"></i>Địa điểm làm việc: {$post.place}</p>
					</div>
					<div class="col-md-6">
						<p><i class="fa fa-fw fa-usd"></i>Kinh nghiệm: {$post.salary}</p>
					</div>
					<div class="col-md-6">
						<p><i class="fa fa-fw fa-map-marker"></i>Chức vụ: {$post.place}</p>
					</div>
					<div class="col-md-6">
						<p><i class="fa fa-fw fa-usd"></i>Yêu cầu bằng cấp: {$post.salary}</p>
					</div>
					<div class="col-md-6">
						<p><i class="fa fa-fw fa-map-marker"></i>Hình thức làm việc: {$post.place}</p>
					</div>
					<div class="col-md-6">
						<p><i class="fa fa-fw fa-usd"></i>Số lượng cần tuyển: {$post.salary}</p>
					</div>
					<div class="col-md-6">
						<p><i class="fa fa-fw fa-map-marker"></i>Yêu cầu giới tính: {$post.place}</p>
					</div>
					<div class="col-md-6">
						<p><i class="fa fa-fw fa-usd"></i>Ngành nghề: {$post.salary}</p>
					</div>
					<div class="col-md-6">
						<p><i class="fa fa-fw fa-map-marker"></i>Yêu cầu độ tuổi: {$post.place}</p>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<div class="col-md-4">
		<div class="card mt-3 rounded-0">
			<div class="card-body">
				<div class="text-center">
					<img alt="{$page.name}" class="mb-3" src="{$page.logo_custom_img}">
					<h3>{$page.name}</h3>
				</div>
				<hr>
				<p>Điện thoại: {$page.phone}</p>
				<p>Email: {$page.email}</p>
				<p>Website: {$page.website}</p>
				<p>Địa chỉ: {$page.address}</p>
			</div>
		</div>	
	</div>
</div>
