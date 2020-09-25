<header>
	<div class="container">
		<div class="py-3">
		<div class="row row-no">
			<div class="col-md-2 col-12">
				<a class="logo d-none d-md-block" href="{$arg.domain}">
					<img src="{$arg.logo.image|default:$arg.noimg}" height="38">
				</a>
				<span onclick="goBackHistory()" class="d-block d-sm-none float-left pr-3"><i class="fa fa-arrow-left"></i></span>
					<span class="title d-block d-sm-none">Yêu cầu báo giá</span>
			</div>
			<div class="col-md-7 d-none d-md-block">
				<h2><a href="./">Yêu cầu báo giá</a></h2>
			</div>
			<div class="col-md-3 col-4 text-right">
				<a href="?site=createRfq" class="btn btn-primary d-none d-md-block">
					<span><i class="fa fa-plus"></i> Tạo yêu cầu</span>
				</a>
			</div>
		</div>
		</div>
	</div>
</header>