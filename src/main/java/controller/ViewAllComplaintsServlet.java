package controller;

import java.io.IOException;
import java.util.List;

import com.dao.ComplaintDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import modal.Complaint;

@WebServlet("/ViewAllComplaintsServlet")
public class ViewAllComplaintsServlet extends HttpServlet {

	private static final long serialVersionUID = 8574134807931036836L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || !"admin".equals(session.getAttribute("role"))) {

			response.sendRedirect("Login.jsp");
			return;
		}

		ComplaintDAO dao = new ComplaintDAO();

		List<Complaint> complaints = dao.getAllComplaints();

		request.setAttribute("complaints", complaints);

		request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
	}
}