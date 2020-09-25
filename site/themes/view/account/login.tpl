<section class="loginn pt-4">
	<div class="container">
	<div class="card-group justify-content-end">
		<div class="card rounded-0" style="flex-grow: 0.35">
			<div class="card-body">
				<h5 class="card-title">Đăng nhập</h5>
				<hr>
				<div id="FrmLogin">
					<div class="form-group">
						<label>Tài khoản đăng nhập</label> 
						<input type="text" name="Username" autofocus="autofocus" class="form-control">
					</div>
					<div class="form-group">
						<label>Mật khẩu</label> 
						<a href="?mod=account&site=forgetpass" class="float-right">Quên mật khẩu ?</a>
						<input type="password" name="Password" class="form-control">
					</div>
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label"> 
								<input class="form-check-input" type="checkbox" value=""> Ghi nhớ đăng nhập
							</label>
						</div>
					</div>
					<div class="form-group">
						<button type="button" onclick="HodineLogin();" id="BtnLogin" class="btn btn-success  w-100">Đăng nhập</button>
					</div>
					<p class="clearfix">
						<a href="?mod=account&site=register">Tạo tài khoản miễn phí</a>
					</p>
	
					<hr>
					<div class="d-flex">
						<p class="m-0">Đăng nhập với:</p>
						<ul class="list-inline px-2">
							<li class="list-inline-item"><a href="{$btn_fb_login}"><i class="fa fa-facebook-square cl-blue fz32"></i></a></li>
						</ul>
						<div class="g-signin2" data-onsuccess="onSignIn"></div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
</section>

<input type="text" value="{$out.url}" id="url_redirect">
<link href="{$arg.stylesheet}css/pnotify.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/animate.min.css" rel="stylesheet">
<script src="{$arg.stylesheet}js/pnotify.min.js"></script>
{literal}
<script>
$('#FrmLogin input[name=Username],#FrmLogin input[name=Password]').keypress(function(event) {
	if (event.which == 13) HodineLogin();
});

function onSignIn(googleUser) {
	var profile = googleUser.getBasicProfile();
	var data = {};
	data.id = profile.getId();
	data.name = profile.getName();
	data.image = profile.getImageUrl();
	data.email = profile.getEmail();
	console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	console.log('Name: ' + profile.getName());
	console.log('Image URL: ' + profile.getImageUrl());
	console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	
	if(data.id!='' && data.email!=''){
		loading();
		data.action = 'ajax_login_google';
		$.post("?mod=account&site=login", data).done(function(Data) {
			Data = JSON.parse(Data);
			if (Data.Code == 0) {
				noticeMsg('Thông báo', Data.Msg, 'error');
				endloading();
			} else {
				noticeMsg('Thông báo', Data.Msg, 'success');
				endloading();
				var url_redirect = $("#url_redirect").val();
				location.href = url_redirect;
			}
		});

	}
	
}
	
function HodineLogin() {
	var Username = $("#FrmLogin input[name=Username]").val();
	var Password = $("#FrmLogin input[name=Password]").val();
	var url_redirect = $("#url_redirect").val();
	if (Username == '' || Username.length < 6) {
		noticeMsg('Thông báo', 'Vui lòng nhập tài khoản tối thiểu 6 ký tự',
				'error');
		$("#FrmLogin input[name=Username]").focus();
		return false;
	} else if (Password == '' || Password.length < 6) {
		noticeMsg('Thông báo', 'Vui lòng nhập mật khẩu tối thiểu 6 ký tự',
				'error');
		$("#FrmLogin input[name=Password]").focus();
		return false;
	} else {
		loading();
		$("#FrmLogin input[name=Username]").attr('disabled', 'disabled');
		$("#FrmLogin input[name=Password]").attr('disabled', 'disabled');
		$("#FrmLogin #BtnLogin").attr('disabled', 'disabled');
		$.post("?mod=account&site=login", {
			'action' : 'ajax_login',
			'Username' : Username,
			'Password' : Password
		}).done(function(Data) {
			Data = JSON.parse(Data);
			if (Data.Code == 0) {
				$("#FrmLogin input[name=Username]").removeAttr('disabled');
				$("#FrmLogin input[name=Password]").removeAttr('disabled');
				$("#FrmLogin #BtnLogin").removeAttr('disabled');
				noticeMsg('Thông báo', Data.Msg, 'error');
				endloading();
			} else {
				noticeMsg('Thông báo', Data.Msg, 'success');
				$.post("?mod=system&site=SetSessionLogin", {
					'Action' : 'set_session_login',
					'UserId' : Data.UserId
				}).done(function(e) {
					//console.log(e);
					endloading();
					location.href = url_redirect;
				});
			}
		});
	}
}
</script>
{/literal}
