package com.boyi.service;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.boyi.base.BaseServerImpl;
import com.boyi.po.Paper;

@Service
@SuppressWarnings("unchecked")
public class PaperServiceImpl extends BaseServerImpl<Paper> implements PaperService{
	
	
	@Override
	public List<Paper> findAll() {
		
		return (List<Paper>) getSession().createQuery("from Paper p order by p.createDate").list();
	}
	
	@Override
	public List<Paper> findAllByGradeAndSubject(String grade, String subject) {
		Query query= getSession().createQuery("from Paper p where p.grade =? and p.subject = ? order by p.id desc");
		query.setParameter(0, grade).setParameter(1, subject);
		return query.list();
	}
	
	
	/**
	 * 根据数目生成试卷
	 */
	@Override
	public Paper getPaper(Paper paper) {
		
		return null;
	}
}	
