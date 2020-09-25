<header id="dheader">
	<div class="head_menu head_top_fixed d-none d-sm-block border-0">
		<div class="container">
			<ul class="nav">
				<li class="nav-item navigation"><a
					class="nav-link text-dark text-nm" href="javascript:void(0)"><i
						class="fa fa-bars"></i></a></li>
				<li class="nav-item"><a class="nav-link text-dark text-nm"
					href="#"><i class="fa fa-search"></i></a></li> {foreach
				from=$a_main_category key=k item=data}
				<li class="nav-item"><a class="nav-link text-dark text-nm"
					href="{$data.url}">{$data.name}</a></li> {/foreach}
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="head_top d-none d-sm-block">
			<div class="d-flex justify-content-between bd-highlight">
				<div class="p-2 bd-highlight">
					<ul class="nav">
						<li class="nav-item navigation"><a class="nav-link text-dark"
							href="javascript:void(0)"><i class="fa fa-bars"></i></a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="#"><i
								class="fa fa-search"></i></a></li>
						{if isset($out.taxonomy_name)}
						<li class="nav-item"><a href="{$arg.thislink}" class="nav-link text-dark text-b">{$out.taxonomy_name}</a></li>
						{/if}
					</ul>
				</div>
				<div class="p-2 bd-highlight">
					<a href="./"><img src="{$arg.logo.image|default:$arg.noimg}"
						height="35"></a>
				</div>
				<div class="p-2 bd-highlight d-none d-sm-block">
					<!-- <a href="#" class="btn btn-primary btn-sm">Đăng ký</a> <a href="#"
						class="btn btn-secondary btn-sm">Đăng nhập</a> -->
					<time data-testid="todays-date text-msm">{$arg.timenow|date_format:"%A,
						%B %e, %Y"}</time>
				</div>

				<!-- 
				<div class="p-2 bd-highlight d-none d-sm-block">
					<a href="#" class="btn btn-primary btn-sm">SUBSCRIBE NOW</a> <a
						href="#" class="btn btn-secondary btn-sm">LOGIN</a>
				</div>
				 -->
			</div>
		</div>

		<div class="mhead_top py-3 border-bottom d-sm-none">
			<div class="row">
				<div class="col-2 d-block d-sm-none align-self-center">
					<a href="javascript:void(0)" class="text-dark mmenu"
						onclick="ShowAllCateNews()"><i class="fa fa-bars"></i></a>
				</div>
				<div class="col-8 text-center">
					<a href="./"><img src="{$arg.logo.image|default:$arg.noimg}"
						height="25"></a>
				</div>
				<div
					class="col-2 d-flex d-sm-none align-self-center justify-content-end">
					<a href="javascript:void(0)" class="text-dark"
						onclick="ShowInfoUser()"><i class="fa fa-users"></i></a>
				</div>
			</div>
		</div>
		{if !isMobile()}
		<div id="home_search" class="py-5 bg-light">
			<div class="col-md-7 p-lg-7 mx-auto">
			{if isset($smarty.get.key)}
				<p>Hiển thị {$out.number} kết quả từ:</p>
			{/if}
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Nhập từ khóa"
						id="search_key" value="{$arg.search_key}">
					<div class="input-group-prepend">
						<span class="input-group-text bg-dark text-white border-0"
							onclick="search()"><i class="fa fa-search"></i></span>
					</div>
				</div>
			</div>
		</div>
		{/if}
		<div class="head_menu d-none d-sm-block">
			<ul class="nav">
				{foreach from=$a_main_category key=k item=data}
				<li class="nav-item {if $k eq 0}active{/if}"><a
					class="nav-link text-dark" href="?mod=posts&site=index&cid={$data.id}">{$data.name}</a></li>
				{/foreach}
			</ul>
		</div>

		<div id="sidebar" class="shadow">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="{$arg.domain}">Trang
						chủ </a></li> {foreach from=$a_main_category key=k item=data}
				<li class="nav-item"><a class="nav-link" href="{$data.url}">{$data.name}
						{if $data.sub} <i class="fa fa-angle-right" aria-hidden="true"></i>
						{/if}
				</a> {if $data.sub}
					<ul class="navbar-nav ml-auto shadow">
						<span class="markPoint"></span> {foreach from=$data.sub item=sub}
						<li class="nav-item"><a class="nav-link" href="{$sub.url}">{$sub.name}</a></li>
						{/foreach}
					</ul> {/if}</li> {/foreach}
			</ul>
		</div>
		<div class="modal v--modal-overlay scrollable" id="fsAllCateNews"
			aria-modal="true">
			<div class="modal-dialog bg-white m-0" role="document">
				<div class="modal-header py-2">
					<h5 class="modal-title text-center">
						<img src="{$arg.logo.image|default:$arg.noimg}" height="26">
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-content mb-2 border-0">
					<div class="modal-body">
						<form class="form-inline">
							<div class="form-group mr-2 mb-2">
								<input type="text" class="form-control" placeholder="Tìm kiếm"
									id="search_key" value="{$arg.search_key}">
							</div>
							<button type="button" class="btn btn-primary mb-2"
								onclick="search()">Tìm</button>
						</form>
					</div>
					<div class="modal-body">
						<div class="nav">
							{foreach from=$a_main_category key=k item=data}
							<h3 class="text-b text-nm w-100">{$data.name}</h3>
							<ul class="row row-no list-unstyled w-100">
								{foreach from=$data.sub item=sub}
								<li class="col-6"><a class="text-nm text-dark"
									href="{$sub.url}">{$sub.name}</a></li> {/foreach}
							</ul>
							{/foreach}
						</div>
					</div>
					<!-- end modal content -->
				</div>
			</div>
		</div>
	</div>
	<!-- end #fsAllCateNews -->
	<div class="modal v--modal-overlay scrollable" id="fsInfoUser"
		aria-modal="true">
		<div class="modal-dialog bg-white m-0" role="document">
			<div class="modal-header py-2">
				<h5 class="modal-title text-center">
					<img src="{$arg.logo.image|default:$arg.noimg}" height="26">
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-content mb-2 border-0">
				<div class="modal-body">
					<!-- 
					<div class="text-center">
						<a href="#" class="text-dark text-sm">SUBSCRIBE NOW</a><span
							class="mx-2">|</span> <a href="#" class="text-dark text-sm">LOGIN</a>
					</div>
				 -->
					<div class="pt-4">
						<ul class="row row-no list-unstyled">
							{foreach from=$a_main_category key=k item=data}
							<li class="col-6"><a href="{$data.url}"
								class="text-nm text-dark">{$data.name}</a></li> {/foreach}
						</ul>
					</div>
				</div>
				<!-- end modal content -->
			</div>
		</div>
	</div>
	<!-- end #fsAllCateNews -->
</header>
<!-- 
<header>
	<div class="container">
		<div class="py-3">
			<div class="row row-no">
				<div class="col-md-3 col-8">
					<a class="logo" href="{$arg.url_blog}"> <img
						src="{$arg.logo.image|default:$arg.noimg}" height="35">
					</a>
				</div>
				<div class="col-md-6 d-none d-md-block">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Nhập từ khóa"
							id="search_key" value="{$arg.search_key}">
						<div class="input-group-prepend">
							<span class="input-group-text bg-dark text-white border-0"
								onclick="search()"><i class="fa fa-search"></i></span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="head_menu d-none d-sm-block">
			<ul class="nav">
				{foreach from=$a_main_category key=k item=data}
				<li class="nav-item"><a class="nav-link text-dark"
					href="?mod=posts&site=index&cid={$data.id}">{$data.name}</a></li>
				{/foreach}
			</ul>
		</div>
	</div>
</header> -->

