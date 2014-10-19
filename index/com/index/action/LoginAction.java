package com.index.action;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.student.action.BaseAction;
import com.student.po.Student;
import com.student.service.StudentService;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/")
@Action(value="loginAction",results={
		@Result(name="index",type="redirectAction",location="indexAction"),
		@Result(name="loginUI",location="/WEB-INF/jsp/index/login.jsp"),
		@Result(name="registerUI",location="/WEB-INF/jsp/index/register.jsp"),
		@Result(name="loginout",location="/WEB-INF/jsp/loginAction/logout.jsp"),
})
public class LoginAction extends  BaseAction{
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService; 
	
	
	private Student student;
	private String meg;
	private String remberPwd;
	
	public String loginUI(){
		return "loginUI";
	}
	
	public String login(){
		
		Student s = studentService.login(student);
		//登陆成功 
		if(s!=null){
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("student", s);	//把用户信息添加到session中，跳转到主页面
			return "index";
		}
		//登陆失败
		meg = "error";
		return "loginUI";		//返回到登陆页面
	}
	
	
	
	
	
	public String registerUI(){
		return "registerUI";
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getMeg() {
		return meg;
	}

	public void setMeg(String meg) {
		this.meg = meg;
	}

	public String getRemberPwd() {
		return remberPwd;
	}

	public void setRemberPwd(String remberPwd) {
		this.remberPwd = remberPwd;
	}
	
	
	
}
