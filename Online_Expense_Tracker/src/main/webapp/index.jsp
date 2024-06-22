<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Expense Tracker System</title>

<%@include file="component/all_css.jsp"%>

</head>
<body>

	<%@include file="component/navbar.jsp"%>

	<%-- <%@include file="piechart.jsp"%> --%>

	<h1
		style="z-index: 2; color: green; padding-left: 30%; padding-top: 10%; position: absolute;">Online
		Expense Tracker System</h1>
	<h5
		style="z-index: 2; color: green; padding-left: 1%; padding-top: 32%; position: absolute;">Created
		By</h5>
	<h3
		style="z-index: 2; color: red; padding-left: 2%; padding-top: 34%; position: absolute;">
		Pratik Kadam
	</h3>
	


	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/img-4.jpg" class="d-block w-100" alt="Internet Issue"
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/img-2.jpg" class="d-block w-100" alt="Internet Issue"
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/img-3.jpg" class="d-block w-100" alt="Internet Issue"
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/img-7.jpg" class="d-block w-100" alt="Internet Issue"
					height="600px">
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