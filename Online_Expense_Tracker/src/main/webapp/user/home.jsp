<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="../component/all_css.jsp"%>
</head>
<body>

	<c:if test="${empty loginuser }">
		<c:redirect url="../Login.jsp"></c:redirect>
	</c:if>

	<%@include file="../component/navbar.jsp"%>

	<c:if test="${not empty loginuser}">
		<h2
			style="position: absolute; margin-top: 4%; z-index: 2; padding-left: 38%; color: Orange">
			Welcome, ${loginuser.name} ! <br>
			<span style="padding-left: 47%"></span>To
		</h2>
	</c:if>

	<h1
		style="z-index: 2; color: green; padding-left: 30%; padding-top: 10%; position: absolute;">Online
		Expense Tracker System</h1>

	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../img/img-4.jpg" class="d-block w-100"
					alt="Internet Issue" height="600px">
			</div>
			<div class="carousel-item">
				<img src="../img/img-2.jpg" class="d-block w-100"
					alt="Internet Issue" height="600px">
			</div>
			<div class="carousel-item">
				<img src="../img/img-3.jpg" class="d-block w-100"
					alt="Internet Issue" height="600px">
			</div>
			<div class="carousel-item">
				<img src="../img/img-7.jpg" class="d-block w-100"
					alt="Internet Issue" height="600px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<script>
		window.embeddedChatbotConfig = {
			chatbotId : "bcEFfHt7t41Rd3cbWp415",
			domain : "www.chatbase.co"
		}
	</script>
	<script src="https://www.chatbase.co/embed.min.js"
		chatbotId="bcEFfHt7t41Rd3cbWp415" domain="www.chatbase.co" defer>
		
	</script>
	

</body>
</html>