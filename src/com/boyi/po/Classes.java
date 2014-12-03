package com.boyi.po;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.boyi.enmu.ClassesStatus;

@Entity
@Component
public class Classes implements Serializable {
	
	private Integer id;					//id
	private String name;				//班级名称
	private Integer studentNumer;		//班级总人数
	private Integer curentNumber;		//当前人数
	
	private Date endDate;				//班级截止日期
	private Date beginDate;				//班级开始日期
	
	private String classTime;			//上课时间
	private String classType;			//班级类型
	
	private String classPlace;			//上课地点
	
	private int classPrice;				//课时价格
	private int teacherPrice;			//教师授课课时价格
	
	private String status;				//课程状态
	private String classDetail;			//班级详情
	
	private boolean recommand;			//是否是推荐课程
	
	private Set<Student> students;		//学生
	private Teacher teacher ; 			//老师
	private Course course;				//所属课程
	private Set<Exam> exams;			//考试
	
	private Set<ClassApply> classApplies;
	private Set<StudentResume> studentResumes;
	private Set<ClassRecord> classRecords;	//课程记录

	
	
	@ManyToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE},fetch=FetchType.EAGER)
	@JoinColumn(name="courseId")
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
	@Column(length=65536)
	public String getClassDetail() {
		return classDetail;
	}
	public void setClassDetail(String classDetail) {
		this.classDetail = classDetail;
	}
	
	public String getClassPlace() {
		return classPlace;
	}
	public void setClassPlace(String classPlace) {
		this.classPlace = classPlace;
	}
	public int getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(length=20)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getStudentNumer() {
		return studentNumer;
	}
	public void setStudentNumer(Integer studentNumer) {
		this.studentNumer = studentNumer;
	}
	
	@ManyToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE})
	@JoinColumn(name="teacherId")
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="classes",targetEntity=ClassApply.class)
	public Set<ClassApply> getClassApplies() {
		return classApplies;
	}
	public void setClassApplies(Set<ClassApply> classApplies) {
		this.classApplies = classApplies;
	}
	
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	
	@ManyToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE},mappedBy="classes")
	public Set<Student> getStudents() {
		return students;
	}
	public void setStudents(Set<Student> students) {
		this.students = students;
	}
	public Integer getCurentNumber() {
		return curentNumber;
	}
	public void setCurentNumber(Integer curentNumber) {
		this.curentNumber = curentNumber;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@OneToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE},mappedBy="classes")
	public Set<Exam> getExams() {
		return exams;
	}
	public void setExams(Set<Exam> exams) {
		this.exams = exams;
	}
	
	public boolean isRecommand() {
		return recommand;
	}
	public void setRecommand(boolean recommand) {
		this.recommand = recommand;
	}
	public int getTeacherPrice() {
		return teacherPrice;
	}
	public void setTeacherPrice(int teacherPrice) {
		this.teacherPrice = teacherPrice;
	}
	
	@OneToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE},mappedBy="classes")
	public Set<StudentResume> getStudentResumes() {
		return studentResumes;
	}
	public void setStudentResumes(Set<StudentResume> studentResumes) {
		this.studentResumes = studentResumes;
	}
	
	@OneToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE},mappedBy="classes")
	public Set<ClassRecord> getClassRecords() {
		return classRecords;
	}
	public void setClassRecords(Set<ClassRecord> classRecords) {
		this.classRecords = classRecords;
	}
	
	/**
	 * 检查课程状态
	 * @return	如果课程状态改变了，返回true
	 */
	public boolean checkStatus(){
		Long now = System.currentTimeMillis();
		String s = "";
		boolean flag =false;
		if(now < this.getBeginDate().getTime()){
			s=ClassesStatus.未开始.toString();
		}else if(now < this.getEndDate().getTime()){
			s=ClassesStatus.在读.toString();
		}else{
			s=ClassesStatus.已结束.toString();
		}
		flag = !s.equals(this.status);
		this.status = s;
		return flag;
	}
	
	
	
	
	

}
