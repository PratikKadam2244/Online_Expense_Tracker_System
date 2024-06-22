<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<%@include file="component/all_css.jsp"%>

<style type="text/css">
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}

.row {
	padding-top: 70px;
}
</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="carousel-item active">
		<img src="img/L3.jpg" class="d-block w-100" alt="Internet Issue"
			height="600px">
	</div>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card card-sh">
					<div class="card-header">
						<p class="text-center fs-3">Login Page</p>
						<c:if test="${not empty msg}">
							<p class="text-center text-danger fs-7">${msg}</p>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">
						<form action="Login" method="post">

							<div class="mb-3">
								<label><i class="fa-solid fa-envelope"></i> Email</label> <input
									type="email" name="email" class="form-control" placeholder="Enter Email">
							</div>
							<div class="mb-3">
								<label><i class="fa-solid fa-key"></i> Password</label> <input
									type="password" name="Password" class="form-control" placeholder="Enter Password">
							</div>
							<button class="btn btn-success col-md-12">Login</button>
							<div class="text-center mt-2">
								Don't have account? <a href="Register.jsp"
									class="text-decoration-none">Create One</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>