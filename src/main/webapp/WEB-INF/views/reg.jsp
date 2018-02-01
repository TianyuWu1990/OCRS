<%@ page contentType="text/html; charset=ISO-8859-1" language="java" errorPage="" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    
	<title>New User Registration</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
var userNamePass=false;
var stuIDPass=false;
$.ajaxSetup({
	async: false
	});
$("document").ready(function(){
	$("#stuIDError").hide();
	$("#usernameError").hide();
	$("#submit").attr("disabled",!(userNamePass && stuIDPass));
	$("#userName").blur(function(){
		if($("#userName").val()) {
			checkUserName();
			$("#submit").attr("disabled",!OK());
			console.log("USERNAME PASS"+window.userNamePass);
		}
	});
	$("#stuID").blur(function(){
		if($("#stuID").val()) {
			checkStuID();
			$("#submit").attr("disabled",!OK());
			console.log("after check stuID:"+stuIDPass);
		}
	});
	
	$("#userReg").submit(OK);
});

function checkUserName(){
	
	$.getJSON("reg/checkUserName",{userName:$("#userName").val()},function(result){
		if(result.pass){
			console.log("pass value:"+result.pass);
			$("#usernameError").hide();
			window.userNamePass = true;
			
		} else{
			console.log("pass value:"+result.pass);
			$("#usernameError").text("This username has been used!");
			$("#usernameError").show();
			window.userNamePass = false;
			
		}
	});
}

function checkStuID(){
	
	$.getJSON("reg/checkStuID",{stuID:$("#stuID").val()},function(result){
		if(result.pass){
			$("#stuIDError").hide();
			window.stuIDPass= true;
		} else{
			//if($("#stuIDError").length==0)
			$("#stuIDError").text("This student ID does not exist!");
			$("#stuIDError").show();
			window.stuIDPass= false;
		}
	});
}
function OK(){
	console.log("uPass:"+userNamePass+"\nsPass:"+stuIDPass)
	return userNamePass && stuIDPass;
}
</script>
  </head>
  <body>
    <div class="container">
    	<div class="jumbotron">
    		<h1 class="text-center">New User Registration</h1>
    		<p class="text-center">Please fill out the form below</p>
    	</div>
    	<form:form class="form-horizontal" id="userReg" method="post"  modelAttribute="regBean">
    		<div class="row">
    			<div class="bg-danger col-md-offset-2 col-md-10" id="usernameError">error</div>
    		</div>
    		<div class="form-group">
    			<label for="userName" class="col-md-2 control-label">Username</label>
    			<div class="col-md-10">
      				<form:input type="text" class="form-control" path="userName" placeholder="Username" required = "true"/>
    			</div>
  			</div>
			<div class="form-group">
    			<label for="pwd" class="col-md-2 control-label">Password</label>
    			<div class="col-md-10">
      				<form:input type="password" class="form-control" path="pwd" required="true" placeholder="Password"/>
    			</div>
  			</div>
  			<div class="row">
    			<div class="bg-danger col-md-offset-2 col-md-10" id="stuIDError">error</div>
    		</div>
  			<div class="form-group">
    			<label for="stuID" class="col-md-2 control-label">Student ID</label>
    			<div class="col-md-10">
      				<form:input type="text" class="form-control" path="stuID" required="true" placeholder="Student ID"/>
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="name" class="col-md-2 control-label">Name</label>
    			<div class="col-md-10">
      				<form:input type="text" class="form-control" path="name" required="true" placeholder="Name"/>
    			</div>
  			</div>
  			<div class="form-group">
    			<div class="col-md-offset-2 col-md-5">
      				<button id="submit" type="submit" class="btn btn-primary">Submit</button>
    			</div>
    			<div class="col-md-5">
      				<button type="reset" class="btn btn-default">Clear</button>
    			</div>
  			</div>
		</form:form>
    </div>

  </body>
</html>