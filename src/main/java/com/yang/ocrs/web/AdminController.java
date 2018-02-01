package com.yang.ocrs.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yang.ocrs.dao.Dao;
import com.yang.ocrs.dao.UserDao;
import com.yang.ocrs.po.Course;
import com.yang.ocrs.po.Student;
import com.yang.ocrs.po.Subject;
import com.yang.ocrs.po.User;
import com.yang.ocrs.service.CourseInfoService;
import com.yang.ocrs.service.EmailService;
import com.yang.ocrs.service.StudentInfoService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	private StudentInfoService stuService;
	@Autowired
	private CourseInfoService courseService;
	@Autowired
	private EmailService emailService;
	
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
	//@RequestMapping(value="/addstu",method=RequestMethod.GET)
	public String showStuInfoForm(Student stu) {
		return "/admin/stuInfoForm";
	}
	@RequestMapping(value="/addstu",method=RequestMethod.POST)
	public @ResponseBody Map<String,String> addStuInfo(Model model,@Valid Student stu,BindingResult result){
		Map<String,String> res = new HashMap<String,String>();
		if(result.hasErrors()) {
			res.put("status", "error");
			return res;
		}
		String stuID=stuService.addStudent(stu);
		if(stuID!=null)
		{
			String emailSub="Please Register your student account";
			String emailText="Hello, "+stu.getName()+"!\n\nYou are added to the Online Course Registration System. Your Student ID is "+stuID+". You can register your student account now!";
			emailService.sendMail(stu.getEmail().trim(), emailSub, emailText);
			model.addAttribute("message", "The information of the student has been saved! The student ID is "+stuID);
			res.put("status", "OK");
			res.put("stuID", stuID);
		} else {
			res.put("status", "error");
			model.addAttribute("message","Something wrong happens when saving the student information!");
		}
		return res;
	}
	//@RequestMapping(value="/modstu",method=RequestMethod.GET)
	public String getStuID() {
		return "/admin/inputStuID";
	}
	@RequestMapping(value="/modstu", params="sid", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getStuID(@RequestParam(value="sid")String stuID,Model model) {
		Map<String,Object> res = new HashMap<String,Object>();
		stuID=stuID.trim();
		Student stu=stuService.getStudent(stuID);
		if(stu!=null) {
			model.addAttribute("student", stu);
			model.addAttribute("m",true);
			res.put("status", "OK");
			res.put("student", stu);
			return res;
		} else {
			model.addAttribute("message", "The Student ID does not exist");
			res.put("status", "error");
			return res;
		}
	}
	
	@RequestMapping(value="/modstu", method=RequestMethod.POST)
	public @ResponseBody Map<String,String> modifyStuInfo(Model model,@Valid Student stu,BindingResult result) {
		Map<String,String> res = new HashMap<String,String>();
		if(result.hasErrors()) {
			model.addAttribute("m", true);
			res.put("status", "error");
			return res;
		}
		stuService.update(stu);
		model.addAttribute("message", "The information of the student has been successfully updated!");
		System.out.println("Ajax modStu success!");
		res.put("status", "OK");
		return res;	
	}
	
	//@RequestMapping(value="/addcourse",method=RequestMethod.GET)
	public String showCourseInfoForm(Course course, Model model) {
		return "/admin/courseInfoForm";
	}
	@RequestMapping(value="/addcourse",method=RequestMethod.POST)
	public @ResponseBody Map<String,String> addCourseInfo(Model model,@Valid Course course,BindingResult result){
		Map<String,String> res = new HashMap<String,String>();
		if(result.hasErrors()) {
			res.put("status","error" );
			return res;
		}
		String courseNum=courseService.addCourse(course);
		if(courseNum!=null)
		{
			model.addAttribute("message", "The course information has been successfully saved! The course number is "+courseNum);
			res.put("status", "OK");
			res.put("courseNum", courseNum);
			
			System.out.println("Add Course Ajax success");
		} else {
			model.addAttribute("message","Something wrong happens when saving the course information!");
			res.put("status", "error");
			System.err.println("Add Course Ajax Fail");
		}
		return res;
	}
	//@RequestMapping(value="/modcourse",method=RequestMethod.GET)
	public String getCourseNum() {
		return "/admin/inputCourseNum";
	}
	@RequestMapping(value="/modcourse", params="cnum", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getCourseNum(@RequestParam(value="cnum")String courseNum, Model model) {
		Map<String,Object> res = new HashMap<String,Object>();
		courseNum=courseNum.trim();
		Course course=courseService.getCourse(courseNum);
		if(course!=null){
			model.addAttribute("course", course);
			model.addAttribute("m", true);
			res.put("status", "OK");
			res.put("course", course);
			return res;
		} else {
			model.addAttribute("message", "The Course Number does not exsit");
			res.put("status", "error");
			return res;
		}
	}
	@RequestMapping(value="/modcourse", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> modifyCourseInfo(Model model,@Valid Course course,BindingResult result) {
		Map<String,Object> res = new HashMap<String,Object>();
		if(result.hasErrors()) {
			model.addAttribute("m", true);
			res.put("status", "error");
			return res;
		}
		courseService.update(course);
		model.addAttribute("message","The course information has been successfully updated!");
		System.out.println("Ajax modCourse success!");
		res.put("status", "OK");
		return res;
	}
	
	@RequestMapping(value="/checkcnum", method=RequestMethod.GET,params="cnum")
	public @ResponseBody CheckResult checkCourseNum(@RequestParam(value="cnum") String courseNum){
		return courseService.checkCourseNum(courseNum);
	}
}
