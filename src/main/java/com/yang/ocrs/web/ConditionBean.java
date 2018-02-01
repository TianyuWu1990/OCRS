package com.yang.ocrs.web;

import java.sql.Time;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.yang.ocrs.po.Instructor;
import com.yang.ocrs.po.Subject;

public class ConditionBean {
	private String courseNum="";
	private int term;
	private String courseName="";
	private int subId;
	private int instructorId;
	private int level;
	private Integer creditMin;
	private Integer creditMax;
	private int instructionMethod;
	private int scheduleType;
	private Time startTime;
	private Time endTime;
	public String getCourseNum() {
		return courseNum;
	}
	public void setCourseNum(String courseNum) {
		this.courseNum = courseNum;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public int getSubId() {
		return subId;
	}
	public void setSubId(int subId) {
		this.subId = subId;
	}
	public int getInstructorId() {
		return instructorId;
	}
	public void setInstructorId(int instructorId) {
		this.instructorId = instructorId;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public Integer getCreditMin() {
		return creditMin;
	}
	public void setCreditMin(Integer creditMin) {
		this.creditMin = creditMin;
	}
	public Integer getCreditMax() {
		return creditMax;
	}
	public void setCreditMax(Integer creditMax) {
		this.creditMax = creditMax;
	}
	public int getInstructionMethod() {
		return instructionMethod;
	}
	public void setInstructionMethod(int instructionMethod) {
		this.instructionMethod = instructionMethod;
	}
	public int getScheduleType() {
		return scheduleType;
	}
	public void setScheduleType(int scheduleType) {
		this.scheduleType = scheduleType;
	}
	public Time getStartTime() {
		return startTime;
	}
	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}
	public Time getEndTime() {
		return endTime;
	}
	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}
	
	
	
}
