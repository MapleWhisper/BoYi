package com.boyi.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.stereotype.Component;


@Entity
@Component
public class TeacherAccount implements Serializable{
	private Integer id;				//Id
	private Teacher teacher;		//哪个老师
	private Integer money;			//账户余额
	private Set<TeacherResume> resumes;	//消费记录
	
	public TeacherAccount() {
		resumes = new HashSet<TeacherResume>();
	}
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@OneToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE})
	@JoinColumn(name="teacherId")
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	
	public synchronized Integer getMoney() {
		return money;
	}
	
	public synchronized void setMoney(Integer money) {
		this.money = money;
	}
	
	
	public  synchronized void add(int amount){
		if(money==null){
			money=0;
		}
		this.money +=amount;
	}
	
	public  synchronized void remove(int amount){
		if(money==null){
			money=0;
		}
		this.money -=amount;
	}
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="account",targetEntity=TeacherResume.class)
	public Set<TeacherResume> getResumes() {
		return resumes;
	}
	public void setResumes(Set<TeacherResume> resumes) {
		this.resumes = resumes;
	}
}
