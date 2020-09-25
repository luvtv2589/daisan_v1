<div class="{if !$is_mobile} container{/if}">
	<div class="mt-md-3 d-none d-sm-block">{$breadcrumb}</div>
	<div class="row row-nm">
		<div class="col-md-9" id="RfqDetail">
			<div class="card rounded-0 mt-md-3">
				<div class="card-body">
					<div class="m-md-3">
						<h1>{$rfq.title}</h1>
						<div class="my-3">
							<span><span class="text-sm-o">Số lượng yêu cầu:</span> <b>{$rfq.number}</b> {$rfq.unit}</span>
							<span class="ml-3"><span class="text-sm-o">Thời gian đăng:</span> {$rfq.created|date_format:'%H:%M %Y-%m-%d'}</span>
						</div>
						<div>
							<span><span class="text-sm-o">Người đăng:</span> {$rfq.user} <span class="text-sm-bo mr-1">Email đã xác nhận</span><span class="text-sm-bo">Người mua đang hoạt động</span></span>
							<span class="ml-3"><span class="text-sm-o">Địa điểm:</span> {$rfq.location}, Việt Nam</span>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<div class="m-md-3">
						<button type="button" class="btn btn-danger btn-sm btnRfq" data-toggle="modal" data-target="#FormQuotation">Gửi báo giá ngay</button>
						<span class="mx-md-3"><span class="text-sm-o">Còn lại</span> <b class="text-lg-o mx-1 text-danger">{$out.number_quotation}</b> <span class="text-sm-o">báo giá</span></span>
						<span class=""><span class="text-sm-o">Hết hạn</span> {$rfq.endtime|date_format:'%H:%M %Y-%m-%d'}</span>
					</div>
				</div>
			</div>
			
			<div class="card rounded-0 mt-3">
				<div class="card-header">
					<h5>Thông tin yêu cầu</h5>
				</div>
				<div class="card-body pt-0">
					<div class="row">
						<div class="col-md-7">
							<p>{$rfq.description|nl2br}</p>
							<div class="card-header">
								Thông tin bổ xung
							</div>
							<table class="table table-bordered">
								<tr>
									<td>Yêu cầu giá</td>
									<td>{$rfq.price|number_format} VND</td>
								</tr>
								<tr>
									<td>Thanh toán</td>
									<td>{$rfq.payment_method}</td>
								</tr>
							</table>
						</div>
						<div class="col-md-5">
							{if $rfq.image}
							<div class="img-thumbnail rounded-0">
								<img src="{$rfq.avatar}" class="w-100">
							</div>
							{/if}
						</div>
					</div>
				</div>
			</div>
			
			<div class="card rounded-0 mt-3">
				<div class="card-body">
					<h6 class="text-uppercase mb-2">Hồ sơ người yêu cầu</h6>
					<p class="mb-0"><b>{$rfq.user}</b> | Người dùng cá nhân <span class="text-sm-bo mr-1">Email đã xác nhận</span><span class="text-sm-bo">Người mua đang hoạt động</span></p>
				</div>
				<!-- <div class="card-header">Yêu cầu mới nhất</div>
				<div class="card-body">
					<div class="row row-nm">
						{foreach from=$user_rfqs item=data}
						<div class="col-md-2">
							<div class="img-thumbnail rounded-0">
								<img alt="{$data.title}" src="{$data.avatar}" class="w-100">
							</div>
							<p class="line-2 my-1">{$data.title}</p>
							<p class="text-sm col-gray">Cần {$data.number} {$data.unit}</p>
						</div>
						{/foreach}
					</div>
				</div>-->
			</div>
			
			<div class="card rounded-0 mt-3">
				<div class="card-header">
					<h5>Danh sách báo giá</h5>
				</div>
				<ul class="list-group list-group-flush">
					{foreach from=$quotations item=data}
					<li class="list-group-item">
						<div class="row row-nm">
							<div class="col-md-2">
								<img alt="{$data.page_name}" src="{$data.page_logo}" class="w-100 img-thumbnail">
							</div>
							<div class="col-md-10">
								<h5 class="my-1">{$data.page_name}</h5>
								<p>{$data.description}</p>
								<p>Gửi lúc: {$data.created|date_format:'%H:%M %Y-%m-%d'}</p>
							</div>
						</div>
					</li>
					{/foreach}
				</ul>
			</div>
			
			
		</div>
		<div class="col-md-3" id="RfqOther">
			<div class="card rounded-0 mt-3">
				<div class="card-header"><h5 class="mb-0">Yêu cầu mới nhất</h5></div>
				<ul class="list-group list-group-flush">
					{foreach from=$other item=data}
					<li class="list-group-item">
						<p class="mb-1"><a href="{$data.url}">{$data.title}</a></p>
						<p class="mb-0"><span class="text-sm-o">Số lượng yêu cầu:</span> <b class="text-success">{$data.number}</b> {$data.unit}</p>
						<p class="mb-0"><span class="text-sm-o">Địa điểm:</span> {$data.location}, Việt Nam</p>
						<p class="mb-0"><span class="text-sm-o">Thời gian đăng: {$data.created|date_format:'%H:%M %Y-%m-%d'}</span></p>
					</li>
					{/foreach}
				</ul>
			</div>
		</div>
	</div>

</div>

<div class="modal fade" tabindex="-1" role="dialog" id="FormQuotation">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Gửi báo giá cho yêu cầu</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<input type="hidden" name="rfq_id" value="{$rfq.id}">
				<div class="form-group">
					<label class="col-form-label">Báo giá với tư cách:</label>
					<select class="form-control" name="page_id" onchange="SetProducts(this.value);">{$out.s_pages}</select>
				</div>
				<div class="row row-sm mb-3">
					<div class="col-md-4">
						<span class="border d-block">
							<img src="{$user.avatar}" id="ShowImg" width="100%">
						</span>
					</div>
					<div class="col-md-8">
						<input type="file" id="UploadImg" onchange="LoadImage(this);">
						<input type="hidden" name="image">
						<small class="form-text text-muted"> Kích thước file tối đa 2Mb, hỗ trợ định dạng jpg, png.</small>
					</div>
				</div>
				<div class="form-group">
					<textarea class="form-control" name="description" rows="4" placeholder="Nội dung báo giá"></textarea>
				</div>

				<div class="form-group row">
					<label for="staticEmail" class="col-sm-2 col-form-label">Giá báo</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="price">
					</div>
				</div>

				<div class="form-group">
					<label class="col-form-label">Sản phẩm đính kèm theo báo giá</label>
					<select class="form-control" name="product_id">{$out.s_products}</select>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
				<button type="button" class="btn btn-primary" onclick="SaveQuotation();">Lưu báo giá</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function SaveQuotation(){
	var data = {};
	data.rfq_id = $("#FormQuotation input[name=rfq_id]").val();
	data.page_id = $("#FormQuotation select[name=page_id]").val();
	data.product_id = $("#FormQuotation select[name=product_id]").val();
	data.description = $("#FormQuotation textarea[name=description]").val();
	data.price = $("#FormQuotation input[name=price]").val();
	data.image = $("#FormQuotation input[name=image]").val();
	if(data.description.length<10 || data.description.length>1000){
		noticeMsg('System Message', 'Vui lòng nhập nội dung báo giá có 10~1000 ký tự.', 'error');
		$("#FormQuotation textarea[name=description]").focus();
		return false;
	}
	//console.log(data);
	data.ajax_action = 'save_quotation';
	loading();
	$.post('?site=ajax_handle', data).done(function(e){
		var rt = JSON.parse(e);
		if(rt.code==0){
			noticeMsg('System Message', rt.msg, 'error');
			endloading();
		}else{
			noticeMsg('System Message', rt.msg, 'success');
			setTimeout(function(){
				location.reload();
			}, 1500);
		}
	});
}

function SetProducts(page_id){
	loading();
	var data = {};
	data.page_id = page_id;
	data.ajax_action = 'load_page_products';
	$.post('?site=ajax_handle', data).done(function(e){
		$("#FormQuotation select[name=product_id]").html(e);
		endloading();
	});
}

function LoadImage(input) {
	loading();
	if (input.files && input.files[0]) {
		var fileImg = input.files[0];
		var _URL = window.URL || window.webkitURL;
		var img = new Image();
        img.onload = function () {
            if(this.width/this.height>5 || this.width/this.height<0.2){
            	noticeMsg('Thông báo', 'Kích thước ảnh không phù hợp vui lòng chọn lại.', 'error');
            	$("#UploadImg").val('');
            	$("#FormQuotation input[name=image]").val('');
            	$("#ShowImg").attr('src', arg.noimg);
            	return false;
            }else{
        		var reader = new FileReader();
        		reader.onload = function(e) {
        			$("#ShowImg").attr('src', e.target.result);
        			$("#FormQuotation input[name=image]").val(e.target.result);
        		}
        		reader.readAsDataURL(fileImg);
            }
        }
        img.src = _URL.createObjectURL(fileImg);
        endloading();
	}
}

</script>