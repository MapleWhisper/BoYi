package com.boyi.service;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.boyi.base.BaseServer;
import com.boyi.po.Classes;

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
}
