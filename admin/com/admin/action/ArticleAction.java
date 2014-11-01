package com.admin.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.boyi.base.BaseAction;
import com.boyi.po.Article;
import com.boyi.service.ArticleService;



@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/article")
@Action(value="articleAction",results={
		@Result(name="toIndex",type="redirectAction",location="articleAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/article/article.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/article/addArticle.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/article/editArticle.jsp"),
		
})
public class ArticleAction  extends BaseAction{
	
	@Resource(name = "articleSerivceImpl")
	private ArticleService articleService;
	
	private List<Article> articleList;
	
	private Article article;
	private Integer id;
	
	/**
	 * 后台文章管理 列表
	 */
	@Override
	public String execute() throws Exception {
		this.articleList = articleService.findAll();
		return "index";
	}

	@Override
	public String add() {
		
		return	"add";
	}
	
	@Override
	public String save() {
		article.setCreateDate(new Date());
		this.articleService.save(article);
		return "toIndex";
	}
	
	public String show() {
		if(id!=null){
			article = articleService.getById(id);
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String a= JSON.toJSONString(article);
		try {
			response.getWriter().println(a);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public String edit() {
		this.article = articleService.getById(id);
		return super.edit();
	}
	
	@Override
	public String update() {
		Article a = articleService.getById(article.getId());
		a.setTitle(article.getTitle());
		a.setType(article.getType());
		a.setContext(article.getContext());
		articleService.updata(a);
		return "toIndex";
	}
	
	@Override
	public String delete() {
		articleService.delete(id);
		return "toIndex";
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
	public void setArticleList(List<Article> articlelist) {
		this.articleList = articlelist;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	
	
	
	
	
	
	
	
	
	
}
