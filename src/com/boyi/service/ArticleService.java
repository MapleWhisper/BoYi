package com.boyi.service;

import java.util.List;

import com.boyi.base.BaseServer;
import com.boyi.po.Article;
import com.boyi.utils.Page;

public interface ArticleService extends BaseServer<Article> {
	public List<Article> findHelpAll();
	public List<Article> findNewsAll();
	public List<Article> findAdminNotificationAll();
	public List<Article> findAdminNotificationAll(Page page);
	public List<Article> findDownLoadAll();
	
}
