<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="textml; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="textml; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<style type="text/css">
div#container{width:1000px;height:700px;border:#0099FF 1px solid;background-color:#0099FF;}
div#header{width:1000px;height:100px;color:white;font-size:30px;}
div#main{width:1000px;height:520px;background-color:white;}
div#left{width:300px;height:400px;margin-top:80px;margin-left:50px;float:left;}
div#form{width:250px;height:200px;margin-top:20px;border:#0099FF 1px solid;background-image:url(/ocrs/resources/image/form.jpg);}
div#image{width:600px; height:428px;margin-top:50px;margin-right:30px;background-image:url(/ocrs/resources/image/login.jpg);float:right;}
div#foot{width:1000px;height:50px;background-color:#0099FF;text-align:left;font-size:20px;}
</style>
<title>Login</title>
</head>

<body>
<center>
<div id="container">
<div id="header">
<p>Online Course Registeration System</p></div>
<div id="main">
<div id="left">
<div id="form">
<c:if test="${not empty param.error}">
  <font color="red">
  Login error. <br />
  Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
  </font>
</c:if>
<form method="POST" action="<c:url value="/j_spring_security_check" />">
<br><br>
<table>
  <tr>
    <td align="right">Username</td>
    <td><input type="text" name="j_username" /></td>
  </tr>
  <tr>
    <td align="right">Password</td>
    <td><input type="password" name="j_password" /></td>
  </tr>
  <tr>
    <td colspan="2" align="right">
      <input type="submit" value="Login" />
      <input type="reset" value="Reset" />
      <input type="button" value="Register" onclick="window.location.href='<c:url value="/reg"/>'"/>
    </td>
  </tr>
</table>
</form>
</div>
</div>
<div id="image"></div>
</div>
</div>
</center>
</body>
</html>
