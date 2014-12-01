package com.boyi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boyi.po.Student;

public class LoginFilter implements Filter{
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginFileter...ok");
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		String path = req.getRequestURI();
		if(path.indexOf("student/")!=-1){
			Student stu = (Student) session.getAttribute("student");
			if(stu==null){
				resp.sendRedirect(req.getContextPath()+"/loginAction!loginUI");
			}else{
				chain.doFilter(request, response);
			}
			return;
		}
		chain.doFilter(request, response);
		
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}
