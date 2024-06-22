<%@page import="com.google.protobuf.Type"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entity.Expense"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Information</title>
<%@include file="../component/all_css.jsp"%>

<style type="text/css">
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}

.row {
	padding-top: 10px;
}
</style>

</head>
<body class="bg-light">

	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><i
				class="fa-solid fa-money-check"></i> Expense Tracker</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					<c:if test="${not empty loginuser}">

						<li class="nav-item"><a class="nav-link active"
							href="user/home.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
					</c:if>
				</ul>


				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

					<c:if test="${not empty loginuser}">

						<li class="nav-item"><a class="nav-link active"
							href="Userinfo.jsp"><i class="fa-solid fa-circle-user"></i>
								${loginuser.name}</a></li>

						<li class="nav-item"><a class="nav-link active" href="logout"
							tabindex="-1"><i class="fa-solid fa-right-to-bracket"></i>
								Logout</a></li>

					</c:if>

				</ul>

			</div>
		</div>
	</nav>


	<div class="carousel-item active">
		<img src="img/img-7.jpg" class="d-block w-100" alt="Internet Issue"
			height="600px">
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card card-sh">
					<div class="card-header text-center">
						<p class="fs-3">User Information</p>

					</div>
					<div class="card-body">
<!-- 						<form action="user/home.jsp" method="post">
 -->
 						<form >
 
							<%
							User user = (User) session.getAttribute("loginuser");
							UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
							List<User> list1 = dao.userinformation(user.getId());

							for (User ex1 : list1) {
							%>
							<tr>
								<label><i class="fa-solid fa-circle-user"></i> <b>Name</b></label>
								<br> &nbsp;&nbsp; &nbsp;
								<th><%=ex1.getName()%></th>
								<br>
								<br>
								<label><i class="fa-solid fa-envelope"></i> <b>Email</b></label>
								<br> &nbsp;&nbsp; &nbsp;
								<td><%=ex1.getEmail()%></td>
								<br>
								<br>
								<label><i class="fa-solid fa-envelope"></i> <b>Password</b></label>
								<br> &nbsp;&nbsp;&nbsp;&nbsp;
								<td><%=ex1.getPass()%></td>
								<br>
								<br>
								<label><i class="fa-solid fa-envelope"></i> <b>Mobile
										Number</b></label>
								<br> &nbsp;&nbsp; &nbsp;
								<td><%=ex1.getNumber()%></td>
								<br>
								<br>

							</tr>
							<%
							}
							%>

							<a href="user/home.jsp" class="btn btn-success col-md-12" role="button">Back</a>


							<%-- Delete Account Button --%>
							<br><br>
							<h6 style="color: red">'Warning, This account will be permanently deleted.'</h6>
							<button type="submit" name="deleteAccount"
								class="btn btn-danger col-md-12">Delete Account</button>
						
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

<%
if(request.getParameter("deleteAccount") != null) {
    int userId = ((User) session.getAttribute("loginuser")).getId();
    UserDao userDao = new UserDao(HibernateUtil.getSessionFactory());
    userDao.deleteUser(userId);
    session.invalidate(); // invalidate session after deleting user
    response.sendRedirect("index.jsp"); // redirect to index.jsp after deletion
}
%>

</body>
</html>
