package com.yang.ocrs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ocrs.dao.UserDao;
import com.yang.ocrs.po.User;


@Service("userSevice")
public class UserService {
	
	@Autowired
	private UserDao dao;

	public UserDao getDao() {
		return dao;
	}

	
	public void setDao(UserDao dao) {
		this.dao = dao;
	}
	
	public int saveUser(String userName, String password, String type) {
		User user = new User(userName, password, type);
		return dao.save(user);
	}
	
	public boolean login(User user){
		return dao.isExsiting(user);
	}
}
