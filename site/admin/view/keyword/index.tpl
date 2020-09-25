<div class="body-head">
	<div class="row">
		<div class="col-md-8">
			<h1><i class="fa fa-bars fa-fw"></i> Quản lý danh sách từ khóa</h1>
		</div>
		<div class="col-md-4 text-right">
			<button class="btn btn-primary" onclick="Refresh();"><i class="fa fa-check fa-fw"></i> Refresh</button>
			<button class="btn btn-primary" onclick="LoadForm(0);"><i class="fa fa-plus fa-fw"></i> Thêm Mới</button>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-8">
	    <div class="form-group form-inline">
	        <input type="search" class="left form-control" id="keyword" placeholder="Từ khóa..." value="{$out.filter_key}">
	        <button type="button" class="btn btn-default" onclick="filter();"><i class="fa fa-search fa-fw"></i> Tìm kiếm</button>
	    </div>
	</div>
	<div class="col-md-4">
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
            <th class="text-right">Id</th>
            <th>Từ khóa</th>
            <th class="text-right">Score</th>
            <th class="text-right">Thời gian</th>
            <th class="text-center">TT</th>
            <th class="text-right" width="100"></th>
        </tr>
        </thead>
        <tbody>
        {if $result neq NULL}
            {foreach from=$result item=data}
                <tr id="field{$data.id}">
                    <td class="text-center"><input type="checkbox" class="item_checked" value="{$data.id}"></td>
                    <td class="text-right">{$data.id}</td>
                    <td width="40%" class="field_name">{$data.name}</td>
                    <td class="text-right">{$data.score}</td>
                    <td class="text-right">{$data.created|date_format:'%H:%M:%S %d-%m-%Y'}</td>
                    <td class="text-center" id="stt{$data.id}">{$data.status}</td>
                    <td class="text-right" style="min-width:88px">
                        <button class="btn btn-default btn-xs" onclick="LoadForm({$data.id});"><i class="fa fa-pencil fa-fw"></i></button>
                        <button type="button" class="btn btn-default btn-xs" title="Xóa" onclick="LoadDeleteItem('keyword', {$data.id}, 'ajax_delete');"><i class="fa fa-trash fa-fw"></i></button>
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

<div class="modal fade" id="Form">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Cập nhật từ khóa</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Nhập từ khóa</label>
                    <input type="text" class="form-control" name="name">
                    <input type="hidden" value="" name="id">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ</button>
                <button type="button" class="btn btn-info" onclick="SaveForm();">Lưu thông tin</button>
            </div>
        </div>
    </div>
</div>

{literal}
<script>
$('#keyword,#category').keypress(function( event ){
    if ( event.which == 13 ) filter();
});

function LoadForm(id){
	var data = {};
	data.id = id;
	data.ajax_action = 'load_keyword';
	$.post('?mod=keyword&site=index', data).done(function(e){
		$("#Form input[name=id]").val(id);
		var rt = JSON.parse(e);
		$("#Form input[name=name]").val(rt.name);
		$("#Form").modal('show');
	});
}

function SaveForm(){
	var data = {};
	data.id = $("#Form input[name=id]").val();
	data.name = $("#Form input[name=name]").val();
	data.ajax_action = 'save_keyword';
	
	if(data.name.length < 3){
		noticeMsg('Message System', 'Vui lòng nhập từ khóa tối thiểu 3 ký tự.', 'error');
		$("#Form input[name=name]").focus();
		return false;
	}
	
	$.post('?mod=keyword&site=index', data).done(function(e){
		var rt = JSON.parse(e);
		noticeMsg('Message System', 'Cập nhật thông tin thành công.', 'success');
		$("#Form").modal('hide');
		if(data.id==0){
			setTimeout(function(){
				location.reload();
			}, 1000);
		}else $("#field"+data.id+" .field_name").html(data.name);
	});
}

function filter(){
    var key = $.trim($("#keyword").val());
    var status = $("#status").val();
    var cat = $("#category").val();
    var url = "?mod=keyword&site=index";
    if(cat!=0) url = url+"&cat="+cat;
    if(status!=-1) url = url+"&status="+status;
    if(key!='') url = url+"&key="+key;
    window.location.href = url;
}

function Refresh(){
	var data = {};
	loading();
	$.post('?mod=keyword&site=ajax_export_keywords', data).done(function(e){
		noticeMsg('Message System', 'Successful !');
		endloading();
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
</script>
{/literal}
