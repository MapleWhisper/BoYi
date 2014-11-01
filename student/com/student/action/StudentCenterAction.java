package com.student.action;

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
import com.boyi.po.Student;
import com.boyi.service.StudentService;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/student")
@Action(value="studentCenterAction",results={
		@Result(name="index",type="redirectAction",location="indexAction"),
		@Result(name="studentCenter",location="/WEB-INF/jsp/student/studentCenter.jsp"),
})
public class StudentCenterAction extends BaseAction{
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService; 
	
	private Student student;
	@Override
	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		Student stu = (Student) session.getAttribute("student");
		Student student = studentService.getById(stu.getId());
		
		return "studentCenter";
	}
}
