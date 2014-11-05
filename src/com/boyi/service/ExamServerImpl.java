package com.boyi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServerImpl;
import com.boyi.po.Classes;
import com.boyi.po.Exam;


/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 * 
 */

@Service
@SuppressWarnings("unchecked")
@Transactional
public class ExamServerImpl extends BaseServerImpl<Exam> implements ExamServer {
	
	@Override
	public List<Exam> findAll() {
		String hql  = "from Exam e order by id desc";
		return getSession().createQuery(hql).list();
	}
	
	@Override
	public List<Exam> findAllByStatus(String status) {
		String hql  = "from Exam e where e.status = ? ";
		return getSession().createQuery(hql).setString(0, status).list();
	}
	
	@Override
	public HashMap<String, String> countByStatus() {
		
		Query query = getSession().createQuery(
				"select e.status ,count(*) from Exam e group by e.status");
		List<Object[]> list = query.list();
		HashMap<String, String> map = new HashMap<>();
		for (Object[] o : list) {
			map.put(o[0].toString(), o[1].toString());
		}
		return map;
	}
}
