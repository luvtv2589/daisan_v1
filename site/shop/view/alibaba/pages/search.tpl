<div class="container-fluid" id="Products-detail">
	<div class="row row-sm mt-3">
		<div id="barproduct" class="col-lg-2 col-md-3 d-none d-sm-none d-md-block">
			<div class="filter mb-3">
				<h4 class="title py-1">
					<i class="fa fa-list-ul fa-fw"></i> Danh mục liên quan
				</h4>
				<div class="">
					<ul class="list-unstyled">
						{foreach from=$a_main_product_category item=data}
						<li><a class="text-custom" href="{$data.url}">{$data.name}</a></li>
						{/foreach}
					</ul>
				</div>
			</div>
		</div>

		<div class="col-lg-10 col-md-9 " id="Products">

			<div class="card rounded-0 mb-1 d-none d-sm-none d-md-block border-0">
				<div class="card-header pt-0">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active"><b>Danh
									sách sản phẩm</b></a></li>
						<!-- <li class="nav-item"><a href="?mod=page&site=index" class="nav-link">Người bán sỉ</a></li> -->
					</ul>
				</div>
			</div>
			<div class="row py-2 m-0 S-1">
				{foreach from=$result item=data}
				<div class="col-md-3 col-6 pl-0 text-left pb-4">
					<div class="item  pb-4">
						<a href="{$data.url}"><img class="img-thumbnail rounded-0"
							src="{$data.avatar}" width="100%"></a>
						<div>
							<a href="{$data.url}" class="fz-12 text-custom">{$data.name}</a>
						</div>
						<span class="fz-12"><span class="text-muted">Giá từ</span>
							{$data.price}</span> <a href=""
							class="fz-12 d-block mt-3">Chi tiết</a>
					</div>
				</div>
				{/foreach}
			</div>

			<div class="mt-3">{$paging}</div>
		</div>
	</div>

</div>
