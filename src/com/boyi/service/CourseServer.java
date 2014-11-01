package com.boyi.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServer;
import com.boyi.po.Course;

/**
 * 
 * 管理员登陆实现接口
 * 
 * @author 广路
 * 
 */
@Transactional
public interface CourseServer extends BaseServer<Course> {
	public List<Course> findAllByGrade(String grade);
}
