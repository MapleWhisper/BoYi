package com.boyi.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServer;
import com.boyi.po.Classes;
import com.boyi.utils.Page;

/**
 * 
 * 管理员登陆实现接口
 * 
 * @author 广路
 * 
 */
@Transactional
public interface ClassesServer extends BaseServer<Classes> {
	
	/**
	 * 根据状态查找班级
	 * @param status
	 * @return
	 */
	public List<Classes> findAllByStatus(String status);
	
	public List<Classes> findIndexAll(String grade,String subject,String sort,Page page);
	
	/**
	 * 返回所有的 未开始 和 在读的课程
	 * @return
	 */
	public List<Classes> findAvailable();
	
	public List<Classes> findRecommand();
}
