package com.boyi.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boyi.po.Admin;
import com.boyi.po.Privilege;
import com.boyi.po.Student;
import com.boyi.po.Teacher;

public class LoginFilter implements Filter{
	private List<String> teacherList = new ArrayList<String>();
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginFileter...ok");
		teacherList.addAll(Arrays.asList(new String[]{"indexAction","teacherCenterAction",
				"paperAction!checkPaper","articleAction!show"}));
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		String path = req.getRequestURI();
		
		//验证学生登录
		if(path.indexOf("student/studentCenterAction")!=-1 || path.indexOf("examAction!show")!=-1){
			Student stu = (Student) session.getAttribute("student");
			if(stu==null){
				resp.sendRedirect(req.getContextPath()+"/loginAction!loginUI");
			}else{
				chain.doFilter(request, response);
			}
			return;
		}
		if(path.indexOf("admin/")!=-1){
			Teacher tea = (Teacher) session.getAttribute("teacher");
			Admin admin = (Admin) session.getAttribute("admin");
			if(tea==null && admin==null){
				resp.sendRedirect(req.getContextPath()+"/adminLoginAction");
				
			}else{
				if(tea!=null){
					checkTeacher(request, response, chain, req, resp, path, tea);
					return;
				}
				if(admin!=null){
					if(path.indexOf("admin/indexAction")!=-1){
						chain.doFilter(request, response);
						return;
					}
					checkAdmin(request, response, chain, req, resp, path, admin);
					return;
				}
				
			}
			return;
		}
		chain.doFilter(request, response);
		
	}
	private void checkAdmin(ServletRequest request, ServletResponse response,
			FilterChain chain, HttpServletRequest req,
			HttpServletResponse resp, String path, Admin admin) {
		try {
			boolean flag = false;
	        for(Privilege p :  admin.getPrivileges() ){
	        	if(path.indexOf(p.getUrl())!=-1 ){
	        		flag= true;
	        	}
	        }
	        if(!flag){
	        	resp.sendRedirect(req.getContextPath()+"/admin/indexAction");
	        }
	        chain.doFilter(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	private void checkTeacher(ServletRequest request, ServletResponse response,
			FilterChain chain, HttpServletRequest req,
			HttpServletResponse resp, String path, Teacher tea)
			throws IOException, ServletException {
		System.out.println(tea.getName());
		
		if(checkTeacherPrivilege(path)){
			chain.doFilter(request, response);
			return;
		}else{
			resp.sendRedirect(req.getContextPath()+"/admin/indexAction");
			return;
		}
	}
	
	public boolean checkTeacherPrivilege(String path){
		for(String s :teacherList){
			
			if(path.indexOf(s)!=-1){
				return true;
			}
		}
		return false;
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	public List<String> getTeacherList() {
		return teacherList;
	}
	public void setTeacherList(List<String> teacherList) {
		this.teacherList = teacherList;
	}
	
	
}
