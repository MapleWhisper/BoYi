package com.admin.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.service.ClassesServer;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/classes")
@Action(value="classesAction",results={
		@Result(name="toIndex",type="redirectAction",location="classesAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/classes/classes.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/classes/addClasses.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/admin/editAdmin.jsp"),
		
})
public class ClassesAction extends BaseAction{
	
	@Resource(name="classesServerImpl")
	private ClassesServer classesServer;
	
	
	
	@Override
	public String execute() throws Exception {
		
		return "index";
	}
	
	@Override
	public String add() {
		return super.add();
	}
	
	
	
	
}
