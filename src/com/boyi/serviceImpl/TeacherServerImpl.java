package com.boyi.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServerImpl;
import com.boyi.po.Teacher;
import com.boyi.service.TeacherServer;


/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 * 
 */
@Service("teacherServerImpl")
@Transactional
public class TeacherServerImpl extends BaseServerImpl<Teacher> implements TeacherServer {
	@SuppressWarnings("unchecked")
	@Override
	public List<Teacher> findRecommand() {
		 String hql="from Teacher t where t.recommand=?";

		 return  getSession().createQuery(hql).setBoolean(0, true).setMaxResults(5).list();
	}
	
	@Override
	public Teacher login(Teacher teacher) {
		Teacher t = (Teacher) getSession()
				.createQuery(
						"from Teacher t where t.email = ? and t.password= ? ")
						.setParameter(0, teacher.getEmail())
						.setParameter(1, teacher.getPassword()).uniqueResult();
		return t;
	}
}
