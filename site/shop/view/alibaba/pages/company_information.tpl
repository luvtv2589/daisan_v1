<div class="p-3  S-1 company_information" id="company_information">
	<div class="row">
		<div class="col-md-2 d-none d-lg-block SS-99">
			<div class="border-right">
				<div class="fz-12 text-left border-bottom pb-2 mb-2">
					<div class="font-weight-bold p-1">Thông tin tổng quan</div>
					<div class="p-1 active">
						<a href="" class="text-dark">Thông tin tổng quan</a>
					</div>
				</div>
				<div class="fz-12 text-left border-bottom pb-2 mb-2">
					<div class="font-weight-bold p-1">Hồ sơ công ty</div>
					<div class="p-1">
						<a href="{$a_main_menu.company_profile}" class="text-dark">Hồ
							sơ công ty</a>
					</div>
				</div>
				<div class="fz-12 text-left pb-2 mb-2">
					<div class="font-weight-bold p-1">Khả năng của công ty</div>
					<div class="p-1">
						<a href="{$a_main_menu.company_capacity}" class="text-dark">Khả
							năng của công ty</a>
					</div>
					<div class="p-1">
						<a href="{$a_main_menu.company_capacity}" class="text-dark">Khả
							năng sản xuất</a>
					</div>
					<div class="p-1">
						<a href="{$a_main_menu.company_capacity}" class="text-dark">Kiểm
							soát chất lượng</a>
					</div>
					<div class="p-1">
						<a href="{$a_main_menu.company_capacity}" class="text-dark">Công
							suất R & D</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-10 col-12">
			<div class="rounded-0">
				<div class="bg-white pb-2">
					<div class="row">
						<div class="col-md-8">
							<h4 class="mb-0 font-weight-bold d-inline-block">
								{$page.name} <span class="icon icon-3"></span> <span
									class="icon icon-4"></span>
							</h4>
						</div>
						<div class="col-md-4 text-right">
							<a href="" class="fz-10 mr-2"> <i class="icon-chat"></i>Chat
								Now!
							</a> <a href="{$info.url_contact}"
								class="btn btn-custom-3 text-white font-weight-bold px-3 fz-12 btn-sm mt-1"><i
								class="fa fa-envelope fa-fw"></i> Gửi liên hệ</a> <a
								href="{$a_main_menu.product_list}"
								class="btn btn-custom-4 text-white btn-sm mt-1 fz-12"><i
								class="fa fa-check fa-fw"></i> Đặt hàng</a>
						</div>
					</div>
				</div>
				<div class="mx-3 my-4 bg-light">
					<img src="{$arg.stylesheet}images/ic-23.png" width="39" height="39">
					<span class="fz-12">Nhà cung cấp này đã được xác nhận qua hệ
						thống TMĐT DAISAN</span>
				</div>
				<div class="row">
					<div class="col-lg-4 col-12">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								{foreach from=$profile.a_image key=k item=img}
								<li data-target="#carouselExampleIndicators"
									data-slide-to="{$k}" {if $k eq 0}class="active"{/if}><img
									class="d-block w-100" src="{$img}"></li> {/foreach}
							</ol>
							<div class="carousel-inner">
								{foreach from=$profile.a_image key=k item=img}
								<div class="carousel-item {if $k eq 0}active{/if}">
									<img class="d-block w-100" src="{$img}">
								</div>
								{/foreach}
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" data-slide="prev"> <span
								class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" data-slide="next"> <span
								class="carousel-control-next-icon"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div class="col-lg-8 col-12 mt-4 mt-lg-0">
						<table class="mb-1 fz-13">
							<tr class="">
								<td class="pb-1" width="35%">Thời gian làm việc :</td>
								<td class="pb-1" width="25%">{$profile.time_open}</td>
								<td class="d-flex pb-1 SS-1"><img
									src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
									class="cl-oran ml-2">Đã xác nhận</span> <span class="SSS-1">
										<span>xác nhận qua hệ thống</span> <span class="fz-12">DAISAN</span>
										</a>
								</span></td>
							</tr>
							<tr>
								<td class="pb-1">Loại hình kinh doanh :</td>
								<td class="pb-1">{$page.type}</td>
								<td class="d-flex SS-1"><img
									src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
									class="cl-oran ml-2">Đã xác nhận</span> <span class="SSS-1">
										<span>xác nhận qua hệ thống</span> <span class="fz-12">DAISAN</span>
										</a>
								</span></td>
							</tr>
							<tr>
								<td class="pb-1">Vị trí :</td>
								<td class="pb-1">{$page.district}, {$page.province}</td>
								<td class="d-flex pb-1 SS-1"><img
									src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
									class="cl-oran ml-2">Đã xác nhận</span> <span class="SSS-1">
										<span>xác nhận qua hệ thống</span> <span class="fz-12">DAISAN</span>
										</a>
								</span></td>
							</tr>
							<!-- 
							<tr>
								<td class="pb-1">Sản phẩm chính :</td>
								<td class="pb-1">{$page.mainproducts}</td>
								<td class="d-flex pb-1 SS-1"><img
									src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
									class="cl-oran ml-2">Đã xác nhận</span> <span class="SSS-1">
										<span>xác nhận qua hệ thống</span> <span class="fz-12">DAISAN</span>
										</a>
								</span></td>
							</tr> -->
							{if $page.number_mem_show}
							<tr>
								<td class="pb-1">Tổng số nhân viên :</td>
								<td class="pb-1">{$page.number_mem_show}</td>
								<td class="d-flex pb-1 SS-1"><img
									src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
									class="cl-oran ml-2">Đã xác nhận</span> <span class="SSS-1">
										<span>xác nhận qua hệ thống</span> <span class="fz-12">DAISAN</span>
										</a>
								</span></td>
							</tr>
							{/if} {if $profile.revenue}
							<tr>
								<td class="pb-1">Doanh thu hàng năm :</td>
								<td class="pb-1">{$profile.revenue}</td>
								<td class="d-flex pb-1 SS-1"><img
									src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
									class="cl-oran ml-2">Đã xác nhận</span> <span class="SSS-1">
										<span>xác nhận qua hệ thống</span> <span class="fz-12">DAISAN</span>
										</a>
								</span></td>
							</tr>
							{/if}
							<tr>
								<td class="pb-1">Năm thành lập :</td>
								<td class="pb-1">{$page.date_start|date_format:'%Y'}</td>
								<td class="d-flex pb-1 SS-1"><img
									src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
									class="cl-oran ml-2">Đã xác nhận</span> <span class="SSS-1">
										<span>xác nhận qua hệ thống</span> <span class="fz-12">DAISAN</span>
										</a>
								</span></td>
							</tr>
							<tr>
								<td class="pb-1">Khả năng cung cấp :</td>
								<td class="pb-1">{$profile.supply_ability}</td>
								<td class="d-flex pb-1 SS-1"><img
									src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
									class="cl-oran ml-2">Đã xác nhận</span> <span
									class="SSS-1 SS-1"> <span>xác nhận qua hệ thống</span> <span
										class="fz-12">DAISAN</span> </a>
								</span></td>
							</tr>
						</table>
					</div>
				</div>

				<div class="bg-white-1 pb-2 mt-3">
					<div class="row">
						<div class="col-md-8">
							<h4 class="mb-0 font-weight-bold d-inline-block">Sản phẩm chính</h4>
						</div>
					</div>
				</div>
				<div class="py-3 fz-13">
					<div class="row m-0 border border-bottom-0 border-right-0">
					{foreach from=$a_home_product_main item=data}
					<div
						class="col-lg-3 col-6 py-2 px-3 px-lg-5 border-bottom border-right">
						<a href="{$data.url}" class="text-custom-u"> <img
							src="{$data.avatar}" class="w-100">
							<h3 class="fz-12 d-block name pt-3">{$data.name}</h3>
						</a> <span class="fz-12 d-block"> <span
							class="font-weight-bold"> {$data.price}</span>{if $data.price neq
							0}<span class="text-muted">/{$data.unit}</span>{/if}
						</span> <span class="fz-12 d-block"> <span
							class="font-weight-bold">{$data.minorder} {$data.unit}</span> <span
							class="text-muted">(Min. Order)</span>
						</span>
					</div>
					{/foreach}
				</div>
				</div>

				<div class="bg-white-1 pb-2 mt-3">
					<div class="row">
						<div class="col-md-8">
							<h4 class="mb-0 font-weight-bold d-inline-block">Giới thiệu</h4>
						</div>
						<div class="col-md-4 text-right">
							<a href="javascript:void(0)" class="fz-12 mr-2">Xem thêm ></a>
						</div>
					</div>
				</div>
				<div class="py-3 fz-13">{$profile.description|nl2br}</div>
				<!-- 
				<div class="bg-white-1 pb-2 mt-3">
					<div class="row">
						<div class="col-md-8">
							<h4 class="mb-0 font-weight-bold d-inline-block">Năng lực
								sản xuất</h4>
						</div>
						<div class="col-md-4 text-right">
							<a href="" class="fz-10 mr-2">View More ></a>
						</div>
					</div>
				</div>
				<div class="p-3 fz-12">
					<span>Năng lực sản xuất hàng năm (Năm ngoái)</span> <span
						class="d-inline-flex ml-2 SS-1"> <img
						src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
						class="cl-oran">Đã xác nhận</span> <span class="SSS-1"> <span>xác
								nhận qua</span> <a href=""> <img
								src="{$arg.stylesheet}/images/ic-24.png" width="50" height="30">
								<span class="fz-12">SGS Group</span>
						</a>
					</span>
					</span>
					<table class="table mt-3 table-striped table-bordered">
						<thead class="table-primary">
							<tr>
								<th>Tên sản phẩm</th>
								<th>Dây chuyền sản xuất</th>
								<th>Các đơn vị thực tế được sản xuất (năm trước)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Khuôn ép nhựa</td>
								<td>30 bộ / tháng</td>
								<td>300 bộ</td>
							</tr>
							<tr>
								<td>Bộ phận nhựa</td>
								<td>576000 chiếc / tháng</td>
								<td>5000000 chiếc</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="p-3 fz-12">
					<span>Máy móc sản xuất</span> <span class="d-inline-flex ml-2 SS-1">
						<img src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
						class="cl-oran">Đã xác nhận</span>
					</span>
					<div class="owl-carousel owl-theme">
						<div class="item my-3 mx-5">
							<img src="{$arg.stylesheet}images/img-sp.jpg" width="120"
								height="120">
							<div class="fz-10">Raw Material</div>
						</div>
						<div class="item my-3 mx-5">
							<img src="{$arg.stylesheet}images/img-sp.jpg" width="120"
								height="120">
							<div class="fz-10">Raw Material</div>
						</div>
						<div class="item my-3 mx-5">
							<img src="{$arg.stylesheet}images/img-sp.jpg" width="120"
								height="120">
							<div class="fz-10">Raw Material</div>
						</div>
						<div class="item my-3 mx-5">
							<img src="{$arg.stylesheet}images/img-sp.jpg" width="120"
								height="120">
							<div class="fz-10">Raw Material</div>
						</div>
						<div class="item my-3 mx-5">
							<img src="{$arg.stylesheet}images/img-sp.jpg" width="120"
								height="120">
							<div class="fz-10">Raw Material</div>
						</div>
						<div class="item my-3 mx-5">
							<img src="{$arg.stylesheet}images/img-sp.jpg" width="120"
								height="120">
							<div class="fz-10">Raw Material</div>
						</div>
					</div>

					<script type="text/javascript">
						$('.owl-carousel').owlCarousel({
							loop : true,
							margin : 10,
							nav : false,
							dots : false,
							responsive : {
								0 : {
									items : 1
								},
								600 : {
									items : 3
								},
								1000 : {
									items : 5
								}
							}
						})
					</script>
				</div>
				<div class="bg-white-1 pb-2 mt-3">
					<div class="row">
						<div class="col-md-8">
							<h4 class="mb-0 font-weight-bold d-inline-block">Kiểm soát
								chất lượng</h4>
						</div>
						<div class="col-md-4 text-right">
							<a href="" class="fz-10 mr-2">View More ></a>
						</div>
					</div>
				</div>
				<div class="p-3 fz-12">
					<span>Số lượng nhân viên trong mỗi dây chuyền sản xuất</span> <span
						class="d-inline-flex ml-2 SS-1"> <img
						src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
						class="cl-oran">Đã xác nhận</span> <span class="SSS-1"> <span>xác
								nhận qua</span> <a href=""> <img
								src="{$arg.stylesheet}/images/ic-24.png" width="50" height="30">
								<span class="fz-12">SGS Group</span>
						</a>
					</span>
					</span>
					<table class="table mt-3 table-striped table-bordered">
						<thead class="table-primary">
							<tr>
								<th>Dây chuyền sản xuất</th>
								<th>Giám sát viên</th>
								<th>Số người điều hành</th>
								<th>Số lượng QC / QA trực tuyến</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Tiên tiến</td>
								<td>30</td>
								<td>300</td>
								<td>3</td>
							</tr>
						</tbody>
					</table>
					<span>Chứng nhận</span>
					<table class="table mt-3">
						<thead class="table-primary">
							<tr>
								<th>Hình ảnh</th>
								<th>Thông tin</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><img src="{$arg.stylesheet}images/img-chungchi.jpg"
									width="60" height="80"></td>
								<td><span class="d-block font-weight-bold">Chứng
										nhận</span> <span class="d-block">ISO/TS16949</span> <span
									class="d-block font-weight-bold mt-2">Lĩnh vực kinh
										doanh</span> <span class="d-block">Sản xuất các bộ phận bằng
										nhựa (vỏ bọc cho tấm lót) và các bộ phận bằng kim loại (giá đỡ
										tấm lót)</span> <span class="d-block font-weight-bold mt-2">Ngày
										bắt đầu --- Ngày hết hạn</span> <span class="d-block">2017-06-12
										~ 2018-09-14</span></td>
								<td><span class="d-inline-flex ml-2 SS-1"> <img
										src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
										class="cl-oran">Đã xác nhận</span>
								</span></td>
							</tr>
							<tr>
								<td><img src="{$arg.stylesheet}images/img-chungchi.jpg"
									width="60" height="80"></td>
								<td><span class="d-block font-weight-bold">Lĩnh vực
										kinh doanh</span> <span class="d-block">Sản xuất các bộ phận
										bằng nhựa (vỏ bọc cho tấm lót) và các bộ phận bằng kim loại
										(giá đỡ tấm lót)</span> <span class="d-block font-weight-bold mt-2">Ngày
										bắt đầu --- Ngày hết hạn</span> <span class="d-block">2017-06-12
										~ 2018-09-14</span></td>
								<td><span class="d-inline-flex ml-2 SS-1"> <img
										src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
										class="cl-oran">Đã xác nhận</span>
								</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="bg-white-1 pb-2 mt-3">
					<div class="row">
						<div class="col-md-8">
							<h4 class="mb-0 font-weight-bold d-inline-block">Công suất
								thương mại</h4>
						</div>
						<div class="col-md-4 text-right">
							<a href="" class="fz-10 mr-2">View More ></a>
						</div>
					</div>
				</div>
				<div class="p-3 fz-12">
					<span>Thị trường thương mại</span> <span
						class="d-inline-flex ml-2 SS-1"> <img
						src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
						class="cl-oran">Đã xác nhận</span> <span class="SSS-1"> <span>xác
								nhận qua</span> <a href=""> <img
								src="{$arg.stylesheet}/images/ic-24.png" width="50" height="30">
								<span class="fz-12">SGS Group</span>
						</a>
					</span>
					</span>
					<table class="table mt-3 table-striped table-bordered">
						<thead class="table-primary">
							<tr>
								<th>Thị trường chính</th>
								<th>Tổng doanh thu(%)</th>
								<th>Sản phẩm chính</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>North America</td>
								<td>38.76%</td>
								<td>Khuôn ép nhựa, bộ phận bằng nhựa, bộ phận kim loại</td>
							</tr>
							<tr>
								<td>North America</td>
								<td>38.76%</td>
								<td>Khuôn ép nhựa, bộ phận bằng nhựa, bộ phận kim loại</td>
							</tr>
							<tr>
								<td>North America</td>
								<td>38.76%</td>
								<td>Khuôn ép nhựa, bộ phận bằng nhựa, bộ phận kim loại</td>
							</tr>
							<tr>
								<td>North America</td>
								<td>38.76%</td>
								<td>Khuôn ép nhựa, bộ phận bằng nhựa, bộ phận kim loại</td>
							</tr>
							<tr>
								<td>North America</td>
								<td>38.76%</td>
								<td>Khuôn ép nhựa, bộ phận bằng nhựa, bộ phận kim loại</td>
							</tr>
						</tbody>
					</table>
					<table>
						<thead>
							<tr>
								<td>Tỷ lệ xuất khẩu:</td>
								<td>85.58%</td>
								<td><span class="d-inline-flex ml-2 SS-1"> <img
										src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
										class="cl-oran">Đã xác nhận</span> <span class="SSS-1">
											<span>xác nhận qua</span> <a href=""> <img
												src="{$arg.stylesheet}/images/ic-24.png" width="50"
												height="30"> <span class="fz-12">SGS Group</span>
										</a>
									</span>
								</span></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="55%">North America</td>
								<td width="30%">38.76%</td>
								<td><span class="d-inline-flex ml-2 SS-1"> <img
										src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
										class="cl-oran">Đã xác nhận</span> <span class="SSS-1">
											<span>xác nhận qua</span> <a href=""> <img
												src="{$arg.stylesheet}/images/ic-24.png" width="50"
												height="30"> <span class="fz-12">SGS Group</span>
										</a>
									</span>
								</span></td>
							</tr>
							<tr>
								<td>Chế độ xuất:</td>
								<td>Có giấy phép xuất khẩu riêng</td>
								<td><span class="d-inline-flex ml-2 SS-1"> <img
										src="{$arg.stylesheet}images/ic-22.png" height="14"> <span
										class="cl-oran">Đã xác nhận</span> <span class="SSS-1">
											<span>xác nhận qua</span> <a href=""> <img
												src="{$arg.stylesheet}/images/ic-24.png" width="50"
												height="30"> <span class="fz-12">SGS Group</span>
										</a>
									</span>
								</span></td>
							</tr>
							<tr>
								<td>Ngôn ngữ :</td>
								<td>English, Tiếng việt</td>
								<td></td>
							</tr>
							<tr>
								<td>Số lượng nhân viên trong Phòng Thương mại:</td>
								<td>11-20 người</td>
								<td></td>
							</tr>
						</tbody>
					</table>
 -->
			</div>
		</div>
	</div>
</div>