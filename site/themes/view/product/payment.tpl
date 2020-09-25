<div class="container">
	<div class="mt-4">
		<div class="row row-no" id="cartmenu">
			<div class="col-md-4">
				<div class="item">Thông tin giỏ hàng</div>
			</div>
			<div class="col-md-4">
				<div class="item active">Giao hàng và thanh toán</div>
			</div>
			<div class="col-md-4">
				<div class="item">Hoàn thành</div>
			</div>
		</div>
	</div>
	
	
	<div class="card-group my-4">
		<div class="card rounded-0" style="flex-grow: 1.75;">
			<div class="card-header">
				<h3 class="">Thông tin mua hàng</h3>
			</div>
			<div class="card-body" id="FrmCont">
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Họ tên</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="name" value="{$user.name|default:''}">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Số điện thoại</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="phone" value="{$user.phone|default:''}">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="email" value="{$user.email|default:''}">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Địa chỉ nhận hàng</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="address">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Mô tả thêm</label>
					<div class="col-sm-9">
						<textarea class="form-control" name="description" rows="4"></textarea>
					</div>
				</div>

			</div>
			<div class="card-footer">
				<div class="mb-3">
					<button type="button" class="btn btn-danger" onclick="Payment();">Thanh toán ngay</button>
					<a href="?mod=product&site=cart" class="btn btn-outline-primary">Cập nhật đơn hàng</a>
				</div>
				<p>Bằng việc ấn nút Thanh toán trên, Quý khách xác nhận đã kiểm tra kỹ đơn hàng với Điều khoản & Điều kiện giao dịch của chúng tôi.</p>
			</div>
		</div>
		<div class="card rounded-0">
			<div class="p-3">
				{foreach from=$cart item=page}
				<h5 class="mb-2"><i class="fa fa-fw fa-diamond"></i> {$page.pagename}</h5>
				{foreach from=$page.products item=data}
				<div class="row row-sm">
					<div class="col-md-3">
						<a href="{$data.url}">
							<img alt="{$data.name}" src="{$data.avatar}" class="img-thumbnail w-100">
						</a>
					</div>
					<div class="col-md-9">
						<p><a href="{$data.url}">{$data.name}</a></p>
						<p>{$data.price|number_format}đ x {$data.number} = <b>{($data.number*$data.price)|number_format}đ</b></p>
					</div>
				</div>
				{/foreach}
				<hr>
				{/foreach}
				
				<h5>Tổng tiền đơn hàng: <b>{$out.total|number_format}đ</b></h5>
				
			</div>
		</div>
	</div>

</div>

{literal}
<script type="text/javascript">
function Payment(){
	var data = {};
	data['name'] = $("#FrmCont input[name=name]").val();
	data['phone'] = $("#FrmCont input[name=phone]").val();
	data['email'] = $("#FrmCont input[name=email]").val();
	data['address'] = $("#FrmCont input[name=address]").val();
	data['description'] = $("#FrmCont textarea[name=description]").val();
	data['ajax_action'] = "payment";
	
	if(data.name.length < 6){
		noticeMsg('System Message', 'Vui lòng nhập tên người mua tối thiểu 6 ký tự.');
		$("#FrmCont input[name=name]").focus();
		return false;
	}else if(data.phone.length < 10){
		noticeMsg('System Message', 'Vui lòng nhập chính xác số điện thoại liên hệ của bạn.');
		$("#FrmCont input[name=phone]").focus();
		return false;
	}else if(data.address.length < 10){
		noticeMsg('System Message', 'Vui lòng nhập chính xác địa chỉ nhận hàng.');
		$("#FrmCont input[name=address]").focus();
		return false;
	}
	
	loading();
	$.post('?mod=product&site=payment', data).done(function(){
		noticeMsg('System Message', 'Đặt mua đơn hàng thành công.', 'success');
		location.href = "?mod=product&site=index";
	});
}
</script>
{/literal}