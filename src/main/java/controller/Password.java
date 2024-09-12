package controller;

import java.io.IOException;

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
 * Servlet implementation class Password
 */
@WebServlet("/change-password")
public class Password extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Password() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
				url = "/password.jsp";
			} else {
				if (!matKhauMoiNhapLai.equals(matKhauMoi)) {
					baoLoi = "Mật khẩu không khớp!";
					url = "/password.jsp";
				} else {
					String matKhauMoi_SHA1 = Encryption.toSHA1(matKhauMoi);
					kh.setMatKhau(matKhauMoi_SHA1);
					KhachHangDAO khd = new KhachHangDAO();
					if (khd.changePassword(kh)) {
						baoLoi =  "Mật khẩu thay đổi thành công!";
						url = "/password.jsp";
					} else {
						baoLoi = "Mật khẩu thay đổi không thành công!";
						url = "/password.jsp";
					}
				}
			}
		}
		request.setAttribute("baoLoi", baoLoi);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
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

}
