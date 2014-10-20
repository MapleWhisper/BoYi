package com.boyi.base;

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
public class BaseAction extends ActionSupport{
	
	
	public String edit(){
		return "";
	}
	
	public String update(){
		return "";
	}
	
	public String add(){
		return "";
	}
	
	public String save(){
		return "";
	}
	
	public String delete(){
		return "";
	}
}
