package com.admin.action;

import java.util.Arrays;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boyi.base.BaseAction;
import com.boyi.po.Admin;
import com.boyi.po.Privilege;
import com.boyi.service.AdminServer;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/")
@Action(value="adminLoginAction",results={
		@Result(name="toIndex",type="redirectAction",location="adminLoginAction"),
		@Result(name="login",location="/WEB-INF/jsp/admin/login.jsp"),
		@Result(name="success",type="redirectAction" , location="admin/indexAction"),
})
public class AdminLoginAction extends BaseAction{
	
	//注入admin服务	adminServerImpl
		@Resource(name="adminServerImpl")
		private AdminServer adminServer;
		
	private Admin admin;
	private String valifCode;
	private String error;
		
	/**
	 * 显示登陆界面
	 */
	@Override
	public String execute() throws Exception {
		/**
		 * if(session.getAttribute("admin")!=null){
			//如果管理员已经登陆
			return "redirect:/admin/position";
		}
		 */
		return "login";
	}
	
	
	/**
	 * 验证用户名密码是否正确
	 * @param admin
	 * @return
	 */
	public String login(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		//如果输入的验证码不正确
		if( !valifCode.equals(session.getAttribute("valifCode") ))  {
			error = "验证码错误";
			return "login";
		}
		System.out.println(admin.getUsername());
		System.out.println(admin.getPassword());
		Admin a =adminServer.login(admin);
		System.out.println("管理员登陆");
		//登陆成功
		if(a!=null){
			/*
			Integer [] ids = new Integer[5];
			Arrays.fill(ids, 0);
			int index = 0 ;
			if(a.getPrivileges()!=null){
				for(Privilege p : a.getPrivileges()){
					ids[index++]=p.getId();
				}
			}
			admin.setPrivilegeIds(ids);
			*/
			session.setAttribute("admin", a);
			return "success";
		}
		//登陆失败
		error="账号或密码不正确";
		return "login";
		
	}
	
	public String logout(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("admin");	
		return "toIndex";		//返回到登陆页面
	}


	public AdminServer getAdminServer() {
		return adminServer;
	}


	public void setAdminServer(AdminServer adminServer) {
		this.adminServer = adminServer;
	}


	public Admin getAdmin() {
		return admin;
	}


	public void setAdmin(Admin admin) {
		this.admin = admin;
	}


	public String getValifCode() {
		return valifCode;
	}


	public void setValifCode(String valifCode) {
		this.valifCode = valifCode;
	}


	public String getError() {
		return error;
	}


	public void setError(String error) {
		this.error = error;
	}
	
	
}
