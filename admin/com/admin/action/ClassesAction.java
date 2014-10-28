package com.admin.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/course")
@Action(value="courseAction",results={
		@Result(name="toIndex",type="redirectAction",location="courseAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/course/classes.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/admin/addAdmin.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/admin/editAdmin.jsp"),
		
})
public class ClassesAction {

}
