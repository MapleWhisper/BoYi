package com.admin.server;

import java.util.List;

import com.boyi.base.BaseServer;
import com.boyi.po.Problem;
import com.boyi.utils.Page;

public interface ProblemService extends BaseServer<Problem>{
	
	/**
	 * 得到最大的页数
	 * @param page	分页信息
	 * @return
	 */
	public int getMaxPageNum(Page page);
	public int getMaxPageNum(Page page,String grade,String subject);
	
	/**
	 * 分页显示
	 * @param page 分页信息
	 * @return
	 */
	public List<Problem> findAll(Page page);
	public List<Problem> findAllByGradeAndSubject(Page page,String grade,String subject);

	public List<Problem> search(String key); 
}
