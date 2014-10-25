package com.boyi.po;

import java.io.Serializable;
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
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Student implements Serializable{
	private Integer id;				//id
	private String password;		//密码
	private String name;			//姓名
	private String email;			//邮箱
	private String phoneNumber;	//手机号
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	@ManyToMany(cascade=CascadeType.ALL)
	@JoinTable(
			name="student_class",
			joinColumns=@JoinColumn(name="student_id"),
			inverseJoinColumns=@JoinColumn(name="class_id")
	)
	private Set<Classes>classes;
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="student")
	private Set<Score>scores;
	
	
	
	public Set<Score> getScores() {
		return scores;
	}
	public void setScores(Set<Score> scores) {
		this.scores = scores;
	}
	public Set<Classes> getClasses() {
		return classes;
	}
	public void setClasses(Set<Classes> classes) {
		this.classes = classes;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(unique=true)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
}
