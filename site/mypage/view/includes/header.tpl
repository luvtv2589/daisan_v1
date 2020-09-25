<header>
	<div class="container-fluid">
		<div class="row">
			<div class="col-2">
				<a href="{$arg.url_location}">
					<img src="{$arg.logo.image|default:$arg.noimg}" height="50">
				</a>
			</div>
			<div class="col-5">
				<div class="ml-4">
					<h1><a href="./">Webmaster System</a></h1>
					<h3 class="col-gray"><i class="fa fa-fw fa-diamond"></i> {$page.name}</h3>
				</div>
			</div>
			<div class="col">
				<ul class="nav justify-content-end mt-2">
					<li class="nav-item">
						<a class="nav-link active btn btn-primary btn-sm" href="{$page.url}"><i class="fa fa-home"></i> Trang chủ gian hàng</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active p-0 pl-3" href="{$arg.domain}?mod=account&site=index">
							<img src="{$user.avatar}" class="avatar">{$user.name}
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</header>
