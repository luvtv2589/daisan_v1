<header>
	<div class="head_top">
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-6">
					<a class="navbar-brand d-block d-sm-none" href="./"><img
						src="{$arg.logo.image|default:$arg.noimg}" class="img-fluid"></a>
					<ul class="nav">
						<li class="nav-item  d-none d-sm-block"><a class="nav-link"
							href="{$arg.url_import}">DaisanImport - Sản phẩm nhập khẩu trên hệ thống Daisan.vn</a></li>
					</ul>
				</div>
				<div class="col-xl-6 col-6 d-none d-sm-block">
					<ul class="nav justify-content-end">
					{if $arg.login eq 0}
						<li class="nav-item"><a class="nav-link" href="?mod=account&site=login">Đăng
								nhập</a></li>
					{else}
					<li class="nav-item"><a class="nav-link" href="?mod=account&site=index">Hi, {$user.name|default:''}</a></li>
					{/if}
					</ul>
				</div>
				<div
					class="col-xl-6 col-6 p-2 d-flex justify-content-end align-items-center d-block d-sm-none mmenu"
					onclick="ShowAllService()">
					<img src="{$arg.stylesheet}images/mmenu.png" width="20" height="14">
				</div>
			</div>
			<!--  end row -->
		</div>
	</div>
	
	<!-- emd head-top -->
	<div class="head_main">
		<div class="container px-2 px-sm-3">
			<nav class="navbar navbar-expand-lg px-0">
				<a class="navbar-brand d-none d-sm-block" href="./"><img
					src="{$arg.logo.image|default:$arg.noimg}" height="26"></a>
				<form class="form-inline my-2 my-lg-0 w-sm-100 search">
					<div class="input-group">
						<input type="text" class="form-control border-0 rounded-0"
							placeholder="Nhập từ khóa tìm kiếm" id="search_key"
							value="{$arg.search_key}">
						<div class="input-group-append ">
							<span class="input-group-text border-0 rounded-0" onclick="search();"><i
								class="fa fa-search"></i></span>
						</div>
					</div>
				</form>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown dropdown-large"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Danh mục</a>
						<div
							class="dropdown-menu dropdown-menu-right dropdown-menu-large header_category_tab rounded-0 p-0"
							aria-labelledby="navbarDropdown" style="width: 930px;">
							<form>
								<div class="row row-sm">
									<div class="col-2">
										<div class="nav flex-column nav-pills bg-light"
											id="v-pills-tab" role="tablist" aria-orientation="vertical">
											{foreach from=$a_main_category key=k item=parent} <a
												class="nav-link text-dark {if $k eq 0}active{/if}"
												id="v-pills-home-tab" data-toggle="pill"
												href="#taxonomy{$parent.id}" role="tab"
												aria-controls="v-pills-home" aria-selected="true">{$parent.name}</a>
											{/foreach}
										</div>
									</div>
									<div class="col-10">
										<div class="tab-content pt-2" id="v-pills-tabContent">
											{foreach from=$a_main_category key=k item=parent}
											<div class="tab-pane fade {if $k eq 0}show active{/if}"
												id="taxonomy{$parent.id}" role="tabpanel"
												aria-labelledby="v-pills-home-tab">
												<ul class="row row-sm list-unstyled">
													{foreach from=$parent.sub key=k item=sub}
													<li class="col-2-5"><a href="{$sub.url}"
														class="text-dark font-weight-bold">{$sub.name}</a>
														<ul class="nav flex-column">
															{foreach from=$sub.sub key=h item=sub1}
															{if $h <5}
															<li class="nav-item"><a class="text-dark" href="{$sub1.url}">{$sub1.name}</a></li>
															{/if}
															{/foreach}
														</ul></li> {/foreach}
														
												</ul>
											</div>
											{/foreach}
										</div>
									</div>
								</div>
							</form>
						</div></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link" href="#">Ưu
							đãi thành viên </a></li>
					<li class="nav-item"><a class="nav-link" href="#">Tuyển
							dụng</a></li>
					{if $arg.login neq 0}
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><i class="fa fa-user fa-fw"></i>Tài
							khoản</a>
						<div class="dropdown-menu dropdown-menu-right rounded-0"
							aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item text-secondary" href="?mod=account&site=index"><i class="fa fa-fw fa-user-circle"></i> Thông tin hồ sơ</a>
							<a class="dropdown-item text-secondary" href="?mod=account&site=index"><i class="fa fa-fw fa-key"></i> Đổi mật khẩu</a>
							<a class="dropdown-item text-secondary" href="?mod=account&site=pages"><i class="fa fa-fw fa-globe"></i> Quản lý gian hàng</a> 
							<a class="dropdown-item text-secondary" href="?mod=account&site=createpage"><i class="fa fa-fw fa-plus"></i> Tạo gian hàng</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item text-secondary" href="?mod=account&site=logout"><i class="fa fa-fw fa-sign-out"></i> Đăng xuất</a>
						</div></li>
					{/if}
				</ul>
			</nav>
			<!-- end nav -->
		</div>
		<!-- end nav -->
	</div>
	<!-- emd head-main -->
	<div class="head_menu">
		<div class="container p-0">
			<div class="head_menu_scoll">
				<ul class="nav">
					<li class="nav-item"><a
						class="nav-link font-weight-bold active" href="./">Trang chủ</a></li>
					{foreach from=$a_menu_main item=data}
					<li class="nav-item"><a class="nav-link" href="{$data.url}">{$data.name}</a></li>
					{/foreach}
				</ul>
			</div>
		</div>
		<a href="#collapseExample" data-toggle="collapse" role="button"
			aria-expanded="false" aria-controls="collapseExample"
			class="btn_service d-block d-sm-none"><span class="blind"><i
				class="fa fa-chevron-down"></i></span></a>
	</div>
	<div class="collapse" id="collapseExample">
		<div class="card p-2 rounded-0 border-0">
			<div class="row row-sm">
				{foreach from=$a_main_category key=k item=parent}
				<div class="col-3 mb-2">
					<div class="border px-1 py-2">
						<a href="{$parent.url}" class="text-dark">{$parent.name}</a>
					</div>
				</div>
				{/foreach}
			</div>
		</div>
	</div>
	<!-- end head menu -->
	<!-- mmenu  -->
	<div class="mmenu_content">
		<div class="modal v--modal-overlay scrollable" id="fsAllService">
			<div class="modal-dialog bg-light m-0" role="document">
				<div class="modal-header">
					<h5 class="modal-title">
						<img src="{$arg.logo.image|default:$arg.noimg}" height="30">
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div
					style="margin-top: -48px; margin-left: .5rem; margin-right: .5rem; width: auto;">
					<div class="modal-content rounded-0 mb-2">
						<div class="modal-body">
							<div class="text-center">
								<p class="mb-0">
									Vui lòng <a href="{$arg.url_id}">Đăng nhập</a>
								</p>
								<p class="text-secondary">Đăng nhập và kiểm tra thông tin
									mua sắm của bạn.</p>
							</div>
						</div>
					</div>
					<div
						class="modal-content rounded-0 mb-2 border-top-0 mmenu_my_service">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item w-50"><a
								class="nav-link text-center rounded-0 border-left-0 active "
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">Thể loại</a></li>
							<li class="nav-item w-50"><a
								class="nav-link text-center rounded-0 border-right-0"
								id="profile-tab" data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile" aria-selected="false">Tìm thương
									hiệu</a></li>
						</ul>
						<div class="modal-body">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<ul class="row row-no list-unstyled">
										{foreach from=$a_main_category item=data}
										<li class="col-4 text-center"><a href="{$data.url}"><img
												src="{$data.image}" width="60px" height="60px">
											<p class="text-twoline">{$data.name}</p></a></li> {/foreach}
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-content rounded-0 mb-2 my_service">
						<div class="title">
							<h3>
								<a href="#" class="text-dark">Dịch vụ tiện ích</a>
							</h3>
						</div>
						<div class="modal-body pt-0">
							<ul class="row row-no list-unstyled">
								{foreach from=$a_menu_top item=data}
								<li class="col-6"><a href="{$data.url}"><img
										src="{$data.image}" width="26">&nbsp;{$data.name}</a></li>
								{/foreach}
							</ul>
						</div>
					</div>
					<!-- end modal content -->
				</div>
			</div>
		</div>
	</div>
	<!-- end mmenu -->
</header>
