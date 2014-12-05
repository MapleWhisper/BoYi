package com.admin.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyi.base.BaseAction;
import com.boyi.enmu.ClassApplyStatus;
import com.boyi.enmu.ClassesStatus;
import com.boyi.po.ClassApply;
import com.boyi.po.ClassRecord;
import com.boyi.po.Classes;
import com.boyi.po.Course;
import com.boyi.po.Student;
import com.boyi.po.StudentAccount;
import com.boyi.po.Teacher;
import com.boyi.service.ClassApplyService;
import com.boyi.service.ClassRecordService;
import com.boyi.service.ClassesServer;
import com.boyi.service.CourseServer;
import com.boyi.service.StudentAccountService;
import com.boyi.service.StudentService;
import com.boyi.service.TeacherServer;


@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/admin/classes")
@Action(value="classesAction",results={
		@Result(name="toIndex",type="redirectAction",location="classesAction"),
		@Result(name="toRecord",type="redirectAction",location="classesAction!showRecord"),
		@Result(name="toClasses",type="redirectAction",location="classesAction!show"),
		@Result(name="error",location="/WEB-INF/jsp/admin/error.jsp"),
		@Result(name="index",location="/WEB-INF/jsp/admin/classes/classes.jsp"),
		@Result(name="add",location="/WEB-INF/jsp/admin/classes/addClasses.jsp"),
		@Result(name="edit",location="/WEB-INF/jsp/admin/classes/editClasses.jsp"),
		@Result(name="show",location="/WEB-INF/jsp/admin/classes/showClasses.jsp"),
		@Result(name="showRecord",location="/WEB-INF/jsp/admin/classes/showRecord.jsp"),
		
})
public class ClassesAction extends BaseAction{
	
	@Resource(name="classesServerImpl")
	private ClassesServer classesServer;
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;
	
	@Resource(name="studentAccountServiceImpl")
	private StudentAccountService studentAccountService;
	
	@Resource(name="teacherServerImpl")
	private TeacherServer teacherServer;
	
	@Resource(name="courseServerImpl")
	private CourseServer courseServer;
	
	@Resource(name="classApplyServiceImpl")
	private ClassApplyService classApplyService;
	
	@Resource(name="classRecordServiceImpl")
	private ClassRecordService classRecordService;
	
	private List<Teacher> teacherList;
	private List<Course> courseList;
	private List<Classes> classesList;
	
	
	
	
	private Classes classes;
	private ClassRecord classRecord;
	
	private Integer teacherId;
	private Integer courseId;
	private String status;
	private Integer id;
	private Integer sId;	//学生Id

	private Integer tId;	//教师Id
	
	
	
	@Override
	public String execute() throws Exception {
		
		if(status ==null){
			this.status = "未开始";
		}
		this.classesList = classesServer.findAllByStatus(status);
		
		return "index";
	}
	
	@Override
	public String add() {
		this.teacherList = teacherServer.findAll();
		this.courseList = courseServer.findAll();
		
		return super.add();
	}
	
	@Override
	public String save() {
		Teacher t = teacherServer.getById(teacherId);
		Course c = courseServer.getById(courseId);
		this.classes.setTeacher(t);
		this.classes.setCourse(c);
		this.classes.checkStatus();	//检查当前课程状态
		
		classesServer.save(classes);
		return "toIndex";
	}
	
	@Override
	public String edit() {
		this.classes = classesServer.getById(id);
		
		this.courseId  = classes.getCourse().getId();
		this.teacherId = classes.getTeacher().getId();
		
		this.teacherList = teacherServer.findAll();
		this.courseList = courseServer.findAll();
		return "edit";
	}
	
	@Override
	public String update() {
		Classes c = classesServer.getById(id);
		c.setName(classes.getName());
		c.setBeginDate(classes.getBeginDate());
		c.setEndDate(classes.getEndDate());
		c.setClassDetail(classes.getClassDetail());
		c.setClassPlace(classes.getClassPlace());
		c.setClassPrice(classes.getClassPrice());
		c.setClassTime(classes.getClassTime());
		c.setClassType(classes.getClassType());
		c.setStudentNumber(classes.getStudentNumber());
		c.setRecommand(classes.isRecommand());
		Teacher t = teacherServer.getById(teacherId);
		Course c1 = courseServer.getById(courseId);
		c.setTeacher(t);
		c.setCourse(c1);
		
		c.checkStatus();
		classesServer.update(c);
		return super.update();
	}
	
	/**
	 * 显示课程详情
	 */
	@Override
	public String show() {
		if(id==null){
			id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("classesId");
		}
		classes = classesServer.getById(id);
		if(classes.checkStatus()){
			classesServer.update(classes);
		}
		
		return super.show();
	}
	
	/**
	 * 接受课程申请
	 * @return
	 */
	public String accept(){
		ClassApply apply = classApplyService.getById(id);
		if(!apply.getStatus().equals("待确认")){
			return "toIndex";
		}
		apply.setStatus(ClassApplyStatus.已完成.toString());
		
		
		//把学生加入班级
		Classes classes = apply.getClasses();
		classes.getStudents().add(apply.getStudent());
		Student stu = apply.getStudent();
		
		if(stu.getAccount()==null){
			StudentAccount account = new StudentAccount();
			account.setMoney(0);
			account.setStudent(stu);
			studentAccountService.save(account);
			
			stu.setAccount(account);
		}
		
		
		stu.getClasses().add(apply.getClasses());
		
		classesServer.update(classes);
		studentService.update(stu);
		classApplyService.update(apply);
		
		return "toIndex";
	}
	
	/**
	 * 签到
	 * @return
	 */
	public String sign(){
		this.classRecord = classRecordService.getById(id);
		ServletActionContext.getRequest().getSession().setAttribute("recordId", id);
		if(classRecord==null){
			setMeg("错误的记录Id");
			return "error";
		}
		Map<Integer,Boolean> records = classRecord.getRecords();
		if(sId!=null){
			if( records.get(sId)==true ){	//如果 学生 已经签到了
				return "toRecord";	//返回签到页
			}
		}
		if(tId!=null){
			if(  classRecord.isTrecord()){	//如果 老师 已经签到了
				return "toRecord";	//返回签到页
			}
		}
		
		Student stu = studentService.getById(sId);
		Teacher tea = teacherServer.getById(tId);
		if(stu!=null){
			if(!classRecordService.sign(classRecord,stu)){	//签到
				setMeg("签到失败，请联系管理员处理");
				return "error";
			}
		}
		if(tea!=null){
			if(!classRecordService.sign(classRecord,tea)){	//签到
				setMeg("签到失败，请联系管理员处理");
				return "error";
			}
		}
		
		return "toRecord";	//返回签到页
	}
	
	/**
	 * 拒绝课程申请
	 * @return
	 */
	public String refuse(){
		ClassApply apply = classApplyService.getById(id);
		if(!apply.getStatus().equals("待确认")){
			return "toIndex";
		}
		apply.setStatus(ClassApplyStatus.已拒绝.toString());
		classApplyService.update(apply);
		return "toIndex";
	}
	
	/**
	 * 显示课程记录
	 * @return
	 */
	public String showRecord(){
		if(id==null){
			id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("recordId");
		}
		this.classRecord = classRecordService.getById(id);
		
		this.classes = classRecord.getClasses();
		if(!classes.getStatus().equals(ClassesStatus.在读.toString())){
			setMeg("当前班级还没有开课，或者课程已经结束，不可以添加班级记录");
			return "error";
		}
		if(classRecord!=null){	//如果有该课程记录
			return "showRecord";
		}
		return "toRecord";
	}
	
	
	/**
	 * 
	 * 添加课程记录
	 * @return
	 */
	public String addRecord(){
		ServletActionContext.getRequest().getSession().setAttribute("classesId",id);
		
		this.classes = classesServer.getById(id);
		if(classes==null){
			return "toClasses";
		}
		ClassRecord record = new ClassRecord();
		record.setClasses(classes);
		record.setDate(new Date());
		record.setRecord("");
		record.setTrecord(false);
		if(!classRecordService.save1(record)){	//如果创建失败
			setMeg("今天已经创建课程记录了，创建失败！");
			return "error";
		}
		
		return "toClasses";
	}
	
	
	public List<Teacher> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<Teacher> teacherList) {
		this.teacherList = teacherList;
	}

	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public List<Classes> getClassesList() {
		return classesList;
	}

	public void setClassesList(List<Classes> classesList) {
		this.classesList = classesList;
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

	public ClassRecord getClassRecord() {
		return classRecord;
	}

	public void setClassRecord(ClassRecord classRecord) {
		this.classRecord = classRecord;
	}

	public Integer getSId() {
		return sId;
	}

	public void setSId(Integer sId) {
		this.sId = sId;
	}

	public Integer getTId() {
		return tId;
	}

	public void setTId(Integer tId) {
		this.tId = tId;
	}

	
	
	
	
	
}
