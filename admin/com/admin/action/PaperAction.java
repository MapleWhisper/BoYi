package com.admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
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
import com.boyi.po.ExamResult;
import com.boyi.po.Paper;
import com.boyi.po.Problem;
import com.boyi.service.ExamResultServer;
import com.boyi.service.PaperService;
import com.boyi.service.ProblemService;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/paper")
@Action(value="paperAction",results={
		@Result(name="toIndex",type="redirectAction",location="paperAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/paper/paper.jsp"),
		@Result(name="show",location="/WEB-INF/jsp/admin/paper/showPaper.jsp"),
		@Result(name="list",location="/WEB-INF/jsp/admin/paper/paperList.jsp"),
		@Result(name="checkPaper",location="/WEB-INF/jsp/admin/paper/checkPaper.jsp"),
		
})
public class PaperAction extends BaseAction{
	@Resource(name="paperServiceImpl")
	private PaperService paperService;
	
	@Resource(name="problemServiceImpl")
	private ProblemService problemService;
	
	@Resource(name="examResultServerImpl")
	private ExamResultServer examResultServer;
	
	
	private ExamResult examResult;
	
	private List<Paper> paperList;
	private Paper paper;
	private Integer id;
	private String grade;	//试题列表年级
	private String subject;	//试题列表 课程
	private Double score;		//用户答案
	
	/**
	 * 显示试卷列表页面
	 * 列出所有试卷
	 * @return
	 */
	@Override
	public String execute() throws Exception {
		return "index";
	}
	
	
	
	@Override
	public String save() {
		HttpSession  session = ServletActionContext.getRequest().getSession();
		PaperCart cart = (PaperCart) session.getAttribute("paperCart");
		if(cart==null){
			return "redirect:/admin/paper/item/1";
		}
		
		Paper p = cart.toPaper(cart);		//根据试题篮 生成试卷
		String grade = (String) session.getAttribute("grade");
		String subject = (String) session.getAttribute("subject");
				
		session.removeAttribute("paperCart");
		p.setCreateDate(new Date());
		p.setTitle(paper.getTitle());
		p.setAuther(paper.getAuther());
		p.setGrade(grade);
		p.setSubject(subject);
		paperService.save(p);
		return "toIndex";
	}
	
	@Override
	public String list() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(grade!=null && subject!=null){
			session.setAttribute("grade", grade);
			session.setAttribute("subject", subject);
			return "toIndex";
		}else{
			this.grade = (String) session.getAttribute("grade");
			this.subject = (String) session.getAttribute("subject");
			if(grade==null || subject==null){
				return "toIndex";
			}
		}
		
		paperList = paperService.findAllByGradeAndSubject(grade, subject);
		return super.list();
	}
	
	/**
	 * 根据Id 显示试卷
	 * @param id
	 * @return
	 */
	@Override
	public String show() {
		Paper paper = paperService.getById(id);
		if(paper==null){
			return "toIndex";
		}
		
		this.paper = problemService.showPaper(paper);
		return "show";
	}
	
	/**
	 * 显示带成绩 试卷页面
	 * 教师查看试卷
	 * @return
	 */
	public String checkPaper(){
		
		this.examResult = examResultServer.getById(id);
		this.paper = examResult.getExam().getPaper();
		//加载试题信息
		this.paper = problemService.showPaper(paper);
		
		String ans = examResult.getAns();
		//加载答案
		this.paper = problemService.setAnswer(paper, ans);
		
		
		return "checkPaper";
	}
	
	/**
	 * 设置成绩
	 * 
	 */
	public void setScore(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			this.examResult = examResultServer.getById(id);
			examResult.setScore(score);
			examResultServer.update(examResult);
			pw.println("success");
		} catch (Exception e) {
			e.printStackTrace();
			pw.println("error");
		}
		
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


	public List<Paper> getPaperList() {
		return paperList;
	}

	public void setPaperList(List<Paper> paperList) {
		this.paperList = paperList;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	public String getGrade() {
		return grade;
	}



	public void setGrade(String grade) {
		this.grade = grade;
	}



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public ExamResultServer getExamResultServer() {
		return examResultServer;
	}



	public void setExamResultServer(ExamResultServer examResultServer) {
		this.examResultServer = examResultServer;
	}







	public Double getScore() {
		return score;
	}



	public void setScore(Double score) {
		this.score = score;
	}



	public ExamResult getExamResult() {
		return examResult;
	}


	public void setExamResult(ExamResult examResult) {
		this.examResult = examResult;
	}
	
}
