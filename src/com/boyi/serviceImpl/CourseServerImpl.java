package com.boyi.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServerImpl;
import com.boyi.po.Course;
import com.boyi.service.CourseServer;


/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 * 
 */

@Service
@SuppressWarnings("unchecked")
@Transactional
public class CourseServerImpl extends BaseServerImpl<Course> implements CourseServer {
	@Override
	public List<Course> findAllByGrade(String grade) {
		String hql = "select new Course(id,grade,subject) from Course c where c.grade like ?";
		List <Course> course = getSession().createQuery(hql).setString(0, grade+"%").list();
		return course;
	}
	
	@Override
	public List<Course> findAll() {
		String hql = "select new Course(id,grade,subject) from Course ";
		List <Course> course = getSession().createQuery(hql).list();
		return course;
	}
}
