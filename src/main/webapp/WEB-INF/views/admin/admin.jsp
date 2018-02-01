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
		function resetCheckbox(){
			$('input:checkbox').removeAttr('checked');
		}
		function ckAOtoc() {
			var Aotoc = document.getElementById('aotoc');
			var Aotos = document.getElementById('aotos');
			if (Aotoc.checked) {
				Aotos.checked = true;
			}
		}

		function ckAOtos() {
			var Aotoc = document.getElementById('aotoc');
			var Aotos = document.getElementById('aotos');
			if (!Aotos.checked) {
				Aotoc.checked = false;
			}
		}
		
		function ckMOtoc() {
			var Motoc = document.getElementById('openToOtherCol');
			var Motos = document.getElementById('openToOtherSub');
			if (Motoc.checked) {
				Motos.checked = true;
			}
		}

		function ckMOtos() {
			var Motoc = document.getElementById('openToOtherCol');
			var Motos = document.getElementById('openToOtherSub');
			if (!Motos.checked) {
				Motoc.checked = false;
			}
		}
		
     		var courseNumExist = false;
     		var stuIDExist = false;
     		var alertDelay = 3000
			var addCourseOptions = {"dataType":"json",
     						"success": function(response,status,xhr,elem){
     							if(response.status == "error") {
     								$("#alertMsg").text("Some error happens! Operation Fails!");
     								
     								$("#alertDiv").removeClass("alert-success");
     								$("#alertDiv").addClass("alert-danger");
     								$("#alertDiv").show();
     								
     							} else {
     								var courseNum = response.courseNum;
     								$("#alertMsg").text("Success! The course number is "+courseNum);
     								$("#alertDiv").addClass("alert-success");
     								$("#alertDiv").removeClass("alert-danger");
     								$("#alertDiv").show();
     							}
     							$("#addCourseModal").modal("hide");
     							window.setTimeout(function() { $("#alertDiv").hide(); }, alertDelay);
     						}};
			
			var addStuOptions = {"dataType":"json",
     						"success": function(response,status,xhr,elem){
     							if(response.status == "error") {
     								$("#alertMsg").text("Some error happens! Operation Fails!");
     								
     								$("#alertDiv").removeClass("alert-success");
     								$("#alertDiv").addClass("alert-danger");
     								$("#alertDiv").show();
     							} else {
     								var stuID = response.stuID;
     								$("#alertMsg").text("Success! The student ID is "+stuID);
     								$("#alertDiv").addClass("alert-success");
     								$("#alertDiv").removeClass("alert-danger");
     								$("#alertDiv").show();
     								
     							}
     							$("#addStuModal").modal("hide");
     							window.setTimeout(function() { $("#alertDiv").hide(); }, alertDelay);
     						}};
     		
			var inputCourseNumOptions = {"dataType":"json",
						"success": function(response,status,xhr,elem){
							if(response.status == "error") {
								courseNumExist = false
								$("#alertMsg").text("Invalid course number!");
								$("#alertDiv").removeClass("alert-success");
								$("#alertDiv").addClass("alert-danger");
								$("#alertDiv").show();
								
							} else {
								courseNumExist = true;
								var course = response.course;
								$('#modCourseForm').trigger("reset");
								resetCheckbox();
								bindJsonToModCourseForm(course)
							}
							$("#inputCourseNumModal").modal("hide");
							window.setTimeout(function() { $("#alertDiv").hide(); }, alertDelay);
						}};
			
			var inputStuIDOptions = {"dataType":"json",
					"success": function(response,status,xhr,elem){
						if(response.status == "error") {
							stuIDExist = false
							$("#alertMsg").text("Invalid student ID!");
							$("#alertDiv").removeClass("alert-success");
							$("#alertDiv").addClass("alert-danger");
							$("#alertDiv").show();
							
						} else {
							stuIDExist = true;
							var student = response.student;
							$('#modStuForm').trigger("reset");
							resetCheckbox();
							bindJsonToModStuForm(student)
						}
						$("#inputStuIDModal").modal("hide");
						window.setTimeout(function() { $("#alertDiv").hide(); }, alertDelay);
					}};
			
			var modStuOptions = {"dataType":"json",
					"success": function(response,status,xhr,elem){
						if(response.status == "error") {
							$("#alertMsg").text("Some error happens! Operation fails!");
							$("#alertDiv").removeClass("alert-success");
							$("#alertDiv").addClass("alert-danger");
							$("#alertDiv").show();
							
						} else {
								$("#alertMsg").text("Student information updated successfully!");
								$("#alertDiv").addClass("alert-success");
								$("#alertDiv").removeClass("alert-danger");
								$("#alertDiv").show();
								
						}
						$("#modStuModal").modal("hide");
						window.setTimeout(function() { $("#alertDiv").hide(); }, alertDelay);
						
					}};
			
			var modCourseOptions = {"dataType":"json",
					"success": function(response,status,xhr,elem){
						if(response.status == "error") {
							$("#alertMsg").text("Some error happens! Operation fails!");
							$("#alertDiv").removeClass("alert-success");
							$("#alertDiv").addClass("alert-danger");
							$("#alertDiv").show();
							
						} else {
								$("#alertMsg").text("Course information updated successfully!");
								$("#alertDiv").addClass("alert-success");
								$("#alertDiv").removeClass("alert-danger");
								$("#alertDiv").show();
								
						}
						$("#modCourseModal").modal("hide");
						window.setTimeout(function() { $("#alertDiv").hide(); }, alertDelay);
						
					}};
			
			function bindJsonToModCourseForm(course) {
				$("#cid").val(course.id);
				$("#courseNum").val(course.courseNum);
				$("#courseName").val(course.courseName);
				$("#courseDesp").val(course.courseDesp);
				$("#credit").val(course.credit);
				$("#level").val(course.level);
				$("#location").val(course.location);
				$("#startTime").val(course.startTime);
				$("#endTime").val(course.endTime);
				$("#term").val(course.term);
				$("#level").val(course.level);
				$("#subId").val(course.subId);
				$("#instructorId").val(course.instructorId);
				$("#instructionMethod").val(course.instructionMethod);
				$("#scheduleType").val(course.scheduleType);
				$("#maxNum").val(course.maxNum);
				for(var day in course.days) {
					
					$("#"+course.days[day]).attr("checked","true");
				}
				if(course.openToOtherSub) {
					$("#openToOtherSub").attr("checked","true");
				} else {
					$("#openToOtherSub").removeAttr("checked");
				}
				
				if(course.openToOtherCol) {
					$("#openToOtherCol").attr("checked","true");
				} else {
					$("#openToOtherCol").removeAttr("checked");
				}
				
			}
			
			function bindJsonToModStuForm(student) {
				$("#sid").val(student.id);
				$("#stuID").val(student.stuID);
				$("#name").val(student.name);
				$("#stuLevel").val(student.level);
				$("#startYear").val(student.startYear);
				$("#stuSubId").val(student.subId);
				$("#email").val(student.email);
				$("#holdReason").val(student.holdReason);
				if(student.hold) {
					$("#hold").attr("checked","true");
				} else {
					$("#hold").removeAttr("checked");
				}
				
			}
			
			// wait for the DOM to be loaded
     		$(function() {
       		// bind 'myForm' and provide a simple callback function
       			$('#inputCourseNumModal').on('hidden.bs.modal', function (e) {
       				if(courseNumExist) {
       					$("#modCourseModal").modal("show");
       					courseNumExist = false;
       				}
				});
				
       			$('#addCourseModal').on('show.bs.modal',function(e){
					
					$('#addCourseForm').trigger("reset");
				});
       			
				$('#inputCourseNumModal').on('show.bs.modal',function(e){
					
					$('#inputCourseNumForm').trigger("reset");
				});
				
				
				$('#addStuModal').on('show.bs.modal',function(e){
					
					$('#addStuForm').trigger("reset");
				});
       			
				$('#inputStuIDModal').on('show.bs.modal',function(e){
					
					$('#inputStuIDForm').trigger("reset");
				});
				
				$('#inputStuIDModal').on('hidden.bs.modal', function (e) {
       				if(stuIDExist) {
       					$("#modStuModal").modal("show");
       					stuIDExist = false;
       				}
				});
				
       			$("#alertDiv").hide();
       			$('#addCourseForm').ajaxForm(addCourseOptions);
       			$('#inputCourseNumForm').ajaxForm(inputCourseNumOptions);
       			$('#addStuForm').ajaxForm(addStuOptions);
       			$('#inputStuIDForm').ajaxForm(inputStuIDOptions);
       			$('#modCourseForm').ajaxForm(modCourseOptions);
       			$('#modStuForm').ajaxForm(modStuOptions);
       			
     		});
   </script>
	</head>
	<body>
		<div class="container">
			<div class="jumbotron">
				<h1 class="text-center">Welcome Administrator</h1>
				<p class="text-center">Please choose one of the actions below</p>
			</div>
			<div class="alert" id="alertDiv">
  				<strong><span id="alertMsg"></span></strong>
			</div>
			<div class="well center-block">
				<div class="row">
					<div class="col-md-4 col-md-offset-2">
						<p>
							<button type="button" class="btn btn-primary btn-lg btn-block" id="addCourseBtn" data-toggle="modal" data-target="#addCourseModal">Add Course</button>
						</p>
					</div>
					<div class="col-md-4">
						<p>
							<button type="button" class="btn btn-primary btn-lg btn-block" id="modCourseBtn" data-toggle="modal" data-target="#inputCourseNumModal">Modify Course Information</button>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-md-offset-2">
						<p>
							<button type="button" class="btn btn-primary btn-lg btn-block" id="addStuBtn" data-toggle="modal" data-target="#addStuModal">Add Student</button>
						</p>
					</div>
					<div class="col-md-4">
						<p>
							<button type="button" class="btn btn-primary btn-lg btn-block" id="modStuBtn" data-toggle="modal" data-target="#inputStuIDModal">Modify Student Information</button>
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
							<input type="submit" value="Submit" form="addCourseForm" class="btn btn-primary"/>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- inputCourseNumModal -->
			<div class="modal fade" id="inputCourseNumModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Please enter the course number</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="inputCourseNumForm" method="post" action="<c:url value="/admin/modcourse"/>">
								<div class="form-group">
					    			<label  for="cnum" class="col-md-2 control-label">Course Number</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="cnum" placeholder="Course Number" required = "true" pattern="\d+"/>
					    			</div>
					  			</div>
							</form>
						</div>
						<div class="modal-footer">
							<input type="submit" value="Submit" form="inputCourseNumForm" class="btn btn-primary"/>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- modCourseModal -->
			<div class="modal fade" id="modCourseModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Modify Course Information</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="modCourseForm" method="post" action="<c:url value='/admin/modcourse'/>">
					    		<input type="hidden" name="id" id="cid"/>
					    		<div class="form-group">
					    			<label  for="courseNum" class="col-md-2 control-label">Course Number</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="courseNum" id="courseNum" placeholder="Course Number" readonly="true" required = "true"/>
					    			</div>
					  			</div>
					    		
					    		<div class="form-group">
					    			<label  for="courseName" class="col-md-2 control-label">Course Name</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="courseName" id="courseName" placeholder="Course Name" required = "true"/>
					    			</div>
					  			</div>
								<div class="form-group">
					    			<label for="term" class="col-md-2 control-label">Term</label>
					    			<div class="col-md-10">
					      				<select class="form-control" name="term" id="term">
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
					      				<textarea name="courseDesp" id="courseDesp" class="form-control" placeholder="Course Description"></textarea>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="credit" class="col-md-2 control-label">Credit</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="credit" id="credit" required="true" placeholder="Credit"/>
					    			</div>
					  			</div>
					  			<div class="form-group">
					    			<label for="level" class="col-md-2 control-label">Level</label>
					    			<div class="col-md-10">
					      				<select class="form-control" name="level" id="level">
    										<option value="" label="Please select the level" />
    										<option value="1" label="Undergraduate" />
											<option value="2" label="Graduate" />
  										</select>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="subId" class="col-md-2 control-label">Subject</label>
					    			<div class="col-md-10">
					      				<select class="form-control" name="subId" id="subId">
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
					      				<select class="form-control" name="instructionMethod" id="instructionMethod">
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
					      				<select class="form-control" name="scheduleType" id="scheduleType">
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
					      				<select class="form-control" name="instructorId" id="instructorId">
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
					      				<input type="text" class="form-control" name="maxNum" id="maxNum" required="true" placeholder="Maximum number of students"/>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="days" class="col-md-2 control-label">Days</label>
					    			<div class="col-md-10">
					      				<label class="checkbox-inline"><input type="checkbox" name="days" id="Mon" value="Mon">Mon</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" id="Tue" value="Tue">Tue</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" id="Wed" value="Wed">Wed</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" id="Thu" value="Thu">Thu</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" id="Fri" value="Fri">Fri</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" id="Sat" value="Sat">Sat</label>
										<label class="checkbox-inline"><input type="checkbox" name="days" id="Sun" value="Sun">Sun</label>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="startTime" class="col-md-2 control-label">Start Time</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="startTime" id="startTime" required="true" placeholder="Start Time"/>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="endTime" class="col-md-2 control-label">End Time</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="endTime" id="endTime" required="true" placeholder="End Time"/>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="location" class="col-md-2 control-label">Location</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="location" id="location" required="true" placeholder="Location"/>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="otos" class="col-md-2 control-label">Open to other subjects</label>
					    			<div class="col-md-10">
					      				<span class="checkbox-inline"><input type="checkbox" name="openToOtherSub" id="openToOtherSub" onclick="ckMOtos()"></span>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="otoc" class="col-md-2 control-label">Open to other colleges</label>
					    			<div class="col-md-10">
					      				<span class="checkbox-inline"><input type="checkbox" name="openToOtherCol" id="openToOtherCol" onclick="ckMOtoc()"></span>
					    			</div>
					  			</div>
					  		</form>
						</div>
						<div class="modal-footer">
							<input type="submit" value="Submit" form="modCourseForm" class="btn btn-primary"/>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- addStuModal -->
			<div class="modal fade" id="addStuModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">New Student Information</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="addStuForm" method="post" action="<c:url value='/admin/addstu'/>">
					    		
					    		<div class="form-group">
					    			<label  for="name" class="col-md-2 control-label">Student Name</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="name" placeholder="Student Name" required = "true"/>
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
					    			<label for="startYear" class="col-md-2 control-label">Start year</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control"  name="startYear" required="true" placeholder="Start Year"/>
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
					    			<label for="email" class="col-md-2 control-label">Email</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="email" required="true" placeholder="Email"/>
					    			</div>
					  			</div>					  			

								<div class="form-group">
					    			<label for="hold" class="col-md-2 control-label">Hold</label>
					    			<div class="col-md-10">
					      				<span class="checkbox-inline"><input type="checkbox" name="hold"></span>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="Hold reason" class="col-md-2 control-label">Hold reason</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="holdReason" placeholder="Hold reason"/>
					    			</div>
					  			</div>
					  			
							</form>
						</div>
						<div class="modal-footer">
							<input type="submit" value="Submit" form="addStuForm" class="btn btn-primary"/>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- inputStuIDModal -->
			<div class="modal fade" id="inputStuIDModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Please enter the student ID</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="inputStuIDForm" method="post" action="<c:url value='/admin/modstu'/>">
								<div class="form-group">
					    			<label  for="id" class="col-md-2 control-label">Student ID</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="sid" placeholder="Student ID" required = "true" pattern="\d+"/>
					    			</div>
					  			</div>
							</form>
						</div>
						<div class="modal-footer">
							<input type="submit" value="Submit" form="inputStuIDForm" class="btn btn-primary"/>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- modStuModal -->
			<div class="modal fade" id="modStuModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Modify Student Information</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="modStuForm" method="post" action="<c:url value="/admin/modstu"/>">
					    		<input type="hidden" name="id" id="sid"/>
					    		<div class="form-group">
					    			<label  for="stuID" class="col-md-2 control-label">Student ID</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="stuID" id="stuID" placeholder="Student ID" readonly="true" required = "true"/>
					    			</div>
					  			</div>
					    		<div class="form-group">
					    			<label  for="name" class="col-md-2 control-label">Student Name</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="name" id="name" placeholder="Student Name" required = "true"/>
					    			</div>
					  			</div>
								<div class="form-group">
					    			<label for="level" class="col-md-2 control-label">Level</label>
					    			<div class="col-md-10">
					      				<select class="form-control" id="stuLevel" name="level" disabled="true">
    										<option value="" label="Please select the level" />
    										<option value="1" label="Undergraduate" />
											<option value="2" label="Graduate" />
  										</select>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="startYear" class="col-md-2 control-label">Start year</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" id="startYear" name="startYear" required="true" readonly="true" placeholder="Start Year"/>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="subId" class="col-md-2 control-label">Subject</label>
					    			<div class="col-md-10">
					      				<select class="form-control" name="subId" id="stuSubId">
    										<option value="" label="Please select the subject" />
    										<c:forEach items="${sub}" var="item">
        										<option value="${item.id}" label="${item.abbr}"/>
    										</c:forEach>
  										</select>
					    			</div>
					  			</div>
								
								<div class="form-group">
					    			<label for="email" class="col-md-2 control-label">Email</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="email" id="email" required="true" placeholder="Email"/>
					    			</div>
					  			</div>					  			

								<div class="form-group">
					    			<label for="hold" class="col-md-2 control-label">Hold</label>
					    			<div class="col-md-10">
					      				<span class="checkbox-inline"><input type="checkbox" name="hold" id="hold"></span>
					    			</div>
					  			</div>
					  			
					  			<div class="form-group">
					    			<label for="Hold reason" class="col-md-2 control-label">Hold reason</label>
					    			<div class="col-md-10">
					      				<input type="text" class="form-control" name="holdReason" id="holdReason" placeholder="Hold reason"/>
					    			</div>
					  			</div>
					  			
							</form>
						</div>
						<div class="modal-footer">
							<input type="submit" value="Submit" form="modStuForm" class="btn btn-primary"/>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>