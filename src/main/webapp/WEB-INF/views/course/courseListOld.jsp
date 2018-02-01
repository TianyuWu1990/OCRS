<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<c:url value="/resources/css/stumain.css"/>" type="text/css" />
<title>Course List</title>
</head>

<body style="background-color: #fcf16e;">
	<center>
		<div class="container">
			<div class="header">
				<form action="<c:url value="/j_spring_security_logout"/>">
					<div style="float: right;">
						<input type="submit" value="Logout">
					</div>
				</form>
				<br> Hello,<b>${user.stu.name}</b> Welcome!<br /> <br />
<!-- 				<div class="nav"> -->
<!-- 					<ul> -->
<%-- 						<li><a href="<c:url value="/course/coursesearch" />">Register --%>
<!-- 								Course</a></li> -->
<%-- 						<li><a href="<c:url value="/course/viewregcourses" />">Registered --%>
<!-- 								Courses</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
			</div>
			<div class="main">
				<c:choose>
					<c:when test="${not empty courseList}">
						<table border="1">
						<tr bgcolor="cde6c7" style="color:black"><th>Course Name</th><th>Action</th></tr>
							<c:forEach items="${courseList}" var="course">
								<tr>
									<td width="400" align="center">${course.courseName}</td>
									<td width="200" align="center">
										<form action="<c:url value="/course/coursedetail" />"
											method="post">
											<input name="cnum" type="hidden" value="${course.courseNum}" />
											<input type="submit" value="View Details" />
										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<h3>No course satisfy your conditions</h3>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</center>
</body>
</html>