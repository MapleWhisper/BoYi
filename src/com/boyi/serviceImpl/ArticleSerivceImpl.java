package com.boyi.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.boyi.base.BaseServerImpl;
import com.boyi.enmu.ArticleType;
import com.boyi.po.Article;
import com.boyi.service.ArticleService;
import com.boyi.utils.Page;

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
	@Override
	public List<Article> findAdminNotificationAll(Page page) {
		String hql = " from Article a where a.type=?";
		Query query= getSession().createQuery(hql).setParameter(0, ArticleType.后台通知.toString());
		query.setMaxResults(page.getAmount());							//取几条记录
		query.setFirstResult( (page.getCur()-1)*page.getAmount() );		//从哪个记录开始取
		getMaxPageNum(page);	//得到总页数
		return query.list();
	}
	
	/**
	 * 显示所有 下载文档的连接
	 */
	@Override
	public List<Article> findDownLoadAll() {
		String hql = " from Article a where a.type=?";
		List<Article> list = (List<Article>) getSession().createQuery(hql)
				.setParameter(0, ArticleType.资料下载.toString()).list();
		return list;
	}
}
