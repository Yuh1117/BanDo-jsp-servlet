<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta>
<title>Đăng nhập</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
<link href="<%=url%>/css/login.css" rel="stylesheet">

</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
	<main class="form-signin w-100 m-auto">
		<form class="text-center" action="<%=url %>/khach-hang" method="post">
			<input type="hidden" name="hanhDong" value="do-login" />
			<h1 class="h2 mb-3 fw-medium">ĐĂNG NHẬP</h1>
			<div class="form-floating">
				<input type="text" class="form-control" id="tenDangNhap"
					placeholder="tenDangNhap" name="tenDangNhap"> <label
					for="tenDangNhap">Tên đăng nhập </label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="matKhau"
					placeholder="matKhau" name="matKhau"> <label for="matKhau">Mật
					Khẩu</label>
			</div>
			<%
			String baoLoi = request.getAttribute("baoLoi") + "";
			if (baoLoi.equals("null")) {
				baoLoi = "";
			}
			%>
			<div class="text-center">
				<span style="color: red"><%=baoLoi%></span>
			</div>

			<div class="form-check text-start my-3">
				<input class="form-check-input" type="checkbox" value="remember-me"
					id="flexCheckDefault"> <label class="form-check-label"
					for="flexCheckDefault"> Ghi nhớ </label>
			</div>
			<button class="btn btn-primary w-100 py-2 mb-2" type="submit">Đăng
				nhập</button>
			<a href="<%=url%>/khachhang/register.jsp" class="mt-1">Đăng ký tài khoản mới. </a>
			<p class="mt-5 mb-3 text-muted">&copy; VPGH</p>
		</form>
	</main>
</body>
</html>