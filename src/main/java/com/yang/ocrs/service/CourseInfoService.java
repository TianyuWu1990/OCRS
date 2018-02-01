package com.yang.ocrs.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yang.ocrs.dao.CourseDao;
import com.yang.ocrs.po.Course;
import com.yang.ocrs.po.Instructor;
import com.yang.ocrs.po.Subject;
import com.yang.ocrs.web.CheckResult;
@Service
public class CourseInfoService {
	@Autowired
	private CourseDao courseDao;
	public List getSubList() {
		return courseDao.findAll(Subject.class);
	}
	public List getInstructorList() {
		return courseDao.findAll(Instructor.class);
	}
	public Set getInstructionMethods(){
		InputStream in=getClass().getResourceAsStream("/instructionMethods.properties");
		Properties props=new Properties();
		try {
			props.load(in);
		} catch (IOException e) {

			e.printStackTrace();
		}
		Map<String,String> map=new HashMap<String,String>((Map)props);
		Set instructionMethods=map.entrySet();
		return instructionMethods;
	}
	
	public String getInstructionMethodName(String value){
		String key=null;
		Set<Entry<String,String>> instructionMethods= getInstructionMethods();
		for(Entry<String,String> entry:instructionMethods) {
			if(entry.getValue().equals(value)) {
				key = entry.getKey();
				break;
			}
		}
		return key;
	}
	
	public Set getScheduleTypes() {
		InputStream in=getClass().getResourceAsStream("/scheduleTypes.properties");
		Properties props=new Properties();
		try {
			props.load(in);
		} catch (IOException e) {

			e.printStackTrace();
		}
		Map<String,String> map=new HashMap<String,String>((Map)props);
		Set scheduleTypes=map.entrySet();
		return scheduleTypes;
	}
	public String getScheduleTypeName(String value){
		String key=null;
		Set<Entry<String,String>> scheduleTypes = getScheduleTypes();
		for(Entry<String,String> entry:scheduleTypes) {
			if(entry.getValue().equals(value)) {
				key = entry.getKey();
				break;
			}
		}
		return key;
	}
	
	public Set getTerms() {
		InputStream in=getClass().getResourceAsStream("/terms.xml");
		Properties props=new Properties();
		try {
			props.loadFromXML(in);
		} catch (IOException e) {

			e.printStackTrace();
		}
		Map<String,String> map=new HashMap<String,String>((Map)props);
		Set terms=map.entrySet();
		return terms;
	}
	public String getTermName(String value){
		String key=null;
		Set<Entry<String,String>> terms = getTerms();
		for(Entry<String,String> entry:terms) {
			if(entry.getValue().equals(value)) {
				key = entry.getKey();
				break;
			}
		}
		return key;
	}
	
	public String addCourse(Course course) {
		Subject sub=courseDao.getById(Subject.class, course.getSubId());
		course.setSub(sub);
		Instructor instr=courseDao.getById(Instructor.class, course.getInstructorId());
		course.setInstructor(instr);
		int courseAmount=courseDao.findByQuery("from Course where sub.id=?", course.getSubId()).size();
		String courseNum=Integer.toString(course.getSubId())+Integer.toString(courseAmount+1);
		course.setCourseNum(courseNum);
		int secNum=courseDao.findByQuery("from Course where courseName=?", course.getCourseName()).size()+1;
		course.setSecNum(secNum);
		if(courseDao.save(course)>0)
		return courseNum;
		else return null;
	}
	
	public Course getCourse(String courseNum){
		Course course= courseDao.getByCourseNum(courseNum);
		if(course!=null){
			course.setSubId(course.getSub().getId());
			course.setInstructorId(course.getInstructor().getId());
			return course;
		} else return null;
		
	}
	
	public CheckResult checkCourseNum(String courseNum){
		Course course =courseDao.getByCourseNum(courseNum);
		if (course!=null){
			return CheckResult.pass();
		} else {
			return CheckResult.notPass();
		}
	}
	
	public void update(Course course){
		Course pCourse=courseDao.getByCourseNum(course.getCourseNum());// the course in the database
		pCourse.setCourseName(course.getCourseName());
		pCourse.setCredit(course.getCredit());
		pCourse.setDays(course.getDays());
		pCourse.setEndTime(course.getEndTime());
		pCourse.setInstructionMethod(course.getInstructionMethod());
		Instructor instructor=courseDao.getById(Instructor.class, course.getInstructorId());
		pCourse.setInstructor(instructor);
		pCourse.setLevel(course.getLevel());
		pCourse.setLocation(course.getLocation());
		pCourse.setMaxNum(course.getMaxNum());
		pCourse.setOpenToOtherCol(course.isOpenToOtherCol());
		pCourse.setOpenToOtherSub(course.isOpenToOtherSub());
		pCourse.setScheduleType(course.getScheduleType());
		pCourse.setStartTime(course.getStartTime());
		pCourse.setCourseDesp(course.getCourseDesp());
		pCourse.setTerm(course.getTerm());
		Subject sub=courseDao.getById(Subject.class, course.getSubId());
		pCourse.setSub(sub);
		courseDao.update(pCourse);
	}
}
