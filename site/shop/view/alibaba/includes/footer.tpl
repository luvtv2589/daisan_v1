
<section id="S-10" class="justify-content-center d-none d-lg-block ">
			<div class="box-item">
				<div class="item text-center py-1">
					<a href="{$page.page_contact}"> <i class="icon icon-1"></i> <span
						class="fz-11 d-block">Liên hệ nhà cung cấp</span>
					</a>
				</div>
				<div class="item text-center py-1 dropleft">
					<a href="javascript:void(0)" class="dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
						class="icon rounded-circle"> <img
							src="{$page.logo_custom_img}" class="w-100">
					</i> <span class="fz-11 d-block">Chat Now</span></a>
					<ul class="list-unstyled dropdown-menu">
						<li class="media mb-2"><a href="{$data.url}">Zalo</a></li>
						<li class="media mb-2"><a href="{$data.url}">Facebook</a></li>
						<li class="media mb-2"><a href="{$data.url}">SMS</a></li>
					</ul>
				</div>
				<div class="item text-center py-1 border-bottom">
					<i class="icon icon-2"></i>
				</div>
				<div class="item text-center py-1 btn-group dropleft">
					<a href="javascript:void(0)" class="dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
						class="icon icon-3"></i> <span class="fz-11 d-block">Lịch
							sử duyệt web</span></a>
					<ul class="list-unstyled dropdown-menu">
						{foreach from = $a_product_views item = data}
						<li class="media mb-2"><a href="{$data.url}"><img
								class="mr-3" src="{$data.avatar}" width="72" alt="{$data.name}"></a>
							<div class="media-body">
								<h3 class="mt-0 mb-1 fz-13">
									<a href="{$data.url}">{$data.name}</a>
								</h3>
								<span class="fz-12 d-block"> <span
									class="font-weight-bold">Giá từ 0đ</span> <span
									class="text-muted">/piece</span>
								</span>
							</div></li> {/foreach}
					</ul>
				</div>
				<div class="item text-center py-1">
					<a href="?mod=account&site=messages"><i class="icon icon-4"></i>
						<span class="fz-11 d-block">Tin nhắn liên hệ</span> </a>
				</div>
				<div class="item text-center py-1">
					<i class="icon icon-5"></i> <span class="fz-11 d-block">Quản
						lí thương mại</span>
				</div>
			</div>
			<div class="box-item-bot">
				<div class="item text-center py-3 border-top">
					<i class="icon icon-6"></i>
				</div>
				<div class="item bg-white text-center py-3 border-top">
					<a href="#top"> <i class="icon icon-7"></i>
					</a>
				</div>
			</div>
		</section>

 <footer class="border-top bg-light py-4 d-none d-lg-block mt-5">
        <div class="footer-seo text-center d-none d-md-block">
      <p class="footer-seo-brand">
         <a target="_blank" href="#" class="text-muted">Daisan B2C</a>
         | <a target="_blank" href="#" class="text-muted">Daisannews.com</a>
         | <a target="_blank" href="#" class="text-muted">Daisanplus.com</a>
         | <a target="_blank" href="#" class="text-muted">Cungnhap.vn</a>
         | <a target="_blank" href="#" class="text-muted">Duantoanquoc.com</a>
         | <a target="_blank" href="#" class="text-muted">Daisanmart.com</a>
         | <a target="_blank" href="#" class="text-muted">Thegioioplat.com</a>
         | <a target="_blank" href="#" class="text-muted">Daisan.com.vn</a>
         | <a target="_blank" href="#" class="text-muted">Daisan.vn</a>
         <br>
         <a target="_blank" href="#" class="text-muted">Daisan Hosting</a>
         | <a target="_blank" href="#" class="text-muted">Daisan Domain</a>
         | <a target="_blank" href="#" class="text-muted">Daisaninax.com</a>
         | <a target="_blank" href="#" class="text-muted">Gachinax.com.vn</a>
         | <a target="_blank" href="#" class="text-muted">Rubivina.com.vn</a>
      </p>
<!-- 
      <p class="footer-seo-brand">
         Browse Alphabetically:
         <a target="_blank" href="#" class="text-muted">Help Center</a>
         | <a target="_blank" href="#" class="text-muted">Request For Quotes</a>
         | <a target="_blank" href="#" class="text-muted">Seller Center</a>
         | <a target="_blank" href="#" class="text-muted">Suppliers</a>
      </p>

      <p class="footer-seo-policy">
         <a href="" rel="nofollow" class="text-muted">Product Listing Policy</a>
         - <a href="" class="text-muted">Intellectual Property Protection</a>
         - <a href="" class="text-muted">Privacy Policy</a>
         - <a href="" rel="nofollow" class="text-muted">Terms of Use</a>
         - <a href="" rel="nofollow" class="text-muted">Law Enforcement Compliance Guide</a>
      </p>
 -->
      <p class="footer-copyright">
         <a rel="nofollow" href="" class="text-muted">©</a> 2017-2018 Sàn TMĐT DAISAN. All rights reserved.
      </p>
   </div>
      </footer>