package com.yang.ocrs.web;

import java.sql.Time;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yang.ocrs.po.Course;
import com.yang.ocrs.po.Student;
import com.yang.ocrs.po.User;
import com.yang.ocrs.service.CourseInfoService;
import com.yang.ocrs.service.CourseRegService;
import com.yang.ocrs.service.StudentInfoService;

@Controller
@RequestMapping("/course")
public class CourseRegDropController {
	@Autowired
	private StudentInfoService stuService;
	@Autowired
	private CourseInfoService courseService;
	@Autowired
	private CourseRegService courseRegService;
	@ModelAttribute("sub")
	public List getSubList() {
		return stuService.getSubList();
	}
	@ModelAttribute("instructionMethods")
	public Set getInstructionMethods() {
		return courseService.getInstructionMethods();
	}
	
	@ModelAttribute("instructorList")
	public List getInstrList() {
		return courseService.getInstructorList();
	}
	@ModelAttribute("terms")
	public Set getTerms() {
		return courseService.getTerms();
	}
	@ModelAttribute("scheduleTypes")
	public Set getScheduleTypes() {
		return courseService.getScheduleTypes();
	}
	
	@RequestMapping(value="/coursesearch",method=RequestMethod.GET)
	public String createSearchForm(@ModelAttribute("condition")ConditionBean condition) {
		return "/course/courseSearch";
	}
	
	@RequestMapping(value="/coursesearch",method=RequestMethod.POST)
	public String getCourseList(Model model,HttpServletRequest req) {
		ConditionBean condition =new ConditionBean();
		populateConditionBean(req,condition);
		List courseList=courseRegService.getCourseList(condition);
		model.addAttribute("courseList", courseList);
		return "/course/courseList";
	}
	@RequestMapping(value="/coursedetail" ,method=RequestMethod.POST,params="cnum")
	public String showCourseDetail(Model model, @RequestParam(value="cnum") String courseNum,HttpSession session){
		Course course =courseService.getCourse(courseNum);
		model.addAttribute("course",course);
		if(course.getLevel()==1){
			model.addAttribute("level", "Undergraduate");
		} else {
			model.addAttribute("level", "Graduate");
		}
		String term = courseService.getTermName(course.getTerm().toString());
		String scheduleType =courseService.getScheduleTypeName(Integer.toString(course.getScheduleType()));
		String instructionMethod =courseService.getInstructionMethodName(Integer.toString(course.getInstructionMethod()));
		model.addAttribute("scheduleType", scheduleType);
		model.addAttribute("instructionMethod", instructionMethod);
		model.addAttribute("term", term);
		User user=(User)session.getAttribute("user");
		if(user!=null) {
			if(user.getUserType().equals(User.COORDINATOR)){
				model.addAttribute("coord", true);
			}
		}
		return "/course/courseDetail";
	}
	@RequestMapping(value="/register",method=RequestMethod.POST,params="cnum")
	public String registerCourse(Model model, @RequestParam(value="cnum")String courseNum,HttpSession session, HttpServletRequest req){
		Course course = courseService.getCourse(courseNum);
		User user = (User)session.getAttribute("user");
		String result=null;
		if(user!=null) {
			if(user.getUserType().equals(User.STUDENT)){
				Student stu=user.getStu();
				result = courseRegService.selfRegister(stu,courseNum);
				model.addAttribute("result", result);
			} else if(user.getUserType().equals(User.COORDINATOR)){
				String stuID=req.getParameter("stuID").trim();
				Student stu= stuService.getStudent(stuID);
				if(stu!=null){
					result = courseRegService.coordRegister(stu, courseNum);
					model.addAttribute("result", result);
				} else {
					result="ERROR:The student ID is invalid!";
					model.addAttribute("result", result);
				}
			}
				return "result";
		} else {
			return "login";
		}
	}
	@RequestMapping(value="/viewregcourses")
	String viewRegCourses(HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		if(user!=null){
			Student stu =user.getStu();
			Set<Course> courseList = stu.getCourses();
			System.out.println("Course Size:"+courseList.size());
			model.addAttribute("courseList", courseList);
			return "/student/viewRegisteredCourses";
		} else {
			return "redirct:/ocrs/";
		}
	}
	@RequestMapping(value="/dropcourse",method=RequestMethod.POST, params="cnum")
	String dropCourse(HttpSession session, Model model, @RequestParam(value="cnum") String courseNum) {
		User user =(User)session.getAttribute("user");
		Student stu=user.getStu();
		String result =courseRegService.dropCourse(stu, courseNum);
		model.addAttribute("result", result);
		return "result";
	}
	
	private void populateConditionBean(HttpServletRequest req,ConditionBean condition){
		String courseNum=req.getParameter("courseNum");
		String courseName=req.getParameter("courseName");
		String creditMax=req.getParameter("creditMax");
		String creditMin=req.getParameter("creditMin");
		String startTime=req.getParameter("startTime");
		String endTime=req.getParameter("endTime");
		String instructionMethod=req.getParameter("instructionMethod");
		String instructorId=req.getParameter("instructorId");
		String level=req.getParameter("level");
		String scheduleType=req.getParameter("scheduleType");
		String term=req.getParameter("term");
		String subId=req.getParameter("subId");
		if(!isNullOrEmpty(courseNum)){
			condition.setCourseNum(courseNum.trim());
		}
		if(!isNullOrEmpty(courseName)){
			condition.setCourseName(courseName.trim());
		}
		if(!isNullOrEmpty(creditMax)){
			condition.setCreditMax(Integer.parseInt(creditMax.trim()));
		}
		if(!isNullOrEmpty(creditMin)){
			condition.setCreditMin(Integer.parseInt(creditMin.trim()));
		}
		if(!isNullOrEmpty(startTime)){
			startTime=startTime.trim()+":00";
			condition.setStartTime(Time.valueOf(startTime));
		}
		if(!isNullOrEmpty(endTime)){
			endTime=endTime.trim()+":00";
			condition.setEndTime(Time.valueOf(endTime));
		}
		if(!isNullOrEmpty(instructionMethod)){
			condition.setInstructionMethod(Integer.parseInt(instructionMethod.trim()));
		}
		if(!isNullOrEmpty(instructorId)){
			condition.setInstructorId(Integer.parseInt(instructorId.trim()));
		}
		if(!isNullOrEmpty(level)){
			condition.setLevel(Integer.parseInt(level.trim()));
		}
		if(!isNullOrEmpty(scheduleType)){
			condition.setScheduleType(Integer.parseInt(scheduleType.trim()));
		}
		if(!isNullOrEmpty(term)){
			condition.setTerm(Integer.parseInt(term.trim()));
		}
		if(!isNullOrEmpty(subId)){
			condition.setSubId(Integer.parseInt(subId.trim()));
		}
	}
	private Boolean isNullOrEmpty(String str) {
		return (str==null)||(str.trim().isEmpty());
	}
}
