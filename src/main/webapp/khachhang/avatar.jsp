<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta>
<title>Thông tin avatar</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
.red {
	color: red;
}
</style>
</head>
<body class="bg-body-tertiary">
	<%
	String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();

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
	String duongDanAnh = kh.getDuongDanAnh();
	%>
	<div class="container my-3">
		<div class="text-center">
			<h1>THAY ĐỔI AVATAR</h1>
		</div>
		<div class="red" id="baoLoi">
			<%=baoLoi%>
		</div>
		<form class="form" action="<%=url%>/change-avatar" method="post"
			enctype="multipart/form-data">
			<div style="width: 100px">
				<img src="<%=url%>/khachhang/avatar/<%=duongDanAnh%>" alt="Avatar"
					class="img-thumbnail" />
			</div>
			<div class="mb-3">
				<label for="duongDanAnh" class="form-label">Đường dẫn ảnh</label> <input
					type="file" class="form-control" id="duongDanAnh"
					name="duongDanAnh">
			</div>
			<button class="btn btn-primary form-control" type="submit">Xác
				nhận</button>
		</form>
	</div>
	<%
	}
	%>
</body>
</html>