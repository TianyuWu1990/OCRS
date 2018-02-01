package com.yang.ocrs.service;
import java.sql.Time;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ocrs.dao.CourseDao;
import com.yang.ocrs.dao.StudentDao;
import com.yang.ocrs.po.Course;
import com.yang.ocrs.po.Student;
import com.yang.ocrs.web.ConditionBean;

@Service("courseRegService")
public class CourseRegService {
	@Autowired
	StudentDao stuDao;
	@Autowired
	CourseDao courseDao;
	@Autowired
	EmailService emailService;
	
	private String createHql(ConditionBean condition){
		StringBuilder conditionStr= new StringBuilder();
		String courseName=condition.getCourseName();
		String courseNum=condition.getCourseNum();
		Integer creditMax=condition.getCreditMax();
		Integer creditMin=condition.getCreditMin();
		Time startTime=condition.getStartTime();
		Time endTime=condition.getEndTime();
		int instructionMethod =condition.getInstructionMethod();
		int instructorId=condition.getInstructorId();
		int term=condition.getTerm();
		int level=condition.getLevel();
		int scheduleType=condition.getScheduleType();
		int subId=condition.getSubId();	
		if(!courseName.isEmpty()){
			conditionStr.append("and courseName like '%"+courseName+"%' ");
		}
		if(!courseNum.isEmpty()) {
			conditionStr.append("and courseNum='"+courseNum+"' ");
		}
		if(creditMax!=null&&creditMin!=null) {
			conditionStr.append("and credit between "+creditMin+" and "+creditMax+" ");
		}
		if(startTime!=null) {
			conditionStr.append("and startTime='"+startTime+"' ");
		}
		if(endTime!=null) {
			conditionStr.append("and endTime='"+endTime+"' ");
		}
		if(instructionMethod!=0) {
			conditionStr.append("and instructionMethod="+instructionMethod+" ");
		}
		if(instructorId!=0){
			conditionStr.append("and instructor.id="+instructorId);
		}
		if(term!=0){
			conditionStr.append("and term="+term+" ");
		}
		if(level!=0) {
			conditionStr.append("and level="+level+" ");
		}
		if(scheduleType!=0) {
			conditionStr.append("and scheduleType="+scheduleType+" ");
		}
		if(subId!=0) {
			conditionStr.append("and sub.id="+subId+" ");
		}
		if (conditionStr.length()!=0) {
			conditionStr.replace(0, 3, "");
			return "from Course where" + conditionStr.toString();
		} else {
			return "from Course";
		}
	}
	
	public List getCourseList(ConditionBean condition) {
		String hqlStr=createHql(condition);
		return courseDao.findByQuery(hqlStr);
	}
	public String selfRegister(Student stu,String courseNum){
		Course course =courseDao.getByCourseNum(courseNum);
		if(stu.isHold()){
			return "You have holds. Hold reason:"+stu.getHoldReason();
		}
		if(course.getLevel()!=stu.getLevel()){
			return"Registration is not allowed! The course is not for your level.";
		}
		if(course.getNumStu()>=course.getMaxNum()){
			return "Registration is not allowed! The course is full.";
		}
		if(!course.getSub().equals(stu.getSub())) {
			if(!course.isOpenToOtherSub()){
				return "Registration is not allowed! The course is not open to students in other Subjects.";
			} else if (!course.getSub().getCol().equals(stu.getSub().getCol())&&!course.isOpenToOtherCol()) {
				return "Registration is not allowed! The course is not open to students in other College.";
			}
		}
		for(Course c :stu.getCourses()) {
			for(String day:c.getDays()){
				if(course.getDays().contains(day)){
					if(checkTimeConflict(course,c)){
						return "There is a time conflict with the course "+c.getCourseName();
					}
				}
			}
		}
		stu.getCourses().add(course);
		stuDao.update(stu);
		course.addNumStu();
		courseDao.update(course);
		return "You have registered the course successfully!";
	}
	
	private Boolean checkTimeConflict(Course course1, Course course2){
		Time s1 = course1.getStartTime();
		Time e1 = course1.getEndTime();
		Time s2 = course2.getStartTime();
		Time e2 =course2.getEndTime();
		return !(e1.before(s2)||e2.before(s1));
	}
	public String coordRegister(Student stu,String courseNum){
		Course course =courseDao.getByCourseNum(courseNum);
		for(Course c :stu.getCourses()) {
			for(String day:c.getDays()){
				if(course.getDays().contains(day)){
					if(checkTimeConflict(course,c)){
						return "There is a time conflict with the course "+c.getCourseName();
					}
				}
			}
		}
		stu.getCourses().add(course);
		stuDao.update(stu);
		course.addNumStu();
		courseDao.update(course);
		String emailSub=course.getCourseName()+" course registration done";
		String emailText="Hello, "+stu.getName()+". The course coordinator has registered the course "+course.getCourseName()+"for you!";
		emailService.sendMail(stu.getEmail(), emailSub, emailText);
		return "You registered the course successfully!";
	}
	public String dropCourse(Student stu,String courseNum) {
		Set<Course> registeredCourses=stu.getCourses();
		Boolean dropFlag=false;
		Course course=null;
		for(Course c:registeredCourses) {
			if(c.getCourseNum().equals(courseNum)) {
				course=c;
			}
		}
		dropFlag=registeredCourses.remove(course);
		if(dropFlag) {
			course.subNumStu();
			courseDao.update(course);
			stuDao.update(stu);
			return "The course has been dropped!";
		} else return "Error occurs when dropping the course. The course hasn't been dropped.";
	}
}
