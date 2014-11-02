package com.admin.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.enmu.ExamStatus;
import com.boyi.po.Classes;
import com.boyi.po.Exam;
import com.boyi.po.Paper;
import com.boyi.service.ClassesServer;
import com.boyi.service.ExamServer;
import com.boyi.service.PaperService;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/exam")
@Action(value="examAction",results={
		@Result(name="toIndex",type="redirectAction",location="examAction"),
		@Result(name="error",location="/WEB-INF/jsp/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/exam/exam.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/exam/addExam.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/exam/editExam.jsp"),
		
})
public class ExamAction extends BaseAction{
	
	@Resource(name="classesServerImpl")
	private ClassesServer classesServer;
	
	@Resource(name="paperServiceImpl")
	private PaperService paperService;
	

	@Resource(name="examServerImpl")
	private ExamServer examServer;
	
	
	private List<Exam> examList;
	private List<Classes> classesList;
	private List<Paper> paperList;
	private Exam exam;
	private Integer paperId;
	
	
	private Integer classesId;
	
	private String status;
	private Integer id;
	
	@Override
	public String execute() throws Exception {
		if(status == null){
			this.status = "未开始";
		}
		this.examList = examServer.findAll();
		
		return "index";
	}
	
	@Override
	public String add() {
		this.classesList = classesServer.findAll();
		this.paperList = paperService.findAll();
		return super.add();
	}
	
	@Override
	public String save() {
		
		Classes c = classesServer.getById(classesId);
		Paper p = paperService.getById(paperId);
		if( new Date().getTime() <  exam.getBeginTime().getTime() ){
			
			exam.setStatus(ExamStatus.未开始.toString());
			
		}else if(new Date().getTime() <  exam.getEndTime().getTime()){
			exam.setStatus(ExamStatus.正在考试.toString());
		}else{
			exam.setStatus(ExamStatus.已结束.toString());
		}
		exam.setClasses(c);
		exam.setPaper(p);
		examServer.save(exam);
		
		return "toIndex";
	}
	
	@Override
	public String edit() {
		return "edit";
	}
	
	@Override
	public String update() {
		return super.update();
	}

	public ClassesServer getClassesServer() {
		return classesServer;
	}

	public void setClassesServer(ClassesServer classesServer) {
		this.classesServer = classesServer;
	}

	public PaperService getPaperService() {
		return paperService;
	}

	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}


	public List<Exam> getExamList() {
		return examList;
	}

	public void setExamList(List<Exam> examList) {
		this.examList = examList;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ExamServer getExamServer() {
		return examServer;
	}

	public void setExamServer(ExamServer examServer) {
		this.examServer = examServer;
	}

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public Integer getClassesId() {
		return classesId;
	}

	public void setClassesId(Integer classesId) {
		this.classesId = classesId;
	}

	public List<Classes> getClassesList() {
		return classesList;
	}

	public void setClassesList(List<Classes> classesList) {
		this.classesList = classesList;
	}

	public List<Paper> getPaperList() {
		return paperList;
	}

	public void setPaperList(List<Paper> paperList) {
		this.paperList = paperList;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}
	
	
	
	
	
	
	
}
