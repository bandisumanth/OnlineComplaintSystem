<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login - Gudivada MLA Local Issues</title>

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

/* dark overlay */
body::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.45);
	z-index: -1;
}

/* Glass card */
.card {
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(15px);
	-webkit-backdrop-filter: blur(15px);
	border-radius: 20px;
	border: 1px solid rgba(255, 255, 255, 0.3);
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.4);
	color: white;
	padding: 35px;
}

.card h2 {
	text-align: center;
	margin-bottom: 25px;
	font-weight: bold;
}

/* Input fields */
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
	box-shadow: none;
	color: white;
}

/* Button */
.btn-danger {
	width: 100%;
	border-radius: 10px;
	padding: 10px;
	font-weight: bold;
	background: rgba(220, 53, 69, 0.85);
	border: none;
	transition: 0.3s;
}

.btn-danger:hover {
	background: rgba(220, 53, 69, 1);
	transform: scale(1.03);
}

/* Register */
.register-link {
	text-align: center;
	margin-top: 15px;
}

.register-link a {
	color: white;
	font-weight: bold;
	text-decoration: underline;
}

/* Message */
#message {
	text-align: center;
	margin-bottom: 15px;
	font-weight: bold;
	padding: 6px;
	border-radius: 6px;
}
</style>

</head>

<body>

	<div class="container">
		<div class="row justify-content-center">

			<div class="col-md-4">

				<div class="card">

					<h2>
						<i class="fa-solid fa-user-lock"></i> Login
					</h2>

					<div id="message"></div>

					<form action="LoginServlet" method="post">

						<div class="form-group">

							<div class="input-group">

								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fa-solid fa-user"></i>
									</span>
								</div>

								<input type="text" name="username" class="form-control"
									placeholder="Username" required>

							</div>

						</div>


						<div class="form-group">

							<div class="input-group">

								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fa-solid fa-lock"></i>
									</span>
								</div>

								<input type="password" name="password" class="form-control"
									placeholder="Password" required>

							</div>

						</div>

						<button type="submit" class="btn btn-danger">Login</button>

						<div class="register-link">
							New user? <a href="Register.jsp">Register</a>
						</div>

					</form>

				</div>

			</div>

		</div>
	</div>

	<script>
		const urlParams = new URLSearchParams(window.location.search);
		const messageDiv = document.getElementById('message');

		const success = urlParams.get('message');
		const error = urlParams.get('error');

		if (success === 'success') {
			messageDiv.style.color = 'lime';
			messageDiv.innerText = 'Registration Successful! You can now login.';
		}

		if (error === 'invalid') {
			messageDiv.style.color = 'red';
			messageDiv.innerText = 'Login Failed! Invalid username or password.';
		}
	</script>

</body>
</html>