package com.boyi.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServer;
import com.boyi.po.Admin;
import com.boyi.po.Teacher;

/**
 * 
 * 管理员登陆实现接口
 * 
 * @author 广路
 * 
 */
@Transactional
public interface TeacherServer extends BaseServer<Teacher> {
	public List<Teacher> findRecommand();
	public Teacher login(Teacher teacher);
}
