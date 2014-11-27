package com.admin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.junit.Test;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;

@Controller("configAction")
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/config")
@Action(value="configAction",results={
		@Result(name="toIndex",type="redirectAction",location="configAction"),
		@Result(name="index",location="/WEB-INF/jsp/admin/config/config.jsp"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/config/addconfig.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/config/editconfig.jsp"),
		
})
public class ConfigAction extends BaseAction{
	
	private Properties sysPro;	//系统配置文件
	private File file;
	
	private String name;
	private String value;
	
	@Override
	public String execute() throws Exception {
		readProperties();
		return "index";
	}
	
	private  void readProperties(){
		String path = this.getClass().getClassLoader().getResource("system.properties").getPath();
		this.sysPro = new Properties();
		path = path.replace("%20", " ");
		this.file = new File(path);
		InputStream is;
		try {
			is = new FileInputStream(file);
			ServletContext application = ServletActionContext.getServletContext();
			this.sysPro.load(is);
			application.setAttribute("system", sysPro);
			
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void saveProperties(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			readProperties();
			this.sysPro.setProperty(name, value);
			
			OutputStream os = new FileOutputStream(file);
			sysPro.store(os, "lastedt change of the system config is" + name);
			os.close();
			response.getWriter().println("success");
			
		} catch (Exception e) {
			try {
				response.getWriter().println("error");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
}
