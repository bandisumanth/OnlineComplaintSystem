package controller;

import java.io.File;
import java.io.IOException;

import com.dao.ComplaintDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import modal.Complaint;

@WebServlet("/SubmitComplaintServlet")
@MultipartConfig
public class SubmitComplaintServlet extends HttpServlet {

	private static final long serialVersionUID = 3675483770439093966L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("username") == null) {

			response.sendRedirect("Login.jsp");
			return;

		}

		String username = (String) session.getAttribute("username");

		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		String location = request.getParameter("location");

		String status = "Pending";

		/* IMAGE UPLOAD */

		Part filePart = request.getPart("image");

		String fileName = filePart.getSubmittedFileName();

		String uploadPath = getServletContext().getRealPath("/") + "uploads";

		File uploadDir = new File(uploadPath);

		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		if (fileName != null && !fileName.isEmpty()) {

			filePart.write(uploadPath + File.separator + fileName);

		}

		/* MODEL OBJECT */

		Complaint c = new Complaint();

		c.setUsername(username);
		c.setTitle(title);
		c.setCategory(category);
		c.setDescription(description);
		c.setLocation(location);
		c.setStatus(status);
		c.setImage(fileName);

		/* DAO CALL */

		ComplaintDAO dao = new ComplaintDAO();

		boolean result = dao.submitComplaint(c);

		if (result) {

			response.sendRedirect("ViewComplaintServlet");

		} else {

			response.getWriter().println("Failed to submit complaint.");

		}

	}
}