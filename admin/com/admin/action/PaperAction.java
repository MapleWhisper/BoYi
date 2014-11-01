package com.admin.action;

import java.util.Date;
import java.util.List;

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
		
})
public class PaperAction extends BaseAction{
	@Resource(name="paperServiceImpl")
	private PaperService paperService;
	
	@Resource(name="problemServiceImpl")
	private ProblemService problemService;
	
	private List<Paper> paperList;
	private Paper paper;
	private Integer id;
	private String grade;	//试题列表年级
	private String subject;	//试题列表 课程
	
	
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
	
	
	
}
