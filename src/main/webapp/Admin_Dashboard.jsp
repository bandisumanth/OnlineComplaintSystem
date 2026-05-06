<%@ page import="java.util.List"%>
<%@ page import="modal.Complaint"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

if (session == null || session.getAttribute("username") == null || !"admin".equals(session.getAttribute("role"))) {
	response.sendRedirect("Login.jsp");
	return;
}

int total = (Integer) request.getAttribute("total");
int pending = (Integer) request.getAttribute("pending");
int progress = (Integer) request.getAttribute("progress");
int resolved = (Integer) request.getAttribute("resolved");

List<Complaint> list = (List<Complaint>) request.getAttribute("complaints");
%>

<!DOCTYPE html>
<html>

<head>

<title>Admin Dashboard - Gudivada Issues Portal</title>

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
	background: #f4f6f9;
	font-family: Arial;
}

.stat-card {
	border: none;
	border-radius: 12px;
	color: white;
	padding: 25px;
	text-align: center;
	height: 150px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	transition: 0.3s;
}

.stat-card:hover {
	transform: translateY(-5px);
}

.total {
	background: #007bff;
}

.pending {
	background: #ffc107;
}

.progress {
	background: #17a2b8;
}

.resolved {
	background: #28a745;
}

.table tbody tr:hover {
	background: #f1f1f1;
}

img {
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
}

img:hover {
	transform: scale(1.1);
}

footer {
	margin-top: 40px;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<nav class="navbar navbar-dark bg-dark">

		<span class="navbar-brand font-weight-bold"> <i
			class="fa-solid fa-user-shield"></i> Admin - Gudivada Issues Portal
		</span> <a href="LogoutServlet" class="btn btn-danger btn-sm"> <i
			class="fa-solid fa-right-from-bracket"></i> Logout
		</a>

	</nav>


	<div class="container mt-4">

		<h2 class="text-center mb-4">Admin Dashboard</h2>

		<%
		String msg = request.getParameter("msg");
		if ("updated".equals(msg)) {
		%>

		<div class="alert alert-success text-center">Complaint status
			updated successfully!</div>

		<%
		}
		%>


		<!-- STATISTICS -->

		<div class="row text-center mb-4">

			<div class="col-md-3">
				<div class="stat-card total shadow">
					<i class="fa-solid fa-list fa-2x mb-2"></i>
					<h5>Total Complaints</h5>
					<h3><%=total%></h3>
				</div>
			</div>

			<div class="col-md-3">
				<div class="stat-card pending shadow">
					<i class="fa-solid fa-clock fa-2x mb-2"></i>
					<h5>Pending</h5>
					<h3><%=pending%></h3>
				</div>
			</div>

			<div class="col-md-3">
				<div class="stat-card progress shadow">
					<i class="fa-solid fa-spinner fa-2x mb-2"></i>
					<h5>In Progress</h5>
					<h3><%=progress%></h3>
				</div>
			</div>

			<div class="col-md-3">
				<div class="stat-card resolved shadow">
					<i class="fa-solid fa-check-circle fa-2x mb-2"></i>
					<h5>Resolved</h5>
					<h3><%=resolved%></h3>
				</div>
			</div>

		</div>


		<!-- COMPLAINT TABLE -->

		<div class="card shadow">

			<div class="card-body">

				<div class="mb-3">

					<a href="AdminDashboardServlet" class="btn btn-secondary btn-sm">
						All </a> <a href="AdminDashboardServlet?status=Pending"
						class="btn btn-warning btn-sm"> Pending </a> <a
						href="AdminDashboardServlet?status=In Progress"
						class="btn btn-info btn-sm"> In Progress </a> <a
						href="AdminDashboardServlet?status=Resolved"
						class="btn btn-success btn-sm"> Resolved </a>

				</div>

				<table class="table table-bordered table-hover table-striped">

					<thead class="thead-dark">

						<tr>
							<th>ID</th>
							<th>User</th>
							<th>Title</th>
							<th>Category</th>
							<th>Description</th>
							<th>Location</th>
							<th>Image</th>
							<th>Status</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

						<%
						if (list != null && !list.isEmpty()) {

							for (Complaint c : list) {
						%>

						<tr>

							<td><%=c.getId()%></td>
							<td><%=c.getUsername()%></td>
							<td><%=c.getTitle()%></td>
							<td><%=c.getCategory()%></td>
							<td><%=c.getDescription()%></td>
							<td><%=c.getLocation()%></td>

							<td>
								<%
								String image = c.getImage();

								if (image != null && !image.isEmpty()) {
								%> <img src="<%=request.getContextPath()%>/uploads/<%=image%>"
								width="80" data-toggle="modal" data-target="#imageModal"
								onclick="showImage('<%=request.getContextPath()%>/uploads/<%=image%>')">

								<%
								} else {
								%> No Image <%
								}
								%>

							</td>

							<td>
								<%
								String status = c.getStatus();

								if ("Pending".equals(status)) {
								%> <span class="badge badge-warning">Pending</span> <%
 } else if ("In Progress".equals(status)) {
 %> <span class="badge badge-info">In Progress</span> <%
 } else if ("Resolved".equals(status)) {
 %> <span class="badge badge-success">Resolved</span> <%
 }
 %>

							</td>

							<td>

								<form action="UpdateStatusServlet" method="post">

									<input type="hidden" name="id" value="<%=c.getId()%>">

									<select name="status" class="form-control form-control-sm">

										<option value="Pending">Pending</option>
										<option value="In Progress">In Progress</option>
										<option value="Resolved">Resolved</option>

									</select> <br>

									<button class="btn btn-primary btn-sm">
										<i class="fa-solid fa-pen"></i> Update
									</button>

								</form>

							</td>

						</tr>

						<%
						}

						} else {
						%>

						<tr>
							<td colspan="9" class="text-center">No complaints found</td>
						</tr>

						<%
						}
						%>

					</tbody>

				</table>

			</div>

		</div>

	</div>


	<!-- IMAGE MODAL -->

	<div class="modal fade" id="imageModal">

		<div class="modal-dialog modal-lg modal-dialog-centered">

			<div class="modal-content">

				<div class="modal-header">

					<h5 class="modal-title">Complaint Image</h5>

					<button type="button" class="close" data-dismiss="modal">
						&times;</button>

				</div>

				<div class="modal-body text-center">

					<img id="modalImage" class="img-fluid">

				</div>

			</div>

		</div>

	</div>


	<script>
		function showImage(src) {
			document.getElementById("modalImage").src = src;
		}
	</script>


	<!-- FOOTER -->

	<footer class="bg-dark text-white text-center p-3 mt-5">

		<p>© 2026 Gudivada Constituency Public Issues Portal</p>

	</footer>

</body>
</html>