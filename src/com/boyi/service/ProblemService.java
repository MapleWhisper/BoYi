package com.boyi.service;

import java.util.List;

import com.boyi.base.BaseServer;
import com.boyi.po.Paper;
import com.boyi.po.Problem;
import com.boyi.utils.Page;

public interface ProblemService extends BaseServer<Problem>{
	
	/**
	 * 得到最大的页数
	 * @param page	分页信息
	 * @return
	 */
	public Integer getMaxPageNum(Page page,String grade,String subject);
	
	/**
	 * 分页显示
	 * @param page 分页信息
	 * @return
	 */
	public List<Problem> findAll(Page page);
	public List<Problem> findAllByGradeAndSubject(Page page,String grade,String subject);

	public List<Problem> search(String key); 
	
	public Paper showPaper(Paper paper);
	
	/**
	 * 通过Ans字符串 把答案 放到试卷中
	 * @param paper
	 * @param Ans
	 * @return
	 */
	public Paper setAnswer(Paper paper,String Ans);
	
	/**
	 * 根据年级 课程 和 个数 选取 试题 并返回
	 * @param grade
	 * @param subject
	 * @param number
	 * @return
	 */
	public List<Integer> getProblemId(String grade,String subject,String type , Integer number);
	public List<Integer> getProblemId(String grade,String subject,String type,Integer number,Integer strategy);
}
