package com.admin.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.boyi.base.BaseAction;
import com.boyi.po.Classes;
import com.boyi.po.Course;
import com.boyi.service.CourseServer;



@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/course")
@Action(value="courseAction",results={
		@Result(name="toIndex",type="redirectAction",location="courseAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/course/course.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/admin/addAdmin.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/admin/editAdmin.jsp"),
		
})
public class CourseAction  extends BaseAction{
	
	@Resource(name="courseServerImpl")
	private CourseServer courseServer;
	
	
	private List<Course> seniorlist;
	private List<Course> middlelist;
	private List<Course> primarylist;
	
	private int id;
	private String courseDetail;
	private Course course;
	
	
	public String execute() throws Exception {
		this.seniorlist = courseServer.findAllByGrade("高中");
		this.middlelist = courseServer.findAllByGrade("初中");
		this.primarylist = courseServer.findAllByGrade("小学");
		
		return "index";
	}

	@Override
	public String show() {
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			if(id!=0){
				this.course = courseServer.getById(id);
				response.setCharacterEncoding("utf-8");
				response.setContentType("application/json");
				String c = JSON.toJSONString(course);
				response.getWriter().println(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	@Override
	public String update() {
		
		Course c = courseServer.getById(id);
		c.setCourseDetail(courseDetail);
		courseServer.update(c);
		
		return null;
	}
	
	
	
	public CourseServer getCourseServer() {
		return courseServer;
	}

	public void setCourseServer(CourseServer courseServer) {
		this.courseServer = courseServer;
	}

	public List<Course> getSeniorlist() {
		return seniorlist;
	}

	public void setSeniorlist(List<Course> seniorlist) {
		this.seniorlist = seniorlist;
	}

	public List<Course> getMiddlelist() {
		return middlelist;
	}

	public void setMiddlelist(List<Course> middlelist) {
		this.middlelist = middlelist;
	}

	public List<Course> getPrimarylist() {
		return primarylist;
	}

	public void setPrimarylist(List<Course> primarylist) {
		this.primarylist = primarylist;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getCourseDetail() {
		return courseDetail;
	}

	public void setCourseDetail(String courseDetail) {
		this.courseDetail = courseDetail;
	}

	
	
}
