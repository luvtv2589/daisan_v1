<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

<style>
	.badge-info{
		color: #333 !important;
    	background-color: #fff !important;
	}
</style>
<div class="body-head">
	<div class="row">
		<div class="col-md-8">
			<h1><i class="fa fa-bars fa-fw"></i> Quản lý sản phẩm</h1>
		</div>
		<div class="col-md-4 text-right">
		</div>
	</div>
</div>
<form method="post">
	<div class="card mb-3">
		<div class="card-body">
			<input type="hidden" name="id" value="{$product.id|default:0}">
			<input type="hidden" name="folder" id="folder" value="{$product.folder|default:''}">
			<input type="hidden" name="folder_img" value="{$folder|default:''}">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Tên sản phẩm</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="name" value="{$product.name|default:''}">
					<input type="text" class="form-control" name="source" value="{$product.source|default:''}">
				</div>
				<div class="col-sm-1 col-form-label"><a href="{$product.source}" target="_blank">Nguồn</a></div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Danh mục</label>
				<div class="col-sm-4">
					<select name="taxonomy_id_c" class="form-control" onchange="LoadCategory(this.value, 0);">
						{$out.select_category}
					</select>
				</div>
			</div>
			<div class="form-group row" id="Cate1">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-4">
					<select name="taxonomy_id_c1" class="form-control" onchange="LoadCategory(this.value, 1);">
						{$out.select_category_sub1}
					</select>
				</div>
			</div>
			<div class="form-group row" id="Cate2">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-4">
					<select name="taxonomy_id" class="form-control" onchange="LoadCategory(this.value, 2);">
						{$out.select_category_sub2}
					</select>
				</div>
			</div>
			
			

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Mã sản phẩm</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="code" value="{$product.code|default:''}">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Tên thương hiệu</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="trademark" value="{$product.trademark|default:''}">
				</div>
			</div>
			<div class="form-group row row-sm">
				<label class="col-sm-2 col-form-label">Từ khóa</label>
				<div class="col-sm-3">
					<input type="text" class="form-control keyword" name="key[]" value="{$keywords[0]|default:''}">
				</div>
				<div class="col-sm-3">
					<input type="text" class="form-control keyword" name="key[]" value="{$keywords[1]|default:''}">
				</div>
				<div class="col-sm-3">
					<input type="text" class="form-control keyword" name="key[]" value="{$keywords[2]|default:''}">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Thời gian giao hàng</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="ordertime" value="{$product.ordertime|default:''}">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Khả năng cung cấp</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="ability" value="{$product.ability|default:''}" placeholder="Vd: Cung cấp 1000 sản phẩm/ ngày">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Số lượng đặt hàng tối thiểu</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="minorder" value="{$product.minorder|default:1}">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Đơn vị</label>
				<div class="col-sm-3">
					<select class="form-control" name="unit_id" id="unit_id">{$product.s_unit}</select>
					<input type="hidden" name="unit_name" id="unit_name">
				</div>
			</div>
		</div>
	</div>
	
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-4">Thuộc tính</div>
				<!-- <div class="col-md-4 text-right">
					<a href="?mod=product&site=attribute" class="btn btn-success btn-sm">
						<i class="fa fa-plus fa-fw"></i>
						Thêm loại thuộc tính mới
					</a>
				</div> -->
			</div>
		</div>
		<div class="panel-body">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Loại thuộc tính</label>
				<div class="col-sm-8">
					<select name="attribute_id" class="form-control" onchange="changeAttribute(this.value)">
						<option value="0">Chọn loại thuộc tính</option>
						{foreach from=$groupAttributes key=k item=v}
						<option value="{$v.id}" {if $v.id==$product.groupattributes_id}selected{/if}>{$v.name}</option>
						{/foreach}
					</select>
				</div>
			</div>
			<hr>
			<!-- dataAttribute -->
			<div class="class" id="detailAttribute">
				


				{if count($dataAttribute)>0}
				{foreach from=$dataAttribute key=k item=v}
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">{$v.name}</label>
					
					<div class="col-sm-8">
						<input type="hidden" name="detail_attribute_name_{$k+1}" value="{$v.name}">
						<select class="form-control selectpicker" 
							name="detail_attribute_content_{$k+1}[]" 
							data-live-search="true"
							data-none-selected-text="Chọn" 
							data-select-all-text="Chọn tất cả" 
							data-deselect-all-text="Bỏ tất cả"
							data-actions-box="true" multiple>
						{foreach from=$v['contents'] key=k2 item=v2}
							
							<option value="{$v2.name}" 
								data-content="<span class='badge badge-info'>{if $v2.img_name != '' && $v2.img_name != null}<img src='{$folder}{$v2.img_name}' width='30px' style='margin-right: 5px;'>{/if}{$v2.name}</span>"
								{if $v2.actived=='true'}selected{/if}>
								{$v2.name}
							</option>
							
						{/foreach}
						
						</select>
					</div>
				</div>
				{/foreach}
				{else}
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">{$v.name}</label>
					<div class="col-sm-8">
						<input type="hidden" name="detail_attribute_name_{$k+1}" value="{$v.key}">
						<input type="text" class="form-control" name="detail_attribute_content_{$k+1}" value="{$v.content}">
					</div>
				</div>
				{/if}
				
			</div>
			
		</div>
	</div>
	
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-8">Mô tả thêm thông tin</div>
				<div class="col-md-4 text-right">
					<button type="button" class="btn btn-light btn-sm" onclick="AddDetail();"><i class="fa fa-plus fa-fw"></i>Thêm</button>
				</div>
			</div>
		</div>
		<div class="panel-body" id="LoadDetail"></div>
	</div>
	

	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-8">Mô tả thêm thông tin</div>
			</div>
		</div>
		<div class="panel-body">
			<div class="mb-2">
				<input type="hidden" name="images" value="{$product.images|default:''}">
				<input type="file" id="UploadImg"> 
				<small class="form-text text-muted"> Kích thước file ảnh tối đa 300Mb, hỗ trợ định dạng jpg, png.</small>
			</div>

			<div class="row">
				<div class="col-sm-9">
					<div class="row row-sm" id="ShowImg">
						{foreach from=$a_image_show key=k item=img}
						<div class="col-md-2" id="Img{$k}">
							<div class="card-body align-middle p-0">
								<img alt="{$k}" src="{$img}" width="100%">
							</div>
							<div class="card-footer text-center p-1">
								{if $img eq $arg.noimg}
								<small>No Image</small>
								{else}
								<small><a href="javascript:void(0);" onclick="RemoveImg({$k});">Remove image</a></small>
								{/if}
							</div>
						</div>
						{/foreach}
					</div>
				</div>
			</div>
			<hr>
		
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Mô tả sản phẩm</label>
				<div class="col-sm-8">
					<textarea class="form-control" id="post_content" name="description" rows="12">{$product.description|default:''}</textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Quy cách đóng gói</label>
				<div class="col-sm-9">
					<textarea class="form-control" name="package" rows="8">{$product.package|default:''}</textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Câu hỏi thường gặp</label>
				<div class="col-sm-9">
					<textarea class="form-control" name="qa" rows="8">{$product.qa|default:''}</textarea>
				</div>
			</div>
		
		
		</div>
	</div>


	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-8">Bảng giá sản phẩm</div>
				<div class="col-md-4 text-right">
					<button type="button" class="btn btn-light btn-sm" onclick="AddPrice();"><i class="fa fa-plus fa-fw"></i>Thêm</button>
				</div>
			</div>
		</div>
		<div class="panel-body" id="LoadPrice"></div>
	</div>
	
	<div class="form-group row">
		<div class="col-sm-10">
			<input type="hidden" name="lenght_attribute" id="lenght_attribute" value="{count($dataAttribute)}">
			<button type="submit" name="submit" class="btn btn-primary btn-lg">Lưu thông tin</button>
		</div>
	</div>

</form>


<input type="hidden" name="json_keywords" value='{$json_keywords}'>

<link href="{$arg.stylesheet}chosen/chosen.min.css" rel="stylesheet">
<script src="{$arg.stylesheet}chosen/chosen.jquery.min.js"></script>
<script src="{$arg.stylesheet}tinymce/tinymce.min.js"></script>
<script src="{$arg.stylesheet}tinymce/tinymce-config.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

{literal}
<script>
	var ArrImg = [];
	var Images = $("input[name=images]").val();
	var Folder = $("input[name=folder]").val();
	var FolderImg = $("input[name=folder_img]").val();
	
	if(Images!='') ArrImg = Images.split(';');
	var id = $("input[name=id]").val();
	var json_keywords = JSON.parse($("input[name=json_keywords]").val());
	// $("select#attribute_id").change(function () {
	// 	console.log('change attribute');
	// 	var selected = $(this).children("option:selected").val();
	// 	console.log(selected);
	// });
	
	$(window).ready(function(){
		$( ".keyword" ).autocomplete({
			source: json_keywords
		});
		LoadImgForm();
		$('#UploadImg').change(function() {
			var Number = ArrImg.length;
			if (Number > 5){
				noticeMsg('Thông báo', 'Đã vượt quá số lượng ảnh được phép đăng.', 'error');
			}else if (this.files && this.files[0]) {
				var fileType = this.files[0]["type"];
				var fileName = this.files[0]["name"];
				var ValidImageTypes = ["image/jpeg","image/png"];
				
				if ($.inArray(fileType, ValidImageTypes)>=0) {
					var reader = new FileReader();
					reader.onload = function(e) {
						var Data = {};
						Data['imgname'] = fileName;
						Data['img'] = e.target.result;
						Data['ajax_action'] = 'upload_images';
						loading();
						$.post('?mod=product&site=ajax_handle&id='+id, Data).done(function(e){
							ArrImg.push(e);
							LoadImgForm();
							endloading();
						});
					}
					reader.readAsDataURL(this.files[0]);
				}else{
					noticeMsg('Thông báo', 'Vui lòng chọn ảnh đúng định dạng.', 'error');
				}
			}
			$("#UploadImg").val('');
		});
		
		$("#unit_name").val($("#unit_id option:selected").html());
		$("#unit_id").change(function () {
			$.each($("#unit_id option:selected"), function () {
				$("#unit_name").val($(this).html());
			});
		});
	});

	function changeAttribute($value) {
		
		var Data = {};
		Data['id'] = $value;
		Data['ajax_action'] = "load_detail_attribute";
		
		loading();
		$.post('?mod=product&site=ajax_handle', Data).done(function (e) {
			if (e.length > 0) {
				var $data = JSON.parse(e);
				var data = JSON.parse($data);
				var xhtml = "";
				
				data.forEach((element, index) => {
					var i = index+1;
					var data_contents = element.contents;
					if (data_contents.length > 0) {
						var yhtml = `<select class="form-control selectpicker" 
									name="detail_attribute_content_` + i +`[]" 
									data-live-search="true"
									data-none-selected-text="Chọn"
									data-select-all-text="Chọn tất cả"
									data-deselect-all-text="Bỏ tất cả"
									data-actions-box="true"
									multiple>`;
						var zhtml = "";
						data_contents.forEach((v, k) => {
							var ahtml = "";
							if (v.img_name != '' && v.img_name != null) {
								ahtml = `<img src='`+ FolderImg + v.img_name + `' width='30px' style='margin-right: 5px;'>`;
							}
							zhtml += `<option value="`+v.name+`" data-content="<span class='badge badge-info'>` + ahtml + v.name +`</span>">`+v.name+`</option>`;
						});

						yhtml += zhtml + `</select>`;
					}else{
						var yhtml = `<input type="text" class="form-control" name="detail_attribute_content_` + i +`">`;
					}
					
					
					xhtml += `<div class="form-group row">
					<label class="col-sm-2 col-form-label">`+element.name+`</label>
					<div class="col-sm-8">
						<input type="hidden" name="detail_attribute_name_`+ i +`" value="`+element.name+`">
						`+ yhtml +`
						
					</div>
				</div>`;
				});
				
				$("#detailAttribute").html(xhtml);
				$("#lenght_attribute").val(data.length);
				// console.log($data.length);
				// lenght_attribute
				endloading();
				$('.selectpicker').selectpicker();
			}
			endloading();
		});
	}

	function LoadCategory(id, level){
		var Data = {};
		Data['id'] = id;
		Data['ajax_action'] = "load_category";
		var id_set = level+1;
		
		loading();
		$.post('?mod=product&site=ajax_handle', Data).done(function(e){
			$("#Cate"+id_set+" select").html(e);
			endloading();
		});
	}

	function RemoveImg(Key){
		var Data = {};
		Data['imgname'] = ArrImg[Key];
		Data['ajax_action'] = 'remove_images';
		loading();
		$.post('?mod=product&site=ajax_handle&id='+id, Data).done(function(e){
			ArrImg.splice(Key, 1);
			LoadImgForm();
			endloading();
		});
	}

	function LoadImgForm(){
		$('#ShowImg img').attr('src', arg.noimg);
		$("#ShowImg small").html('No image');
		$.each(ArrImg, function(k, item){
			$('#Img'+k+' img').attr('src', Folder+item);
			$("#Img"+k+" small").html('<a href="javascript:void(0)" onclick="RemoveImg('+k+');">Remove</a>');
		});
	}

	$(".chosen").chosen({disable_search_threshold: 10});
	$("#LoadDetail").load('?mod=product&site=load_details');
	$("#LoadPrice").load('?mod=product&site=load_prices');

	function AddDetail(){
		$.post('?mod=product&site=ajax_handle', {'ajax_action':'add_detail'}).done(function(e){
			var rt = JSON.parse(e);
			if(rt.code==0){
				noticeMsg('Thông báo', rt.msg, 'error');
				return false;
			}
			$("#LoadDetail").load('?mod=product&site=load_details');
		});
	}
	function SetDetail(type, id, value){
		var Data = {};
		Data['type'] = type;
		Data['id'] = id;
		Data['value'] = value;
		Data['ajax_action'] = 'set_detail';
		$.post('?mod=product&site=ajax_handle', Data).done(function(){
			noticeMsg('Thông báo', 'Lưu thông tin thành công.', 'success');
		});
	}
	function DeleteDetail(id){
		$.post('?mod=product&site=ajax_handle', {'ajax_action':'delete_detail','id':id}).done(function(){
			$("#LoadDetail").load('?mod=product&site=load_details');
		});
	}
	function SortDetail(id, type){
		$.post('?mod=product&site=ajax_handle', {'ajax_action':'sort_detail','id':id,'type':type}).done(function(){
			$("#LoadDetail").load('?mod=product&site=load_details');
		});
	}

	/*-------------------*/
	function AddPrice(){
		$.post('?mod=product&site=ajax_handle', {'ajax_action':'add_price'}).done(function(e){
			var data = JSON.parse(e);
			if(data.code==1){
				$("#LoadPrice").load('?mod=product&site=load_prices');
			}else{
				noticeMsg('Thông báo', data.msg, 'error');
			}
		});
	}
	function SetPrice(type, id, value){
		var Data = {};
		Data['type'] = type;
		Data['id'] = id;
		Data['value'] = value;
		Data['ajax_action'] = 'set_price';
		$.post('?mod=product&site=ajax_handle', Data).done(function(){
			noticeMsg('Thông báo', 'Lưu thông tin thành công.', 'success');
		});
	}
	function DeletePrice(id){
		$.post('?mod=product&site=ajax_handle', {'ajax_action':'delete_price','id':id}).done(function(){
			$("#LoadPrice").load('?mod=product&site=load_prices');
		});
	}
	function SortPrice(id, type){
		$.post('?mod=product&site=ajax_handle', {'ajax_action':'sort_price','id':id,'type':type}).done(function(){
			$("#LoadPrice").load('?mod=product&site=load_prices');
		});
	}
</script>
{/literal}