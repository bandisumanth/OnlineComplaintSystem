<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register - Gudivada MLA Local Issues</title>

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
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: Arial;
}

body::before {
	content: "";
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.45);
	z-index: -1;
}

.card {
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(15px);
	border-radius: 20px;
	border: 1px solid rgba(255, 255, 255, 0.3);
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.4);
	color: white;
	padding: 35px;
}

.card-header {
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.3);
}

.input-group-text {
	background: rgba(255, 255, 255, 0.2);
	border: none;
	color: white;
}

.form-control {
	background: rgba(255, 255, 255, 0.2);
	border: none;
	color: white;
}

.form-control::placeholder {
	color: #eee;
}

.form-control:focus {
	background: rgba(255, 255, 255, 0.3);
	color: white;
	box-shadow: none;
}

.btn-danger {
	width: 100%;
	border-radius: 10px;
	padding: 10px;
	font-weight: bold;
}

.register-link {
	text-align: center;
	margin-top: 15px;
}

.register-link a {
	color: white;
	font-weight: bold;
	text-decoration: underline;
}

#message, #passError, #confirmError {
	text-align: center;
	font-size: 13px;
	margin-top: 5px;
}
</style>

</head>

<body>

	<div class="container">
		<div class="row justify-content-center">

			<div class="col-md-5">

				<div class="card">

					<div class="card-header">
						<i class="fa-solid fa-user-plus"></i> Registration Form
					</div>

					<div id="message"></div>

					<form action="RegisterServlet" method="post"
						onsubmit="return validateForm()">

						<!-- Username -->
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class="fa-solid fa-user"></i></span>
								</div>
								<input type="text" name="username" class="form-control"
									placeholder="Username" required>
							</div>
						</div>

						<!-- Password -->
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class="fa-solid fa-lock"></i></span>
								</div>
								<input type="password" name="password" id="password"
									class="form-control" placeholder="Password" required>
							</div>
							<small id="passError" style="color: red;"></small>
						</div>

						<!-- Confirm Password -->
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class="fa-solid fa-lock"></i></span>
								</div>
								<input type="password" id="confirmPassword" class="form-control"
									placeholder="Confirm Password" required>
							</div>
							<small id="confirmError" style="color: red;"></small>
						</div>

						<!-- Phone -->
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class="fa-solid fa-phone"></i></span>
								</div>
								<input type="number" name="phone" class="form-control"
									placeholder="Phone Number" required>
							</div>
						</div>

						<!-- Email -->
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class="fa-solid fa-envelope"></i></span>
								</div>
								<input type="email" name="email" class="form-control"
									placeholder="Email Address" required>
							</div>
						</div>

						<button type="submit" class="btn btn-danger">Register</button>

						<div class="register-link">
							Already registered? <a href="Login.jsp">Click to login</a>
						</div>

					</form>

				</div>

			</div>

		</div>
	</div>

	<script>
		// URL messages
		const urlParams = new URLSearchParams(window.location.search);
		const messageDiv = document.getElementById('message');

		if (urlParams.get('message') === 'success') {
			messageDiv.style.color = 'lime';
			messageDiv.innerText = 'Registration Successful!';
		}

		if (urlParams.get('error') === 'exists') {
			messageDiv.style.color = 'red';
			messageDiv.innerText = 'Username or phone already exists!';
		}

		// Validation
		function validateForm() {

			let password = document.getElementById("password").value;
			let confirm = document.getElementById("confirmPassword").value;

			let passError = document.getElementById("passError");
			let confirmError = document.getElementById("confirmError");

			let pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{6,}$/;

			let valid = true;

			// Password rules
			if (!pattern.test(password)) {
				passError.innerText = "Password must contain Uppercase, Lowercase, Special Character & min 6 chars";
				valid = false;
			} else {
				passError.innerText = "";
			}

			// Match check
			if (password !== confirm) {
				confirmError.innerText = "Passwords do not match";
				valid = false;
			} else {
				confirmError.innerText = "";
			}

			return valid;
		}
	</script>

</body>
</html>