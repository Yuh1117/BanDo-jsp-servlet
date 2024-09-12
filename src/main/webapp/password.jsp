<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi mật khẩu</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body class="bg-body-tertiary">
	<%
	KhachHang kh = (KhachHang) session.getAttribute("khachHang");
	if (kh == null) {
	%>
	<h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ.</h1>
	<%
	} else {
	String baoLoi = request.getAttribute("baoLoi") + "";
	if (baoLoi.equals("null")) {
		baoLoi = "";
	}
	%>
	<div class="container my-3">
		<h1 class="text-center">ĐỔI MẬT KHẨU</h1>
		<form action="change-password" method="POST">
			<div class="mb-3">
				<label for="matKhauHienTai" class="form-label">Mật khẩu hiện
					tại</label> <input type="password" class="form-control" id="matKhauHienTai"
					name="matKhauHienTai">
			</div>
			<div class="mb-3">
				<label for="matKhauMoi" class="form-label">Mật khẩu mới</label> <input
					type="password" class="form-control" id="matKhauMoi"
					name="matKhauMoi">
			</div>
			<div class="mb-3">
				<label for="matKhauMoiNhapLai" class="form-label">Mật khẩu
					mới</label> <input type="password" class="form-control"
					id="matKhauMoiNhapLai" name="matKhauMoiNhapLai">
			</div>
			<div class="mb-3">
				<span style="color: red"> <%=baoLoi%></span>
			</div>
			<button type="submit" class="btn btn-primary form-control">Lưu
				mật khẩu</button>
		</form>
	</div>
	<%
	}
	%>

</body>
</html>