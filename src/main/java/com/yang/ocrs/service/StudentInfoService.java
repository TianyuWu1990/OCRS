package com.yang.ocrs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ocrs.dao.StudentDao;
import com.yang.ocrs.po.Student;
import com.yang.ocrs.po.Subject;

@Service
public class StudentInfoService {
	@Autowired
	private StudentDao stuDao;
	public List getSubList() {
		return stuDao.findAll(Subject.class);
	}
	
	public String addStudent(Student stu) {
		Subject sub=stuDao.getById(Subject.class, stu.getSubId());
		stu.setSub(sub);
		int stuAmount=stuDao.findByQuery("from Student where sub.id=?", stu.getSubId()).size();
		String stuID=Integer.toString(stu.getStartYear())+Integer.toString(stu.getSubId())+Integer.toString(stuAmount+1);
		stu.setStuID(stuID);
		if(stuDao.save(stu)>0){
			return stuID;
		} else return null;
	}
	
	public Student getStudent(String stuID){
		Student stu= stuDao.getByStuID(stuID);
		if(stu!=null){
			stu.setSubId(stu.getSub().getId());
			return stu;
		} else {
			return null;
		}
	}
	
	public void update(Student stu){
		Student pStu=stuDao.getByStuID(stu.getStuID());// the student in the database
		pStu.setName(stu.getName());
		pStu.setEmail(stu.getEmail());
		pStu.setHold(stu.isHold());
		pStu.setHoldReason(stu.getHoldReason());
		Subject sub=stuDao.getById(Subject.class, stu.getSubId());
		pStu.setSub(sub);
		stuDao.update(pStu);
	}
}
