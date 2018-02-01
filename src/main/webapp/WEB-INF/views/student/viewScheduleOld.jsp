<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
    @import "/ocrs/resources/dojoroot/dijit/themes/claro/claro.css";
    @import "/ocrs/resources/dojoroot/dojo/resources/dojo.css"
</style>
<script type="text/javascript" src="/ocrs/resources/dojoroot/dojo/dojo.js" djConfig="parseOnLoad: true"></script>
<script>
    dojo.require("dojo.parser");
    dojo.require("dijit.layout.ContentPane");
    dojo.require("dijit.layout.TabContainer");
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="claro">
	<div dojoType="dijit.layout.TabContainer">
		<div dojoType="dijit.layout.ContentPane" title="Monday">
		<c:choose>
				<c:when test="${not empty schedule.Mon}">
					<table>
						<tr bgcolor="cde6c7" style="color:black">
							<th>Course Name</th><th>Time</th><th>Location</th>
						</tr>
							<c:forEach items="${schedule.Mon}" var="course">
								<tr>
									<td width="200">${course.courseName}</td>
									<td width="300">${course.startTime}-${course.endTime}</td>
									<td width="100">${course.location}</td>
								</tr>
							</c:forEach>
						</table>
				</c:when>
				<c:otherwise>
						<h3>No class on Monday!</h3>
				</c:otherwise>
		</c:choose>
		</div>
		<div dojoType="dijit.layout.ContentPane" title="Tuesday">
		<c:choose>
				<c:when test="${not empty schedule.Tue}">
					<table>
						<tr bgcolor="cde6c7" style="color:black">
							<th>Course Name</th><th>Time</th><th>Location</th>
						</tr>
							<c:forEach items="${schedule.Tue}" var="course">
								<tr>
									<td width="200">${course.courseName}</td>
									<td width="300">${course.startTime}-${course.endTime}</td>
									<td width="100">${course.location}</td>
								</tr>
							</c:forEach>
						</table>
				</c:when>
				<c:otherwise>
						<h3>No class on Tuesday!</h3>
				</c:otherwise>
		</c:choose>
		</div>
		<div dojoType="dijit.layout.ContentPane" title="Wednessday">
		<c:choose>
				<c:when test="${not empty schedule.Wed}">
					<table>
						<tr bgcolor="cde6c7" style="color:black">
							<th>Course Name</th><th>Time</th><th>Location</th>
						</tr>
							<c:forEach items="${schedule.Wed}" var="course">
								<tr>
									<td width="200">${course.courseName}</td>
									<td width="300">${course.startTime}-${course.endTime}</td>
									<td width="100">${course.location}</td>
								</tr>
							</c:forEach>
						</table>
				</c:when>
				<c:otherwise>
						<h3>No class on Wednesday!</h3>
				</c:otherwise>
		</c:choose>
		</div>
		<div dojoType="dijit.layout.ContentPane" title="Thursday">
		<c:choose>
				<c:when test="${not empty schedule.Thu}">
					<table>
						<tr bgcolor="cde6c7" style="color:black">
							<th>Course Name</th><th>Time</th><th>Location</th>
						</tr>
							<c:forEach items="${schedule.Thu}" var="course">
								<tr>
									<td width="200">${course.courseName}</td>
									<td width="300">${course.startTime}-${course.endTime}</td>
									<td width="100">${course.location}</td>
								</tr>
							</c:forEach>
						</table>
				</c:when>
				<c:otherwise>
						<h3>No class on Thursday!</h3>
				</c:otherwise>
		</c:choose>
		</div>
		<div dojoType="dijit.layout.ContentPane" title="Friday">
		<c:choose>
				<c:when test="${not empty schedule.Fri}">
					<table>
						<tr bgcolor="cde6c7" style="color:black">
							<th>Course Name</th><th>Time</th><th>Location</th>
						</tr>
							<c:forEach items="${schedule.Fri}" var="course">
								<tr>
									<td width="200">${course.courseName}</td>
									<td width="300">${course.startTime}-${course.endTime}</td>
									<td width="100">${course.location}</td>
								</tr>
							</c:forEach>
						</table>
				</c:when>
				<c:otherwise>
						<h3>No class on Friday!</h3>
				</c:otherwise>
		</c:choose>
		</div>
		<div dojoType="dijit.layout.ContentPane" title="Saturday">
		<c:choose>
				<c:when test="${not empty schedule.Sat}">
					<table>
						<tr bgcolor="cde6c7" style="color:black">
							<th>Course Name</th><th>Time</th><th>Location</th>
						</tr>
							<c:forEach items="${schedule.Sat}" var="course">
								<tr>
									<td width="200">${course.courseName}</td>
									<td width="300">${course.startTime}-${course.endTime}</td>
									<td width="100">${course.location}</td>
								</tr>
							</c:forEach>
						</table>
				</c:when>
				<c:otherwise>
						<h3>No class on Saturday!</h3>
				</c:otherwise>
		</c:choose>
		</div>
		<div dojoType="dijit.layout.ContentPane" title="Sunday">
		<c:choose>
				<c:when test="${not empty schedule.Sun}">
					<table>
						<tr bgcolor="cde6c7" style="color:black">
							<th>Course Name</th><th>Time</th><th>Location</th>
						</tr>
							<c:forEach items="${schedule.Sun}" var="course">
								<tr>
									<td width="200">${course.courseName}</td>
									<td width="300">${course.startTime}-${course.endTime}</td>
									<td width="100">${course.location}</td>
								</tr>
							</c:forEach>
						</table>
				</c:when>
				<c:otherwise>
						<h3>No class on Sunday!</h3>
				</c:otherwise>
		</c:choose>
		</div>
		
	</div>
</body>
</html>