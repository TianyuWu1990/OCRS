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
		<script type="text/javascript">
			
		</script>
	</head>

	<body>
		<div class="container">
			<div class="jumbotron">
				<h1 class="text-center">Welcome ${user.stu.name}</h1>
				<p class="text-center">Your Student ID is ${user.stu.stuID }</p>
			</div>
			<h3 class="text-center">Your Weekly Schedule</h3>
			<ul class="nav nav-tabs">
  				<li role="presentation" class="active" id="monTab"><a href="#mon" data-toggle="tab">Monday</a></li>
  				<li role="presentation"><a href="#tue" data-toggle="tab">Tuesday</a></li>
  				<li role="presentation"><a href="#wed" data-toggle="tab">Wednesday</a></li>
  				<li role="presentation"><a href="#thu" data-toggle="tab">Thursday</a></li>
  				<li role="presentation"><a href="#fri" data-toggle="tab">Friday</a></li>
  				<li role="presentation"><a href="#sat" data-toggle="tab">Saturday</a></li>
  				<li role="presentation"><a href="#sun" data-toggle="tab">Sunday</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active fade in" id="mon">
					<c:choose>
						<c:when test="${not empty schedule.Mon}">
							<table class="table table-striped">
								<tr>
									<th>Course Name</th><th>Time</th><th>Location</th>
								</tr>
								<c:forEach items="${schedule.Mon}" var="course">
								<tr>
									<td>${course.courseName}</td>
									<td>${course.startTime}-${course.endTime}</td>
									<td>${course.location}</td>
								</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<h3>No class on Monday!</h3>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="tab-pane fade" id="tue">
					<c:choose>
						<c:when test="${not empty schedule.Tue}">
							<table class="table table-striped">
								<tr>
									<th>Course Name</th><th>Time</th><th>Location</th>
								</tr>
								<c:forEach items="${schedule.Tue}" var="course">
								<tr>
									<td>${course.courseName}</td>
									<td>${course.startTime}-${course.endTime}</td>
									<td>${course.location}</td>
								</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<h3>No class on Tuesday!</h3>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="tab-pane fade" id="wed">
					<c:choose>
						<c:when test="${not empty schedule.Wed}">
							<table class="table table-striped">
								<tr>
									<th>Course Name</th><th>Time</th><th>Location</th>
								</tr>
								<c:forEach items="${schedule.Wed}" var="course">
								<tr>
									<td>${course.courseName}</td>
									<td>${course.startTime}-${course.endTime}</td>
									<td>${course.location}</td>
								</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<h3>No class on Wednesday!</h3>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="tab-pane fade" id="thu">
					<c:choose>
						<c:when test="${not empty schedule.Thu}">
							<table class="table table-striped">
								<tr>
									<th>Course Name</th><th>Time</th><th>Location</th>
								</tr>
								<c:forEach items="${schedule.Thu}" var="course">
								<tr>
									<td>${course.courseName}</td>
									<td>${course.startTime}-${course.endTime}</td>
									<td>${course.location}</td>
								</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<h3>No class on Thursday!</h3>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="tab-pane fade" id="fri"><c:choose>
						<c:when test="${not empty schedule.Fri}">
							<table class="table table-striped">
								<tr>
									<th>Course Name</th><th>Time</th><th>Location</th>
								</tr>
								<c:forEach items="${schedule.Fri}" var="course">
								<tr>
									<td>${course.courseName}</td>
									<td>${course.startTime}-${course.endTime}</td>
									<td>${course.location}</td>
								</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<h3>No class on Friday!</h3>
						</c:otherwise>
					</c:choose></div>
				<div class="tab-pane fade" id="sat">
					<c:choose>
						<c:when test="${not empty schedule.Sat}">
							<table class="table table-striped">
								<tr>
									<th>Course Name</th><th>Time</th><th>Location</th>
								</tr>
								<c:forEach items="${schedule.Sat}" var="course">
								<tr>
									<td>${course.courseName}</td>
									<td>${course.startTime}-${course.endTime}</td>
									<td>${course.location}</td>
								</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<h3>No class on Saturday!</h3>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="tab-pane fade" id="sun">
					<c:choose>
						<c:when test="${not empty schedule.Sun}">
							<table class="table table-striped">
								<tr>
									<th>Course Name</th><th>Time</th><th>Location</th>
								</tr>
								<c:forEach items="${schedule.Sun}" var="course">
								<tr>
									<td>${course.courseName}</td>
									<td>${course.startTime}-${course.endTime}</td>
									<td>${course.location}</td>
								</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<h3>No class on Sunday!!</h3>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</body>
</html>