package com.course.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/course")
@Action(value="indexAction",results={
		@Result(name="toIndex",type="redirectAction",location="indexAction"),
		@Result(name="index",location="/WEB-INF/jsp/course/index.jsp")
})
public class CourseIndexAction extends BaseAction{
	@Override
	public String execute() throws Exception {
		return "index";
	}
}
