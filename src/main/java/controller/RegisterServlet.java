package controller;

import java.io.IOException;

import com.dao.Userdao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modal.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		User user = new User(username, password, phone, email);

		boolean result = Userdao.registerUser(user);

		if (result) {
			response.getWriter().println("Registration Successful! You can now login.");
			response.sendRedirect("Login.jsp?message=success");
		} else {
			response.getWriter().println("Registration Failed! Try again.");
		}
	}

}
