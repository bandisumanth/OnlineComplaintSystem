package controller;

import java.io.IOException;
import java.util.List;

import com.dao.ComplaintDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import modal.Complaint;

@WebServlet("/ViewComplaintServlet")
public class ViewComplaintServlet extends HttpServlet {

	private static final long serialVersionUID = -3992225355206952335L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("username") == null) {

			response.sendRedirect("Login.jsp");
			return;

		}

		String username = (String) session.getAttribute("username");

		ComplaintDAO dao = new ComplaintDAO();

		List<Complaint> complaints = dao.getComplaintsByUsername(username);

		request.setAttribute("complaints", complaints);

		request.getRequestDispatcher("Your_Complaints.jsp").forward(request, response);
	}
}