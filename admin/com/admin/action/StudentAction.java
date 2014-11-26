package com.admin.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.po.Student;
import com.boyi.service.StudentService;



@Controller("studentStudentAction")
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/student")
@Action(value="studentAction",results={
		@Result(name="toIndex",type="redirectAction",location="studentAction"),
		@Result(name="index",location="/WEB-INF/jsp/admin/student/student.jsp"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/student/addStudent.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/student/editStudent.jsp"),
		
})
public class StudentAction  extends BaseAction{
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;	//注入student服务	studentServerImpl
	
	private List<Student> studentList;
	private Student student;
	private Integer id;
	
	private String meg;
	
	@Override
	public String execute() throws Exception {
		studentList = studentService.findAll();
		return "index";
	}
	
	@Override
	public String show() {
		student = studentService.getById(id);
		return super.show();
	}
	
	@Override
	public String add() {
		return "add";
	}
	
	@Override
	public String save() {
		try {
			studentService.save(student);
		} catch (Exception e) {
			meg="该管理员账号已经存在,请不要重复添加!";
			return "error";
		}
		return "toIndex";
	}
	
	@Override
	public String edit() {
		this.student = studentService.getById(id);
		
		return super.edit();
	}
	
	@Override
	public String update() {
		Student s = studentService.getById(student.getId());
		s.setName(student.getName());
		studentService.updata(s);
		return super.update();
	}
	
	@Override
	public String delete() {
		studentService.delete(id);
		return super.delete();
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public List<Student> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMeg() {
		return meg;
	}

	public void setMeg(String meg) {
		this.meg = meg;
	}
	
	

	
}
