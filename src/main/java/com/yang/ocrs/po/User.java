package com.yang.ocrs.po;

public class User {
	private String userName;
	private String pwd;
	private String userType;
	private Integer id;
	private Student stu;
	public static final String STUDENT="ROLE_STU";
	public static final String ADMINISTRATOR="ROLE_ADMIN";
	public static final String COORDINATOR="ROLE_CORD";
	
	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public User() {
		
	}
	
	public User(String userName, String userPassword, String userType) {
		this.userName = userName;
		this.pwd = userPassword;
		this.userType = userType;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	
}
