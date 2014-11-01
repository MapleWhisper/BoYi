package com.admin.action;

import java.io.IOException;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.boyi.base.BaseAction;
import com.boyi.po.Problem;
import com.boyi.service.ProblemService;
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
		@Result(name="toAdd",type="redirectAction",location="problemAction!add"),
		@Result(name="list",location="/WEB-INF/jsp/admin/problem/problemList.jsp"),
		
})
public class ProblemAction extends BaseAction{
	
	private Problem problem;
	private int cur;		//试题列表当前页数
	private String grade;	//试题列表年级
	private String subject;	//试题列表 课程
	
	private List<Problem> problemList;
	
	private Page page;
	private String key;
	private Integer id;
	
	
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
		return "toAdd";
	}
	 
	
	public String list(){
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
		Page page = new Page();
		page.setAmount(10);		//每页页数
		page.setCur(cur);									//当前第几页
		page.setSum( problemService.getMaxPageNum(page,grade,subject));			//一共多少页
		List<Problem> problemList = problemService.findAllByGradeAndSubject(page,grade,subject);	//数据
		this.problemList = problemList;
		this.page = page;
		
		return "list";
	}
	
	/**
	 * 根据关键字 搜索试题
	 * @param key
	 * @param response
	 */
	@RequestMapping("/problem/search/json")
	public void search(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		List<Problem> problemList =  problemService.search(key);
		String list = JSON.toJSONString(problemList);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().println(list);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改试题
	 * @param problem
	 * @throws IOException 
	 */
	public String update()  {
		HttpServletResponse response = ServletActionContext.getResponse();
		Problem p = problemService.getById(problem.getId());
		response.setContentType("application/json");
		if(p!=null){
			p.setTitle(problem.getTitle());
			p.setOptA(problem.getOptA());
			p.setOptB(problem.getOptB());
			p.setOptC(problem.getOptC());
			p.setOptD(problem.getOptD());
			p.setAnswer(problem.getAnswer());
			problemService.updata(p);
			try {
				response.getWriter().println("{\"mes\":\"success\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			try {
				response.getWriter().println("{\"mes\":\"error\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
		
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
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	 
}
