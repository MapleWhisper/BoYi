package com.admin.server;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServer;
import com.boyi.po.Classes;
import com.boyi.po.Course;

/**
 * 
 * 管理员登陆实现接口
 * 
 * @author 广路
 * 
 */
@Transactional
public interface ClassesServer extends BaseServer<Classes> {
}
