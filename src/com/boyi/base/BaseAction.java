package com.boyi.base;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
public class BaseAction extends ActionSupport{
	
	
	public String edit(){
		return "edit";
	}
	
	public String list(){
		return "list";
	}
	
	public String update(){
		return "toIndex";
	}
	
	public String add(){
		return "add";
	}
	
	public String save(){
		return "toIndex";
	}
	
	public String delete(){
		return "toIndex";
	}
	
	public String show(){
		return "show";
	}
}
