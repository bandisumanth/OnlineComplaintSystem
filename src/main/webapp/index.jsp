<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<title> Local Issues Portal</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- Font Awesome -->
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
	background: url('images/govt1.webp') no-repeat center center fixed;
	background-size: cover;
	font-family: Arial;
}

/* HERO SECTION */
.hero {
	background: rgba(0, 0, 0, 0.65);
	color: white;
	padding: 90px 20px;
	border-radius: 15px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4);
}

.hero h1 {
	font-weight: bold;
}

/* MAIN OVERLAY */
.overlay {
	background: rgba(255, 255, 255, 0.95);
	padding: 40px;
	border-radius: 15px;
	margin-top: 30px;
}

/* CARDS */
.card {
	border: none;
	border-radius: 12px;
	transition: 0.3s;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);
}

.icon {
	font-size: 40px;
	margin-bottom: 10px;
	color: #dc3545;
}

/* STATISTICS */
.stats {
	background: linear-gradient(45deg, #f8f9fa, #eef2f7);
	padding: 40px;
	border-radius: 10px;
	margin-top: 40px;
}

.stats h2 {
	font-weight: bold;
	color: #dc3545;
}

/* BUTTON */
.btn-danger {
	padding: 12px 25px;
	font-weight: bold;
	border-radius: 30px;
}

/* FOOTER */
footer {
	margin-top: 40px;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

		<a class="navbar-brand font-weight-bold" href="index.jsp"> <i
			class="fa-solid fa-city"></i> Local Issues Portal
		</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav">

			<span class="navbar-toggler-icon"></span>

		</button>

		<div class="collapse navbar-collapse" id="navbarNav">

			<ul class="navbar-nav ml-auto">

				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home</a></li>

				<li class="nav-item"><a class="nav-link" href="#about">About</a>
				</li>

				<li class="nav-item"><a class="nav-link" href="#contact">Contact</a>
				</li>

				<li class="nav-item"><a
					class="nav-link btn btn-danger text-white ml-2 px-3"
					href="Login.jsp"> Login </a></li>

			</ul>

		</div>

	</nav>


	<div class="container mt-5">

		<!-- HERO -->

		<div class="hero text-center">

			<h1 class="display-4"> Constituency Public Issues Portal
			</h1>

			<p class="lead">A digital platform for citizens to report local
				issues directly to the MLA office.</p>

			<a href="Login.jsp" class="btn btn-danger btn-lg mt-3"> Login to
				Submit Complaint </a>

		</div>


		<!-- MAIN CONTENT -->

		<div class="overlay">

			<h3 class="text-center mb-4">Common Local Issues</h3>

			<div class="row text-center">

				<div class="col-md-3 mb-3">

					<div class="card p-3">

						<div class="icon">
							<i class="fa-solid fa-road"></i>
						</div>

						<h5>Road Issues</h5>

						<p>Potholes, damaged roads and street maintenance.</p>

					</div>

				</div>

				<div class="col-md-3 mb-3">

					<div class="card p-3">

						<div class="icon">
							<i class="fa-solid fa-droplet"></i>
						</div>

						<h5>Water Supply</h5>

						<p>Drinking water shortages and pipeline problems.</p>

					</div>

				</div>

				<div class="col-md-3 mb-3">

					<div class="card p-3">

						<div class="icon">
							<i class="fa-solid fa-bolt"></i>
						</div>

						<h5>Electricity</h5>

						<p>Power outages and street light failures.</p>

					</div>

				</div>

				<div class="col-md-3 mb-3">

					<div class="card p-3">

						<div class="icon">
							<i class="fa-solid fa-screwdriver-wrench"></i>
						</div>

						<h5>Drainage</h5>

						<p>Blocked drainage systems and sanitation issues.</p>

					</div>

				</div>

			</div>


			<!-- STATISTICS -->

			<div class="stats text-center">

				<h3>Community Impact</h3>

				<div class="row mt-4">

					<div class="col-md-4">

						<h2>120+</h2>

						<p>Complaints Submitted</p>

					</div>

					<div class="col-md-4">

						<h2>85+</h2>

						<p>Issues Resolved</p>

					</div>

					<div class="col-md-4">

						<h2>35+</h2>

						<p>Pending Issues</p>

					</div>

				</div>

			</div>


			<!-- ABOUT -->

			<div class="mt-5" id="about">

				<h3 class="text-center">About This Portal</h3>

				<p class="text-center">This portal helps citizens of Gudivada
					constituency report public issues such as road damage, drainage
					problems, electricity failures, and water supply issues. The goal
					is to create better communication between the public and the MLA
					office to resolve problems faster.</p>

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

					<h6 id="contact">Contact</h6>

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

			<p class="mb-0">© 2026 Gudivada Constituency Public Issues Portal
			</p>

		</div>

	</footer>

</body>
</html>