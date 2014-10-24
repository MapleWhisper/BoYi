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

import com.admin.server.ProblemService;
import com.boyi.base.BaseAction;
import com.boyi.po.Problem;
import com.boyi.utils.Page;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/problem")
@Action(value="problemAction",results={
		@Result(name="toIndex",type="redirectAction",location="problemAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/problem/problem.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/problem/addProblem.jsp"),
		@Result(name="list",location="/WEB-INF/jsp/admin/problem/problemList.jsp"),
		
})
public class ProblemAction extends BaseAction{
	
	private Problem problem;
	private int cur;		//试题列表当前页数
	private String grade;	//试题列表年级
	private String subject;	//试题列表 课程
	
	private List<Problem> problemList;
	private Page page;
	
	@Resource(name="problemServiceImpl")
	private ProblemService problemService;
	
	
	@Override
	public String execute() throws Exception {
		return "index";
	}
	@Override
	public String add() {
		
		return "add";
	}
	
	@Override
	public String save() {
		problem.setCreateDate(new Date());
		problemService.save(problem);
		return "toIndex";
	}
	 
	
	public String list(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		System.out.println(grade);
		System.out.println(subject);
		if(grade!=null && subject!=null){
			session.setAttribute("grade", grade);
			session.setAttribute("subject", subject);
		}else{
			this.grade = (String) session.getAttribute("grade");
			this.subject = (String) session.getAttribute("subject");
			if(grade==null || subject==null){
				return "toIndex";
			}
		}
		Page page = new Page();
		page.setAmount(10);		//每页页数
		page.setCur(cur);									//当前第几页
		page.setSum( problemService.getMaxPageNum(page,grade,subject));			//一共多少页
		List<Problem> problemList = problemService.findAllByGradeAndSubject(page,grade,subject);	//数据
		this.problemList = problemList;
		this.page = page;
		
		return "list";
	}
	 

	public Problem getProblem() {
		return problem;
	}
	public void setProblem(Problem problem) {
		this.problem = problem;
	}
	public ProblemService getProblemService() {
		return problemService;
	}
	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}
	public int getCur() {
		return cur;
	}
	public void setCur(int cur) {
		this.cur = cur;
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
	public List<Problem> getProblemList() {
		return problemList;
	}
	public void setProblemList(List<Problem> problemList) {
		this.problemList = problemList;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
	 
}
