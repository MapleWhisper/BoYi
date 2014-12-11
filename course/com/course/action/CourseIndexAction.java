package com.course.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.enmu.ClassApplyStatus;
import com.boyi.po.Article;
import com.boyi.po.ClassApply;
import com.boyi.po.Classes;
import com.boyi.po.Student;
import com.boyi.po.Teacher;
import com.boyi.service.ArticleService;
import com.boyi.service.ClassApplyService;
import com.boyi.service.ClassesServer;
import com.boyi.service.TeacherServer;
import com.boyi.utils.Page;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/course")
@Action(value="indexAction",results={
		@Result(name="toIndex",type="redirectAction",location="indexAction"),
		@Result(name="login",type="redirectAction",location="/loginAction!loginUI"),
		@Result(name="index",location="/WEB-INF/jsp/course/index.jsp"),
		
		@Result(name="showClass",location="/WEB-INF/jsp/course/showClass.jsp"),
		@Result(name="showTeacher",location="/WEB-INF/jsp/course/showTeacher.jsp")
})
public class CourseIndexAction extends BaseAction{
	
	@Resource(name="classesServerImpl")
	private ClassesServer classesServer;
	
	@Resource(name="articleSerivceImpl")
	private ArticleService articleService;
	
	@Resource(name="classApplyServiceImpl")
	private ClassApplyService classApplyService;
	
	@Resource(name="teacherServerImpl")
	private TeacherServer teacherServer;
	
	
	@Value("${page.classesIndexAmountPerPage}")
	private Integer classesIndexAmountPerPage;
	
	private List<Classes> classesList;
	private List<Article> articleList;
	private List<Teacher> teacherList;
	private Classes classes;
	private Teacher teacher;
	private int id;
	
	private String grade;
	private String subject;
	private String sort;
	
	private Integer cur;
	private Page page;
	
	/**
	 * 显示选课主页
	 */
	@Override
	public String execute() throws Exception {
		//检查传入参数
		this.checkCondition();
		
		this.page = new Page();
		page.setAmount(classesIndexAmountPerPage);
		page.setCur(cur);
		this.classesList = classesServer.findIndexAll(grade, subject, sort, page);
		this.articleList = articleService.findDownLoadAll();
		this.teacherList = teacherServer.findRecommand();
		
		return "index";
	}
	
	/**
	 * 检查传入查询参数，并处理
	 */
	private void checkCondition(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(cur != null){
			this.grade = (String) session.getAttribute("grade");
			this.subject = (String) session.getAttribute("subject");
			this.sort = (String) session.getAttribute("sort");
			return;
		}
		if(sort != null){
			this.grade = (String) session.getAttribute("grade");
			this.subject = (String) session.getAttribute("subject");
			session.setAttribute("sort", sort);
			if(cur == null){
				cur = 1;
			}
			return;
		}
		if(grade == null ){
			grade = "";
		}
		if(subject == null){
			subject = "";
		}
		if(sort == null){
			sort = "不限";
		}
		
		session.setAttribute("grade", grade);
		session.setAttribute("subject", subject);
		session.setAttribute("sort", sort);
		
		if(cur == null){
			cur = 1;
		}
		return;
	}
	
	/**
	 * 显示课程详情
	 * @return
	 */
	public String  showClass(){
		this.classes = classesServer.getById(id);
		if(classes==null){
			return "toIndex";
		}
		this.teacherList= teacherServer.findRecommand();
		return "showClass";
	}
		
	public String showTeacher(){
		this.teacher = teacherServer.getById(id);
		this.teacherList = teacherServer.findRecommand();
		return "showTeacher";
	}
	
	/**
	 * 学生申请课程
	 */
	public void applyClass(){
		classes  = classesServer.getById(id);
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		Student stu  = (Student) session.getAttribute("student");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			if(stu==null){
				pw.println("login");
				pw.close();
				return;
			}
			
			
			ClassApply classApply = new ClassApply();
			classApply.setStudent(stu);
			classApply.setClasses(classes);
			classApply.setApplyDate(new Date());
			classApply.setStatus(ClassApplyStatus.待确认.toString());
			classApplyService.save(classApply);
			pw.println("success");
			pw.close();
			return;
			
		} catch (Exception e) {
			pw.println("error");
			pw.close();
			return;
		}
		
	
	}
	
	public ClassesServer getClassesServer() {
		return classesServer;
	}

	public void setClassesServer(ClassesServer classesServer) {
		this.classesServer = classesServer;
	}

	public List<Classes> getClassesList() {
		return classesList;
	}

	public void setClassesList(List<Classes> classesList) {
		this.classesList = classesList;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}




	public ArticleService getArticleService() {
		return articleService;
	}




	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}




	public List<Article> getArticleList() {
		return articleList;
	}




	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}




	public String getGrade() {
		return grade;
	}




	public void setGrade(String grade) {
		this.grade = grade;
	}




	public String getSubject() {
		return subject;
	}




	public void setSubject(String subject) {
		this.subject = subject;
	}




	public String getSort() {
		return sort;
	}




	public void setSort(String sort) {
		this.sort = sort;
	}

	public Integer getCur() {
		return cur;
	}

	public void setCur(Integer cur) {
		this.cur = cur;
	}

	public Integer getClassesIndexAmountPerPage() {
		return classesIndexAmountPerPage;
	}

	public void setClassesIndexAmountPerPage(Integer classesIndexAmountPerPage) {
		this.classesIndexAmountPerPage = classesIndexAmountPerPage;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public ClassApplyService getClassApplyService() {
		return classApplyService;
	}

	public void setClassApplyService(ClassApplyService classApplyService) {
		this.classApplyService = classApplyService;
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

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	
}
