<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>404</title>
<!--link css-->
<link rel="stylesheet" type="text/css" title=""
	href="{$arg.stylesheet}css/bootstrap.min.css">
</head>
<body>
	<style>
#error {
	background: url("../images/bn-err.png") no-repeat center;
	background-size: cover;
	display: inline-flex;
	width: 100%;
	height: 100%;
	justify-content: center;
	align-items: center;
	position: fixed;
}

#error:after {
	content: "";
	width: 100%;
	height: 100%;
	background: #000000;
	opacity: .9;
	position: absolute;
	top: 0;
	left: 0;
}

#error .content {
	position: relative;
	z-index: 2;
	color: #fff;
}

#error .content p {
	font-size: 40px;
	padding: 60px 0;
}

#error img {
	max-height: 300px;
}

.btn-readmore a {
	display: inline-block;
	font-size: 13px;
	height: 50px;
	line-height: 50px;
	padding: 0 40px;
	text-align: center;
	background: #bf1e2e;
	border-radius: 30px;
	font-weight: bold;
	color: #fff;
	border: 1px solid #bf1e2e;
}
</style>
	<header></header>
	<main>
		<section id="error">
			<div class="container">
				<div class="content">
					<div class="info-err text-center">
						<img
							src="{$arg.stylesheet}images/404.png"
							class="img-fluid" alt="">
						<p>Trang bạn tìm kiếm không còn tồn tại</p>
						<div class="btn-readmore">
							<a title="" href="{$arg.domain}"
								class="text-uppercase">Trở về trang chủ</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<footer></footer>
</body>
</body>
</html>