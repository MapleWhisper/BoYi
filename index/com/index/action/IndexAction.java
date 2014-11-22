package com.index.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

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
	@Override
	public String execute() throws Exception {
		return "index";
	}
}
