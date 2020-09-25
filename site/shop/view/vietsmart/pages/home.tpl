<div class="container">
	<div class="text-center mb-4">
		<h3>Bạn đang cần trợ giúp ?</h3>
		<h5>Hãy liên hệ tới nhân viên của chúng tôi để nhận được sự hỗ trợ tốt nhất cho những thắc mắc của bạn</h5>
		<div class="row row-sm justify-content-md-center mt-4">
			{foreach from=$a_home_supporters item=data}
			<div class="col-md-2 col-6">
				<div class="card mb-4 supporter">
				<div class="p-3 pl-4 pr-4">
					<a href="tel:{$data.phone}" class="d-block rounded-circle o-hidden bg-gray avatar"><img alt="avatar" src="{$data.avatar}" width="100%"></a>
				</div>
				<p class="mb-1"><b>{$data.name}</b></p>
				<p><a href="tel:{$data.phone}"><b>{$data.phone}</b></a></p>
				</div>
			</div>
			{/foreach}
		</div>
	</div>
</div>

<div class="bg-white">
	<div class="container">
		<div class="text-center pt-4 pb-4">
			<h3>Dịch vụ của chúng tôi</h3>
			<div class="row justify-content-center mt-4" id="services">
				{foreach from=$services key=k item=data}
				<div class="col-md-3">
					<div class="card mb-4 rounded-0">
						<a href="{$data.url}" class="o-hidden"><img class="card-img-top rounded-0" src="{$data.avatar}" alt="{$data.name}"></a>
						<div class="card-body px-2">
							<h5 class="card-title">
								<a href="{$data.url}">{$data.name}</a>
							</h5>
							<p class="card-text price mb-1">Giá từ {$data.price|number_format}đ</p>
							<p class="desc mb-0"><small>{$data.description}</small></p>
						</div>
					</div>
				</div>
				{/foreach}
			</div>
			<p>
				<a class="btn btn-success" href="?mod=service&site=index&pageId={$arg.page_id}">Xem tất cả dịch vụ</a>
			</p>
		</div>
	</div>
</div>


<div class="container">
	<div class="text-center pt-4 mb-4">
		<h3>Đối tác của chúng tôi</h3>
		<h5>Đây là những đơn vị cùng hợp tác với chúng tôi trong công việc, kinh doanh</h5>
		<div class="row justify-content-center row-sm">
			{foreach from=$partners item=data}
			<div class="col-2">
				<div class="card mb-2 rounded-0 pt-2 pb-2 p-1">
					<a href="{$data.url}" title="{$data.name}"><img alt="{$data.name}" src="{$data.logo_custom}" width="100%"></a>
				</div>
			</div>
			{/foreach}
		</div>
	</div>
</div>