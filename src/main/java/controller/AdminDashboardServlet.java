package controller;

import java.io.IOException;
import java.util.List;

import com.dao.ComplaintDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import modal.Complaint;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -430132363306180519L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || !"admin".equals(session.getAttribute("role"))) {
			response.sendRedirect("Login.jsp");
			return;
		}

		String filter = request.getParameter("status");

		ComplaintDAO dao = new ComplaintDAO();

		List<Complaint> complaints = dao.getComplaintsByStatus(filter);

		int total = dao.getTotalComplaints();
		int pending = dao.getCountByStatus("Pending");
		int progress = dao.getCountByStatus("In Progress");
		int resolved = dao.getCountByStatus("Resolved");

		request.setAttribute("complaints", complaints);
		request.setAttribute("total", total);
		request.setAttribute("pending", pending);
		request.setAttribute("progress", progress);
		request.setAttribute("resolved", resolved);

		request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
	}
}