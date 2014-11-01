package com.boyi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.boyi.base.BaseServerImpl;
import com.boyi.enmu.ArticleType;
import com.boyi.po.Article;

@Service
@SuppressWarnings("unchecked")
public class ArticleSerivceImpl extends BaseServerImpl<Article> implements ArticleService{
	
	@Override
	public List<Article> findNewsAll() {
		String hql = " from Article a where a.type=?";
		List<Article> list = (List<Article>) getSession().createQuery(hql)
				.setParameter(0, ArticleType.主页新闻.toString()).list();
		return list;
	}
	
	@Override
	public List<Article> findHelpAll() {
		String hql = " from Article a where a.type=?";
		List<Article> list = (List<Article>) getSession().createQuery(hql)
				.setParameter(0, ArticleType.帮助文章.toString()).list();
		return list;
	}
	@Override
	public List<Article> findAdminNotificationAll() {
		String hql = " from Article a where a.type=?";
		List<Article> list = (List<Article>) getSession().createQuery(hql)
				.setParameter(0, ArticleType.后台通知.toString()).list();
		return list;
	}
}
