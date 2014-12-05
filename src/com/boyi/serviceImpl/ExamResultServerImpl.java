package com.boyi.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServerImpl;
import com.boyi.po.Exam;
import com.boyi.po.ExamResult;
import com.boyi.service.ExamResultServer;


/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 * 
 */

@Service
@SuppressWarnings("unchecked")
@Transactional
public class ExamResultServerImpl extends BaseServerImpl<ExamResult> implements ExamResultServer {       
	@Override
	public ExamResult getById(Integer studentId, Integer ExamId) {
		String sql = "select * from examresult  e where e.studentid = ? and examid = ?";
		ExamResult result = (ExamResult) getSession().createSQLQuery(sql).addEntity(ExamResult.class)
		.setInteger(0, studentId)
		.setInteger(1, ExamId).uniqueResult();
		return result;
	}
}
