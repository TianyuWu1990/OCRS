package com.yang.ocrs.po;

import java.sql.Time;
import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class Course implements Comparable<Course> {
	private Integer id;
	private String courseNum;
	@NotNull
	private Integer term;
	@NotEmpty
	private String courseName;
	private int secNum;
	private String courseDesp;
	private Subject sub;
	private Instructor instructor;
	@NotNull
	private Integer level;
	@NotNull
	private Integer credit;
	private int instructionMethod;
	private int scheduleType;
	@NotNull
	private Time startTime;
	@NotNull
	private Time endTime;
	@NotNull
	private Set<String> days=new HashSet();
	private boolean openToOtherSub;
	private boolean openToOtherCol;
	@NotEmpty
	private String location;
	//@Min(value=10)
	private int maxNum;
	private int numStu;
	private int subId;
	private int instructorId;
	
	public int getInstructorId() {
		return instructorId;
	}
	public void setInstructorId(int instructorId) {
		this.instructorId = instructorId;
	}
	public int getSubId() {
		return subId;
	}
	public void setSubId(int subId) {
		this.subId = subId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public int getNumStu() {
		return numStu;
	}
	public void setNumStu(int numStu) {
		this.numStu = numStu;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCourseNum() {
		return courseNum;
	}
	public void setCourseNum(String courseNum) {
		this.courseNum = courseNum;
	}
	public Integer getTerm() {
		return term;
	}
	public void setTerm(Integer term) {
		this.term = term;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public int getSecNum() {
		return secNum;
	}
	public void setSecNum(int secNum) {
		this.secNum = secNum;
	}
	public String getCourseDesp() {
		return courseDesp;
	}
	public void setCourseDesp(String courseDesp) {
		this.courseDesp = courseDesp;
	}
	public Subject getSub() {
		return sub;
	}
	public void setSub(Subject sub) {
		this.sub = sub;
	}
	public Instructor getInstructor() {
		return instructor;
	}
	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getCredit() {
		return credit;
	}
	public void setCredit(Integer credit) {
		this.credit = credit;
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
	public Set<String> getDays() {
		return days;
	}
	public void setDays(Set<String> days) {
		this.days =days;
	}
	public boolean isOpenToOtherSub() {
		return openToOtherSub;
	}
	public void setOpenToOtherSub(boolean openToOtherSub) {
		this.openToOtherSub = openToOtherSub;
		if(!openToOtherSub) {
			setOpenToOtherCol(false);
		}
	}
	public boolean isOpenToOtherCol() {
		return openToOtherCol;
	}
	public void setOpenToOtherCol(boolean openToOtherCol) {
		this.openToOtherCol = openToOtherCol;
		if(openToOtherCol) {
			setOpenToOtherSub(true);
		}
	}
	public void addNumStu(){
		numStu++;
	}
	public void subNumStu() {
		numStu--;
	}
	@Override
	public int compareTo(Course o) {
		if(o.getClass()!=this.getClass()){
			throw new ClassCastException("Can't compare!");
		}
		if(this.startTime.before(o.getStartTime())){ 
			return -1;
		} else return 1;
	}
	
}
