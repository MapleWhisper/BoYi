package com.boyi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServer;
import com.boyi.po.Classes;
import com.boyi.po.Exam;

/**
 * 
 * 管理员登陆实现接口
 * 
 * @author 广路
 * 
 */
@Transactional
public interface ExamServer extends BaseServer<Exam> {
	public List<Exam> findAllByStatus(String status);
	
	public HashMap<String, String> countByStatus();
}
