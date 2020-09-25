
<link href="{$arg.stylesheet}css/cloud-zoom.css" rel="stylesheet">
<span data-swiftype-name="price" data-swiftype-type="float" class="d-none">{$swiftype_price|default:0}</span>
<span data-swiftype-name="image" data-swiftype-type="enum" style="display:none;">{$info.avatar}</span>
<span data-swiftype-name="category" data-swiftype-type="string" style="display:none;">{$info.category}</span>
<span data-swiftype-name="category_id" data-swiftype-type="enum" style="display:none;">{$info.tax_id}</span>
<span data-swiftype-name="brand" data-swiftype-type="string" style="display:none;">{$info.trademark}</span>
<span data-swiftype-name="supplier" data-swiftype-type="string" style="display:none;">{$page.name}</span>
<div class="container container_detail mt-3 d-none d-sm-block">
	{if $info.taxonomy_id}
	<nav>
		<ol class="breadcrumb">
			{$breadcrumb}
			<li>&nbsp;({$a_cate_number[$info.taxonomy_id]|default:0})</li>
		</ol>
	</nav>
	{/if}
	<div class="row row-sm">
		<div class="col-xl-10 col-lg-9 col-md-9" id="ProductDetail">
			<div class="card-group">
				<div class="card rounded-0" style="flex-grow: 0.75;z-index:99" id="productimg">
					<div class="card-body">
						<div class="zoom-section">
							<div class="zoom-small-image">
								<div id="wrap"
									style="top: 0px; z-index: 1000; position: relative;">
									<a href="{$info.avatar}" class="cloud-zoom" id="zoom1"
										rel="adjustX:10, adjustY:-4"
										style="position: relative; display: block;"> <img
										src="{$info.avatar}" width="100%" style="display: block;">
									</a>
								</div>
							</div>
							<p class="zoom">
								<i class="fa fa-arrows-alt"></i> Click to enlarge
							</p>
							<div class="zoom-desc slide_option img_tiny">
								{foreach from=$info.a_images key=k item=data} <a href="{$data}"
									class="cloud-zoom-gallery"
									rel="useZoom: 'zoom1', smallImage: '{$data}'"> <img
									class="zoom-tiny-image thumbnail" src="{$data}" width="100%">
								</a> {/foreach}
							</div>
						</div>

						<div class="mt-3 d-flex">
							<button class="btn btn-sm btn-link"
								onclick="SetFavorites({$info.id});">
								<i class="fa fa-fw fa-heart-o"></i> Yêu thích
							</button>
							<div class="align-self-center ml-3" id="Share-11">
								<button class="btn btn-sm btn-link">
									<i class="fa fa-share-square"></i> Share
								</button>
								<div
									class="dropdown-menu border-0 rounded-0 animated zoomIn px-2">
									<a class="mr-2" target="_blank"
										href="https://www.facebook.com/sharer/sharer.php?u={$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}">
										<img src="{$arg.stylesheet}images/fb.svg" width="22">
									</a> <a class="mr-2"
										href="https://plus.google.com/share?url={$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}">
										<img src="{$arg.stylesheet}images/g.svg" width="22">
									</a> <a class="mr-2"
										data-href="{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
										data-oaid="579745863508352884" data-layout="2"
										data-color="blue" data-customize=false> <img
										src="{$arg.stylesheet}images/zalo.jpg" width="22">
									</a>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="card rounded-0">
					<div class="card-body">
						<h1 class="mb-0">{$info.name}</h1>
						<p class="my-1">
							<span class="col-gray product_code">Mã:{$info.code} &nbsp;|&nbsp;</span>{if
							$info.trademark} <span class="col-gray">Thương hiệu:</span>
							{$info.trademark} {/if}
						</p>
					</div>
					<div class="card-header">
						<b>Gửi yêu cầu</b>, <a href="javascript:void(0)"
							data-toggle="modal" data-target="#exampleModal" class="link_sourcing">Nhận giá mới
							nhất</a>{if $out.role_edit}<a href="javascript:void(0)"
							onclick="loadPrice({$info.id});" class="text-info1">(Sửa giá)</a>{/if}

					</div>
					{if $info.prices|@count gt 1}
					<div class="border-bottom">
						{foreach from=$info.prices key=k item=data}
						<div class="float-left price-item">
							<div class="card-body bg-transparent py-2">
								<p class="card-text m-0">{$data.version}</p>
								<h5 class="card-title font-weight-bold mb-0 {if $smarty.get.eventproduct_id && $k eq 1}price-event{/if}">{$data.price|number_format}
									VNĐ/ {$info.unit}</h5>
							</div>
						</div>
						{/foreach}
					</div>
					{/if}
					
					{if $info.prices|@count le 1}
					<div class="card-body">
						<h5>
							<b>{$info.price}</b> | <span>{$info.unit}
								(Đặt hàng tối thiểu {$info.minorder}&nbsp;{$info.unit} )</span>
						</h5>
					</div>
					{/if}
					<div class="card-header">
						{if $info.ordertime}
						<p class="mb-1">
							Xử lý đơn hàng: <b>{$info.ordertime|default:''}</b>
						</p>
						{/if} {if $info.ability}
						<p class="mb-2">
							Khả năng cung cấp: <b>{$info.ability|default:''}</b>
						</p>
						{/if}
						<div class="mt-3">
							<a class="btn btn-danger btncontact mb-2"
								href="javascript:void(0)" data-toggle="modal" data-target="#exampleModal"> <i
								class="fa fa-fw fa-envelope-open-o"></i> Liên Hệ Nhà Cung Cấp
							</a> 
							<a class="btn btn-warning mb-2 font-weight-bold show_phone"
								href="javascript:void(0)" onclick="SaveInfoCall({$info.id},0)">
								<i class="fa fa-fw fa-phone"></i>Xem số điện thoại
							</a>
							{if $info.order} <a class="btn btncontact-outline mb-2"
								href="{$info.url_addcart}"> <i
								class="fa fa-fw fa-shopping-cart"></i> Đặt Hàng Ngay
							</a>
							{/if}
						</div>
					</div>
					<div class="alert alert-success alert-hotline rounded-0 border-0 mb-0"
						role="alert">
						 <input type="hidden" class="phonenumber" value="{$page.phone}">
						 <input type="hidden" class="url" value="{$arg.thislink}">
						<p>
							<small>Thông báo*: Chúng tôi đang tiến hành xác minh giá
								sản phẩm các nhà cung cấp trên hệ thống website. Giá sản phẩm
								hiện nay có thể chưa chính xác</small>
						</p>
						<hr>
						<p class="mb-0">
							<small>Vui lòng <a href="javascript:void(0)" data-toggle="modal" data-target="#exampleModal"
								class="btn btn-primary btn-hotline">Gửi yêu cầu</a> để nhận báo
								giá mới nhất
							</small>
						</p>
					</div>
					<div class="card-body">
						<div>
							<div class="row mx-0">
								<div class="col-sm-3 col-6 px-0">
									<div class="item text-nm mb-1">
										<span><i class="fa fa-comments-o pr-2 fa-fw text-dark"
											aria-hidden="true"></i>Hỗ trợ người bán: </span>
									</div>
								</div>
								<div class="col-sm-9">
									<div class="item text-nm mb-1">
										<span>Giao dịch an toàn</span>
									</div>
								</div>
								<div class="col-sm-3 col-6 px-0">
									<div class="item text-nm mb-1">
										<span><i class="fa fa-cc-discover fa-fw pr-2 text-dark"
											aria-hidden="true"></i>Thanh toán:</span>
									</div>
								</div>
								<div class="col-sm-9">
									<span class="payment-item visa"></span> <span
										class="payment-item mastercard"></span> <span
										class="payment-item tt"></span> <span
										class="payment-item e-checking"></span>
								</div>
								<div class="col-sm-3 col-6 px-0">
									<div class="item text-nm mb-1">
										<span><i class="fa fa-truck fa-fw pr-2 text-dark"
											aria-hidden="true"></i>Đổi trả và bảo hành:</span>
									</div>
								</div>
								<div class="col-sm-9">
									<ul class="nav flex-column">
										<li class="nav-item"><i
											class="fa fa-circle fz-4 pr-2 fa-fw text-dark"></i>14 ngày
											đổi trả dễ dàng</li>
										<li class="nav-item"><i
											class="fa fa-circle fz-4 pr-2 fa-fw text-dark"></i>Hàng chính
											hãng</li>
										<li class="nav-item"><i
											class="fa fa-circle fz-4 pr-2 fa-fw text-dark"></i>Nhà cung
											cấp giao hàng</li>
									</ul>
								</div>
							</div>
							<p>
								Từ khóa:&nbsp;{foreach from = $keywords item =data}<a
									href="{$data.url}" class="badge badge-warning mr-2 p-2">{$data.name}</a>{/foreach}
							</p>
						</div>
					</div>
				</div>
			</div>
			
			<div id="ProductInfo" class="mt-2 mb-3">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">Thông tin sản phẩm</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">Hồ sơ công ty</a></li>
				</ul>

				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<div class="nav-con">
							<ul class="nav">
								<li class="nav-item active"><a href="{$arg.thislink}#one"
									class="nav-link">Mô tả sản phẩm</a></li>
								<li class="nav-item"><a href="{$arg.thislink}#two"
									class="nav-link">Đóng gói và vận chuyển</a></li>
								<li class="nav-item"><a href="{$arg.thislink}#three"
									class="nav-link">Dịch vụ của chúng tôi</a></li>
								<li class="nav-item"><a href="{$arg.thislink}#four"
									class="nav-link">Thông tin công ty</a></li>
								<li class="nav-item"><a href="{$arg.thislink}#five"
									class="nav-link">Câu hỏi thường gặp</a></li>
							</ul>
						</div>
						<div class="card-body widget-detail-overview border">
							<h3>Tổng Quan</h3>
							<div class="row">
								<div class="col-md-12">
									<div class="float-left w-100">
										<div class="do-entry-title">Thông số sản phẩm</div>
										{foreach from=$info.metas item=data}
										<dl>
											<dt>{$data.meta_key}:</dt>
											<dd>{$data.meta_value}</dd>
										</dl>
										{/foreach}
										<div class="clearfix"></div>
									</div>
									<div class="float-left widget-item w-100" id="two">
										<div class="do-entry-title">Đóng gói và vận chuyển</div>
										<dl class="w-100">
											<dt>Quy cách đóng gói:</dt>
											<dd>{$info.package|nl2br}</dd>
										</dl>
										<dl class="w-100">
											<dt>Thời gian xử lý:</dt>
											<dd>{$info.ordertime}</dd>
										</dl>
									</div>
									<div class="float-left widget-item w-100" id="one">
										<div class="do-entry-title">Mô tả sản phẩm</div>
										<div class="py-3">{$info.description}</div>
									</div>
									{if $info.qa}
									<div class="do-overview">
										<div class="do-entry-title w-100">Câu hỏi thưởng gặp</div>
										<div class="py-3">{$info.qa|nl2br}</div>
									</div>
									{/if}
								</div>
							</div>

							<!-- Bình luận
							<div class="card">
								<div class="card-body sendcomment">
									<h3>Chia sẻ nhận xét của bạn về {$info.name}</h3>
									<input type="hidden" name="user_id" value="{$arg.login}">
									<input type="hidden" name="page_id"
										value="{$info.page_id|default:0}"> <input
										type="hidden" name="product_id" value="{$info.id|default:0}">
									<textarea rows="" cols=""
										placeholder="Nhập câu hỏi / bình luận / nhận xét tại đây..."
										class="form-control"></textarea>
									<p class="py-2">Bạn đang băn khoăn cần tư vấn? Vui lòng để
										lại số điện thoại hoặc lời nhắn, nhân viên META sẽ liên hệ trả
										lời bạn sớm nhất.</p>
									<div class="input-account-form">
										<h3>Cung cấp thông tin cá nhân</h3>
										<div class="row">
											<div class="col-6">
												<div class="form-group col-md-6 p-0">
													<label for="inputEmail4">Họ và tên</label> <input
														type="email" class="form-control" id="inputEmail4"
														placeholder="Nhập tên của bạn">
												</div>
												<div class="form-group col-md-6 p-0">
													<label for="inputEmail4">Email</label> <input type="email"
														class="form-control" id="inputEmail4"
														placeholder="Địa chỉ email - không bắt buộc">
												</div>
											</div>
											<div class="col-6"></div>
										</div>
									</div>
									<p>
										<button type="button" class="btn btn-primary"
											onclick="SendComment()">Gửi bình luận</button>
									</p>
								</div>
							</div>
							<div id="msgbody">
								{foreach from=$contacts key=k item=data} {if $data.isreply eq 0}
								<div class="row row-sm msg right">
									<div class="col-md-11">
										<div class="mb-1">
											<b>{$data.name}</b> <span class="ml-2">{$data.created|date_format:'%H:%M
												%d/%m/%Y'}</span>
										</div>
										<div class="content">{$data.message}</div>
									</div>
									<div class="col-md-1">
										<img alt="{$data.name}" src="{$data.avatar}"
											class="w-100 rounded-circle">
									</div>
								</div>
								{else}
								<div class="row row-sm msg">
									<div class="col-md-1">
										<img alt="{$data.name}" src="{$data.avatar}"
											class="w-100 rounded-circle">
									</div>
									<div class="col-md-11">
										<div class="mb-1">
											<b>{$data.name}</b> <span class="ml-2">{$data.created|date_format:'%H:%M
												%d/%m/%Y'}</span>
										</div>
										<div class="content">{$data.message}</div>
									</div>
								</div>
								{/if} {/foreach}
							</div>
							<!-- end bình luận -->

							<h5 class="mt-4" id="price">Bảng giá chi tiết</h5>
							<table class="table table-bordered">
								{foreach from=$info.prices item=data}
								<tr>
									<td width="40%">{$data.version}</td>
									<td class="text-right">{$data.price|number_format}đ</td>
								</tr>
								{/foreach}
							</table>

						</div>
						<!-- end card-body -->
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<div class="nav-con">
							<ul class="nav">
								<li class="nav-item active"><a href="{$arg.thislink}#tab-1"
									class="nav-link">Thông tin tổng quan</a></li>
								<li class="nav-item"><a href="{$arg.thislink}#tab-2"
									class="nav-link">Hồ sơ công ty</a></li>
								<li class="nav-item"><a href="{$arg.thislink}#tab-3"
									class="nav-link">Giới thiệu công ty</a></li>
							</ul>
						</div>
						<div class="card-body widget-detail-company border">
							<div class="widget-item" id="tab-1">
								<h3 class="w-100">Thông tin cơ bản</h3>
								<div class="row">
									<div class="p-3 col-12 col-md-6">
										<table>
											<tbody>
												<tr>
													<td class="title">Loại hình doanh nghiệp:</td>
													<td>{$page.type}</td>
													<td class="d-flex verified"><i
														class="fa fa-check fa-fw"></i>Đã xác minh</td>
												</tr>
												<tr>
													<td class="title">Sản phẩm chính:</td>
													<td>{$page.mainproducts}</td>
												</tr>
												<tr>
													<td class="title">Doanh thu hàng năm:</td>
													<td>{$page.number_mem_show}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="p-3 c-left col-12 col-md-6">
										<table>
											<tbody>
												<tr>
													<td class="title">Vị trí:</td>
													<td>{$page.district}, {$page.province}</td>
													<td class="d-flex verified"><i
														class="fa fa-check fa-fw"></i>Đã xác minh</td>
												</tr>
												<tr>
													<td class="title">Tổng số nhân viên:</td>
													<td>{$page.number_mem_show}</td>
												</tr>
												<tr>
													<td class="title">Năm thành lập:</td>
													<td>{$page.date_start|date_format:'%Y'}</td>
													<td class="d-flex verified"><i
														class="fa fa-check fa-fw"></i>Đã xác minh</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="px-3">
									<p class="mt-5">Hình ảnh công ty</p>
									{foreach from = $page.a_image item = data} <a
										href="javascript:void(0)" class="d-inline-block border mr-2">
										<img src="{$data}" width="120" height="90">
									</a> {/foreach}
								</div>
							</div>
							<!-- end thông tin cơ bản -->
							<div class="widget-item" id="tab-2">
								<h3 class="my-3">Hồ sơ công ty</h3>
								<table class="fz-12 mt-2">
									<tbody>
										<tr>
											<td width="30%">Tên công ty:</td>
											<td>{$page.name}</td>
										</tr>
										<tr>
											<td>Mã số thuế:</td>
											<td>{$page.code}</td>
										</tr>
										<tr>
											<td>Ngày bắt đầu hoạt động:</td>
											<td>{$page.date_start|date_format:'%d-%m-%Y'}</td>
										</tr>
										<tr>
											<td>Địa chỉ đăng ký kinh doanh:</td>
											<td>{$page.address}</td>
										</tr>
										<tr>
											<td>Số lượng nhân viên:</td>
											<td>{$page.number_mem_show}</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- end hồ sơ công ty -->
							<div class="widget-item" id="tab-3">
								<h3 class="my-3">Giới thiệu</h3>
								{$page.description}
							</div>
							<!-- end hồ sơ công ty -->

						</div>
					</div>
				</div>
			</div>
			<div id="remove_fixed_feedback"></div>
			<div class="card mt-2 mb-3 rounded-0">
				<div class="card-body">
					<div class="detail-box px-3">
						<h3>Gửi tin nhắn của bạn đến nhà cung cấp này</h3>
						<form>
							<input type="hidden" name="user_id" value="{$arg.login}">
							<input type="hidden" name="page_id"
								value="{$info.page_id|default:0}"> <input type="hidden"
								name="product_id" value="{$info.id|default:0}">
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-1 col-form-label">Tới:</label>
								<div class="col-sm-11">
									<input type="text" class="form-control-plaintext rounded-0"
										id="staticEmail" value="{$page.name}">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-1 col-form-label"><span>*</span>Nội
									dung: </label>
								<div class="col-sm-8">
									<textarea rows="2" class="form-control rounded-0"
										name="message" id="Message1"
										placeholder="Nhập yêu cầu của bạn thông tin chi tiết có thể màu sắc, kích thước, chất liệu,..."></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-1 col-form-label">Số
									lượng:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control rounded-0" name="number"
										value="{$info.minorder}">
								</div>
								<div class="col-sm-4">
									<select class="form-control rounded-0" name="unit_id">
										{$out.product_unit}
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-1 col-form-label">&nbsp;</label>
								<div class="col-sm-11">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="defaultCheck1"> <label class="form-check-label"
											for="defaultCheck1">Đề xuất các nhà cung cấp phù hợp
											nếu nhà cung cấp này không liên hệ với tôi trên Trung tâm
											Thông báo trong vòng 24 giờ. <strong><a
												href="{$arg.url_sourcing}">Gửi yêu cầu ngay</a></strong>
										</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-1 col-form-label">&nbsp;</label>
								<div class="col-sm-11">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="defaultCheck1" checked="checked"> <label
											class="form-check-label" for="defaultCheck1"> Tôi
											đồng ý gửi yêu cầu tới nhà cung cấp </label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-1 col-form-label">&nbsp;</label>
								<div class="col-sm-11">
									<a href="javacript:void(0)" class="btn btn-main rounded"
										onclick="SendContact(1)">Gửi yêu cầu báo giá</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-2 col-lg-3 col-md-3">
			<div class="card mb-3 rounded-0">
				<div class="p-3 col-gray PP-3">
					<div class="dropdown bg-white">
						<p class="text-b mb-1">
							<a href="{if $info_page_location}{$info_page_location.url_page}{else}{$page.url}{/if}"><i class="fa fa-diamond"></i>
							{$page.name}
							</a>
						</p>
						{if $info_page_location.name}<p class="mb-1"><i class="fa fa-map-marker fa-fw"></i>{$info_page_location.name}</p>{/if}
						<div class="px-2 pt-2">
							<span class="fz-12 info pb-2 d-block">{if $info_page_location.name}{$info_page_location.province}{else}{$page.province}{/if},
								Việt Nam</span> <span class="fz-12 py-2 d-block border-top d-flex">
								<span class="pr-1">Cấp độ giao dịch:</span> <span
								class="icon icon-6 pl-1"></span> <span class="icon icon-6 pl-1"></span>
								<span class="icon icon-6 pl-1"></span> <span
								class="icon icon-6 pl-1"></span>
							</span> <span class="fz-12 py-2 d-block border-bottom d-flex"> <span
								class="pr-1">Đánh giá nhà cung cấp:</span> <span
								class="icon icon-3 mr-1"></span> <span class="icon icon-4 mr-1"></span>
								<span class="icon icon-5 mr-1"></span>
							</span>
							<div class="fz-12 py-2 d-block oran-hover border-bottom d-flex">
								<div class="pr-1 info w-50">
									<b>{$out.access_month}</b><br> Truy cập
								</div>
								<div class="pr-1 info d-flex">
								<b
										class="ml-1">{$page.revenue}</b>
								</div>
								<div class="drop-down bg-white p-3 text-dark">Các giao
									dịch của nhà cung cấp được đưa ra thông qua Daisan trong 6
									tháng qua.</div>
							</div>
							<div class="info-item performance">
								<table class="card-table">
									<tbody>
										<tr class="py-2 d-block">
											<th class="pr-4"><a href="" class="link-black">Thời
													gian đáp ứng</a></th>
											<td><span>&lt;24h</span></td>
										</tr>
										<tr class="py-2 d-block">
											<th class="pr-4"><a href="" class="link-black">Tỷ lệ
													tương tác</a></th>
											<td><span>{$page.score}%</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<p class="py-2 text-center">
							<a href="{$page.url}">Xem trang</a> &nbsp;|&nbsp; <a
								href="{$page.pagelink.contact}">Liên hệ</a>
						</p>
					</div>
					<!-- end info-page -->
				</div>
			</div>
			{if $other}
			<div class="card mb-3 rounded-0" id="ProductOther">
				<div class="card-header">Bạn có thể thích</div>
				<ul class="list-unstyled p-2">
					{foreach from=$other item=data}
					<li class="media mb-2"><a href="{$data.url}"><img
							class="mr-3" src="{$data.avatar}" width="72" alt="{$data.name}"></a>
						<div class="media-body">
							<h3 class="mt-0 mb-1 fz-13">
								<a href="{$data.url}">{$data.name}</a>
							</h3>
							<span class="fz-12 d-block"> <span
								class="font-weight-bold">{$data.price}</span>{if $data.price neq
								0}<span class="text-muted">/{$data.unit}</span>{/if}
							</span>
						</div></li> {/foreach}
				</ul>
			</div>
			{/if}
			<div id="fixed_feedback"></div>
			<div class="card feedback rounded-0">
				<div class="card-header">Gửi yêu cầu tới nhà cung cấp</div>
				<div class="card-body">
					<form action="">
						<label><i class="fa fa-envelope-open-o fa-fw mr-1 "></i>To:
							<span>{$page.name}</span></label>
						<textarea rows="5" cols=""
							placeholder="Nhập yêu cầu của bạn thông tin chi tiết có thể màu sắc, kích thước, chất liệu,..."
							style="width: 100%;" name="message" id="Message2"></textarea>
						<p class="title">
							<span>*</span> Số lượng:
						</p>
						<div class="quantity quantity-1">
							<input type="text" name="quantity" value="{$info.minorder}"
								class="form-control rounded-0 w-50 float-left">
							<div class="sub-quantity w-50 float-left">
								<select class="form-control rounded-0 border-left-0"
									name="unit_id">{$out.product_unit}
								</select>
							</div>
							<div class="action">
								<a class="btn btn-main rounded mt-2" href="javascript:void(0)"
									onclick="SendContact(2)">Gửi</a>
							</div>
							<div class="form-check pt-2">
								<input class="form-check-input" type="checkbox" value=""
									id="defaultCheck1" checked="checked"> <label
									class="form-check-label" for="defaultCheck1"> Tôi đồng
									ý gửi yêu cầu tới nhà cung cấp </label>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" tabindex="-1" role="dialog" id="FrmPrice">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Cập nhật giá sản phẩm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" onclick="AddPrice();">
					<i class="fa fa-plus"></i> Thêm
				</button>
				<button type="button" class="btn btn-primary"
					onclick="SavePrice({$info.id});">
					<i class="fa fa-save"></i> Lưu
				</button>
			</div>
		</div>
	</div>
</div>
<script src="{$arg.stylesheet}js/cloud-zoom.1.0.3.js"></script>
<script>
var fixed_ad = $('#fixed_feedback').offset().top;
var remove_feedback = $('#remove_fixed_feedback').offset().top;
$(window).scroll(function() {
	var feedback = $('.feedback'), scroll = $(window).scrollTop();
	if (scroll >= fixed_ad){
		$(".feedback").addClass("fixed");
	}else{
		$(".feedback").removeClass("fixed");
	}
})
</script>
{if $is_mobile}
<div id="main" class="d-block d-sm-none">
	<div class="header-mobile">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<span onclick="goBackHistory()"><i class="fa fa-arrow-left"></i></span>
					<span class="title">Overview</span>
				</div>
				<div class="col-6 text-right">

					<ul class="nav float-right">
						<li class="nav-item"><span onclick="showSearch()"><i
								class="fa fa-search fa-fw"></i></span></li>
						<li class="nav-item"><span
							onclick="SetFavorites({$info.id});"><i
								class="fa fa-heart fa-fw"></i></span></li>
						<li class="nav-item dropdown dropdown-tools-right"><a
							class="nav-link p-0" href="#" id="navbarDropdownMenuLink"
							role="button" data-toggle="dropdown"> <i
								class="fa fa-bars fa-fw"></i>
						</a>
							<div class="dropdown-menu dropdown-menu-right rounded-0"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="./"><i class="fa fa-home"></i>Trang
									chủ</a> <a class="dropdown-item" href="?mod=account&site=messages"><i
									class="fa fa-envelope-o"></i>Tin nhắn liên hệ</a> <a
									class="dropdown-item" href="{$arg.url_sourcing}"><i
									class="fa fa-bullhorn"></i>Yêu cầu báo giá</a> <a
									class="dropdown-item" href="?mod=account&site=pagefavorites"><i
									class="fa fa-star"></i>Gian hàng theo dõi</a> <a
									class="dropdown-item" href="?mod=account&site=productfavorites"><i
									class="fa fa-heart-o"></i>Sản phẩm yêu thích</a>
							</div></li>
					</ul>


					<!-- <span onclick="showSearch()"><i class="fa fa-search fa-fw"></i></span>
					<span><i class="fa fa-cloud-download fa-fw"></i></span>
					<div class="dropdown dropdown-tools-right">
						<span class="" id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"><i class="fa fa-bars"></i></span>
						<div class="dropdown-menu  dropdown-menu-right rounded-0" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="./"><i class="fa fa-home"></i>Trang
								chủ</a> <a class="dropdown-item" href="?mod=account&site=messages"><i
								class="fa fa-envelope-o"></i>Tin nhắn liên hệ</a> <a
								class="dropdown-item" href="{$arg.url_sourcing}"><i
								class="fa fa-bullhorn"></i>Yêu cầu báo giá</a> <a
								class="dropdown-item" href="?mod=account&site=pagefavorites"><i
								class="fa fa-star"></i>Gian hàng theo dõi</a> <a
								class="dropdown-item" href="?mod=account&site=productfavorites"><i
								class="fa fa-heart-o"></i>Sản phẩm yêu thích</a>
						</div>
					</div> -->

				</div>
			</div>
		</div>
	</div>
	<div id="page-detail">
		<div class="product-image">
			<div class="owl-carousel owl-theme detail-slider">
				{foreach from=$info.a_images key=k item=data}
				<div class="item">
					<img src="{$data}" alt="">
				</div>
				{/foreach}
			</div>
		</div>
		<div class="fix-top-header"></div>
		<div id="icon-action">
			<ul class="nav">
				<li class="nav-item"><a href="javascript:void(0)"
					onclick="SetFavorites({$info.id});"><img
						src="{$arg.stylesheet}images/favorite.png" width="42"></a></li>
				<li class="nav-item"><a href="javascriot:void(0)"
					id="DropUpShare"><img src="{$arg.stylesheet}images/share.png"
						width="42"></a></li>
			</ul>
		</div>
		<section id="detail-product">
			<div class="section-body">
				<div class="container">
					<h1 class="pt-3">{$info.name}</h1>
					<div class="product-info">
						{if $info.prices|@count gt 1}
						<div class="d-flex mb-2">
							{foreach from=$info.prices key=k item=data}
							<div class="w-50 float-left price-item">
								<div class="card-body bg-transparent py-2">
									<p class="card-text m-0">{$data.version}</p>
									<h5 class="card-title font-weight-bold mb-0 {if $smarty.get.eventproduct_id && $k eq 1}price-event{/if}">{$data.price|number_format}
										VNĐ/{$info.unit}</h5>
								</div>
							</div>
							{/foreach}
						</div>
						{/if}
						<div class="clearfix"></div>
						{if $info.prices|@count le 1}
						<div class="product-price">{$info.price} / {$info.unit}</div>
						<div class="min-order">
							<span>Min. Order</span> {$info.minorder} {$info.unit}
						</div>
						{/if}


						<div class="contact-supplier pt-2 pt-sm-0">
							<div class="row row-sm">
								<div class="col-6">
									<a href="{$page.page_contact}" class="chat-on-app">LẤY GIÁ
										MỚI</a>
								</div>
								<div class="col-6">
									<a href="tel:{$page.phone}" class="btn-contact" onclick="SaveInfoCall({$info.id},1)">GỌI NGAY</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="item-details" class="mt-3">
			<h3 class="px-3">Thông tin chi tiết</h3>
			<div class="section-body">
				<div class="container">
					<table>
						<tbody>
							{foreach from=$info.metas item=data}
							<tr>
								<th>{$data.meta_key}:</th>
								<td>{$data.meta_value}</td>
							</tr>
							{/foreach}
						</tbody>
					</table>
					<a href="javascript:void(0)" class="item-details-view-more"
						onclick="showMoreDetail()">Xem chi tiết</a>
				</div>
			</div>
		</section>

		<div id="fsDetailFull" class="modal animated bounceInUp" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<!-- dialog -->
			<div class="modal-dialog" id="details">
				<!-- content -->
				<div class="modal-content rounded-0 border-0 h-100">
					<!-- header -->
					<div class="modal-header py-2 bg-warning">
						<h5 class="modal-title text-center w-100" id="exampleModalLabel">Chi
							tiết sản phẩm</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<!-- header -->
					<!-- body -->
					<div class="modal-body px-2 pt-0 bg-white v--modal-overlay scrollable">
						<div class="section-body">
							<h1 class="py-2">{$info.name}</h1>
							<table class="bg-light mb-3">
								{foreach from=$info.metas item=data}
								<tr>
									<th class="p-2">{$data.meta_key}:</th>
									<td class="p-2">{$data.meta_value}</td>
								</tr>
								{/foreach}
							</table>
							{$info.description}
						</div>
					</div>
					<!-- body -->
				</div>
				<!-- content -->

			</div>
			<!-- dialog -->
		</div>
		<!-- modal -->
		<!-- 
		<section id="details">
			<div class="section-body">
				<div class="container">
					<h1>{$info.name}</h1>
					<table>
						{foreach from=$info.metas item=data}
						<tr>
							<th>{$data.meta_key}:</th>
							<td>{$data.meta_value}</td>
						</tr>
						{/foreach}
					</table>
					{$info.description}
				</div>
			</div>
		</section>
		<!-- 
		<section class="rfq-entry mt-3">
			<div class="section-body">
				<a href="{$arg.url_sourcing}"> <i class="fa fa-id-card-o"></i>
					<p>
						{$out.number_othersell} nhà cung cấp đang cung cấp sản phẩm này<span>Yêu
							cầu báo giá ngay</span>
					</p>
				</a>
			</div>
		</section> -->
		<section id="detail-company" class="mt-3">
			<h3 class="px-3">Thông tin công ty</h3>
			<div class="section-body">
				<div class="container">
					<div class="sup-name">
						<a href="{$page.url}"><i class="fa fa-diamond"></i>
							{$page.name}</a>
					</div>
					<div class="company-info">{$page.address}</div>
					<div class="">
						<ul class="nav">
							<li class="nav-item"><a href="" class="nav-link"><span
									class="join-year"><i class="card-icon icon-ggs"></i> <span
										class="value">{$page.yearexp}</span> <span class="unit">YRS</span></span>
									Gold Supplier</a></li>
						</ul>
					</div>
					<div class="row">
						<dl class="col">
							<dt>Thời gian đáp ứng</dt>
							<dd><24h</dd>
						</dl>
						<dl class="col">
							<dt>Tỷ lệ tương tác</dt>
							<dd>{$page.score}%</dd>
						</dl>
						<dl class="col">
							<dt>Truy cập trong tháng</dt>
							<dd>{$out.access_month}</dd>
						</dl>
					</div>
					<a href="{$page.url}" class="item-details-view-more">Đến Shop</a>
				</div>
			</div>
		</section>
		<section id="detail-recommended" class="mt-3">
			<h3 class="px-3">Sản phẩm liên quan</h3>
			<div class="section-body">
				{foreach from=$other item=data}
				<div class="card w-50 float-left">
					<a href="{$data.url}"><img class="card-img-top"
						src="{$data.avatar}" alt="{$data.name}"></a>
					<div class="card-body">
						<p class="card-text">
							<a href="{$data.url}">{$data.name}</a>
						</p>
						<div class="price">{$data.price}</div>
						<div class="moq">Tối thiểu: {$info.minorder} / {$info.unit}</div>
					</div>
				</div>
				{/foreach}
			</div>
		</section>
		<div class="clearfix"></div>
		<section id="detail-related-search" class="mt-3">
			<div class="section-body pt-0">
				<div class="container">
					<div class="related-searches">
						<h3 class="p-0">Danh mục sản phẩm</h3>
						<ol class="breadcrumb p-0">{$breadcrumb}
						</ol>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
<!-- Click for Search -->
<div id="NetworkShare" class="d-block d-sm-none">
	<!-- Modal -->
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title fz-14" id="exampleModalCenterTitle">Chia
					sẻ sản phẩm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<div class="row row-sm">
					<div class="col-3 text-center">
						<a
							href="https://www.facebook.com/sharer/sharer.php?u={$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
							class="d-block p-2"><img
							src="{$arg.stylesheet}images/facebook.svg" class="w-100"> <br>Facebook</a>
					</div>
					<div class="col-3 text-center">
						<a
							href="https://plus.google.com/share?url={$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
							class="d-block p-2"><img
							src="{$arg.stylesheet}images/google.svg" class="w-100"> <br>Google+</a>
					</div>
					<div class="col-3 text-center">
						<a
							data-href="{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
							data-oaid="579745863508352884" data-layout="2" data-color="blue"
							data-customize=false class="d-block p-2"><img
							src="{$arg.stylesheet}images/zalo.png" class="w-100"> <br>Zalo</a>
					</div>
					<div class="col-3 text-center">
						<a
							href="https://www.pinterest.com/pin/create/button/?url={$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}&media={$metadata.image|default:''}&description={$metadata.description|default:''}"
							class="d-block p-2"><img
							src="{$arg.stylesheet}images/pinterest.png" class="w-100">
							<br>Pinterest</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<section id="content-search">
	<div class="search-bar-header">
		<div class="container">
			<div class="row row-sm mt-2">
				<div class="col-1" onclick="goBack()">
					<span class="icon-back"><img
						src="{$arg.stylesheet}images/back.png" class="img-fluid"></span>
				</div>
				<div class="col-11">
					<div class="input-group">
						<input class="form-control" id="mKeyword"
							value="{$filter.key|default:''}"
							placeholder="Nhập vào từ khóa tìm kiếm...">
						<div class="input-group-prepend">
							<span class="input-group-text" onclick="msearch()" id="btn-search">Tìm</span>
						</div>
					</div>
				</div>
			</div>
			<nav>
				<div class="nav nav-pill" id="pills-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-home-tab"
						data-toggle="tab" href="#nav-home" role="tab"
						aria-controls="nav-home" aria-selected="true" onclick="SetType(0)">SẢN
						PHẨM</a> <a class="nav-item nav-link" id="nav-profile-tab"
						data-toggle="tab" href="#nav-profile" role="tab"
						aria-controls="nav-profile" onclick="SetType(1)">NHÀ CUNG CẤP</a>
				</div>
			</nav>
		</div>
	</div>
	<div class="search-bar-content">
		<input type="hidden" id="Type" value="0">
		<div class="container">
			<div class="popular-keyword">
				<h3 class="keyword-title">Từ khóa phổ biến</h3>
				<div class="box-tag">
					{foreach from = $keyword.hot item = data} <a
						href="./product?k={$data.name}">{$data.name}</a> {/foreach}
				</div>

				<div class="clearfix"></div>
			</div>
			<div class="history-keyword">
				<h3 class="keyword-title">Lịch sử tìm kiếm:</h3>
				<div class="box-tag">
					
				</div>
			</div>
		</div>
	</div>
</section>
{/if}
<div class="modal fade" id="PopupCall" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-0">
			<div class="p-3 bg-primary">
				<h5 class="modal-title text-center">
					<img src="{$arg.stylesheet}images/icon-phone.png">
				</h5>
				<h3 class="text-white text-center fz-18">Nhập vào email hoặc số điện thoại của bạn</h3>
				<p class="text-white text-center">Để được chăm sóc tốt nhất</p>
			</div>
			<div class="modal-body text-center">
				<input type="hidden" class="setphonenumber" name="callphone"
					value="{$page.phone}">
				<input type="hidden" class="seturl" name="callurl" value="{$arg.thislink}">
				<input type="hidden" class="ismobile" name="ismobile" value="">
				<div class="input-group mb-3 w-75 mx-auto">
					<input type="text" class="form-control" name="email"
						placeholder="Email hoặc số điện thoại"
						style="border: 0; border-radius: 0; border-bottom: 2px solid #ccc">
				</div>
				<div class="input-group mb-3 w-75 mx-auto text-center">
					<button type="button"
						class="btn btn-danger btn-block rounded-pill"
						onclick="ShowPhoneNumber()">Xác nhận</button>
				</div>
				<p data-dismiss="modal" aria-label="Close">Đóng và tiếp tục tham khảo sản phẩm</p>
			</div>
		</div>
	</div>
</div>
{literal}
<script>
function showMoreDetail(){
	$("#fsDetailFull").modal('show');
	$('.modal-backdrop').remove();
}
	$(function() {
		$('.detail-slider').owlCarousel({
			'items' : 1,
			'loop' : true,
			'nav' : true,
			'dots' : true,
			'autoplay' : true,
			'smartSpeed' : 500,
			responsive : {
				0 : {
					'items' : 1,
					'nav' : false,
				},
				416 : {
					'items' : 1,
					'nav' : false,
				},
				700 : {
					'items' : 1,
					'nav' : false,
				},
				992 : {
					'items' : 1,
					'nav' : true,
				}
			}
		});
	});

	var fixhead = $('.fix-top-header').offset().top;
	console.log(fixhead);
	$(window).scroll(function() {
		var headmobile = $('.header-mobile'), scroll = $(window).scrollTop();
		if (scroll >= 360) {
			$(".header-mobile").addClass("fixed");

		} else {
			$(".header-mobile").removeClass("fixed");
		}
	});
	 $(".open-detail").click(function(){
         $("#details").show();
        // $("html, body").animate({scrollTop: 0},50);
     });
     $(".close-detail").click(function(){
         $("#details").hide();
     });
</script>
{/literal}{literal}
<script type="text/javascript">
function SaveInfoCall(id,ismobile){
	var data = {};
	data.phone=$('.phonenumber').val();
	data.url= $('.url').val();
	if(ismobile==0)
 		$(".show_phone").html('<i class="fa fa-fw fa-phone"></i>&nbsp;'+data.phone);
	data.ajax_action='get_info_call';
	$.post('?mod=product&site=index', data).done(function(e){
	});
}
function GetPhoneNumber(id,ismobile){
	$("#PopupCall input[name=ismobile]").val(ismobile);
	 $("#PopupCall").modal({
			show : true,
			//backdrop: 'static',
			//keyboard: false  // to prevent closing with Esc button (if you want this too)
		});
      }
function ShowPhoneNumber(){
	var IsMobile = $('.ismobile').val();
	var PhoneNumber = $('.setphonenumber').val();
	var data = {};
	data.email = $("#PopupCall input[name=email]").val();
	data.phone=$("#PopupCall input[name=callphone]").val();
	data.url=$("#PopupCall input[name=callurl]").val();
	data.ajax_action='get_info_call';
	if(data.email==''){
		noticeMsg('Thông báo', 'Vui lòng nhập vào email của bạn.',
		'error');
		$("#PopupCall input[name=email]").focus();
		return false;
	}
	loading();
	$.post('?mod=product&site=index', data).done(function(e){
		endloading();	
		if(IsMobile==0) $(".show_phone").html('<i class="fa fa-fw fa-phone"></i>&nbsp;'+PhoneNumber);
		else window.location.href="tel://"+PhoneNumber;	
		$("#PopupCall").modal('hide');
	});
}
</script>
<script type="text/javascript">
function loadPrice(id){
	loading();
	$('#FrmPrice .modal-body').load('?mod=product&site=load_prices&id='+id, function(){
		$('#FrmPrice').modal('show');
		endloading();
	});
}

function AddPrice(){
	loading();
	$.post('?mod=product&site=ajax_handle_price', {'ajax_action':'add_price'}).done(function(e){
		var data = JSON.parse(e);
		if(data.code==1){
			$("#FrmPrice .modal-body").load('?mod=product&site=load_prices');
		}else{
			noticeMsg('Thông báo', data.msg, 'error');
		}
		endloading();
	});
}
function SetPrice(type, id, value){
	var Data = {};
	Data['type'] = type;
	Data['id'] = id;
	Data['value'] = value;
	Data['ajax_action'] = 'set_price';
	$.post('?mod=product&site=ajax_handle_price', Data).done(function(){
		noticeMsg('Thông báo', 'Lưu thông tin thành công.', 'success');
	});
}
function DeletePrice(id){
	loading();
	$.post('?mod=product&site=ajax_handle_price', {'ajax_action':'delete_price','id':id}).done(function(){
		$("#FrmPrice .modal-body").load('?mod=product&site=load_prices');
		endloading();
	});
}
function SortPrice(id, type){
	loading();
	$.post('?mod=product&site=ajax_handle_price', {'ajax_action':'sort_price','id':id,'type':type}).done(function(){
		$("#FrmPrice .modal-body").load('?mod=product&site=load_prices');
		endloading();
	});
}
function SavePrice(id){
	var Data = {};
	Data.id = id;
	Data.ajax_action = 'save_price';
	loading();
	$.post('?mod=product&site=ajax_handle_price', Data).done(function(){
		noticeMsg('Thông báo', 'Lưu thông tin thành công.', 'success');
		setTimeout(function(){
			location.reload();
		}, 1000);
	});

}

function SetFavorites(product_id){
	//if(arg.login==0){
	//	noticeMsg('System Message', 'Vui lòng đăng nhập trước khi thực hiện chức năng.');
	//	return false;
	//}
	var data = {};
	data['id'] = product_id;
	data['ajax_action'] = 'set_product_favorite';
	loading();
	$.post('?mod=product&site=ajax_handle', data).done(function(e){
		data = JSON.parse(e);
		if(data.code==1){
			noticeMsg('System Message', data.msg, 'success');
		}else noticeMsg('System Message', data.msg, 'error');
		
		endloading();
	});
}
function SendComment(){
	var data = {};
	data['page_id'] = $(".sendcomment input[name=page_id]").val();
	data['product_id'] = $(".sendcomment input[name=product_id]").val();
	data['message'] = $(".sendcomment textarea").val();
	data['ajax_action'] = 'send_comment';
	console.log(data);
	if(data.message.length<2|| data.message.length>500){
		noticeMsg('System Message', 'Nội dung phải chứa 2 đến 500 ký tự', 'error');
		$(".sendcomment textarea").focus();
		return false;
	}
	loading();
	$.post('?mod=product&site=detail', data).done(function(e){
		location.reload();
	});
}

function SendContact(type){
	var data = {};
	data['page_id'] = $("input[name=page_id]").val();
	data['product_id'] = $("input[name=product_id]").val();
	if(type==1) data['message'] = $("textarea[name=message]#Message1").val();
	else data['message'] = $("textarea[name=message]#Message2").val();
	data['number'] = $("input[name=number]").val();
	data['unit_id'] = $("select[name=unit_id]").val();
	data['ajax_action'] = 'send_contact';
	
	
	if(arg.login==0){
		//noticeMsg('Thông báo', 'Vui lòng đăng nhập trước khi gửi liên hệ tới nhà cung cấp', 'error');
		window.location.href = arg.domain+"?mod=account&site=login";
		
	}else if(data.message.length<5 || data.message.length>1000){
		noticeMsg('Thông báo', 'Vui lòng nhập nội dung ít nhất 5 ký tự.', 'error');
		if(type==1)
		$("textarea[name=message]#Message1").focus();
		else
			$("textarea[name=message]#Message2").focus();
		return false;
	}
	loading();
	$.post('?mod=page&site=contact', data).done(function(e){
		var data = JSON.parse(e);
		if(data.code==1){
			noticeMsg('System Message', data.msg, 'success');
			$("textarea[name=message]").val('');
			endloading();
		}else{
			noticeMsg('System Message', data.msg, 'error');
			endloading();
		}
	});
}

var height = $("header").height() + $("#P-3").height() + $("#productimg").height() + $("#myTab").height() + $(".nav-con").height();
$(window).scroll(function() {
  if($(window).scrollTop() >  height){
    $("#myTab").addClass('fixed-top1');
    $(".nav-con").addClass('fixed-top2');
    $("header").removeClass('fixed');
  }
  else{
    $("#myTab").removeClass('fixed-top1');
    $(".nav-con").removeClass('fixed-top2');
  }
  $("#home .nav-link").click(function(){
      $("#home .nav-link").removeClass("active");
      $(this).addClass("active");
      $(".widget-item").removeClass("fixed");
      $(".widget-item").addClass("fixed");
  });
});


if ($(window).width() < 700) {
	$('#DropUpShare').on('click', function() {
		$('#NetworkShare').addClass('active');
		$('.overlay').fadeIn();
	});
	$('.overlay').on('click', function() {
		$('#NetworkShare').removeClass('active');
		$('.overlay').fadeOut();
	});
	$('.close').on('click', function() {
		$('#NetworkShare').removeClass('active');
		$('.overlay').fadeOut();
	});

} else {
	$('#DropUpShare').on('click', function() {
		$("#NetworkShare").toggleClass('active');		
	});
}
</script>
{/literal}




