<%@ page import="java.util.List"%>
<%@ page import="modal.Complaint"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
if (session == null || session.getAttribute("username") == null) {
	response.sendRedirect("Login.jsp");
	return;
}

String username = (String) session.getAttribute("username");

List<Complaint> list = (List<Complaint>) request.getAttribute("complaints");
%>

<!DOCTYPE html>
<html>

<head>

<title>Your Complaints - Gudivada Issues Portal</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background: linear-gradient(to right, #f8f9fa, #eef2f7);
	font-family: Arial;
}

.header-box {
	background: linear-gradient(45deg, #dc3545, #ff6b6b);
	color: white;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
}

.card {
	border: none;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.table tbody tr:hover {
	background: #f1f1f1;
}

.badge {
	font-size: 14px;
	padding: 6px 10px;
}

footer {
	margin-top: 40px;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

		<a class="navbar-brand font-weight-bold" href="Dashboard.jsp"> <i
			class="fa-solid fa-city"></i> Gudivada Issues Portal
		</a>

		<div class="ml-auto">
			<a href="LogoutServlet" class="btn btn-danger btn-sm"> <i
				class="fa-solid fa-right-from-bracket"></i> Logout
			</a>
		</div>

	</nav>


	<div class="container mt-4">

		<!-- HEADER -->

		<div class="header-box text-center">

			<h2>
				<i class="fa-solid fa-list-check"></i> Complaints Submitted by <b><%=username%></b>
			</h2>

			<p>
				You have submitted <b> <%=(list != null) ? list.size() : 0%>
				</b> complaints.
			</p>

		</div>


		<div class="card mt-4">

			<div class="card-body">

				<table class="table table-bordered table-hover table-striped">

					<thead class="thead-dark">

						<tr>
							<th>ID</th>
							<th>Title</th>
							<th>Category</th>
							<th>Description</th>
							<th>Location</th>
							<th>Status</th>
						</tr>

					</thead>

					<tbody>

						<%
						if (list != null && !list.isEmpty()) {

							for (Complaint c : list) {
						%>

						<tr>

							<td><%=c.getId()%></td>

							<td><%=c.getTitle()%></td>

							<td><%=c.getCategory()%></td>

							<td><%=c.getDescription()%></td>

							<td><%=c.getLocation()%></td>

							<td>
								<%
								String status = c.getStatus();

								if ("Pending".equals(status)) {
								%> <span class="badge badge-warning">Pending</span> <%
 } else if ("In Progress".equals(status)) {
 %> <span class="badge badge-primary">In Progress</span> <%
 } else if ("Resolved".equals(status)) {
 %> <span class="badge badge-success">Resolved</span> <%
 }
 %>

							</td>

						</tr>

						<%
						}

						} else {
						%>

						<tr>
							<td colspan="6" class="text-center">No complaints found</td>
						</tr>

						<%
						}
						%>

					</tbody>

				</table>

				<div class="text-center">

					<a href="Dashboard.jsp" class="btn btn-primary"> <i
						class="fa-solid fa-arrow-left"></i> Back to Dashboard
					</a>

				</div>

			</div>

		</div>

	</div>


	<!-- FOOTER -->

	<footer class="bg-dark text-white mt-5">

		<div class="container text-center p-4">

			<h5>Gudivada Constituency Public Issues Portal</h5>

			<p>Helping citizens report and resolve local issues quickly and
				efficiently.</p>

			<hr style="background: white">

			<div class="row">

				<div class="col-md-4">
					<h6>Address</h6>
					<p>
						Gudivada MLA Office<br> Krishna District, Andhra Pradesh
					</p>
				</div>

				<div class="col-md-4">
					<h6>Contact</h6>
					<p>
						Phone: 8341624146<br> Email: gudivadaoffice@gmail.com
					</p>
				</div>

				<div class="col-md-4">
					<h6>Office Hours</h6>
					<p>
						Mon - Sat<br> 9:00 AM - 6:00 PM
					</p>
				</div>

			</div>

			<hr style="background: white">

			<p class="mb-0"> Constituency Public Issues Portal</p>

		</div>

	</footer>

</body>

</html>