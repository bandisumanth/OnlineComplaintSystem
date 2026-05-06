package controller;

import java.io.IOException;

import com.dao.ComplaintDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || !"admin".equals(session.getAttribute("role"))) {
			response.sendRedirect("Login.jsp");
			return;
		}

		int id = Integer.parseInt(request.getParameter("id"));
		String status = request.getParameter("status");

		ComplaintDAO dao = new ComplaintDAO();

		boolean result = dao.updateComplaintStatus(id, status);

		if (result) {

			response.sendRedirect("AdminDashboardServlet?msg=updated");

		} else {

			response.sendRedirect("AdminDashboardServlet?msg=failed");

		}

	}
}