<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<title>Course List</title>
		
		<!-- Bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>

	<body>
		<div class="container">
			<div class="jumbotron">
				<h1 class="text-center">Welcome ${user.stu.name}</h1>
				<p class="text-center">Your Student ID is ${user.stu.stuID }</p>
			</div>
			<c:choose>
				<c:when test="${not empty courseList}">
					<table class="table table-hover">
						<tr><th>Course Name</th><th>Action</th></tr>
						<c:forEach items="${courseList}" var="course">
							<tr>
								<td>${course.courseName}</td>
								<td>
									<form action="<c:url value="/course/dropcourse" />" method="post">
										<input name="cnum" type="hidden" value="${course.courseNum}" />
										<input type="submit" value="Drop" class="btn btn-primary"/>
									</form>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<h3 class="text-center">You registered no courses</h3>
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>