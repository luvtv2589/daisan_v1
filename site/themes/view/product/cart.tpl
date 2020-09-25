<div class="container">
	<div class="mt-4">
		<div class="row row-no" id="cartmenu">
			<div class="col-md-4">
				<div class="item active">Thông tin giỏ hàng</div>
			</div>
			<div class="col-md-4">
				<div class="item">Giao hàng và thanh toán</div>
			</div>
			<div class="col-md-4">
				<div class="item">Hoàn thành</div>
			</div>
		</div>
	</div>
	
	{foreach from=$cart key=pageid item=page}
	<div class="mt-4">
		<span class="mr-2">Nhà cung cấp:</span> 
		<b><i class="fa fa-fw fa-diamond"></i> {$page.pagename}</b>
	</div>
	<div class="card rounded-0 mt-2">
		<div class="card-body">
			<div class="row">
				<div class="col-4">Sản phẩm</div>
				<div class="col-3">
					<span>*</span>Số lượng
				</div>
				<div class="col-3">
					<span>*</span>Đơn giá
				</div>
				<div class="col-2"></div>
			</div>

			{foreach from=$page.products key=k item=data}
			<div id="item_id{$k}" class="cartitem">
				<div class="row">
					<div class="col-4">
						<a href="{$data.url}">
							<img src="{$data.avatar}"> 
							<span>{$data.name}</span>
						</a>
					</div>
					<div class="col-3">
						<input type="text" id="Numb{$k}" onchange="ChangeNumber(this.value, {$k}, {$pageid});" value="{$data.number|default:0}" height="100%"> 
						<span>Piece/s</span>
					</div>
					<div class="col-3">
						<input type="text" id="price" class="text-right" disabled value="{$data.price|number_format}" height="100%"> 
						<span class="product-price">VN </span>
					</div>
					<div class="col-2 text-right">
						<button type="button" class="btn btn-sm btn-outline-secondary" onclick="DeleteProduct({$k}, {$pageid});">Xóa sản phẩm</button>
					</div>
				</div>
			</div>
			{/foreach}
			<p class="mt-3 text-right">Tổng: <b>{$page.total|number_format}đ</b></p>
		</div>
	</div>
	{/foreach}
	
	<div class="my-4 text-right">
		<a href="?mod=product&site=payment" class="btn btn-success rounded-0"><i class="fa fa-fw fa-check"></i>Bắt đầu đăt hàng</a>
		<button type="button" class="btn btn-danger rounded-0" onclick="DeleteCart();">
			<i class="fa fa-fw fa-trash"></i> Xóa đơn hàng này
		</button>
	</div>
	
</div>

{literal}
<script type="text/javascript">
function DeleteProduct(id, page_id){
	var data = {};
	data['id'] = id;
	data['page_id'] = page_id;
	data['ajax_action'] = "delete_product";
	loading();
	$.post('?mod=product&site=ajax_handle', data).done(function(){
		noticeMsg('System Message', 'Xóa sản phẩm trong giỏ hàng thành công.', 'success');
		location.reload();
	});
}

function ChangeNumber(number, id, page_id){
	var data = {};
	data['id'] = id;
	data['number'] = number;
	data['page_id'] = page_id;
	data['ajax_action'] = "change_number_product";
	
	if(number<1){
		noticeMsg('System Message', 'Số lượng sản phẩm tối thiểu là 1.', 'error');
		$("#Numb"+id).focus();
		return false;
	}
	
	loading();
	$.post('?mod=product&site=ajax_handle', data).done(function(){
		noticeMsg('System Message', 'Cập nhật giỏ hàng thành công.', 'success');
		location.reload();
	});
}


function DeleteCart(){
	loading();
	$.post('?mod=product&site=ajax_handle', {'ajax_action':'delete_cart'}).done(function(){
		noticeMsg('System Message', 'Xóa giỏ hàng thành công.', 'success');
		location.reload();
	});
}
</script>
{/literal}