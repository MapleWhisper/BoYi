package com.admin.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.admin.server.PaperService;
import com.admin.server.ProblemService;
import com.boyi.base.BaseAction;
import com.boyi.po.Paper;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/paper")
@Action(value="autoPaperAction",results={
		@Result(name="toIndex",type="redirectAction",location="paperAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/paper/autoPaper.jsp"),
		@Result(name="show",location="/WEB-INF/jsp/admin/paper/showPaper.jsp"),
		
})
public class AutoPaperAction extends BaseAction{
	@Resource(name="paperServiceImpl")
	private PaperService paperService;
	
	@Resource(name="problemServiceImpl")
	private ProblemService problemService;
	
	private Paper paper;
	private String action;
	
	
	@Override
	public String execute() throws Exception {
		return "index";
	}
	
	
	public String get(){
		
		String grade = paper.getGrade();
		String subject = paper.getSubject();
		if(grade==null || subject==null || "".equals(grade) || "".equals(subject)){
			return "toIndex";
		}
		this.paper = this.generator(paper);
		this.action="save";
		return "show";
	}
	
	public Paper generator(Paper paper){
		String grade = paper.getGrade();
		String subject = paper.getSubject();
		
		paper.setSingleList(problemService.getProblemList(grade, subject,"单选题" , paper.getSingleNumber()));
		paper.setMultChoiceList(problemService.getProblemList(grade, subject,"多选题" , paper.getMultChoiceNumber()));
		paper.setJudegeList(problemService.getProblemList(grade, subject,"判断题" , paper.getJudgeNumber()));
		paper.setQuestionList(problemService.getProblemList(grade, subject,"简答题" , paper.getQuestionNumber()));
		paper.setSingleNumber(paper.getSingleList().size());
		paper.setMultChoiceNumber(paper.getMultChoiceList().size());
		paper.setJudgeNumber(paper.getJudegeList().size());
		paper.setQuestionNumber(paper.getQuestionList().size());
		return paper;
	}
	
	
	
	
	
	
	public PaperService getPaperService() {
		return paperService;
	}

	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}

	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}
	public Paper getPaper() {
		return paper;
	}


	public void setPaper(Paper paper) {
		this.paper = paper;
	}


	public String getAction() {
		return action;
	}


	public void setAction(String action) {
		this.action = action;
	}
	
	
	
}
