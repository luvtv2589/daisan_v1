<section class="loginn">
	<div class="container">
	<div class="card-group justify-content-end">
		<div class="card" style="flex-grow: 0.35">
			<div class="card-body">
				<h5 class="card-title">Quên mật khẩu</h5>
				<hr>
				<div id="FrmCont">
					<div class="form-group">
						<label>Nhập email đã lưu trong tài khoản</label> 
						<input type="text" name="email" autofocus="autofocus" class="form-control">
					</div>
					<p>Vui lòng nhập chính xác email của bạn đã lưu với tài khoản quên mật khẩu.</p> 
					<p>Chúng tôi sẽ gửi một đường dẫn tới email để thực hiện việc cấp lại mật khẩu mới cho bạn.</p>
					<div class="form-group">
						<button type="button" onclick="ForgetPass();" class="btn btn-success">Gửi thông tin tới email</button>
					</div>
					<hr>
					<p>Nếu có mật khẩu hoặc chưa có tài khoản, vui lòng thực hiện đăng nhập hoặc tạo tài khoản mới.</p>
					<p class="clearfix">
						<a href="?mod=account&site=login" class="btn btn-outline-secondary">Đăng nhập</a>
						<a href="?mod=account&site=register" class="btn btn-outline-secondary">Tạo tài khoản</a>
					</p>
	
				</div>
			</div>
		</div>
	</div>
</div>
</section>

<link href="{$arg.stylesheet}css/pnotify.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/animate.min.css" rel="stylesheet">
<script src="{$arg.stylesheet}js/pnotify.min.js"></script>
{literal}
<script>
$('#FrmLogin input[name=Username],#FrmLogin input[name=Password]').keypress(function(event) {
	if(event.which == 13) HodineLogin();
});

function ForgetPass() {
	var data = {};
	data['email'] = $("#FrmCont input[name=email]").val();
	data['ajax_action'] = 'forget_password';
	if (data.email.length==0) {
		noticeMsg('System Message', 'Vui lòng nhập email của bạn.', 'error');
		$("#FrmCont input[name=email]").focus();
		return false;
	}
	loading();
	$.post("?mod=account&site=forgetpass", data).done(function(e) {
		var Data = JSON.parse(e);
		if (Data.code == 0) {
			noticeMsg('System Message', Data.msg, 'error');
			endloading();
		} else {
			noticeMsg('System Message', Data.msg, 'success');
			$("#FrmCont input[name=email]").val('');
			endloading();
		}
	});
}
</script>
{/literal}
