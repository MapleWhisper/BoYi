package com.admin.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.admin.server.AdminServer;
import com.boyi.base.BaseAction;
import com.boyi.po.Admin;



@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/admin")
@Action(value="adminAction",results={
		@Result(name="toIndex",type="redirectAction",location="admin/index"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/admin/admin.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/admin/addAdmin.jsp"),
		
})
public class AdminAction  extends BaseAction{
	@Resource(name="adminServerImpl")
	private AdminServer adminServer;	//注入admin服务	adminServerImpl
	
	private List<Admin> adminList;
	private Admin admin;
	private String meg;
	
	@Override
	public String execute() throws Exception {
		adminList = adminServer.findAll();
		return "index";
	}

	@Override
	public String add() {
		return "add";
	}
	
	@Override
	public String save() {
		try {
			adminServer.save(admin);
		} catch (Exception e) {
			meg="该管理员账号已经存在,请不要重复添加!";
			return "error";
		}
		return "toIndex";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public AdminServer getAdminServer() {
		return adminServer;
	}

	public void setAdminServer(AdminServer adminServer) {
		this.adminServer = adminServer;
	}

	public List<Admin> getAdminList() {
		return adminList;
	}

	public void setAdminList(List<Admin> adminList) {
		this.adminList = adminList;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public String getMeg() {
		return meg;
	}

	public void setMeg(String meg) {
		this.meg = meg;
	}
	
	
	
}
