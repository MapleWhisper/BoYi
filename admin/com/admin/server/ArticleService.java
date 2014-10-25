package com.admin.server;

import java.util.List;

import com.boyi.base.BaseServer;
import com.boyi.po.Article;

public interface ArticleService extends BaseServer<Article> {
	public List<Article> findHelpAll();
	public List<Article> findNewsAll();
	public List<Article> findAdminNotificationAll();
	
}
