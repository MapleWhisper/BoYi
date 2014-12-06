package com.admin.action;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.po.Student;
import com.boyi.po.StudentAccount;
import com.boyi.po.StudentResume;
import com.boyi.service.StudentAccountService;
import com.boyi.service.StudentService;
import com.boyi.utils.Page;



@Controller("studentStudentAction")
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/student")
@Action(value="studentAction",results={
		@Result(name="toIndex",type="redirectAction",location="studentAction"),
		@Result(name="toShow",type="redirectAction",location="studentAction!show"),
		@Result(name="index",location="/WEB-INF/jsp/admin/student/student.jsp"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/student/addStudent.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/student/editStudent.jsp"),
		@Result(name="show",location="/WEB-INF/jsp/admin/student/showStudent.jsp"),
		
})
public class StudentAction  extends BaseAction{
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;	//注入student服务	studentServerImpl
	
	@Resource(name="studentAccountServiceImpl")
	private StudentAccountService studentAccountService;
	
	@Value("${page.studentAmountPerPage}")
	private Integer studentAmountPerPage;	//每页显示多少学生
	
	
	private List<Student> studentList;
	private Student student;
	private StudentAccount account;
	private StudentResume resume;
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
		if(id==null){
			id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("stuId");
		}
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
			e.printStackTrace();
			meg="该账号已经存在,请不要重复添加!";
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
		s.setSchool(student.getSchool());
		s.setSchoolTime(student.getSchoolTime());
		s.setAge(student.getAge());
		s.setCity(student.getCity());
		s.setEmail(student.getEmail());
		s.setIdNumber(student.getIdNumber());
		s.setParentName(student.getParentName());
		s.setParentPhoneNumber(student.getParentPhoneNumber());
		s.setPassword(student.getPassword());
		s.setPhoneNumber(student.getPhoneNumber());
		s.setSex(student.getSex());
		studentService.update(s);
		return super.update();
	}
	
	@Override
	public String delete() {
		studentService.delete(id);
		return super.delete();
	}
	
	/**
	 * 
	 * 学生存款
	 * @return
	 */
	public String pay() {
		Student stu = studentService.getById(id);
		
		if(resume.getAmount()==null || resume.getAmount()<=0 || resume.getNote()==null || stu==null){
			setMeg("充值失败!<br>可能原因:<br>1.充值金额为空或者为负数<br>2.备注为空<br>");
			return "error";
		}
		ServletActionContext.getRequest().getSession().setAttribute("stuId", id);
		studentAccountService.add(resume, stu);
		return "toShow";
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

	public StudentAccount getAccount() {
		return account;
	}

	public void setAccount(StudentAccount account) {
		this.account = account;
	}

	public StudentResume getResume() {
		return resume;
	}

	public void setResume(StudentResume resume) {
		this.resume = resume;
	}
	
	

	
}
