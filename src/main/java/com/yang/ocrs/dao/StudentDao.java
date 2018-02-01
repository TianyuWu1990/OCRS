package com.yang.ocrs.dao;

import java.util.List;

import com.yang.ocrs.po.Student;

public class StudentDao extends Dao {
	public Student getByStuID(String stuID) {
		List students = findByQuery("from Student where stuID=?",stuID);
		if(students.size()>0) {
			return (Student)students.get(0);
		} else {
			return null;
		}
	}
}
