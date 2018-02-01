<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<c:url value="/resources/css/stumain.css"/>" type="text/css" />
<title>Registered Courses</title>
</head>
<body style="background-color: #fcf16e;">
	<center>
		<div class="container">
			<div class="header">
				<form action="logout" action="post">
					<div style="float: right;">
						<input type="button" value="Logout">
					</div>
				</form>
				<br> Hello,<b>${user.stu.name}</b> Welcome!<br /> <br />
				<div class="nav">
					<ul>
						<li><a href="<c:url value="/course/coursesearch" />">Register
								Course</a></li>
						<li><a href="<c:url value="/course/viewregcourses" />">View Registered
								Courses</a></li>
					</ul>
				</div>
			</div>
			<div border="1">
				<c:choose>
					<c:when test="${not empty courseList}">
						<table>
						<tr bgcolor="cde6c7" style="color:black"><th>Course Name</th><th>Action</th></tr>
							<c:forEach items="${courseList}" var="course">
								<tr>
									<td width="400">${course.courseName}</td>
									<td width="200">
										<form action="<c:url value="/course/dropcourse" />"
											method="post">
											<input name="cnum" type="hidden" value="${course.courseNum}" />
											<input type="submit" value="Drop" />
										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<h3>You have registered No courses!</h3>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</center>
</body>
</html>