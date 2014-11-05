package com.exam.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.po.Classes;
import com.boyi.po.Exam;
import com.boyi.po.Paper;
import com.boyi.service.ClassesServer;
import com.boyi.service.ExamServer;
import com.boyi.service.PaperService;
import com.boyi.service.ProblemService;
import com.boyi.utils.Page;


@Controller("ExamAction")
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/exam")
@Action(value="examAction",results={
		@Result(name="toIndex",type="redirectAction",location="examAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/exam/index.jsp"),
		@Result(name="show",location="/WEB-INF/jsp/exam/show.jsp"),
		
})
public class ExamAction extends BaseAction{
	@Resource(name="classesServerImpl")
	private ClassesServer classesServer;
	
	@Resource(name="paperServiceImpl")
	private PaperService paperService;
	
	@Resource(name="problemServiceImpl")
	private ProblemService problemService;
	
	@Resource(name="examServerImpl")
	private ExamServer examServer;
	
	
	private List<Exam> examList;
	private List<Classes> classesList;
	private List<Paper> paperList;
	
	private Paper paper;
	private Exam exam;
	private String leftTime;
	
	private Page page;
	private Integer id;
	private Integer cur;
	private Integer paperId;
	
	/**
	 * 考试系统 主页面
	 * 显示考试列表 并分页
	 */
	@Override
	public String execute() throws Exception {
		if(cur==null){
			cur=1;
		}
		//分页  数据
		Page page = new Page();
		page.setCur(cur);
		page.setAmount(15);
		this.examList = examServer.findAll(page);
		page.setSum(examServer.getMaxPageNum(page));
		this.page = page;
		
		
		return "index";
	}
	
	/**
	 * 显示 考试详情
	 */
	@Override
	public String show() {
		exam = examServer.getById(id);
		this.paperId = exam.getPaper().getId();
		Paper paper = paperService.getById(paperId);
		if(paper==null){
			return "toIndex";
		}
		this.paper = problemService.showPaper(paper);
		
		Date start = exam.getBeginTime();
		Date end = exam.getEndTime();
		Date now = new Date();
		
		if(now.getTime() < start.getTime()){
			//如果考试还没开始
		}else if(now.getTime() > end.getTime()){
			//考试已经结束
		}else{
			//考试正在进行
				int diff = (int) (end.getTime() - now.getTime());
			 	int day = diff / (24 * 60 * 60 * 1000);  
		        int hour = (diff / (60 * 60 * 1000) - day * 24);  
		        int min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);  
		        int sec = (diff/1000-day*24*60*60-hour*60*60-min*60);
		        this.leftTime = hour+":"+min+":"+sec;
		}
		return "show";
	}
	
	
	public ClassesServer getClassesServer() {
		return classesServer;
	}
	public void setClassesServer(ClassesServer classesServer) {
		this.classesServer = classesServer;
	}
	public PaperService getPaperService() {
		return paperService;
	}
	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}
	public ExamServer getExamServer() {
		return examServer;
	}
	public void setExamServer(ExamServer examServer) {
		this.examServer = examServer;
	}
	public List<Exam> getExamList() {
		return examList;
	}
	public void setExamList(List<Exam> examList) {
		this.examList = examList;
	}
	public List<Classes> getClassesList() {
		return classesList;
	}
	public void setClassesList(List<Classes> classesList) {
		this.classesList = classesList;
	}
	public List<Paper> getPaperList() {
		return paperList;
	}
	public void setPaperList(List<Paper> paperList) {
		this.paperList = paperList;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCur() {
		return cur;
	}

	public void setCur(Integer cur) {
		this.cur = cur;
	}

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public String getLeftTime() {
		return leftTime;
	}

	public void setLeftTime(String leftTime) {
		this.leftTime = leftTime;
	}
	
	
}
