package com.admin.action;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.admin.server.ProblemService;
import com.boyi.base.BaseAction;
import com.boyi.po.Problem;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/problem")
@Action(value="problemAction",results={
		@Result(name="toIndex",type="redirectAction",location="problemAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/problem/problem.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/problem/addProblem.jsp"),
		
})
public class ProblemAction extends BaseAction{
	
	private Problem problem;
	
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
	 
	 
}
