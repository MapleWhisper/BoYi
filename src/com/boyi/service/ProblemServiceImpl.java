package com.boyi.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.boyi.base.BaseServerImpl;
import com.boyi.po.Paper;
import com.boyi.po.Problem;
import com.boyi.utils.Page;

@Transactional
@Service
@SuppressWarnings("unchecked")
public class ProblemServiceImpl extends BaseServerImpl<Problem> implements ProblemService {
	
	
	/**
	 * 分页显示
	 * @param page 分页信息
	 * @return
	 */
	
	public List<Problem> findAll(Page page) {
		Query query= getSession().createQuery("from Problem p order by p.id desc");
		query.setMaxResults(page.getAmount());							//取几条记录
		query.setFirstResult( (page.getCur()-1)*page.getAmount() );		//从哪个记录开始取
		
		return query.list();
	}
	@Override
	public List<Problem> findAllByGradeAndSubject(Page page, String grade,
			String subject) {
		Query query= getSession().createQuery("from Problem p where p.grade =? and p.subject = ? order by p.id desc");
		query.setParameter(0, grade).setParameter(1, subject);
		query.setMaxResults(page.getAmount());							//取几条记录
		query.setFirstResult( (page.getCur()-1)*page.getAmount() );		//从哪个记录开始取
		return query.list();
	}
	
	/**
	 * 得到最大的页数
	 */
	public int getMaxPageNum(Page page){
		int sum = ((Number)(getSession().createQuery("select count(*) from Problem p ").iterate().next())).intValue() ;
		sum = (sum+page.getAmount()-1)/page.getAmount(); 
		return sum;
	}
	@Override
	public int getMaxPageNum(Page page, String grade, String subject) {
		int sum = ((Number)(getSession().createQuery("select count(*) from Problem p where p.grade =? and p.subject = ? ")
				.setParameter(0, grade).setParameter(1, subject)
				.iterate().next())).intValue() ;
		sum = (sum+page.getAmount()-1)/page.getAmount(); 
		return sum;
	}
	
	/**
	 * 根据关键字查找试题
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Problem> search(String key) {
		return	getSession().createQuery("from Problem p  where p.title like ? or p.label like ? ")
				.setParameter(0, "%"+key+"%")
				.setParameter(1, "%"+key+"%").list();
		 
	}
	
	/**
	 * 根据数组获得 试题信息数据
	 */
	@Override
	public Paper showPaper(Paper paper) {
		paper.setSingleList(getByIds( JSON.parseArray(paper.getSingle(), Integer.class) ) );
		paper.setMultChoiceList(getByIds(JSON.parseArray(paper.getMultChoice(), Integer.class)));
		paper.setJudegeList(getByIds(JSON.parseArray(paper.getJudege(), Integer.class)));
		paper.setQuestionList(getByIds(JSON.parseArray(paper.getQuestion(), Integer.class)));
		paper.setSingleNumber(paper.getSingleList().size());
		paper.setMultChoiceNumber(paper.getMultChoiceList().size());
		paper.setJudgeNumber(paper.getJudegeList().size());
		paper.setQuestionNumber(paper.getQuestionList().size());
		return paper;
	}
	
	public List<Integer> getProblemId(String grade,String subject,String type,Integer number){
		return this.getProblemId(grade, subject, type ,number, 1);
		
	}
	
	public List<Integer> getProblemId(String grade,String subject,String type,Integer number,Integer strategy){
		
		List<Integer> list ;
		if(strategy ==1){	//默认策略，随机 选取试题
			 String hql = "select id from Problem p where p.grade = ? and p.subject = ? and p.type = ? order by rand() ";
			 list = getSession().createSQLQuery(hql).setString(0, grade).setString(1, subject).setString(2, type)
			.setMaxResults(number).list();
		}else{
			list = null;
		}
		System.out.println(list);
		return list;
		
	}
}	
