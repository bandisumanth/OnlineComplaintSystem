<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

if (session == null || session.getAttribute("username") == null) {
	response.sendRedirect("Login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>

<head>

<title>Submit Complaint - Gudivada Issues Portal</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

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

.card {
	border: none;
	border-radius: 12px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
}

.card-header {
	background: linear-gradient(45deg, #dc3545, #ff6b6b);
	border-radius: 12px 12px 0 0;
}

.btn-danger {
	background: #dc3545;
	border: none;
	padding: 10px 20px;
	font-weight: bold;
}

.btn-danger:hover {
	background: #c82333;
}

.form-control {
	border-radius: 8px;
}

.preview-img {
	margin-top: 10px;
	max-height: 150px;
	border-radius: 8px;
	display: none;
}

footer {
	margin-top: 40px;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

		<a class="navbar-brand font-weight-bold" href="Dashboard.jsp">
			Gudivada Issues Portal </a>

		<div class="ml-auto">
			<a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
		</div>

	</nav>


	<div class="container mt-5">

		<div class="row justify-content-center">

			<div class="col-md-7">

				<div class="card">

					<div class="card-header text-white">

						<h4 class="mb-0">Submit Complaint</h4>

					</div>

					<div class="card-body">

						<form action="SubmitComplaintServlet" method="post"
							enctype="multipart/form-data">

							<div class="form-group">

								<label><b>Title</b></label> <input type="text" name="title"
									class="form-control" placeholder="Enter complaint title"
									required>

							</div>


							<div class="form-group">

								<label><b>Category</b></label> <select name="category"
									class="form-control" required>

									<option value="">Select Category</option>
									<option value="Roads">Roads</option>
									<option value="Water">Water</option>
									<option value="Electricity">Electricity</option>
									<option value="Drainage">Drainage</option>
									<option value="Other">Other</option>

								</select>

							</div>


							<div class="form-group">

								<label><b>Description</b></label>

								<textarea name="description" class="form-control" rows="4"
									placeholder="Describe the issue clearly..." required></textarea>

							</div>


							<div class="form-group">

								<label><b>Location</b></label> <input type="text"
									name="location" class="form-control"
									placeholder="Enter area or street name" required>

							</div>


							<div class="form-group">

								<label><b>Upload Image (Optional)</b></label> <input type="file"
									name="image" class="form-control" accept="image/*"
									onchange="previewImage(event)"> <img id="preview"
									class="preview-img" />

							</div>


							<div class="text-center">

									<button type="submit" class="btn btn-danger">Submit
										Complaint</button>

								<a href="Dashboard.jsp" class="btn btn-secondary ml-2"> Back
								</a>

							</div>

						</form>

					</div>

				</div>

			</div>

		</div>

	</div>


	<!-- FOOTER -->

	<footer class="bg-dark text-white text-center p-4">

		<h5>Gudivada Constituency Public Issues Portal</h5>

		<p>Helping citizens report and resolve local issues efficiently.</p>

		<hr style="background: white">

		<p class="mb-0">© 2026 Gudivada Issues Portal | Contact:
			8341624146</p>

	</footer>


	<script>
		function previewImage(event) {

			var reader = new FileReader();

			reader.onload = function() {
				var output = document.getElementById('preview');
				output.src = reader.result;
				output.style.display = "block";
			};

			reader.readAsDataURL(event.target.files[0]);

		}
	</script>

</body>

</html>