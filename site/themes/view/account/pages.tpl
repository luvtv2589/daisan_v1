<div class="container">
<div class="card my-3">
	<div class="card-body">
		<h4>Danh sách gian hàng được gắn quản trị</h4>
		<hr>
		<div class="mt-3">
		
			<div class="form-inline">
				<div class="form-group mb-2 mr-2">
					<input type="text" class="form-control" id="filter_key" placeholder="Search" value="{$out.key|default:''}">
				</div>
	        	<select class="form-control mb-2 mr-2" id="package_id">{$out.filter_package}</select>
	        	<select class="form-control mb-2 mr-2" id="location_id">{$out.filter_location}</select>
				<button type="button" onclick="filter();" class="btn btn-primary mb-2">Search</button>
			</div>
			<hr>
		
			{foreach from=$pages item=data}
			<div class="row row-nm">
				<div class="col-2">
					<a href="{$data.url_page}"><img class="img-thumbnail" src="{$data.logo}" width="100%"></a>
				</div>
				<div class="col-10">
					<h5 class="card-title mb-1"><a href="{$data.url_page}">{$data.name}</a></h5>
					<p class="mb-1">
						<span class="text-small"><i class="fa fa-globe"></i> Vai trò: {$data.position}</span>
						<span class="text-small ml-2"><i class="fa fa-globe"></i> Mã: {$data.idcode|default:''}</span>
						<span class="text-small ml-2"><i class="fa fa-diamond"></i> Gói: <b>{$data.package|default:'Free'} {if $data.package}(Hết hạn: {$data.package_end|date_format:'%d-%m-%Y'}){/if}</b></span>
						<span class="text-small ml-2"><i class="fa fa-globe"></i> Sản phẩm: {$a_product[$data.id]|default:0}</span>
					</p>
					<p>Quản trị: {$data.users|default:''}</p>
					<p class="mb-0">
						<a class="btn btn-primary btn-sm" href="{$data.url_admin}" target="_blank"><i class="fa fa-cog"></i> Vào trang quản lý</a>
					</p>
				</div>
			</div>
			<hr>
			{/foreach}
		
			<nav aria-label="Page navigation example">
				{$paging}
			</nav>
		
		</div>
	
	</div>
</div>
</div>
{literal}
<script type="text/javascript">
$(document).ready(function(){
	$('#filter_key').keypress(function(event){
	    if(event.which==13) filter();
	});
});

function filter(){
	var key = $("#filter_key").val();
	var package_id = $("#package_id").val();
	var location_id = $("#location_id").val();
	var url = "?mod=account&site=pages";
	if(key!='') url = url+"&key="+key;
	if(package_id!=0) url = url+"&package_id="+package_id;
	if(location_id!=0) url = url+"&location_id="+location_id;
	location.href =  url;
}
</script>
{/literal}