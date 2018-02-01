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
    
	<title>Course Search</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
</script>
  </head>
  <body>
    <div class="container">
    	<div class="jumbotron">
    		<h1 class="text-center">Course Search</h1>
    		<p class="text-center">Please fill out the form below</p>
    	</div>
    	<form:form class="form-horizontal" method="post" modelAttribute="condition" id="courseForm">	
							<div class="form-group" >
							<label for="cnum" class="col-md-2 control-label">Course Number:</label>
							<div class="col-md-10">
 							<form:input id="cnum" class="form-control" type="text" path="courseNum" placeholder="Course Number"/>
							</div></div>
							
							<div class="form-group">
							<label for="cname" class="col-md-2 control-label">Course Name:</label>
							<div class="col-md-10">
							<form:input id="cname" class="form-control" type="text" path="courseName" placeholder="Course Name"/>
							</div></div>
							
							<div class="form-group">
            				<label for="term" class="col-md-2 control-label">Term:</label>
            				<div class="col-md-10">
               				<form:select class="form-control" path="term">
              				<option value="" label="Please select the term"/>
							<form:options items="${terms}" itemLabel="key" itemValue="value" />
           					</form:select>
            				</div></div>
          					
							<div class="form-group">
							<label for="credit_range" class="col-md-2 control-label">Credit Range:</label>            				
							<div class="col-md-10">
							<form:input id="credit_range" maxlength="1" size="5"  type="text" path="creditMin" placeholder="Min credit"/>-<form:input maxlength="1" size="5" type="text" path="creditMax" placeholder="Max credit"/>
							</div></div>
							
							<div class="form-group">
							<label for="level" class="col-md-2 control-label">Level:</label>
							<div class="col-md-10">	
							<form:select id="level" class="form-control" path="level">
							<option value="" label="Please select the level"/>
							<option value="1" label="Undergraduate" />
							<option value="2" label="Graduate" />
							</form:select></div></div>
							
							<div class="form-group">
							<label class="col-md-2 control-label" for="subject">Subject:</label>
							<div class="col-md-10">							
							<form:select class="form-control" id="subject" path="subId">
							<option  value="" label="Please select the subject"/>
							<form:options items="${sub}" itemLabel="abbr" itemValue="id" />
							</form:select>
							</div></div>
							
							<div class="form-group">
							<label class="col-md-2 control-label" for="ins_meth">Instruction Method:</label>
							<div class="col-md-10">
							<form:select class="form-control" id="ins_meth" path="instructionMethod">
							<option value="" label="Please select the instruction method"/>
							<form:options items="${instructionMethods}" itemLabel="key" itemValue="value" /></form:select>
							</div></div>
							
							<div class="form-group">
							<label class="col-md-2 control-label" for="sch_type">Schedule Type:</label>
							<div class="col-md-10">
							<form:select class="form-control" id="sch_type" path="scheduleType">
							<option value="" label="Please select the schedule type"/>
							<form:options items="${scheduleTypes}" itemLabel="key" itemValue="value" /></form:select>
							</div></div>
							
							<div class="form-group">
							<label class="col-md-2 control-label" for="instructor">Instructor:</label>
							<div class="col-md-10">
							<form:select class="form-control" id="instructor" path="instructorId">
							<option value="" label="Please select the instructor"/>
							<form:options items="${instructorList}" itemLabel="name" itemValue="id" />
							</form:select></div></div>
							
							<div class="form-group">
							<label class="col-md-2 control-label" for="start_time">Start time (HH:MM):</label>
							<div class="col-md-10">
							<form:input id="start_time" pattern="(([0-1][0-9])|2[0-3]):[0-5][0-9]" maxLength="5" class="form-control" path="startTime" type="text" placeholder="HH:MM"/>
							</div></div>
							
							<div class="form-group">
							<label class="col-md-2 control-label" for="end_time">End time (HH:MM):</label>
							<div class="col-md-10">
							<form:input id="end_time" pattern="(([0-1][0-9])|2[0-3]):[0-5][0-9]" maxLength="5" class="form-control" type="text" path="endTime" placeholder="HH:MM"/>
							</div></div>
							
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