<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chủ</title>
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
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid" style="margin: 0 10%">
			<a class="navbar-brand" href="#">VPGH</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Thể loại </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
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
						style="white-space: nowrap;" href="khachhang/register.jsp">Đăng ký</a>
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
							<li><a class="dropdown-item" href="khachhang/information.jsp">Thay
									đổi thông tin</a></li>
							<li><a class="dropdown-item" href="khachhang/password.jsp">Đổi mật
									khẩu</a></li>
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
	<!-- End Navbar -->

	<!-- Page Content -->
	<div class="container my-3">
		<div class="row">
			<div class="col-lg-3">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action"
						aria-current="true"> Sản phẩm mới </a> <a href="#"
						class="list-group-item list-group-item-action">Xu hướng</a> <a
						href="#" class="list-group-item list-group-item-action">Flash
						Sale</a>
				</div>
			</div>

			<div class="col-lg-9">
				<!-- Slider -->
				<div id="carouselExample" class="carousel slide">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="img/slider/1.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/slider/2.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/slider/3.png" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExample" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExample" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- End Slider -->

				<!-- Product -->
				<div class="row">
					<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top" src="img/product/1.png"
								alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Product 1</a>
								</h4>
								<h5>50.000</h5>
								<p class="card-text">Sản phẩm thoáng mát, có độ bền tốt, giữ
									màu sắc tốt.</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top" src="img/product/2.png"
								alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Product 2</a>
								</h4>
								<h5>100.000</h5>
								<p class="card-text">Sản phẩm thoáng mát, có độ bền tốt, giữ
									màu sắc tốt.</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top" src="img/product/3.png"
								alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Product 3</a>
								</h4>
								<h5>150.000</h5>
								<p class="card-text">Sản phẩm thoáng mát, có độ bền tốt, giữ
									màu sắc tốt.</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
				</div>
				<!-- End Product -->
			</div>
		</div>
	</div>
	<!-- End Page Content -->
</body>
</html>