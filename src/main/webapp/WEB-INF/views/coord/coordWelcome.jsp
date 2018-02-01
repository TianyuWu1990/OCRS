<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<link rel="stylesheet" href="<c:url value="/resources/css/blueprint/screen.css"/>" type="text/css" media="screen, projection" />
      	<link rel="stylesheet" href="<c:url value="/resources/css/blueprint/print.css"/>" type="text/css" media="print" />
        <!--[if IE]><link rel="stylesheet" href="<c:url value="/resources/css/blueprint/ie.css"/>" type="text/css" media="screen, projection" /><![endif]-->
      	<!-- Import fancy-type plugin. -->
      	<link rel="stylesheet" href="<c:url value="/resources/css/blueprint/plugins/fancy-type/screen.css"/>" type="text/css" media="screen, projection" />
</head>
<body id="body" align="center">
<div class="container">
<div class="span-12 prepend-6 append-6">
<h1>Hello,${user.userName} Welcome!</h1>
</div>
<hr class="space"/><hr class="space"/><hr class="space"/>
<div class="span-6 prepend-9 append-9">
What do you want to do?<br/>
<div class="box">
<span><a href="/ocrs/course/coursesearch">Register Course for Students</a></span><br>
</div>
</div>
</div>
<script type="text/javascript">
function delMessage(){
	var body=document.getElementById("body");
	var message =document.getElementById("message");
	body.removeChild(message);
}
setTimeout("delMessage();",3000);
</script>
</body>
</html>