package com.boyi.po;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.stereotype.Component;
@Entity
@Component
public class Score implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;

	@Column
	private String name;
	
	@Column
	private String grade;
	
	@Column//小学 初中 高中
	private String gradeId;		//1 2 3 4 5 6
	
	@Column
	private String subject;		//科目 	
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="class_id")
	private Classes classes;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="student_id")
	private Student student;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="paper_id")
	private Paper paper;
	
	
	
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	
	
}
