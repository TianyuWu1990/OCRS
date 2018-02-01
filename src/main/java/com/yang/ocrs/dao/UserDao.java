package com.yang.ocrs.dao;
import java.util.List;

import com.yang.ocrs.po.User;
import org.springframework.orm.hibernate3.support.*;

public class UserDao extends Dao {
	
	public User getByUserName(String userName) {
		List users = findByQuery("from User where userName=?",userName);
		if(users.size()>0) {
			return (User)users.get(0);
		} else {
			return null;
		}
	}
	
}
