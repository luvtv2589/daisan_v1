<section>
	<div class="container">
	<div class="card-group justify-content-end">
		<div class="card mt-4 mb-5 rounded-0" style="flex-grow: 0.5">
			<div class="card-body">
				<h5 class="card-title">Đăng ký tài khoản</h5>
				<hr>
				<div id="FrmRegister">
					<div class="form-group">
						<label>Họ Tên<font color="#f00">&nbsp;*</font>:</label> 
						<input type="text" name="Name" class="form-control rounded-0 lg-sm" placeholder="Ví dụ: Nguyen Van A">
					</div>
	
					<div class="form-group">
						<label>Tên đăng nhập<font color="#f00">&nbsp;*</font>:</label> 
						<input type="text" name="Username" class="form-control rounded-0" placeholder="Ví dụ: username" required>
						<small class="form-text text-muted">Lưu ý: tên đăng nhập gồm các ký tự chữ và số, viết liền không dấu.</small>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Mật khẩu<font color="#f00">&nbsp;*</font>:</label> 
								<input type="password" name="Password" class="form-control rounded-0" placeholder="Mật khẩu">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Nhập lại mật khẩu<font color="#f00">&nbsp;*</font>:</label> 
								<input type="password" name="RePass" class="form-control rounded-0" placeholder="Xác nhận mật khẩu">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>Số điện thoại<font color="#f00">&nbsp;*</font>:</label> 
						<input type="text" name="Phone" class="form-control rounded-0" placeholder="Ví dụ: 0964368282">
					</div>
					<div class="form-group">
						<label>Email<font color="#f00">&nbsp;*</font>:</label> 
						<input type="email" name="Email" class="form-control rounded-0" placeholder="Ví dụ: info@daisan.vn">
					</div>
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label"> 
								<input class="form-check-input" type="checkbox" checked="checked">Đồng ý với các điều khoản của chúng tôi.
							</label>
						</div>
					</div>
					<div class="form-group">
						<button type="button" onclick="HodineRegister();" id="BtnRegister" class="btn btn-success rounded-0">Đăng ký tài khoản ngay</button>
					</div>
				</div>
				<hr>
				<div class="d-flex">
						<p class="m-0">Đăng ký với:</p>
						<ul class="list-inline px-2">
							<li class="list-inline-item"><a href="{$btn_fb_login}"><i class="fa fa-facebook-square cl-blue fz32"></i></a></li>
							<li class="list-inline-item"><a href=""><i class="fa fa-google-plus-square cl-red fz32"></i></a></li>
						</ul>
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
function HodineRegister() {
	var Data = {};
	Data['Name'] = $("#FrmRegister input[name=Name]").val();
	Data['Username'] = $("#FrmRegister input[name=Username]").val();
	Data['Password'] = $("#FrmRegister input[name=Password]").val();
	Data['RePass'] = $("#FrmRegister input[name=RePass]").val();
	Data['Phone'] = $("#FrmRegister input[name=Phone]").val();
	Data['Email'] = $("#FrmRegister input[name=Email]").val();
	if (Data['Name'] == '' || Data['Name'].length < 6) {
		noticeMsg('Thông báo', 'Vui lòng nhập họ tên của bạn.', 'error');
		$("#FrmRegister input[name=Name]").focus();
		return false;
	} else if (Data['Username'] == '' || Data['Username'].length < 6) {
		noticeMsg('Thông báo', 'Vui lòng nhập tài khoản tối thiểu 6 ký tự.', 'error');
		$("#FrmRegister input[name=Username]").focus();
		return false;
	}else if (Data['Email'] == '') {
		noticeMsg('Thông báo', 'Vui lòng nhập vào Email', 'error');
		$("#FrmRegister input[name=Email]").focus();
		return false;
	} else if (Data['Password'] == '' || Data['Password'].length < 6) {
		noticeMsg('Thông báo', 'Vui lòng nhập mật khẩu tối thiểu 6 ký tự.', 'error');
		$("#FrmRegister input[name=Password]").focus();
		return false;
	} else if (Data['RePass'] != Data['Password']) {
		noticeMsg('Thông báo', 'Mật khẩu xác nhận không chính xác, vui lòng nhập lại.', 'error');
		$("#FrmRegister input[name=RePass]").focus();
		return false;
	} else {
		Data['action'] = 'ajax_register';
		loading();
		$.post("?mod=account&site=register", Data).done(function(e) {
			rt = JSON.parse(e);
			if (rt.Code == 0) {
				noticeMsg('Thông báo', rt.Msg, 'error');
				endloading();
			} else {
				noticeMsg('Thông báo', rt.Msg, 'success');
				endloading();
				location.href = arg.domain;
			}
		});
	}
}
</script>
{/literal}