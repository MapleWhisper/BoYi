package com.admin.action;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.po.Admin;
import com.boyi.po.Privilege;
import com.boyi.service.AdminServer;
import com.boyi.service.PrivilegeService;



@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/admin")
@Action(value="adminAction",results={
		@Result(name="toIndex",type="redirectAction",location="adminAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/admin/admin.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/admin/addAdmin.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/admin/editAdmin.jsp"),
		
})
public class AdminAction  extends BaseAction{
	@Resource(name="adminServerImpl")
	private AdminServer adminServer;	//注入admin服务	adminServerImpl
	
	@Resource(name="privilegeServiceImpl")
	private PrivilegeService privilegeService;
	
	private List<Privilege> privilegeList;
	private List<Admin> adminList;
	private Admin admin;
	private Integer id;
	
	private String meg;
	
	@Override
	public String execute() throws Exception {
		adminList = adminServer.findAll();
		return "index";
	}

	@Override
	public String add() {
		this.privilegeList = privilegeService.findAll();
		return "add";
	}
	
	@Override
	public String save() {
		try {
			Integer[] a = admin.getPrivilegeIds();
			HashSet<Privilege> set = new HashSet<Privilege>(privilegeService.getByIds(a));
			admin.setPrivileges(set);
			adminServer.save(admin);
		} catch (Exception e) {
			meg="该管理员账号已经存在,请不要重复添加!";
			return "error";
		}
		return "toIndex";
	}
	
	@Override
	public String edit() {
		this.admin = adminServer.getById(id);
		Set<Privilege> privileges =  admin.getPrivileges();
		Integer [] ids = new Integer[privileges.size()+1];
		if(privileges!=null){
			
			Arrays.fill(ids, 0);
			int index = 0 ;
			for(Privilege p : privileges){
				ids[index++]=p.getId();
			}
		}
		admin.setPrivilegeIds(ids);
		this.privilegeList = privilegeService.findAll();
		
		
		return super.edit();
	}
	
	@Override
	public String update() {
		Admin a = adminServer.getById(admin.getId());
		
		Integer[] ads = admin.getPrivilegeIds();
		HashSet<Privilege> set = new HashSet<Privilege>(privilegeService.getByIds(ads));
		a.setPrivileges(set);
		a.setUsername(admin.getUsername());
		a.setName(admin.getName());
		a.setPosition(admin.getPosition());
		
		adminServer.update(a);
		ServletActionContext.getRequest().getSession().setAttribute("admin", a);
		return super.update();
	}
	
	@Override
	public String delete() {
		adminServer.delete(id);
		return super.delete();
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Privilege> getPrivilegeList() {
		return privilegeList;
	}

	public void setPrivilegeList(List<Privilege> privilegeList) {
		this.privilegeList = privilegeList;
	}
	
	
	
}
