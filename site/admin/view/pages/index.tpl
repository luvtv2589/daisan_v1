<link href="{$arg.stylesheet}chosen/chosen.min.css" rel="stylesheet">
<script src="{$arg.stylesheet}chosen/chosen.jquery.min.js"></script>
<div class="body-head">
	<div class="row">
		<div class="col-md-8">
			<h1><i class="fa fa-bars fa-fw"></i> Quản lý pages đã đăng ký</h1>
		</div>
		<div class="col-md-4 text-right">
			<button type="button" class="btn btn-primary" onclick="UpdateScore();"><i class="fa fa-refresh fa-fw"></i> Cập nhật điểm QC</button>
			<a href="?mod=pages&site=form" class="btn btn-primary"><i class="fa fa-plus fa-fw"></i> Thêm Mới</a>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-9">
	    <div class="form-group form-inline">
	        <input type="search" class="left form-control" id="keyword" placeholder="Từ khóa..." value="{$out.filter_keyword}">
	        <select class="left form-control" id="status">{$out.filter_status}</select>
	        <select class="left form-control" id="user">{$out.filter_user}</select>
	        <select class="left form-control" id="category_id"><option value="-1">Tất cả danh mục</option>{$out.filter_category}</select>
	        <button type="button" class="btn btn-default" onclick="filter();"><i class="fa fa-search fa-fw"></i> Tìm kiếm</button>
	    </div>
	</div>
	<div class="col-md-3">
	    <div class="form-group form-inline text-right">
	        <select class="left form-control" name="bulk1">
	            <option value="">Chọn tác vụ</option>
	            <option value="1">Kích hoạt</option>
	            <option value="2">Hủy kích hoạt</option>
	        </select>
	        <button id="search_btn" type="button" class="btn btn-default" onclick="BulkAction(1);">Áp dụng</button>
        </div>
	</div>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="45"><input type="checkbox" class="SelectAllRows"></th>
            <th>Tiêu đề</th>
            <th>Gói đăng ký</th>
            <th class="text-right">Sản phẩm</th>
            <th>Điểm QC</th>
            <th>Member</th>
            <th>Admin</th>
            <th>Khởi tạo</th>
            <th class="text-center">TT</th>
            <th class="text-center">Hot</th>
            <th class="text-right" width="140"></th>
        </tr>
        </thead>
        <tbody>
        {if $result neq NULL}
            {foreach from=$result item=data}
                <tr id="field{$data.id}">
                    <td class="text-center"><input type="checkbox" class="item_checked" value="{$data.id}"></td>
                    <td width="35%">
                    	<div class="row row-small">
                    		<div class="col-md-2">
                    			<img class="img" id="img{$data.id}" src="{$data.logo}">
                    		</div>
                    		<div class="col-md-10">
		                        <a href="javascript:void(0)" onclick="LoadNation({$data.id});"><img src="{$data.nation_logo}" width="30"></a>&nbsp;&nbsp;<a href="{$data.url}" class="field_name" target="_blank">[{$data.id}] {$data.name}</a>
		                        <br><span class="text-small"><i class="fa fa-map-marker fa-fw"></i> {$data.address}</span>
		                        <br><span class="text-small"><i class="fa fa-globe"></i><a href="{$data.website}" target="_blank"> {$data.website}</a></span>
		                        <br><span class="text-small"><i class="fa fa-tag"></i><a href="javascript:void(0);" onclick="ChangeCategory({$data.id});"> {$data.category|default:'Chưa chọn mục'} <i class="fa fa-pencil"></i></a></span>
		                        
                    		</div>
                    	</div>
                    </td>
                    <td>
                    	<p>
	                        <button class="btn btn-default btn-xs" onclick="LoadPackage({$data.id});"><i class="fa fa-pencil fa-fw"></i></button>
	                    	{$data.package|default:'Free'}
                    	</p>
                    	<small>{$data.package_end}</small>
                    </td>
                    <td class="text-right"><a href="?mod=product&site=index&page_id={$data.id}" target="">{$data.products_active}/{$data.products}</a></td>
                    <td>{$data.score_ads}</td>
                    <td>{$data.user_name}
                    {foreach from = $data.all_users item = user}
                    <a class="btn btn-default btn-sm">{$user.name}</a>
                    {/foreach}
                    </td>
                    <td>{$data.admin}</td>
                    <td>{$data.created|date_format:'%H:%M %d-%m-%Y'}</td>
                    <td class="text-center" id="stt{$data.id}">{$data.status}</td>
                    <td class="text-center" id="stt{$data.id}">{$data.featured}</td>
                    <td class="text-right">
                        <button type="button" class="btn btn-default btn-xs" onclick="LoadSetManager({$data.id});"><i class="fa fa-user fa-fw"></i></button>
                        <button type="button" class="btn btn-default btn-xs" onclick="LoadCopy({$data.id});"><i class="fa fa-clone fa-fw"></i></button>
                        <a href="?mod=pages&site=form&id={$data.id}" class="btn btn-default btn-xs"><i class="fa fa-pencil fa-fw"></i></a>
                        <button type="button" class="btn btn-default btn-xs" onclick="LoadDeleteItem('pages', {$data.id}, 'ajax_delete');"><i class="fa fa-trash fa-fw"></i></button>
                        <button type="button" class="btn btn-default btn-xs" onclick="Refresh({$data.id});"><i class="fa fa-refresh fa-fw"></i></button>
                    </td>
                </tr>
            {/foreach}
        {else}
            <tr><td class="text-center" colspan="10"><br>Không có nội dung nào được tìm thấy<br><br></td></tr>
        {/if}
        </tbody>
    </table>
</div>

<div class="paging">{$paging}</div>

<!-- Content Modal -->
<div class="modal fade" id="SetManager">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">Hiển thị chi tiết bài viết</h4>
            </div>
            <div class="modal-body">
            	<input type="hidden" name="page_id">
				<div class="form-group">
					<label>Nhập user_id muốn set admin</label> 
					<input type="text" name="user_id" class="form-control">
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-success" onclick="SetManager();">Lưu thông tin</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="CopyPage">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">Sao chép gian hàng</h4>
            </div>
            <div class="modal-body">
            	<input type="hidden" name="page_id">
            	<p>Chức năng cho phép sao chép thông tin gian hàng cùng các sản phẩm dịch vụ mà gian hàng đang cung cấp.</p>
            	<p>Bạn chắc chắn muốn sao chép gian hàng này chứ?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="CopyPage();">Đồng ý</button>
            </div>
        </div>
    </div>
</div>

<!-- Content Modal -->
<div class="modal fade" id="SetPackage">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">Hiển thị chi tiết bài viết</h4>
            </div>
            <div class="modal-body">
            	<input type="hidden" name="page_id">
				<div class="form-group">
					<label>Chọn gói gian hàng</label> 
					<select name="package_id" class="form-control"></select>
				</div>
				<div class="form-group">
					<label>Ngày hết hạn</label> 
					<input type="text" name="endtime" class="form-control datepicker">
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-success" onclick="SavePackage();">Lưu thông tin</button>
            </div>
        </div>
    </div>
</div>

<!-- Content Modal -->
<div class="modal fade" id="SetNation">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">Quốc gia</h4>
            </div>
            <div class="modal-body">
            	<input type="hidden" name="page_id">
				<div class="form-group">
					<label>Lựa chọn quốc gia</label> 
					<select name="nation_id" class="form-control"></select>
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-success" onclick="SaveNation();">Lưu thông tin</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="Category">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">danh mục</h4>
            </div>
            <div class="modal-body">
            	<input type="hidden" name="page_id">
				<div class="form-group">
					<label>Lựa chọn danh mục</label> 
					<select name="taxonomy_id" class="form-control chosen"></select>
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-success" onclick="ChangeCategory(0, 'save');">Lưu thông tin</button>
            </div>
        </div>
    </div>
</div>


{literal}
<script>
$(window).ready(function(){
	$("select#user").chosen({});
	$(".chosen").chosen({});
});
$('#keyword,#category').keypress(function( event ){
    if ( event.which == 13 ) filter();
});

$(".datepicker").datepicker();

function filter(){
    var key = $("#keyword").val();
    var status = $("#status").val();
    var user_id = $("#user").val();
    var category_id = $("#category_id").val();
    var url = "?mod=pages&site=index";
    if(user_id!=0) url = url+"&user_id="+user_id;
    if(status!=-1) url = url+"&status="+status;
    if(category_id!=-1) url = url+"&category_id="+category_id;
    if(key!='') url = url+"&key="+key;
    window.location.href = url;
}

function ChangeCategory(page_id, type){
	if(type=='save'){
		var data = {};
		data.page_id = $('#Category input[name=page_id]').val();
		data.taxonomy_id = $('#Category select[name=taxonomy_id]').val();
		data.ajax_action = 'save_category';
		loading();
		$.post('?mod=pages&site=index', data).done(function(e){
			$('#Category').modal('hide');
			location.reload();
			endloading();
		});
	}else{
		var data = {};
		data.page_id = page_id;
		data.ajax_action = 'load_category';
		loading();
		$.post('?mod=pages&site=index', data).done(function(e){
			$('#Category input[name=page_id]').val(page_id);
			$('#Category select[name=taxonomy_id]').html(e);
			$('#Category .chosen').trigger("chosen:updated");
			$("#Category .chosen-container").css("width", "100%");
			$('#Category').modal('show');
			endloading();
		});
	}
}

function LoadPackage(page_id){
	var data = {};
	data.id = page_id;
	data.ajax_action = 'load_package';
	$.post('?mod=pages&site=index', data).done(function(e){
		$("#SetPackage input[name=page_id]").val(page_id);
		var rt = JSON.parse(e);
		$("#SetPackage select[name=package_id]").html(rt.s_package);
		$("#SetPackage input[name=endtime]").val(rt.endtime);
		$("#SetPackage").modal('show');
	});
}

function LoadNation(page_id){
	var data = {};
	data.id = page_id;
	data.ajax_action = 'load_nation';
	$.post('?mod=pages&site=index', data).done(function(e){
		$("#SetNation input[name=page_id]").val(page_id);
		var rt = JSON.parse(e);
		$("#SetNation select[name=nation_id]").html(rt.s_nation);
		$("#SetNation").modal('show');
	});
}
function SaveNation(){
	var data = {};
	data.page_id = $("#SetNation input[name=page_id]").val();
	data.nation_id = $("#SetNation select[name=nation_id]").val();
	data.ajax_action = 'save_nation';
	loading();
	$.post('?mod=pages&site=index', data).done(function(e){
		var rt = JSON.parse(e);
		noticeMsg('Message System', 'Cập nhật thông tin thành công.', 'success');
		setTimeout(function(){
			location.reload();
		}, 1000);
	});
}

function LoadCopy(page_id){
	$("#CopyPage input[name=page_id]").val(page_id);
	$("#CopyPage").modal('show');
}

function CopyPage(){
	var data = {};
	data.page_id = $("#CopyPage input[name=page_id]").val();
	data.ajax_action = 'copy_page';
	loading();
	$.post('?mod=pages&site=index', data).done(function(e){
		console.log(e);
		//return false;
		if(e==0){
			noticeMsg('Message System', 'Sao chép thông tin thất bại.', 'error');
			endloading();
			$("#CopyPage").modal('hide');
		}else{
			noticeMsg('Message System', 'Sao chép thông tin thành công.', 'success');
			setTimeout(function(){
				location.reload();
			}, 1000);
			
		}
	});
}

function SavePackage(){
	var data = {};
	data.page_id = $("#SetPackage input[name=page_id]").val();
	data.package_id = $("#SetPackage select[name=package_id]").val();
	data.endtime = $("#SetPackage input[name=endtime]").val();
	data.ajax_action = 'save_package';
	loading();
	if(data.endtime==''){
		noticeMsg('Message System', 'Vui lòng nhập ngày hết hạn.', 'error');
		$("#SetPackage input[name=endtime]").focus();
		$("#SetPackage").modal('hide');
		endloading();
		return false;
	}
	
	$.post('?mod=pages&site=index', data).done(function(e){
		var rt = JSON.parse(e);
		noticeMsg('Message System', 'Cập nhật thông tin thành công.', 'success');
		setTimeout(function(){
			location.reload();
		}, 1000);
	});
}

function LoadSetManager(page_id){
	$("#SetManager input[name=page_id]").val(page_id);
	$("#SetManager").modal('show');
}

function SetManager(){
	var data = {};
	data.page_id = $("#SetManager input[name=page_id]").val();
	data.user_id = $("#SetManager input[name=user_id]").val();
	
	if(data.user_id=='' || !$.isNumeric(data.user_id)){
		noticeMsg('System Message', 'Vui lòng nhập chính xác mã người dùng', 'error');
		$("#SetManager input[name=user_id]").focus();
		return false;
	}

	loading();
    $.post("?mod=pages&site=ajax_add_admin", data).done(function (e) {
    	var rt = JSON.parse(e);
    	if(rt.code==0){
    		noticeMsg('System Message', rt.msg, 'error');
    		$("#SetManager input[name=user_id]").focus();
    		endloading();
    		return false;
    	}else{
    		noticeMsg('System Message', rt.msg, 'success');
    		setTimeout(function(){
    			location.reload();
    		}, 200);
    	}
    });

}

function BulkAction(pos) {
    PNotify.removeAll();
    var bulk = $('select[name=bulk'+pos+']').val();
    if (bulk == '') {
        var notice = new PNotify({
            title: 'Chọn tác vụ',
            text: 'Vui lòng chọn 1 tác vụ',
            type: 'info',
            mouse_reset: false,
            buttons: { sticker: false },
            animate: { animate: true, in_class: 'fadeInDown', out_class: 'fadeOutRight' }
        });
        notice.get().click(function () { notice.remove(); });
    } 
    else if (bulk == 1) BulkActive('pages', 1);
    else if (bulk == 2) BulkActive('pages', 2);
}

function UpdateScore(){
	loading();
	var data = {};
    $.post("?mod=pages&site=ajax_update_score_monthly", data).done(function (e) {
   		noticeMsg('System Message', 'Cập nhật thông tin thành công.', 'success');
   		endloading();
   		return false;
    });
}

function Refresh(page_id){
	loading();
	var data = {};
	data.page_id = page_id;
	data.ajax_action = 'refresh_page';
    $.post("?mod=pages&site=index", data).done(function (e) {
   		noticeMsg('System Message', 'Cập nhật thông tin thành công.', 'success');
   		endloading();
   		return false;
    });
}

</script>
{/literal}