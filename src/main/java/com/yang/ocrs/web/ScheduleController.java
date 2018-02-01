package com.yang.ocrs.web;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yang.ocrs.po.Course;
import com.yang.ocrs.po.Student;
import com.yang.ocrs.po.User;
import com.yang.ocrs.service.ScheduleService;

@Controller
@RequestMapping(value="/student")
public class ScheduleController {
	@Autowired
	ScheduleService scheduleService;
	
	@RequestMapping(value="/showschedule")
	public String showSchedule(HttpSession session,Model model) {
		User user=(User)session.getAttribute("user");
		if(user!=null&&user.getUserType().equals(User.STUDENT)){
			Student stu =user.getStu();
			Map<String,ArrayList<Course>> schedule=scheduleService.getSchedule(stu);
			model.addAttribute("schedule",schedule);
			return "/student/viewSchedule";
		} else return "redirect:/login";
	}
}
