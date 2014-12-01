package com.boyi.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServerImpl;
import com.boyi.po.Teacher;


/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 * 
 */
@Service("teacherServerImpl")
@Transactional
public class TeacherServerImpl extends BaseServerImpl<Teacher> implements TeacherServer {
	@Override
	public List<Teacher> findRecommand() {
		 String hql="from Teacher t where t.recommand=?";

		 return  getSession().createQuery(hql).setBoolean(0, true).list();
	}
}
