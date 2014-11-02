package com.boyi.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServerImpl;
import com.boyi.po.Classes;
import com.boyi.po.Exam;


/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 * 
 */

@Service
@SuppressWarnings("unchecked")
@Transactional
public class ExamServerImpl extends BaseServerImpl<Exam> implements ExamServer {
	
}
