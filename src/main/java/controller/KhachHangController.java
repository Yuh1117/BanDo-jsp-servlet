package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.KhachHangDAO;
import model.KhachHang;
import util.Encryption;

/**
 * Servlet implementation class KhachHang
 */
@WebServlet("/khach-hang")
public class KhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KhachHangController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hanhDong = request.getParameter("hanhDong");
		if (hanhDong.equals("do-login")) {
			logIn(request, response);
		} else if (hanhDong.equals("do-logout")) {
			logOut(request, response);
		} else if (hanhDong.equals("do-register")) {
			register(request, response);
		} else if (hanhDong.equals("change-password")) {
			changePassword(request, response);
		} else if (hanhDong.equals("change-information")) {
			changeInfor(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void logIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenDangNhap = request.getParameter("tenDangNhap");
		String matKhau = request.getParameter("matKhau");
		// Encrypt
		matKhau = Encryption.toSHA1(matKhau);

		KhachHang kh = new KhachHang();
		kh.setTenDangNhap(tenDangNhap);
		kh.setMatKhau(matKhau);

		KhachHangDAO khd = new KhachHangDAO();
		KhachHang check = khd.selectByIdAndPassWord(kh);

		String url = "";
		if (check != null) {
			HttpSession session = request.getSession();
			session.setAttribute("khachHang", check);
			url = "/index.jsp";
		} else {
			request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không chính xác!");
			url = "/khachhang/login.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	private void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// Huy bo session
		session.invalidate();

		String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath();
		response.sendRedirect(url + "/index.jsp");
	}

	private void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tenDangNhap = request.getParameter("tenDangNhap");
		String matKhau = request.getParameter("matKhau");
		String matKhauNhapLai = request.getParameter("matKhauNhapLai");
		String hoVaTen = request.getParameter("hoVaTen");
		String gioiTinh = request.getParameter("gioiTinh");
		String ngaySinh = request.getParameter("ngaySinh");
		String diaChiKhachHang = request.getParameter("diaChiKhachHang");
		String diaChiMuaHang = request.getParameter("diaChiMuaHang");
		String diaChiNhanHang = request.getParameter("diaChiNhanHang");
		String dienThoai = request.getParameter("dienThoai");
		String email = request.getParameter("email");
		String dongYNhanMail = request.getParameter("dongYNhanMail");

		request.setAttribute("tenDangNhap", tenDangNhap);
		request.setAttribute("hoVaTen", hoVaTen);
		request.setAttribute("gioiTinh", gioiTinh);
		request.setAttribute("ngaySinh", ngaySinh);
		request.setAttribute("diaChiKhachHang", diaChiKhachHang);
		request.setAttribute("diaChiMuaHang", diaChiMuaHang);
		request.setAttribute("diaChiNhanHang", diaChiNhanHang);
		request.setAttribute("dienThoai", dienThoai);
		request.setAttribute("email", email);
		request.setAttribute("dongYNhanMail", dongYNhanMail);

		String url = "";
		String baoLoi = "";
		KhachHangDAO khachHangDAO = new KhachHangDAO();

		if (khachHangDAO.kiemTraTenDangNhap(tenDangNhap)) {
			baoLoi += "Tên đăng nhập đã tồn tại, vui lòng chọn tên đăng nhập khác.<br/>";
		}

		if (!matKhau.equals(matKhauNhapLai)) {
			baoLoi += "Mẫu khẩu không khớp.<br/>";
		}

		request.setAttribute("baoLoi", baoLoi);

		if (baoLoi.length() > 0) {
			url = "/khachhang/register.jsp";
		} else {
			Random rd = new Random();
			String maKhachHang = System.currentTimeMillis() + rd.nextInt(1000) + "";
			// Encrypt
			matKhau = Encryption.toSHA1(matKhau);
			KhachHang kh = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChiKhachHang,
					diaChiNhanHang, diaChiMuaHang, Date.valueOf(ngaySinh), dienThoai, email, dongYNhanMail != null);
			khachHangDAO.insert(kh);
			url = "/khachhang/success.jsp";
		}

		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	private void changePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String matKhauHienTai = request.getParameter("matKhauHienTai");
		String matKhauMoi = request.getParameter("matKhauMoi");
		String matKhauMoiNhapLai = request.getParameter("matKhauMoiNhapLai");

		String matKhauHienTai_SHA1 = Encryption.toSHA1(matKhauHienTai);
		String baoLoi = "";
		String url = "";

		HttpSession session = request.getSession();
		KhachHang kh = (KhachHang) session.getAttribute("khachHang");
		if (kh == null) {
			baoLoi = "Bạn chưa đăng nhập!";
			url = "/index.jsp";
		} else {
			if (!matKhauHienTai_SHA1.equals(kh.getMatKhau())) {
				baoLoi = "Mật khẩu hiện tại không chính xác!";
				url = "/khachhang/password.jsp";
			} else {
				if (!matKhauMoiNhapLai.equals(matKhauMoi)) {
					baoLoi = "Mật khẩu không khớp!";
					url = "/khachhang/password.jsp";
				} else {
					String matKhauMoi_SHA1 = Encryption.toSHA1(matKhauMoi);
					kh.setMatKhau(matKhauMoi_SHA1);
					KhachHangDAO khd = new KhachHangDAO();
					if (khd.changePassword(kh)) {
						baoLoi = "Mật khẩu thay đổi thành công!";
						url = "/khachhang/password.jsp";
					} else {
						baoLoi = "Mật khẩu thay đổi không thành công!";
						url = "/khachhang/password.jsp";
					}
				}
			}
		}
		request.setAttribute("baoLoi", baoLoi);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	private void changeInfor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String hoVaTen = request.getParameter("hoVaTen");
		String gioiTinh = request.getParameter("gioiTinh");
		String ngaySinh = request.getParameter("ngaySinh");
		String diaChiKhachHang = request.getParameter("diaChiKhachHang");
		String diaChiMuaHang = request.getParameter("diaChiMuaHang");
		String diaChiNhanHang = request.getParameter("diaChiNhanHang");
		String dienThoai = request.getParameter("dienThoai");
		String email = request.getParameter("email");
		String dongYNhanMail = request.getParameter("dongYNhanMail");

		String url = "";
		String baoLoi = "";
		KhachHangDAO khachHangDAO = new KhachHangDAO();

		HttpSession session = request.getSession();
		KhachHang kh = (KhachHang) session.getAttribute("khachHang");
		if (kh == null) {
			baoLoi = "Bạn chưa đăng nhập!";
			url = "/index.jsp";
		} else {
			kh.setHoVaTen(hoVaTen);
			kh.setGioiTinh(gioiTinh);
			kh.setNgaySinh(Date.valueOf(ngaySinh));
			kh.setDiaChi(diaChiKhachHang);
			kh.setDiaChiMuaHang(diaChiMuaHang);
			kh.setDiaChiNhanHang(diaChiNhanHang);
			kh.setSoDienThoai(dienThoai);
			kh.setEmail(email);
			kh.setDangKyNhanBangTin(dongYNhanMail != null);
			khachHangDAO.updateInfor(kh);
			baoLoi = "Thay đổi thông tin thành công!";
			url = "/khachhang/information.jsp";
		}

		request.setAttribute("baoLoi", baoLoi);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
