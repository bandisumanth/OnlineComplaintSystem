<%@ page import="jakarta.servlet.http.HttpSession"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

if (session == null || session.getAttribute("username") == null) {
	response.sendRedirect("Login.jsp");
	return;
}

String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>

<head>
<title>User Dashboard - Local Issues Portal</title>

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

/* Welcome Banner */
.welcome-box {
	background: linear-gradient(45deg, #dc3545, #ff6b6b);
	color: white;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
}

/* Cards */
.card {
	border: none;
	border-radius: 12px;
	transition: 0.3s;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.card i {
	font-size: 40px;
	margin-bottom: 15px;
}

/* Buttons */
.btn {
	border-radius: 30px;
	padding: 10px 20px;
	font-weight: bold;
}

/* Footer */
footer {
	margin-top: 50px;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

		<a class="navbar-brand font-weight-bold" href="Dashboard.jsp"> <i
			class="fa-solid fa-city"></i> Local Issues Portal
		</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav">

			<span class="navbar-toggler-icon"></span>

		</button>

		<div class="collapse navbar-collapse" id="navbarNav">

			<ul class="navbar-nav ml-auto">

				<li class="nav-item"><a class="nav-link" href="Dashboard.jsp">Home</a>
				</li>

				<li class="nav-item"><a class="nav-link" href="#about">About</a>
				</li>

				<li class="nav-item"><a class="nav-link text-danger"
					href="LogoutServlet"> <i class="fa-solid fa-right-from-bracket"></i>
						Logout
				</a></li>

			</ul>

		</div>

	</nav>

	<div class="container mt-4">

		<!-- Welcome Banner -->

		<div class="welcome-box text-center">

			<h2>
				Welcome,
				<%=username%>
				👋
			</h2>

			<p>Submit complaints and track their status easily from your
				dashboard.</p>

		</div>

		<!-- Dashboard Actions -->

		<div class="row mt-4 text-center">

			<div class="col-md-6 mb-3">

				<div class="card p-4">

					<i class="fa-solid fa-pen-to-square text-danger"></i>

					<h4>Submit Complaint</h4>

					<p>Report local issues like roads, water supply, drainage, and
						electricity problems.</p>

					<a href="Submit_Complaint.jsp" class="btn btn-danger"> Submit
						Complaint </a>

				</div>

			</div>

			<div class="col-md-6 mb-3">

				<div class="card p-4">

					<i class="fa-solid fa-list-check text-primary"></i>

					<h4>My Complaints</h4>

					<p>View the complaints you have submitted and track their
						current status.</p>

					<a href="ViewComplaintServlet" class="btn btn-primary"> View
						Complaints </a>

				</div>

			</div>

		</div>

		<!-- ABOUT SECTION -->

		<div class="mt-5" id="about">

			<h3 class="text-center mb-3">About This Portal</h3>

			<p class="text-center">The Gudivada Local Issues Portal allows
				citizens to report public problems such as road damage, drainage
				issues, electricity failures, and water supply problems. This
				platform helps the MLA office respond to complaints quickly and
				improve infrastructure in the Gudivada constituency.</p>

		</div>

	</div>

	<!-- FOOTER -->

	<footer class="bg-dark text-white">

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

			<p class="mb-0"> Constituency Public Issues Portal
			</p>

		</div>

	</footer>

</body>
</html>