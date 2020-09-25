<div class="container">
	<div class="card-group">
		<div class="card" style="flex-grow: 0.5">
			<div class="card-body">
				<h5 class="card-title">Cập nhật mật khẩu mới</h5>
				<hr>
				<div id="FrmCont">
					{if $out.status eq 1}
					<div class="form-group">
						<label>Mật khẩu mới</label> 
						<input type="hidden" name="user_id" value="{$out.user_id}">
						<input type="password" name="pass" autofocus="autofocus" class="form-control">
					</div>
					<div class="form-group">
						<label>Xác nhận mật khẩu</label> 
						<input type="password" name="repass" class="form-control">
					</div>
					<p>Vui lòng nhập mật khẩu mới để thay thế cho mật khẩu đã quên của bạn.</p> 
					<div class="form-group">
						<button type="button" onclick="ChangePass();" class="btn btn-success">Cập nhật mật khẩu</button>
					</div>
					{else}
					<h5 class="mb-2">Thông báo</h5>
					<p>{$out.message}</p>
					<p>Vui lòng click vào nút "Quên mật khẩu" bên dưới để thực hiện lại chức năng.</p>
					<p><a href="?mod=account&site=forgetpass" class="btn btn-primary">Quên mật khẩu</a></p>
					{/if}
					<hr>
					<p>Nếu có mật khẩu hoặc chưa có tài khoản, vui lòng thực hiện đăng nhập hoặc tạo tài khoản mới.</p>
					<p class="clearfix">
						<a href="?mod=account&site=login" class="btn btn-outline-secondary">Đăng nhập</a>
						<a href="?mod=account&site=register" class="btn btn-outline-secondary">Tạo tài khoản</a>
					</p>
	
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">This card has supporting text below as a
					natural lead-in to additional content.</p>
				<p class="card-text">
					<small class="text-muted">Last updated 3 mins ago</small>
				</p>
			</div>
		</div>
	</div>
</div>

<link href="{$arg.stylesheet}css/pnotify.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/animate.min.css" rel="stylesheet">
<script src="{$arg.stylesheet}js/pnotify.min.js"></script>
{literal}
<script>
function ChangePass(){
	var data = {};
	data['user_id'] = $("#FrmCont input[name=user_id]").val();
	data['pass'] = $("#FrmCont input[name=pass]").val();
	data['repass'] = $("#FrmCont input[name=repass]").val();
	data['ajax_action'] = 'change_password';
	
	if(data.pass.length < 6){
		noticeMsg('System Message', 'Vui lòng nhập tối thiểu 6 ký tự.', 'error');
		$("#FrmCont input[name=pass]").focus();
		return false;
	}else if(data.repass.length < 6){
		noticeMsg('System Message', 'Vui lòng nhập tối thiểu 6 ký tự.', 'error');
		$("#FrmCont input[name=repass]").focus();
		return false;
	}else if(data.repass!=data.pass){
		noticeMsg('System Message', 'Mật khẩu xác nhận không chính xác.', 'error');
		$("#FrmCont input[name=repass]").focus();
		return false;
	}

	loading();
	$.post('?mod=account&site=resetpass', data).done(function(e){
		var rt = JSON.parse(e);
		if(rt.code==0){
			noticeMsg('System Message', rt.msg, 'error');
			endloading();
		}else{
			noticeMsg('System Message', rt.msg, 'success');
			setTimeout(function(){ location.href="?mod=account&site=login"; }, 2000);
		}
		
	});

}
</script>
{/literal}
