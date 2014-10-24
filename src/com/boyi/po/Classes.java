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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
@Entity
@Component
public class Classes implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@Column(length=20)
	private String name;
	
	@Column
	private Integer studentNumer;
	
	@OneToOne(cascade=CascadeType.ALL,mappedBy="classes")
	private Teacher teacher ; 
	
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="classes")
	private Set<Paper> paper;
	
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date beginDate;
	
	@ManyToMany(cascade=CascadeType.ALL,mappedBy="classes")
	private Set<Student> students;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="course_id")
	private Course course;
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="classes")
	private Set<Score>scores;
	
	@Column
	private String classType;
	
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date classTime;
	
	@Column
	private String classPlace;
	
	@Column
	private int classPrice;
	
	private String classDetail;
	
	
	
	public String getClassDetail() {
		return classDetail;
	}
	public void setClassDetail(String classDetail) {
		this.classDetail = classDetail;
	}
	public Date getClassTime() {
		return classTime;
	}
	public void setClassTime(Date classTime) {
		this.classTime = classTime;
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
	public Set<Score> getScores() {
		return scores;
	}
	public void setScores(Set<Score> scores) {
		this.scores = scores;
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Integer getStudentNumer() {
		return studentNumer;
	}
	public void setStudentNumer(Integer studentNumer) {
		this.studentNumer = studentNumer;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Set<Paper> getPaper() {
		return paper;
	}
	public void setPaper(Set<Paper> paper) {
		this.paper = paper;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	
	public Set<Student> getStudents() {
		return students;
	}
	public void setStudents(Set<Student> students) {
		this.students = students;
	}
	

}
