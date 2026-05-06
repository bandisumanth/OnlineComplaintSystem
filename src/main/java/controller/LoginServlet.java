package controller;

import java.io.IOException;

import com.dao.Userdao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modal.UserLoginModel;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String status = "fail";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UserLoginModel user = new UserLoginModel();
		user.setUsername(username);
		user.setPassword(password);

		Userdao dao = new Userdao();

		status = dao.selectUserByUsername(user);

		if ("sucess".equals(status)) {

			HttpSession session = request.getSession();

			session.setAttribute("username", username);
			session.setAttribute("role", user.getRole());

			if ("admin".equals(user.getRole())) {
				response.sendRedirect("AdminDashboardServlet");
			} else {
				response.sendRedirect("Dashboard.jsp");
			}

		} else {

			response.sendRedirect("Login.jsp?error=invalid");

		}
	}
}
