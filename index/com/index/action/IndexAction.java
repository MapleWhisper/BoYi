package com.index.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.po.Article;
import com.boyi.po.Classes;
import com.boyi.po.Student;
import com.boyi.po.Teacher;
import com.boyi.service.ArticleService;
import com.boyi.service.ClassesServer;
import com.boyi.service.StudentService;
import com.boyi.service.TeacherServer;
import com.opensymphony.xwork2.ActionSupport;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/")
@Action(value="indexAction",results={
		@Result(name="toIndex",type="redirectAction",location="indexAction"),
		@Result(name="loginUI",location="/WEB-INF/jsp/loginAction/loginUI.jsp"),
		@Result(name="loginout",location="/WEB-INF/jsp/loginAction/logout.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/index/index.jsp")
})
public class IndexAction extends ActionSupport{
	@Resource(name="studentServiceImpl")
	private StudentService  studentService;

	@Resource(name="teacherServerImpl")
	private TeacherServer teacherServer;

	@Resource(name="classesServerImpl")
	private ClassesServer  classesServer ;

	@Resource(name="articleSerivceImpl")
	private ArticleService  articleService ;


	private Student s;
	private List<Classes> clist;
	private List<Teacher> tlist;
	private List<Article> alist;





	/**
	 * 显示主页
	 */
	public String execute() {
		//推荐课程
		clist=classesServer.findRecommand();
		
		//推荐教师
		tlist=teacherServer.findRecommand();
		
		//新闻列表
		alist=  articleService.findNewsAll() ;
		return "index";
	}

	public String login(){
		return "";
	}



	public Student getS() {
		return s;
	}

	public void setS(Student s) {
		this.s = s;
	}


	public List<Classes> getClist() {
		return clist;
	}


	public void setClist(List<Classes> clist) {
		this.clist = clist;
	}


	public List<Teacher> getTlist() {
		return tlist;
	}


	public void setTlist(List<Teacher> tlist) {
		this.tlist = tlist;
	}


	public List<Article> getAlist() {
		return alist;
	}


	public void setAlist(List<Article> alist) {
		this.alist = alist;
	}

	
}
