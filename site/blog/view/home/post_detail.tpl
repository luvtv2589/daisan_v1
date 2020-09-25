<section class="pt-3">
	<div class="d-flex nav_category_menu">
		<nav class="my-3">{$breadcrumb|default:''}</nav>
	</div>
	<div class="row">
		<div class="col-md-8 border-right" id="post_detail">
			<h1 class="text-biggest text-b">{$info.title}</h1>
			<div class="fb_social">
				<ul class="nav">
					<li class="nav-item px-2"><div class="fb-like"
							data-href="{$arg.thislink}" data-layout="button_count"
							data-action="like" data-size="small" data-show-faces="false"
							data-share="true"></div></li>
					<li class="nav-item px-2"><div class="zalo-share-button"
							data-href="{$arg.thislink}" data-oaid="3157336717374702729"
							data-layout="1" data-color="blue" data-customize=false></div></li>
				</ul>
			</div>
			<p class="font-weight-bold">{$info.description}</p>
			<div class="content">{$info.content}</div>
			<div class="content_info text-center bg-warning pt-2 mb-3">
			<ul class="list-unstyled mb-0 text-nm">
				<li class="nav-item py-2 text-b">🏢 Công ty CP Xây dựng SX&TM Đại Sàn</li>
				<li class="nav-item py-2">☎️ TƯ VẤN HỖ TRỢ: 1800 6464 98 & 0986 25 8282</li>
				<li class="nav-item py-2">🏠 VPGD Hà Nội: Tầng 2 số 8 Cát Linh, Đống Đa, Hà Nội</li>
				<li class="nav-item py-2">🏠 VPGD Đà Nẵng: 265 Cách Mạng Tháng 8, Phường Khuê Trung, Quận Cẩm Lệ, TP. Đà Nẵng</li>
				<li class="nav-item py-2">🏠 VPGD HCM: Số 2/9 Phạm Văn Bạch, Tân Bình, HCM</li>
				<li class="nav-item py-2">🌐 Website: https://daisan.vn</li>
			</ul>
			</div>
		</div>
		<div class="col-md-4">
			<section>
				<a href=""><img
					src="{$arg.stylesheet}images/48522b52393bc5659c2a.jpg"
					class="img-fluid d-block mb-2"></a>
			</section>
			<section class="section_list_post">
				<ul class="list-unstyled mb-0">
					{foreach from=$a_other key=h item=post} {if $h le 4}
					<li class="post_item py-2">
						<div class="media">
							<div class="media-body">
								<h3 class="text-lg text-mbiggest text-b post_title">
									<a href="{$post.url}" class="text-dark">{$post.title}</a>
								</h3>
								<p class="mb-1 text-twoline text-mbiggest">{$post.description}</p>
								<p class="card-text">
									<small class="text-muted"><i class="far fa-clock fa-fw"
										aria-hidden="true"></i>{$post.updated|date_format:'%d-%m-%Y
										%H:%M'}</small>

								</p>
							</div>
							<a href="{$post.url}"><img src="{$post.avatar}" class="ml-2"
								alt="{$post.name}" height="130"></a>
						</div>
					</li> {/if} {/foreach}
				</ul>
			</section>
		</div>
	</div>
</section>