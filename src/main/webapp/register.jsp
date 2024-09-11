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
<script>
	kiemTraMatKhau = () => {
		matKhau = document.getElementById("matKhau").value;
		matKhauNhapLai = document.getElementById("matKhauNhapLai").value;
		if(matKhau !== matKhauNhapLai){
			document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
			return false;
		}else{
			document.getElementById("msg").innerHTML = "";
			return true;
		}
	}
	
</script>

<style>
.red {
	color: red;
}
</style>
</head>
<body class="bg-body-tertiary">
	<%
	String baoLoi = request.getAttribute("baoLoi") + "";
	baoLoi = baoLoi.equals("null") ? "" : baoLoi;

	String tenDangNhap = request.getAttribute("tenDangNhap") + "";
	tenDangNhap = (tenDangNhap.equals("null")) ? "" : tenDangNhap;

	String hoVaTen = request.getAttribute("hoVaTen") + "";
	hoVaTen = (hoVaTen.equals("null")) ? "" : hoVaTen;

	String gioiTinh = request.getAttribute("gioiTinh") + "";
	gioiTinh = (gioiTinh.equals("null")) ? "" : gioiTinh;

	String ngaySinh = request.getAttribute("ngaySinh") + "";
	ngaySinh = (ngaySinh.equals("null")) ? "" : ngaySinh;

	String diaChiKhachHang = request.getAttribute("diaChiKhachHang") + "";
	diaChiKhachHang = (diaChiKhachHang.equals("null")) ? "" : diaChiKhachHang;

	String diaChiMuaHang = request.getAttribute("diaChiMuaHang") + "";
	diaChiMuaHang = (diaChiMuaHang.equals("null")) ? "" : diaChiMuaHang;

	String diaChiNhanHang = request.getAttribute("diaChiNhanHang") + "";
	diaChiNhanHang = (diaChiNhanHang.equals("null")) ? "" : diaChiNhanHang;

	String dienThoai = request.getAttribute("dienThoai") + "";
	dienThoai = (dienThoai.equals("null")) ? "" : dienThoai;

	String email = request.getAttribute("email") + "";
	email = (email.equals("null")) ? "" : email;

	String dongYNhanMail = request.getAttribute("dongYNhanMail") + "";
	dongYNhanMail = (dongYNhanMail.equals("null")) ? "" : dongYNhanMail;
	%>
	<div class="container my-3">
		<div class="text-center">
			<h1>ĐĂNG KÝ TÀI KHOẢN</h1>
		</div>

		<div class="red" id="baoLoi">
			<%=baoLoi%>
		</div>
		<form class="form" action="do-register" method="post">
			<h3>Tài khoản</h3>
			<div class="mb-3">
				<label for="tenDangNhap" class="form-label">Tên đăng nhập<span
					class="red">*</span></label> <input type="text" class="form-control"
					id="tenDangNhap" name="tenDangNhap" required="required"
					value="<%=tenDangNhap%>">
			</div>
			<div class="mb-3">
				<label for="matKhau" class="form-label">Mật khẩu<span
					class="red">*</span></label> <input type="password" class="form-control"
					id="matKhau" name="matKhau" required="required">
			</div>
			<div class="mb-3">
				<label for="matKhauNhapLai" class="form-label">Nhập lại mật
					khẩu<span class="red">*</span> <span id="msg" class="red"></span>
				</label> <input type="password" class="form-control" id="matKhauNhapLai"
					name="matKhauNhapLai" required="required"
					onkeyup="kiemTraMatKhau()">
			</div>

			<h3>Thông tin khách hàng</h3>
			<div class="mb-3">
				<label for="hoVaTen" class="form-label">Họ và tên</label> <input
					type="text" class="form-control" id="hoVaTen" name="hoVaTen"
					value="<%=hoVaTen%>">
			</div>
			<div class="mb-3">
				<label for="gioiTinh" class="form-label">Giới tính</label> <select
					class="form-control" id="gioiTinh" name="gioiTinh">
					<option value="Nam"
						<%=(gioiTinh.equals("Nam")) ? "selected='selected'" : ""%>>Nam</option>
					<option value="Nữ"
						<%=(gioiTinh.equals("Nữ")) ? "selected='selected'" : ""%>>Nữ</option>
					<option value="Khác"
						<%=(gioiTinh.equals("Khác")) ? "selected='selected'" : ""%>>Khác</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="ngaySinh" class="form-label">Ngày sinh</label> <input
					type="date" class="form-control" id="ngaySinh" name="ngaySinh"
					value="<%=ngaySinh%>">
			</div>

			<h3>Địa chỉ</h3>
			<div class="mb-3">
				<label for="diaChiKhachHang" class="form-label">Địa chỉ
					khách hàng</label> <input type="text" class="form-control"
					id="diaChiKhachHang" name="diaChiKhachHang"
					value="<%=diaChiKhachHang%>">
			</div>
			<div class="mb-3">
				<label for="diaChiMuaHang" class="form-label">Địa chỉ mua
					hàng</label> <input type="text" class="form-control" id="diaChiMuaHang"
					name="diaChiMuaHang" value="<%=diaChiMuaHang%>">
			</div>
			<div class="mb-3">
				<label for="diaChiNhanHang" class="form-label">Địa chỉ nhận
					hàng</label> <input type="text" class="form-control" id="diaChiNhanHang"
					name="diaChiNhanHang" value="<%=diaChiNhanHang%>">
			</div>
			<div class="mb-3">
				<label for="dienThoai" class="form-label">Điện thoại</label> <input
					type="tel" class="form-control" id="dienThoai" name="dienThoai"
					value="<%=dienThoai%>">
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">Email</label> <input
					type="email" class="form-control" id="email" name="email"
					value="<%=email%>">
			</div>
			<hr class="my-5" />
			<div class="mb-3">
				<label for="dongYDieuKhoan" class="form-label">Đồng ý với <a>điều
						khoản của công ty </a><span class="red">*</span>
				</label> <input type="checkbox" class="form-check-input" id="dongYDieuKhoan"
					name="dongYDieuKhoan" required="required">
			</div>
			<div class="mb-3">
				<label for="dongYNhanMail" class="form-label">Đồng ý nhận
					thông báo qua email</label> <input type="checkbox" class="form-check-input"
					id="dongYNhanMail" name="dongYNhanMail">
			</div>
			<button class="btn btn-primary form-control" type="submit">Đăng
				ký</button>
		</form>
	</div>
</body>
</body>
</html>