<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/blueprint/screen.css"/>" type="text/css" media="screen, projection" />
      	<link rel="stylesheet" href="<c:url value="/resources/css/blueprint/print.css"/>" type="text/css" media="print" />
        <!--[if IE]><link rel="stylesheet" href="<c:url value="/resources/css/blueprint/ie.css"/>" type="text/css" media="screen, projection" /><![endif]-->
      	<!-- Import fancy-type plugin. -->
      	<link rel="stylesheet" href="<c:url value="/resources/css/blueprint/plugins/fancy-type/screen.css"/>" type="text/css" media="screen, projection" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Course Detail</title>
</head>
<body>
<div class="container">
<div class="span-24 last"><h1>Course Detail</h1></div>
<hr>
<hr class="space">
<hr class="space">
<div class="span-24 box">
<h2><b>${course.courseName}</b></h2>
</div>
<br>
<b>Term:</b>${term}<br>
<b>Level:</b>${level}<br>
<b>Subject:</b>${course.sub.abbr}<br>
<b>Credit:</b>${course.credit}<br>
<b>Instruction Method:</b>${instructionMethod}<br>
<b>Schedule Type:</b>${scheduleType}<br>
<br><br>
<table border="1">
<tr>
<th scope="col">Course Number</th>
<th scope="col">Days</th>
<th scope="col">Time</th>
<th scope="col">Location</th>
<th scope="col">Instructor</th>
<th scope="col">Remaining Seats</th>
</tr>
<tr class="">
<td>${course.courseNum}</td>
<td>
<c:forEach items="${course.days}" var="day">
${day}&nbsp;
</c:forEach>
</td>
<td>${course.startTime}-${course.endTime}</td>
<td>${course.location}</td>
<td>${course.instructor.name}</td>
<td>${course.maxNum-course.numStu}</td>
</tr>
</table>
<br>
<b>Course Description:</b><br/>
${course.courseDesp}<br>
</div>
<hr>
<center>
<form action="<c:url value="/course/register" />" method="post">
<input name="cnum" type="hidden" value="${course.courseNum}"/>
<c:if test="${not empty coord}">
<lable for="stuID">Student ID:</lable>&nbsp;<input id="stuID"  name="stuID" type="text" required="true" pattern="\d+"/><br/>
</c:if>
<input type="submit" value="Register Course"/>
</form>
</center>
</body>
</html>