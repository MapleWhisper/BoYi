package com.admin.action;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.enmu.ClassApplyStatus;
import com.boyi.enmu.ClassesStatus;
import com.boyi.po.ClassApply;
import com.boyi.po.Classes;
import com.boyi.po.Course;
import com.boyi.po.Student;
import com.boyi.po.Teacher;
import com.boyi.service.ClassApplyService;
import com.boyi.service.ClassesServer;
import com.boyi.service.CourseServer;
import com.boyi.service.StudentService;
import com.boyi.service.TeacherServer;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/classes")
@Action(value="classesAction",results={
		@Result(name="toIndex",type="redirectAction",location="classesAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/classes/classes.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/classes/addClasses.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/classes/editClasses.jsp"),
		@Result(name="show",location="/WEB-INF/jsp/admin/classes/showClasses.jsp"),
		
})
public class ClassesAction extends BaseAction{
	
	@Resource(name="classesServerImpl")
	private ClassesServer classesServer;
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;
	
	@Resource(name="teacherServerImpl")
	private TeacherServer teacherServer;
	
	@Resource(name="courseServerImpl")
	private CourseServer courseServer;
	
	private List<Teacher> teacherList;
	private List<Course> courseList;
	private List<Classes> classesList;
	
	@Resource(name="classApplyServiceImpl")
	private ClassApplyService classApplyService;
	
	
	private Classes classes;
	
	private Integer teacherId;
	private Integer courseId;
	private String status;
	private Integer id;
	
	
	
	@Override
	public String execute() throws Exception {
		
		if(status ==null){
			this.status = "未开始";
		}
		this.classesList = classesServer.findAllByStatus(status);
		return "index";
	}
	
	@Override
	public String add() {
		this.teacherList = teacherServer.findAll();
		this.courseList = courseServer.findAll();
		
		return super.add();
	}
	
	@Override
	public String save() {
		Teacher t = teacherServer.getById(teacherId);
		Course c = courseServer.getById(courseId);
		this.classes.setTeacher(t);
		this.classes.setCourse(c);
		
		if(new Date().getTime() < classes.getBeginDate().getTime()){
			classes.setStatus(ClassesStatus.未开始.toString());
		}else if(new Date().getTime() < classes.getEndDate().getTime()){
			classes.setStatus(ClassesStatus.在读.toString());
		}else{
			classes.setStatus(ClassesStatus.已结束.toString());
		}
		classesServer.save(classes);
		return "toIndex";
	}
	
	@Override
	public String edit() {
		this.classes = classesServer.getById(id);
		
		this.courseId  = classes.getCourse().getId();
		this.teacherId = classes.getTeacher().getId();
		
		this.teacherList = teacherServer.findAll();
		this.courseList = courseServer.findAll();
		return "edit";
	}
	
	@Override
	public String update() {
		Classes c = classesServer.getById(id);
		c.setName(classes.getName());
		c.setBeginDate(classes.getBeginDate());
		c.setEndDate(classes.getEndDate());
		c.setClassDetail(classes.getClassDetail());
		c.setClassPlace(classes.getClassPlace());
		c.setClassPrice(classes.getClassPrice());
		c.setClassTime(classes.getClassTime());
		c.setClassType(classes.getClassType());
		c.setStudentNumer(classes.getStudentNumer());
		c.setRecommand(classes.isRecommand());
		Teacher t = teacherServer.getById(teacherId);
		Course c1 = courseServer.getById(courseId);
		c.setTeacher(t);
		c.setCourse(c1);
		
		if(new Date().getTime() < classes.getBeginDate().getTime()){
			classes.setStatus(ClassesStatus.未开始.toString());
		}else if(new Date().getTime() < classes.getEndDate().getTime()){
			classes.setStatus(ClassesStatus.在读.toString());
		}else{
			classes.setStatus(ClassesStatus.已结束.toString());
		}
		classesServer.updata(c);
		return super.update();
	}
	
	
	@Override
	public String show() {
		classes = classesServer.getById(id);
		return super.show();
	}
	
	
	public String accept(){
		ClassApply apply = classApplyService.getById(id);
		if(!apply.getStatus().equals("待确认")){
			return "toIndex";
		}
		apply.setStatus(ClassApplyStatus.已完成.toString());
		
		
		//把学生加入班级
		Classes classes = apply.getClasses();
		classes.getStudents().add(apply.getStudent());
		Student stu = apply.getStudent();
		stu.getClasses().add(apply.getClasses());
		
		classesServer.updata(classes);
		studentService.updata(stu);
		classApplyService.updata(apply);
		
		return "toIndex";
	}
	
	public String refuse(){
		ClassApply apply = classApplyService.getById(id);
		if(!apply.getStatus().equals("待确认")){
			return "toIndex";
		}
		apply.setStatus(ClassApplyStatus.已拒绝.toString());
		classApplyService.updata(apply);
		return "toIndex";
	}
	
	
	
	
	public ClassesServer getClassesServer() {
		return classesServer;
	}

	public void setClassesServer(ClassesServer classesServer) {
		this.classesServer = classesServer;
	}

	public TeacherServer getTeacherServer() {
		return teacherServer;
	}

	public void setTeacherServer(TeacherServer teacherServer) {
		this.teacherServer = teacherServer;
	}

	public CourseServer getCourseServer() {
		return courseServer;
	}

	public void setCourseServer(CourseServer courseServer) {
		this.courseServer = courseServer;
	}

	
	public List<Teacher> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<Teacher> teacherList) {
		this.teacherList = teacherList;
	}

	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public List<Classes> getClassesList() {
		return classesList;
	}

	public void setClassesList(List<Classes> classesList) {
		this.classesList = classesList;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
	
	
	
}
