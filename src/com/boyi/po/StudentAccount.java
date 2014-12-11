package com.boyi.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;

import org.springframework.stereotype.Component;


@Entity
@Component
public class StudentAccount implements Serializable{
	private Integer id;				//Id
	private Student student;		//哪个学生
	private Integer money;			//账户余额
	private Set<StudentResume> resumes;	//消费记录
	
	public StudentAccount() {
		this.money = 0;
		resumes = new HashSet<StudentResume>();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@OneToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE},mappedBy="account")
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	public synchronized Integer getMoney() {
		return money;
	}
	public synchronized void setMoney(Integer money) {
		this.money = money;
	}
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="account",targetEntity=StudentResume.class)
	public Set<StudentResume> getResumes() {
		return resumes;
	}
	public void setResumes(Set<StudentResume> resumes) {
		this.resumes = resumes;
	}
	
	public  synchronized void add(int amount){
		if(money==null){
			money =0;
		}
		this.money +=amount;
	}
	public  synchronized void remove(int amount){
		if(money==null){
			money =0;
		}
		this.money -=amount;
	}
}
