package com.admin.action;

import java.util.List;

import javax.annotation.Resource;

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
	
	@Override
	public String execute() throws Exception {
		this.articleList = articleService.findAdminNotificationAll();
		return "index";
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
