package com.boyi.service;

import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServer;
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
}
