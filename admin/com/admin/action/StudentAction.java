package com.admin.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.po.Student;
import com.boyi.service.StudentService;
import com.boyi.utils.Page;



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
	
	@Value("${page.studentAmountPerPage}")
	private Integer studentAmountPerPage;	//每页显示多少学生
	
	private List<Student> studentList;
	private Student student;
	private Integer id;
	
	private String meg;
	private Page page;
	private Integer cur;
	
	@Override
	public String execute() throws Exception {
		this.page = new Page();
		page.setAmount(studentAmountPerPage);
		if(cur ==null){
			cur =1;
		}
		page.setCur(cur);
		studentList = studentService.findAll(page);
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
		Student s = studentService.getById(id);
		s.setName(student.getName());
		s.setAddress(student.getAddress());
		s.setAge(student.getAge());
		s.setCity(student.getCity());
		s.setEmail(student.getEmail());
		s.setIdNumber(student.getIdNumber());
		s.setParentName(student.getParentName());
		s.setParentPhoneNumber(student.getParentPhoneNumber());
		s.setPassword(student.getPassword());
		s.setPhoneNumber(student.getPhoneNumber());
		s.setSex(student.getSex());
		s.setStudentId(student.getStudentId());
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

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Integer getCur() {
		return cur;
	}

	public void setCur(Integer cur) {
		this.cur = cur;
	}

	public Integer getStudentAmountPerPage() {
		return studentAmountPerPage;
	}

	public void setStudentAmountPerPage(Integer studentAmountPerPage) {
		this.studentAmountPerPage = studentAmountPerPage;
	}
	
	

	
}
