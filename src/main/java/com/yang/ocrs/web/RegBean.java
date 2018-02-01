package com.yang.ocrs.web;
import org.hibernate.validator.constraints.NotEmpty;
public class RegBean {
	@NotEmpty
	private String userName;
	@NotEmpty
	private String pwd;
	@NotEmpty
	private String stuID;
	@NotEmpty
	private String name;
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
	public String getStuID() {
		return stuID;
	}
	public void setStuID(String stuID) {
		this.stuID = stuID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
}
