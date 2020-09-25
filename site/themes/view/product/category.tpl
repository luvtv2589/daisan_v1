<section id="Cate-1">
	<div class="container">
		<div class="sec-title pt-3 mb-2">
			<h2>{$category.name}</h2>
		</div>
		<div class="sec-content card">
			<div class="row m-0">
				<div class="col-lg-3 col-4 h-100 p-0 d-md-block d-none d-sm-none">
					<div class="title">
						<i class="fa fa-list-ul"></i>
						<h3>Danh mục</h3>
					</div>
					<ul class="nav flex-column menu-list">
						{foreach from=$a_category_all key=k item=data}
						<li class="nav-item"><a class="nav-link link-black"
							href="{$data.url}">{$data.name}</a> {if isset($data.sub)}
							<div class="dropdown">
								<ul class="sub-tree list-unstyled">
									{foreach from=$data.sub key=k item=sub}
									<li><a href="{$sub.url}">{$sub.name}</a></li> {/foreach}
								</ul>
							</div> {/if}</li> {/foreach}
					</ul>
				</div>
				<div class="col-lg-9 col-12 h-100 p-0">
					<ul class="list-wrap list-unstyled m-0 list-wrap-1">
						{foreach from=$a_category_hot key=k item=data}
						<li class="item {if $k eq 0 or $k eq 6}active{/if}">
							<div class="item-wrapper">
								<div class="title pl-0">
									<a href="{$data.url}">{$data.name}</a>
								</div>
								<div class="box">
									<div class="img-wrapper">
										<a href="{$data.url}"><img src="{$data.thumb}"
											alt="{$data.name}" width="100%"></a>
									</div>
									<div class="links d-none d-sm-block">
										<div class="links-item"></div>
										<a href="{$data.url}" class="view-more">View More</a>
									</div>
								</div>
							</div>
						</li> {/foreach}
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	$(document).ready(function() {
		$(".list-wrap-1>.item").mouseover(function() {
			$(".list-wrap-1>.item").removeClass("active");
			$(this).addClass("active");
		});
		$(".list-wrap-2>.item").mouseover(function() {
			$(".list-wrap-2>.item").removeClass("active");
			$(this).addClass("active");
		});
	});
</script>

<section id="Cate-3">
	<div class="container">
		<div class="sec-content card mb-4 px-3 pb-4">
			<div class="sec-title pt-3 mb-2">
				<h2>Hot Products</h2>
			</div>
			<div class="product-tab">
				<ul class="nav nav-tabs" id="myTab">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home">Nổi bật</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile">Sản phẩm mới</a></li>
					<li class="nav-item"><a class="nav-link" id="contact-tab"
						data-toggle="tab" href="#contact">Được quan tâm nhất</a></li>
				</ul>
				<div class="tab-content mt-2" id="myTabContent">
					<div class="tab-pane fade show active" id="home"
						aria-labelledby="home-tab">
						<ul class="row m-0">
							{foreach from=$a_product.hot item=data}
							<li class="col-5th"><a href="{$data.url}"
								class="d-block p-3"> <img class="d-block w-100"
									src="{$data.avatar}" alt="{$data.name}">
							</a>
								<div class="prod-info">
									<div class="title">
										<h3>
											<a href="{$data.url}">{$data.name}</a>
										</h3>
									</div>
									<div class="price"><b>{$data.price}{if $data.pricemax gt
									0}-{$data.pricemax|number_format}{/if}</b>{if $data.price neq 0}<span class="unit">/
									{$data.unit}</span>{/if}</div>
								</div></li> {/foreach}
						</ul>
					</div>
					<div class="tab-pane fade" id="profile"
						aria-labelledby="profile-tab">
						<ul class="row m-0">
							{foreach from=$a_product.new item=data}
							<li class="col-5th"><a href="{$data.url}"
								class="d-block p-3"> <img class="d-block w-100"
									src="{$data.avatar}" alt="{$data.name}">
							</a>
								<div class="prod-info">
									<div class="title">
										<h3>
											<a href="{$data.url}">{$data.name}</a>
										</h3>
									</div>
									<div class="price"><b>{$data.price}{if $data.pricemax gt
									0}-{$data.pricemax|number_format}{/if}</b>{if $data.price neq 0}<span class="unit">/
									{$data.unit}</span>{/if}</div>
									<div class="moq">MOQ: {$data.minorder} {$data.unit}</div>
								</div></li> {/foreach}
						</ul>
					</div>
					<div class="tab-pane fade" id="contact"
						aria-labelledby="contact-tab">
						<ul class="row m-0">
							{foreach from=$a_product.topview item=data}
							<li class="col-5th"><a href="{$data.url}"
								class="d-block p-3"> <img class="d-block w-100"
									src="{$data.avatar}" alt="{$data.name}">
							</a>
								<div class="prod-info">
									<div class="title">
										<h3>
											<a href="{$data.url}">{$data.name}</a>
										</h3>
									</div>
									<div class="price"><b>{$data.price}{if $data.pricemax gt
									0}-{$data.pricemax|number_format}{/if}</b>{if $data.price neq 0}<span class="unit">/
									{$data.unit}</span>{/if}</div>
									<div class="moq">MOQ: {$data.minorder} {$data.unit}</div>
								</div></li> {/foreach}
						</ul>
					</div>
				</div>
				<!-- end tab-content -->
			</div>
		</div>
	</div>
</section>

<section id="Cate-2">
	<div class="container ">
		{foreach from=$a_category_list item=cate}
		<div class="row m-0 card mb-3">
			<div class="col-lg-2 p-0 bdr-1">
				<div class="title">
					<a href="">{$cate.name}</a>
				</div>
				<div class="line-cutter"></div>
				<ul class="text-center">
					{foreach from=$cate.sub item=sub}
					<li><a href="{$sub.url}" class="card text-center">{$sub.name}</a></li>
					{/foreach}
				</ul>
			</div>
			<div class="col-lg-10">
				<div class="row m-0">
					{foreach from=$cate.products item=data}
					<div class="col-6 col-lg-3 h-50 mt-3 bdb-1 pb-3">
						<a href="{$data.url}" class="d-block p-3"> <img
							src="{$data.avatar}" alt="{$data.name}" class="w-100"> </a> <span
							class="name mt-2 d-block">{$data.name}</span>
							
						<span class="d-block mt-2"><b>{$data.price}</b>{if
										$data.pricemax gt 0}-{$data.pricemax|number_format}<span class="unit">/
									{$data.unit}</span>{/if}</span>
					</div>
					{/foreach}
				</div>
			</div>
		</div>
		{/foreach}
	</div>
</section>
