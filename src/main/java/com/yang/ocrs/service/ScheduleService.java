package com.yang.ocrs.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.yang.ocrs.po.Course;
import com.yang.ocrs.po.Student;

enum Day {
	Mon,Tue,Wed,Thu,Fri,Sat,Sun;
}

@Service
public class ScheduleService {
	
	public Map<String,ArrayList<Course>> getSchedule(Student stu){
		Map<String,ArrayList<Course>> schedule= new HashMap<String,ArrayList<Course>>();
		for(Day day:Day.values()) {
			schedule.put(day.toString(), new ArrayList<Course>());
		}
		Set<Course> courses=stu.getCourses();
		for(Course c:courses){
			Set<String> days=c.getDays();
			for(Day day:Day.values()){
				if(days.contains(day.toString())) {
					schedule.get(day.toString()).add(c);
				}
			}
		}
		for(ArrayList<Course> al:schedule.values()){
			Collections.sort(al);
		}
		return schedule;
	}
}
