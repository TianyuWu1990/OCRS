package com.yang.ocrs.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yang.ocrs.dao.UserDao;
import com.yang.ocrs.po.User;
import com.yang.ocrs.service.CourseInfoService;
import com.yang.ocrs.service.StudentInfoService;
import com.yang.ocrs.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private StudentInfoService stuService;
	@Autowired
	private CourseInfoService courseService;
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
	@RequestMapping(value="/login")
	public String login(HttpSession session,Model model) {
		
		UserDetails userDetails=(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userDetails!=null){
			String userName=userDetails.getUsername();
			User user=userDao.getByUserName(userName);
			session.setAttribute("user", user);
			String userType=user.getUserType();
			if(userType.equals(User.STUDENT)) {
				return "/student/stuWelcome";
			}
			else if(userType.equals(User.COORDINATOR)) {
				return "redirect:/course/coursesearch";
			}
			else if(userType.equals(User.ADMINISTRATOR)) {
				return "/admin/admin";
			} else return "redirect:login.jsp";	
		} else return "redirect:login.jsp";
		
	}
	
}
