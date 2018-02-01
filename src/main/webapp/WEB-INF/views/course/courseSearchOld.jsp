<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Course Search</title>
<!-- Framework CSS -->
      	<link rel="stylesheet" href="<c:url value="/resources/css/blueprint/screen.css"/>" type="text/css" media="screen, projection" />
      	<link rel="stylesheet" href="<c:url value="/resources/css/blueprint/print.css"/>" type="text/css" media="print" />
        <!--[if IE]><link rel="stylesheet" href="<c:url value="/resources/css/blueprint/ie.css"/>" type="text/css" media="screen, projection" /><![endif]-->
      	<!-- Import fancy-type plugin. -->
      	<link rel="stylesheet" href="<c:url value="/resources/css/blueprint/plugins/fancy-type/screen.css"/>" type="text/css" media="screen, projection" />
</head>
<body style="background-color: #fcf16e;">
<div class="container">
<div id="header" class="span-24 last">
<h1><center>Course Search</center></h1>
</div>
<hr/>
<div id="content" class="span-12 prepend-6 apend-6 last">
<form:form method="post" modelAttribute="condition" id="courseForm">
	<fieldset>
		<legend>Search Conditions</legend>
		<p>
			<label for="cnum">Course Number:</label><br>
			<form:input id="cnum" class="text" type="text" path="courseNum"/>
		</p>
		<p class="prepend-top">
			<label for="cname">Course Name:</label><br>
			<form:input id="cname" class="text" type="text" path="courseName"/>
		</p>
		<p class="prepend-top">
			<label for="term">Term:</label><br>
			<form:select id="term" required="true" path="term">
				<option value="" label="Please select the term"/>
				<form:options items="${terms}" itemLabel="key" itemValue="value" />
			</form:select>
		</p>
		<p class="prepend-top">
			<label for="credit_range">Credit Range:</label><br>
			<form:input id="credit_range" maxlength="1" size="5"  type="text" path="creditMin"/>-<form:input maxlength="1" size="5" type="text" path="creditMax"/>
		</p>
		<p class="prepend-top">
			<label for="level">Level:</label><br>
			<form:select id="level" path="level">
				<option value="" label="Please select the level"/>
				<form:option value="1" label="Undergraduate" />
				<form:option value="2" label="Graduate" />
			</form:select>
		</p>
		<p class="prepend-top">
			<label for="subject">Subject:</label><br>
			<form:select id="subject" required="true" path="subId">
				<option  value="" label="Please select the subject"/>
				<form:options items="${sub}" itemLabel="abbr" itemValue="id" />
			</form:select>
		</p>
		<p class="prepend-top">
			<label for="ins_meth">Instruction Method:</label><br>
			<form:select id="ins_meth" path="instructionMethod">
				<option value="" label="Please select the instruction method"/>
				<form:options items="${instructionMethods}" itemLabel="key" itemValue="value" />
			</form:select>
		</p>
		<p class="prepend-top">
			<label for="sch_type">Schedule Type:</label><br>
			<form:select id="sch_type" path="scheduleType">
				<option value="" label="Please select the schedule type"/>
				<form:options items="${scheduleTypes}" itemLabel="key" itemValue="value" />
			</form:select>
		</p>
		<p class="prepend-top">
			<label for="instructor">Instructor:</label><br>
			<form:select id="instructor" path="instructorId">
				<option value="" label="Please select the instructor"/>
				<form:options items="${instructorList}" itemLabel="name" itemValue="id" />
			</form:select>
		</p>
		<p class="prepend-top">
			<label for="start_time">Start time (HH:MM):</label><br>
			<form:input id="start_time" pattern="(([0-1][0-9])|2[0-3]):[0-5][0-9]" maxLength="5" class="text" path="startTime" type="text"/>
		</p>
		<p class="prepend-top">
			<label for="end_time">End time (HH:MM):</label><br>
			<form:input id="end_time" pattern="(([0-1][0-9])|2[0-3]):[0-5][0-9]" maxLength="5" class="text" type="text" path="endTime"/>
		</p>
		<p class="prepend-top">
			<input type="submit" value="Submit" />&nbsp;<input type="reset" value="Clear" />
		</p>
	</fieldset>	
	
</form:form>
</div>
</div>
</body>
</html>