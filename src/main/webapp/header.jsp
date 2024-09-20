<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid" style="margin: 0 10%">
		<a class="navbar-brand" href="#">VPGH</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">Trang chủ</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Thể loại </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">1</a></li>
						<li><a class="dropdown-item" href="#">2</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">3</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="#">Giới
						thiệu</a></li>
			</ul>
			<form class="d-flex" role="search">
				<input class="form-control me-2" type="search"
					placeholder="Tìm kiếm" aria-label="Search">
				<button class="btn btn-outline-success me-2"
					style="white-space: nowrap;" type="submit">Tìm kiếm</button>
				<%
				KhachHang kh = (KhachHang) session.getAttribute("khachHang");
				if (kh == null) {
				%>
				<a class="btn btn-primary me-2" style="white-space: nowrap;"
					href="khachhang/login.jsp">Đăng nhập</a> <a class="btn btn-primary"
					style="white-space: nowrap;" href="khachhang/register.jsp">Đăng
					ký</a>
				<%
				} else {
				%>
				<!-- Example single danger button -->
				<div class="btn-group">
					<button type="button" class="btn btn-danger dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"><%=kh.getTenDangNhap()%></button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Đơn hàng của tôi</a></li>
						<li><a class="dropdown-item" href="#">Thông báo</a></li>
						<li><a class="dropdown-item" href="khachhang/avatar.jsp">Thay
								đổi avatar</a></li>
						<li><a class="dropdown-item" href="khachhang/information.jsp">Thay
								đổi thông tin</a></li>
						<li><a class="dropdown-item" href="khachhang/password.jsp">Đổi
								mật khẩu</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="khach-hang?hanhDong=do-logout">Đăng xuất</a></li>
					</ul>
				</div>
				<%
				}
				%>
			</form>
		</div>
	</div>
</nav>