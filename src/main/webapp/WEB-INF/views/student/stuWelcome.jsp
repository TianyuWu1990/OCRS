<%@ page contentType="text/html; charset=ISO-8859-1" language="java"
	errorPage=""%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Administrator</title>

		<!-- Bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script>
			
			
   		</script>
	</head>
	<body>
		<div class="container">
			<div class="jumbotron">
				<h1 class="text-center">Welcome ${user.stu.name}</h1>
				<p class="text-center">Your Student ID is ${user.stu.stuID }</p>
				<p class="text-center">Please choose one of the actions below</p>
			</div>
			
			<div class="well center-block">
				<div class="row">
					<div class="col-md-4">
						<p>
							<a href="<c:url value='/course/coursesearch' />" class="btn btn-primary btn-lg btn-block" id="regCourse">Search Course</a>
						</p>
					</div>
					<div class="col-md-4">
						<p>
							<a href="<c:url value='/course/viewregcourses' />" class="btn btn-primary btn-lg btn-block" id="viewRegCourses">View Registered Courses</a>
						</p>
					</div>
					<div class="col-md-4">
						<p>
							<a href="<c:url value='/student/showschedule'/>" class="btn btn-primary btn-lg btn-block" id="viewSchedule">View Schedule</a>
						</p>
					</div>
				</div>
			</div>
			
			<!-- addCourseModal -->
			<div class="modal fade" id="addCourseModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">New Course Information</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="addCourseForm" method="post" action="<c:url value="/admin/addcourse"/>">
					    		
					    		<div class="form-group">
					    			<label  for="courseName" class="col-md-2 control-label">Course Name</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="courseName" placeholder="Course Name" required = "true"/>
					    			</div>
					  			</div>
								<div class="form-group">
					    			<label for="term" class="col-md-2 control-label">Term</label>
					    			<div class="col-md-10">
					      				<select class="form-control" name="term">
    										<option value="" label="Please select the term" />
    										<c:forEach items="${terms}" var="item">
        										<option value="${item.value}" label="${item.key}"/>
    										</c:forEach>
  										</select>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="courseDesp" class="col-md-2 control-label">Course Description</label>
					    			<div class="col-md-10">
					      				<textarea name="courseDesp" class="form-control" placeholder="Course Description"></textarea>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="credit" class="col-md-2 control-label">Credit</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="credit" required="true" placeholder="Credit"/>
					    			</div>
					  			</div>
					  			<div class="form-group">
					    			<label for="level" class="col-md-2 control-label">Level</label>
					    			<div class="col-md-10">
					      				<select class="form-control" name="level">
    										<option value="" label="Please select the level" />
    										<option value="1" label="Undergraduate" />
											<option value="2" label="Graduate" />
  										</select>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="subId" class="col-md-2 control-label">Subject</label>
					    			<div class="col-md-10">
					      				<select class="form-control" name="subId">
    										<option value="" label="Please select the subject" />
    										<c:forEach items="${sub}" var="item">
        										<option value="${item.id}" label="${item.abbr}"/>
    										</c:forEach>
  										</select>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="instructionMethod" class="col-md-2 control-label">Instruction Method</label>
					    			<div class="col-md-10">
					      				<select class="form-control" name="instructionMethod">
    										<option value="" label="Please select the instruction method" />
    										<c:forEach items="${instructionMethods}" var="item">
        										<option value="${item.value}" label="${item.key}"/>
    										</c:forEach>
    										
  										</select>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="scheduleType" class="col-md-2 control-label">Schedule Type</label>
					    			<div class="col-md-10">
					      				<select class="form-control" name="scheduleType">
    										<option value="" label="Please select the schedule type" />
    										<c:forEach items="${scheduleTypes}" var="item">
        										<option value="${item.value}" label="${item.key}"/>
    										</c:forEach>
    										
  										</select>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="instructorId" class="col-md-2 control-label">Instructor</label>
					    			<div class="col-md-10">
					      				<select class="form-control" name="instructorId">
    										<option value="" label="Please select the instructor" />
    										<c:forEach items="${instructorList}" var="item">
        										<option value="${item.id}" label="${item.name}"/>
    										</c:forEach>
  										</select>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="maxNum" class="col-md-2 control-label">Maximum number of students</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="maxNum" required="true" placeholder="Maximum number of students"/>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="days" class="col-md-2 control-label">Days</label>
					    			<div class="col-md-10">
					      				<label class="checkbox-inline"><input type="checkbox" name="days" value="Mon">Mon</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" value="Tue">Tue</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" value="Wed">Wed</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" value="Thu">Thu</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" value="Fri">Fri</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" value="Sat">Sat</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" value="Sun">Sun</label>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="startTime" class="col-md-2 control-label">Start Time</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="startTime" required="true" placeholder="Start Time"/>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="endTime" class="col-md-2 control-label">End Time</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="endTime" required="true" placeholder="End Time"/>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="location" class="col-md-2 control-label">Location</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="location" required="true" placeholder="Location"/>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="aotos" class="col-md-2 control-label">Open to other subjects</label>
					    			<div class="col-md-10">
					      				<span class="checkbox-inline"><input type="checkbox" name="openToOtherSub" id="aotos" onclick="ckAOtos()"></span>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="aotoc" class="col-md-2 control-label">Open to other colleges</label>
					    			<div class="col-md-10">
					      				<span class="checkbox-inline"><input type="checkbox" name="openToOtherCol" id="aotoc" onclick="ckAOtoc()"></span>
					    			</div>
					  			</div>
							</form>
						</div>
						<div class="modal-footer">
							<input type="submit" text="Submit" form="addCourseForm" class="btn btn-primary"/>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>