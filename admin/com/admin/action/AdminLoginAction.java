package com.admin.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.po.Admin;
import com.boyi.po.Teacher;
import com.boyi.service.AdminServer;
import com.boyi.service.TeacherServer;

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
	
	@Resource(name="teacherServerImpl")
	private TeacherServer teacherServer;
		
	private Admin admin;
	private Teacher teacher;
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
		
		Admin a =adminServer.login(admin);
		this.teacher = new Teacher();
		this.teacher.setEmail(admin.getUsername());
		this.teacher.setPassword(admin.getPassword());
		Teacher t = teacherServer.login(teacher);
		
		System.out.println("管理员/教师登陆");
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
		if(t!=null){
			session.setAttribute("teacher", t);
			return "success";
		}
		//登陆失败
		error="账号或密码不正确";
		return "login";
		
	}
	
	public String logout(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("admin");	
		session.removeAttribute("teacher");
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
