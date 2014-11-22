package com.admin.action;

import java.util.List;

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
import com.boyi.po.Article;
import com.boyi.service.ArticleService;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin")
@Action(value="indexAction",results={
		@Result(name="toIndex",type="redirectAction",location="indexAction"),
		@Result(name="index",location="/WEB-INF/jsp/admin/index.jsp"),
})
public class AdminIndexAction extends BaseAction{
	
	
	@Resource(name = "articleSerivceImpl")
	private ArticleService articleService;
	
	private List<Article> articleList;
	private String grade ;
	private String subject;
	
	@Override
	public String execute() throws Exception {
		this.articleList = articleService.findAdminNotificationAll();
		return "index";
	}
	
	public void greadAndSubject(){
		System.out.println("ok");
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		System.out.println(grade+subject);
		if(grade != null && subject !=null){
			session.setAttribute("grade", grade);
			session.setAttribute("subject", subject);
		}
		
		return;
	}

	public ArticleService getArticleService() {
		return articleService;
	}

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	public List<Article> getArticleList() {
		return articleList;
	}

	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
