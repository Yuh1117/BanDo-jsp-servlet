<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta>
<title>Đăng ký tài khoản</title>
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
	%>
	<div class="container my-3">
		<div class="text-center">
			<h1>THAY ĐỔI THÔNG TIN</h1>
		</div>

		<div class="red" id="baoLoi">
			<%=baoLoi%>
		</div>
		<form class="form" action="<%=url%>/khach-hang" method="post">
			<input type="hidden" name="hanhDong" value="change-information" />
			<h3>Thông tin khách hàng</h3>
			<div class="mb-3">
				<label for="hoVaTen" class="form-label">Họ và tên</label> <input
					type="text" class="form-control" id="hoVaTen" name="hoVaTen"
					value="<%=kh.getHoVaTen()%>">
			</div>
			<div class="mb-3">
				<label for="gioiTinh" class="form-label">Giới tính</label> <select
					class="form-control" id="gioiTinh" name="gioiTinh">
					<option value="Nam"
						<%=(kh.getGioiTinh().equals("Nam")) ? "selected='selected'" : ""%>>Nam</option>
					<option value="Nữ"
						<%=(kh.getGioiTinh().equals("Nữ")) ? "selected='selected'" : ""%>>Nữ</option>
					<option value="Khác"
						<%=(kh.getGioiTinh().equals("Khác")) ? "selected='selected'" : ""%>>Khác</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="ngaySinh" class="form-label">Ngày sinh</label> <input
					type="date" class="form-control" id="ngaySinh" name="ngaySinh"
					value="<%=kh.getNgaySinh()%>">
			</div>

			<h3>Địa chỉ</h3>
			<div class="mb-3">
				<label for="diaChiKhachHang" class="form-label">Địa chỉ
					khách hàng</label> <input type="text" class="form-control"
					id="diaChiKhachHang" name="diaChiKhachHang"
					value="<%=kh.getDiaChi()%>">
			</div>
			<div class="mb-3">
				<label for="diaChiMuaHang" class="form-label">Địa chỉ mua
					hàng</label> <input type="text" class="form-control" id="diaChiMuaHang"
					name="diaChiMuaHang" value="<%=kh.getDiaChiMuaHang()%>">
			</div>
			<div class="mb-3">
				<label for="diaChiNhanHang" class="form-label">Địa chỉ nhận
					hàng</label> <input type="text" class="form-control" id="diaChiNhanHang"
					name="diaChiNhanHang" value="<%=kh.getDiaChiNhanHang()%>">
			</div>
			<div class="mb-3">
				<label for="dienThoai" class="form-label">Điện thoại</label> <input
					type="tel" class="form-control" id="dienThoai" name="dienThoai"
					value="<%=kh.getSoDienThoai()%>">
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">Email</label> <input
					type="email" class="form-control" id="email" name="email"
					value="<%=kh.getEmail()%>">
			</div>
			<hr class="my-5" />
			<div class="mb-3">
				<label for="dongYNhanMail" class="form-label">Đồng ý nhận
					thông báo qua email</label> <input type="checkbox" class="form-check-input"
					id="dongYNhanMail" name="dongYNhanMail"
					<%=(kh.isDangKyNhanBangTin()) ? "checked" : ""%>>
			</div>
			<button class="btn btn-primary form-control" type="submit">Lưu
				thông tin</button>
		</form>
	</div>
	<%
	}
	%>
</body>
</html>