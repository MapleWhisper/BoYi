package com.admin.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.po.Teacher;
import com.boyi.service.TeacherServer;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/teacher")
@Action(value="teacherAction",results={
		@Result(name="toIndex",type="redirectAction",location="teacherAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/teacher/teacher.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/teacher/addteacher.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/teacher/editTeacher.jsp"),
		
})
public class TeacherAction  extends BaseAction{
	@Resource(name="teacherServerImpl")
	private TeacherServer teacherServer;
	
	private Teacher teacher;
	private List<Teacher> teacherList;
	private Integer id;
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
			teacherServer.updata(t);
		}
		return super.update();
	}
	
	@Override
	public String delete() {
		teacherServer.delete(id);
		return super.delete();
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
	
	
	
	
	
}
