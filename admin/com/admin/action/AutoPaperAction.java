package com.admin.action;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.admin.po.PaperCart;
import com.alibaba.fastjson.JSON;
import com.boyi.base.BaseAction;
import com.boyi.po.Paper;
import com.boyi.po.Problem;
import com.boyi.service.PaperService;
import com.boyi.service.ProblemService;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/paper")
@Action(value="autoPaperAction",results={
		@Result(name="toIndex",type="redirectAction",location="paperAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/paper/autoPaper.jsp"),
		@Result(name="show",location="/WEB-INF/jsp/admin/paper/showPaper.jsp"),
		@Result(name="paperCart",type="redirectAction",location="../problem/paperCartAction"),
		
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
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		String grade = paper.getGrade();
		String subject = paper.getSubject();
		if(grade==null || subject==null || "".equals(grade) || "".equals(subject)){
			return "toIndex";
		}
		PaperCart paperCart = this.generator(paper);
		session.setAttribute("paperCart", paperCart);
		return "paperCart";
	}
	
	
	
	public PaperCart generator(Paper paper){
		String grade = paper.getGrade();
		String subject = paper.getSubject();
		
		PaperCart cart = new PaperCart();
		
		cart.setSingles(problemService.getProblemId(grade, subject,"单选题" , paper.getSingleNumber()));
		cart.setMultChoices(problemService.getProblemId(grade, subject,"多选题" , paper.getMultChoiceNumber()));
		cart.setJudges(problemService.getProblemId(grade, subject,"判断题" , paper.getJudgeNumber()));
		cart.setQuestions(problemService.getProblemId(grade, subject,"简答题" , paper.getQuestionNumber()));
		cart.setsingleNumber((cart.getSingles().size()));
		cart.setMultChoiceNumber(cart.getMultChoices().size());
		cart.setJudgeNumber(cart.getJudges().size());
		cart.setQuestionNumber(cart.getQuestions().size());
		return cart;
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
