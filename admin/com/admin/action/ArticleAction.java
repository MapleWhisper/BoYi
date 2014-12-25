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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.boyi.base.BaseAction;
import com.boyi.lucene.ArticleQuery;
import com.boyi.po.Article;
import com.boyi.service.ArticleService;
import com.boyi.utils.Page;



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
	
	@Value("${page.studentAmountPerPage}")
	private Integer articleAmountPerPage;	//每页显示多少文章
	
	@Resource(name="articleQuery")
	private ArticleQuery articleQuery;
	
	private List<Article> articleList;
	
	private Article article;
	private Integer id;
	private Page page;
	private Integer cur;
	private String key;
	
	
	
	
	/**
	 * 后台文章管理 列表
	 */
	@Override
	public String execute() throws Exception {
		if(cur ==null || cur <=0 ){
			cur =1;
		}
		Page page = new Page();
		page.setCur(cur);
		page.setAmount(articleAmountPerPage);
		this.page = page;
		
		this.articleList = articleService.findAll(page);
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
		a.setUrl(article.getUrl());
		articleService.update(a);
		return "toIndex";
	}
	
	@Override
	public String delete() {
		articleService.delete(id);
		return "toIndex";
	}
	
	
	/**
	 * 全文检索
	 * @return
	 */
	public String search(){
		if(key!=null){
			articleQuery.updateIndex();
			this.articleList = articleQuery.serch(key);
		}
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

	public Integer getCur() {
		return cur;
	}

	public void setCur(Integer cur) {
		this.cur = cur;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Integer getArticleAmountPerPage() {
		return articleAmountPerPage;
	}

	public void setArticleAmountPerPage(Integer articleAmountPerPage) {
		this.articleAmountPerPage = articleAmountPerPage;
	}

	public ArticleQuery getArticleQuery() {
		return articleQuery;
	}

	public void setArticleQuery(ArticleQuery articleQuery) {
		this.articleQuery = articleQuery;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	
}
