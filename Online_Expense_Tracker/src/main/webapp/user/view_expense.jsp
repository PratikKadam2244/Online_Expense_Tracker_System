<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.Expense"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Expense</title>
<%@include file="../component/all_css.jsp"%>

<style type="text/css">
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}

.row {
	padding-top: 20px;
}
</style>

</head>
<body>

	<c:if test="${empty loginuser}">
		<c:redirect url="../Login.jsp"></c:redirect>
	</c:if>

	<jsp:include page="../component/navbar.jsp" />

	<div class="carousel-item active">
		<img src="../img/h5.jpg" class="d-block w-100" alt="Internet Issue"
			height="600px">
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header text-center">
						<p class="fs-3">All Expenses</p>

						<c:if test="${not empty msg}">
							<p class="text-center text-success fs-7">${msg}</p>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">
						<form action="view_expense.jsp" method="get" class="mb-3">
                            <div class="row" style="position: absolute; margin-left: 110%; margin-top: -10%">
                                <div class="col">
                                    <label for="startDate" style="color: white">Start Date:</label>
                                    <input type="date" id="startDate" name="startDate" class="form-control" style="background-color: green">
                                </div>
                                <div class="col">
                                    <label for="endDate" style="color: white">End Date:</label>
                                    <input type="date" id="endDate" name="endDate" class="form-control" style="background-color: Red">
                                </div>
                                <div class="col align-self-end">
                                    <button type="submit" class="btn btn-primary mt-2" style="margin-left: 28%; padding: 3px 20px 3px 20px">Filter</button>
                                </div>
                            </div>
                        </form>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Title</th>
									<th scope="col">Description</th>
									<th scope="col">Date</th>
									<th scope="col">Time</th>
									<th scope="col">Price(Rs)</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("loginuser");
								ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());

								String startDate = request.getParameter("startDate");
								String endDate = request.getParameter("endDate");
								List<Expense> list;

								if (startDate != null && endDate != null && !startDate.isEmpty() && !endDate.isEmpty()) {
									list = dao.getExpensesByUserAndDateRange(user, startDate, endDate);
								} else {
									list = dao.getAllExpensesByUser(user);
								}

								for (Expense ex : list) {
								%>
								<tr>
									<th scope="row"><%=ex.getTitle()%></th>
									<td><%=ex.getDescription()%></td>
									<td><%=ex.getDate()%></td>
									<td><%=ex.getTime()%></td>
									<td><%=ex.getPrice()%></td>
									<td><a href="edit_expense.jsp?id=<%=ex.getId()%>"
										class="btn btn-sm btn-primary me-1">Edit</a> <a
										href="../deleteExpense?id=<%=ex.getId()%>"
										class="btn btn-sm btn-danger me-1">Delete</a></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>

						<%
						String totalAmount = "";
						double sum = 0.0;

						for (Expense ex : list) {
							 try {
							        // Convert the price from String to double
							        double price = Double.parseDouble(ex.getPrice());
							        // Add the price to the sum
							        sum += price;
							    } catch (NumberFormatException e) {
							        // Handle the case where the price is not a valid number
							        e.printStackTrace();
							    }	
						}
						totalAmount = Double.toString(sum);

						System.out.println("Total Amount: " + totalAmount);
						%>
						<div class="text-end">
							<h6>
								Total Amount:
								<%=totalAmount%></h6>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
