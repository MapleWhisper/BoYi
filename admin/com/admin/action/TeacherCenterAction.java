package com.admin.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.po.Classes;
import com.boyi.po.Teacher;
import com.boyi.service.ClassesServer;
import com.boyi.service.TeacherServer;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/teacherCenter")
@Action(value="teacherCenterAction",results={
		@Result(name="toIndex",type="redirectAction",location="teacherCenterAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/teacherCenter/teacherCenter.jsp"),
		@Result(name="showClasses",location="/WEB-INF/jsp/admin/teacherCenter/showClasses.jsp"),
		
})
public class TeacherCenterAction  extends BaseAction{
	@Resource(name="teacherServerImpl")
	private TeacherServer teacherServer;
	
	@Resource(name="classesServerImpl")
	private ClassesServer classesServer;
	
	private List<Teacher> teacherList;
	
	private Teacher teacher;
	private Classes classes;
	
	
	private Integer id;
	@Override
	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		this.teacher = (Teacher) session.getAttribute("teacher");
		//临时代码
		if(teacher ==null ){
			teacher = new Teacher();
			teacher.setId(1);
		}
		//临时代码
		this.teacher = teacherServer.getById(teacher.getId());
		
		return "index";
	}
	
	public String showClasses(){
		this.classes = classesServer.getById(id);
		return "showClasses";
	}
	

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TeacherServer getTeacherServer() {
		return teacherServer;
	}

	public void setTeacherServer(TeacherServer teacherServer) {
		this.teacherServer = teacherServer;
	}

	public List<Teacher> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<Teacher> teacherList) {
		this.teacherList = teacherList;
	}


	public ClassesServer getClassesServer() {
		return classesServer;
	}


	public void setClassesServer(ClassesServer classesServer) {
		this.classesServer = classesServer;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	
	
	
	
}
