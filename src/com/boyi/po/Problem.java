package com.boyi.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Entity
@Component
public class Problem implements Serializable{
	private Integer id;			//id
	private String title;		//题目
	private String optA;		//选项A
	private String optB;		//选项B
	private String optC;		//选项C
	private String optD;		//选项D
	private String type;		//题目类型	单选，多选，判断题，简答题
	private String answer;			//答案		问题答案
	private String difficulty;	//题目难度	简单，中等， 困难
	private String label;		//题目标签  	便于搜索
	private Date createDate;	//入库试卷
	private String userAns;	//用户答题答案
	
	private String grade;		//试题年级
	private String subject;		//所属课程
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(length=65535)
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(length=200)
	public String getOptA() {
		return optA;
	}
	public void setOptA(String optA) {
		this.optA = optA;
	}
	@Column(length=200)
	public String getOptB() {
		return optB;
	}
	public void setOptB(String optB) {
		this.optB = optB;
	}
	@Column(length=200)
	public String getOptC() {
		return optC;
	}
	public void setOptC(String optC) {
		this.optC = optC;
	}
	@Column(length=200)
	public String getOptD() {
		return optD;
	}
	public void setOptD(String optD) {
		this.optD = optD;
	}
	@Column(length=200)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(length=500)
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Column(length=200)
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	@Column(length=200)
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	

	@Transient
	public String getUserAns() {
		return userAns;
	}
	public void setUserAns(String userAns) {
		this.userAns = userAns;
	}		//用户答案
	
	@Column(length=20)
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Column(length=20)
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
	
	
	
}
