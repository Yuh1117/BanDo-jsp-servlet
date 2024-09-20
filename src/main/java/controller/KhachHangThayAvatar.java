package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import database.KhachHangDAO;
import model.KhachHang;

/**
 * Servlet implementation class KhachHangThayAvatar
 */
@WebServlet("/change-avatar")
public class KhachHangThayAvatar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KhachHangThayAvatar() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String baoLoi = "";
		String url = "";
		HttpSession session = request.getSession();
		KhachHang kh = (KhachHang) session.getAttribute("khachHang");
		if (kh == null) {
			baoLoi = "Bạn chưa đăng nhập!";
			url = "/index.jsp";
		} else {
			String folder = getServletContext().getRealPath("/khachhang/avatar");
			System.out.println(folder);
			File file;
			int maxFileSize = 5000 * 1024;
			int maxMemSize = 5000 * 1024;
			String contentType = request.getContentType();

			if (contentType.indexOf(contentType) >= 0) {
				try {
					DiskFileItemFactory factory = new DiskFileItemFactory();
					// Quy dinh dung luong toi da cho 1 file
					factory.setSizeThreshold(maxMemSize);
					// Tao file upload
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(maxFileSize);

					List<FileItem> files = upload.parseRequest(request);

					for (FileItem fileItem : files) {
						if (!fileItem.isFormField()) {
							String fileName = System.currentTimeMillis() + fileItem.getName();
							String path = folder + "\\" + fileName;
							file = new File(path);
							fileItem.write(file);

							kh.setDuongDanAnh(fileName);
							KhachHangDAO khachHangDAO = new KhachHangDAO();
							khachHangDAO.updateAvatar(kh);
							kh = khachHangDAO.selectById(kh);
						} else {
							String name = fileItem.getFieldName();
							String value = fileItem.getString();
							System.out.println(name + " : " + value);
						}
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			url = "/khachhang/avatar.jsp";
		}
		request.setAttribute("baoLoi", baoLoi);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}