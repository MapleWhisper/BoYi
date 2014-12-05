package com.admin.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.po.Student;
import com.boyi.po.Teacher;
import com.boyi.po.TeacherResume;
import com.boyi.service.TeacherAccountService;
import com.boyi.service.TeacherServer;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/teacher")
@Action(value="teacherAction",results={
		@Result(name="toIndex",type="redirectAction",location="teacherAction"),
		@Result(name="toShow",type="redirectAction",location="teacherAction!show"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/teacher/teacher.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/teacher/addteacher.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/teacher/editTeacher.jsp"),
		@Result(name="show",location="/WEB-INF/jsp/admin/teacher/showTeacher.jsp"),

})
public class TeacherAction  extends BaseAction{
	@Resource(name="teacherServerImpl")
	private TeacherServer teacherServer;

	@Resource(name="teacherAccountServiceImpl")
	private TeacherAccountService teacherAccountService;

	private Teacher teacher;
	private List<Teacher> teacherList;
	private Integer id;

	private TeacherResume resume;
	@Override
	public String execute() throws Exception {
		this.teacherList = teacherServer.findAll();
		return "index";
	}

	@Override
	public String add() {
		return super.add();
	}

	@Override
	public String save() {
		teacherServer.save(teacher);
		return super.save();
	}

	@Override
	public String edit() {
		this.teacher = teacherServer.getById(id);
		return super.edit();
	}

	@Override
	public String update() {
		Teacher t = teacherServer.getById(teacher.getId());
		if(t!=null){
			t.setEmail(teacher.getEmail());
			t.setName(teacher.getName());
			t.setPassword(teacher.getPassword());
			t.setTeacherId(teacher.getTeacherId());
			t.setRecommand(teacher.isRecommand());
			teacherServer.update(t);
		}
		return super.update();
	}

	@Override
	public String delete() {
		teacherServer.delete(id);
		return super.delete();
	}

	@Override
	public String show() {
		if(id==null){
			id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("teaId");
			if(id==null){
				return "toIndex";
			}
		}
		this.teacher  = teacherServer.getById(id);

		return super.show();
	}


	/**
	 * 充值
	 */
	public String pay(){
		Teacher tea = teacherServer.getById(id);

		if(resume.getAmount()==null || resume.getAmount()<=0 || resume.getNote()==null || tea==null){
			setMeg("充值失败!<br>可能原因:<br>1.充值金额为空或者为负数<br>2.备注为空<br>");
			return "error";
		}
		ServletActionContext.getRequest().getSession().setAttribute("teaId", id);
		teacherAccountService.add(resume, tea);
		return "toShow";
	}

	/**
	 * 发工资
	 * @return
	 */
	public String remove(){
		Teacher tea = teacherServer.getById(id);

		if(resume.getAmount()==null || resume.getAmount()<=0 || resume.getNote()==null || tea==null){
			setMeg("扣除工资失败!<br>可能原因:<br>1.扣除工资为空或者为负数<br>2.备注为空<br>");
			return "error";
		}
		if(resume.getAmount()>tea.getAccount().getMoney()){		//如果要取得钱比余额多，报错
			setMeg("扣除工资失败！<br>教师账户余额不足!");
			return "error";
		}
		ServletActionContext.getRequest().getSession().setAttribute("teaId", id);
		teacherAccountService.remove(resume, tea);
		return "toShow";
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TeacherServer getTeacherServer() {
		return teacherServer;
	}

	public void setTeacherServer(TeacherServer teacherServer) {
		this.teacherServer = teacherServer;
	}

	public List<Teacher> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<Teacher> teacherList) {
		this.teacherList = teacherList;
	}

	public TeacherResume getResume() {
		return resume;
	}

	public void setResume(TeacherResume resume) {
		this.resume = resume;
	}





}
