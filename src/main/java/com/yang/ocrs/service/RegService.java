package com.yang.ocrs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ocrs.dao.StudentDao;
import com.yang.ocrs.dao.UserDao;
import com.yang.ocrs.po.Student;
import com.yang.ocrs.po.User;
import com.yang.ocrs.web.RegBean;

@Service("regService")
public class RegService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private StudentDao stuDao;
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public StudentDao getStuDao() {
		return stuDao;
	}
	public void setStuDao(StudentDao stuDao) {
		this.stuDao = stuDao;
	}
	
	public String regist(RegBean regBean){
		Student stu =stuDao.getByStuID(regBean.getStuID());
		if(userDao.getByUserName(regBean.getUserName())!=null) {
			return "This username has been used!";
		}
		if(stu==null) {
			return "This Student ID is invalid!";
		}
		if(!stu.getName().equals(regBean.getName())){
			return "The name is wrong!";
		}
		if(userDao.findByQuery("from User where stu.stuID=?", regBean.getStuID()).size()>0) {
			return "This Student ID has been associated with another username";
		}
		User user= new User(regBean.getUserName(),regBean.getPwd(),User.STUDENT);
		user.setStu(stu);
		userDao.save(user);
		return "Register Successfully!";
	}
	
	public boolean checkUserName(String userName){
		return userDao.getByUserName(userName)==null;
	}
	
	public boolean checkStuID(String stuID){
		return stuDao.getByStuID(stuID)!=null;
	}
}
