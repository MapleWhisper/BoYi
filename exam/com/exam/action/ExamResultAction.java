package com.exam.action;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.boyi.base.BaseAction;
import com.boyi.enmu.ExamStatus;
import com.boyi.po.Classes;
import com.boyi.po.Exam;
import com.boyi.po.Paper;
import com.boyi.service.ClassesServer;
import com.boyi.service.ExamServer;
import com.boyi.service.PaperService;
import com.boyi.service.ProblemService;
import com.boyi.utils.Page;


@Controller("ExamResultAction")
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/exam")
@Action(value="examResultAction",results={
		@Result(name="toIndex",type="redirectAction",location="examResultAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/exam/index.jsp"),
		@Result(name="show",location="/WEB-INF/jsp/exam/show.jsp"),
		
})
public class ExamResultAction extends BaseAction{
	@Resource(name="classesServerImpl")
	private ClassesServer classesServer;
	
	@Resource(name="paperServiceImpl")
	private PaperService paperService;
	
	@Resource(name="problemServiceImpl")
	private ProblemService problemService;
	
	@Resource(name="examServerImpl")
	private ExamServer examServer;
	
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
		return "";
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
