package com.admin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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

import com.admin.util.ImageUtil;
import com.boyi.base.BaseAction;
import com.boyi.po.Classes;
import com.boyi.po.Exam;
import com.boyi.po.Teacher;
import com.boyi.service.ClassesServer;
import com.boyi.service.ExamServer;
import com.boyi.service.TeacherServer;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/teacherCenter")
@Action(value="teacherCenterAction",results={
		@Result(name="toIndex",type="redirectAction",location="teacherCenterAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/teacherCenter/teacherCenter.jsp"),
		@Result(name="showClasses",location="/WEB-INF/jsp/admin/teacherCenter/showClasses.jsp"),
		@Result(name="showResult",location="/WEB-INF/jsp/admin/teacherCenter/showResult.jsp"),
		
})
public class TeacherCenterAction  extends BaseAction{
	@Resource(name="teacherServerImpl")
	private TeacherServer teacherServer;
	
	@Resource(name="classesServerImpl")
	private ClassesServer classesServer;
	
	@Resource(name="examServerImpl")
	private ExamServer examServer;
	
	private List<Teacher> teacherList;
	private Exam exam;
	
	private Teacher teacher;
	private Classes classes;
	
	private File pic;
	private String picFileName;
	private String picContentType;
	
	private Integer id;
	
	
	@Override
	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		this.teacher = (Teacher) session.getAttribute("teacher");
		//临时代码
		if(teacher ==null ){
			teacher = new Teacher();
			teacher.setId(1);
		}
		//临时代码
		this.teacher = teacherServer.getById(teacher.getId());
		
		return "index";
	}
	
	public String addPic(){
		this.teacher = teacherServer.getById(id);
		System.out.println(id);
		System.out.println(picFileName);
		System.out.println(picContentType);
		System.out.println(pic.length());
		if(teacher==null){
			return "toIndex";
		}
		String path = "image/teacher/pic/"+id+picFileName.substring(picFileName.lastIndexOf("."));
		try {
			if(ImageUtil.savaPic(ServletActionContext.getServletContext(), new FileInputStream(pic), path, pic.length())){
				teacher.setPic(path);
				teacherServer.update(teacher);
				return "toIndex";
			}else{
				meg = "图片上传出错";
				return "error";
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			meg = "图片上传出错";
			return "error";
			
		}
	}
	
	@Override
	public String update() {
		Teacher t = teacherServer.getById(id);
		if(t!=null){
			t.setEmail(teacher.getEmail());
			t.setName(teacher.getName());
			teacherServer.update(t);
		}
		return super.update();
	}
	
	public String showClasses(){
		this.classes = classesServer.getById(id);
		return "showClasses";
	}
	
	public String showResult(){
		this.exam = examServer.getById(id);
		
		return "showResult";
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


	public ClassesServer getClassesServer() {
		return classesServer;
	}


	public void setClassesServer(ClassesServer classesServer) {
		this.classesServer = classesServer;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public ExamServer getExamServer() {
		return examServer;
	}

	public void setExamServer(ExamServer examServer) {
		this.examServer = examServer;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getMeg() {
		return meg;
	}

	public void setMeg(String meg) {
		this.meg = meg;
	}

	public String getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	public String getPicContentType() {
		return picContentType;
	}

	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}


	
	
	
	
}
