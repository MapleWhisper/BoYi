package com.index.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
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
@Namespace("/")
@Action(value="loginAction",results={
		@Result(name="index",type="redirectAction",location="indexAction"),
		@Result(name="toIndex",type="redirectAction",location="indexAction"),
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
			System.out.println(s.getPassword());
			return "index";
		}
		//登陆失败
		meg = "error";
		return "loginUI";		//返回到登陆页面
	}
	
	public String logout(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("student");	
		return "toIndex";		//返回到登陆页面
	}
	
	public String registerUI(){
		return "registerUI";
	}
	
	public String register(){
		try {
			studentService.save(student);
			//注册成功
			return "loginUI";
		} catch (Exception e) {
			//注册失败
			meg = "error";
			return "registerUI";		//返回到注册页面
		}

		
	}
	
	
	public void loginAjax(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Student s = studentService.login(student);
		//登陆成功 
		if(s!=null){
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("student", s);	//把用户信息添加到session中，跳转到主页面
			pw.println("success");
			pw.flush();
			return;
		}
		//登陆失败
		pw.println("error");
		pw.flush();
		return;
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
