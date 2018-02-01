package com.yang.ocrs.dao;

import java.util.List;

import com.yang.ocrs.po.Course;
import com.yang.ocrs.po.Student;

public class CourseDao extends Dao {
	public Course getByCourseNum(String courseNum) {
		List courses = findByQuery("from Course where courseNum=?",courseNum);
		if(courses.size()>0) {
			return (Course)courses.get(0);
		} else {
			return null;
		}
	}
}
