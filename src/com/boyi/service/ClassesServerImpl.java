package com.boyi.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServerImpl;
import com.boyi.po.Classes;


/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 * 
 */

@Service
@SuppressWarnings("unchecked")
@Transactional
public class ClassesServerImpl extends BaseServerImpl<Classes> implements ClassesServer {
		@Override
		public List<Classes> findAllByStatus(String status) {
			String hql  = "from Classes c where c.status = ?";
			return getSession().createQuery(hql).setString(0, status).list();
		}
		
}
