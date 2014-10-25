package com.admin.action;

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
import com.admin.server.ProblemService;
import com.boyi.base.BaseAction;
import com.boyi.po.Problem;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/problem")
@Action(value="paperCartAction",results={
		@Result(name="toIndex",type="redirectAction",location="paperCartAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/problem/paperCart.jsp"),
		
})
public class PaperCartAction extends BaseAction{
	@Resource(name= "problemServiceImpl")
	private ProblemService problemService;
	
	private List<Problem> singles ;
	private List<Problem> multChoices ;
	private List<Problem> judges ;
	private List<Problem> questions;
	
	private String action;
	private Integer id;
	
	/**
	 * 跳转到试卷篮页面
	 * @return
	 */
	public String execute(){
		HttpSession  session = ServletActionContext.getRequest().getSession();
		
		PaperCart cart = (PaperCart) session.getAttribute("paperCart");
		if(cart==null){		//	如果试卷篮为空，创建 添加到session
			cart = new PaperCart();
			session.setAttribute("paperCart", cart);
		}
		
		//取出Session中的试题列表，显示出试卷页面
		singles = problemService.getByIds(  cart.toArray(cart.getSingles()) );
		multChoices = problemService.getByIds(  cart.toArray(cart.getMultChoices()) );
		judges = problemService.getByIds( cart.toArray(cart.getJudges()) );
		questions = problemService.getByIds( cart.toArray(cart.getQuestions()));
		
		return "index";
	}
	
	/**
	 * 试卷篮操作	基于ajax
	 * @param action
	 * @param id
	 * @param session
	 */
	public void opera(){
		HttpSession  session = ServletActionContext.getRequest().getSession();
		PaperCart cart = (PaperCart) session.getAttribute("paperCart");
		if(cart==null){		//	如果试卷篮为空，创建 添加到session
			cart = new PaperCart();
			session.setAttribute("paperCart", cart);
		}
		Problem problem = problemService.getById(id);
		if(problem == null){	//	如果试题为空，返回
			return ;
		}
		if("add".equals(action)){	//	如果为添加试卷
			cart.add(problem);
		} 
		if("remove".equals(action)){
			cart.remove(problem);
		}
		session.setAttribute("paperCart", cart);
		return ;
	}

	
	
	
	
	
	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}

	public List<Problem> getSingles() {
		return singles;
	}

	public void setSingles(List<Problem> singles) {
		this.singles = singles;
	}

	public List<Problem> getMultChoices() {
		return multChoices;
	}

	public void setMultChoices(List<Problem> multChoices) {
		this.multChoices = multChoices;
	}

	public List<Problem> getJudges() {
		return judges;
	}

	public void setJudges(List<Problem> judges) {
		this.judges = judges;
	}

	public List<Problem> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Problem> questions) {
		this.questions = questions;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
	
	
	

}
