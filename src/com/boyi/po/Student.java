package com.boyi.po;

import java.io.Serializable;
import java.text.SimpleDateFormat;
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Entity
@Component
public class Student implements Serializable{
	private Integer id;				//id
	private String name;			//姓名
	private String studentId;		//学号
	
	//登录信息
	private String email;			//邮箱
	private String password;		//密码
	private Date birth;				//出生日期
	private String studentType;		//学生类型，初中高中大学专职培训
	
	
	//个人信息
	private String city;			//城市
	private String picPath;			//头像路径
	private	String phoneNumber;		//手机号
	private String school;			//所属学校
	private String schoolTime;			//入学年月
	private String idNumber;		//身份证号
	private String age;				//年龄
	private String sex;				//性别
	private String parentName;		//父母姓名
	private String parentPhoneNumber;		//父母手机号
	
	private StudentAccount account;	//学生账户
	
	private Set<ExamResult> examResults;	//学生成绩
	private Set<Classes> classes;	//所报课程
	
	
	private Set<ClassApply> classApplys; 
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Column(nullable=true)
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE})
	@JoinTable(
			name="student_classes",
			joinColumns=@JoinColumn(name="student_id"),
			inverseJoinColumns=@JoinColumn(name="classes_id")
	)
	public Set<Classes> getClasses() {
		return classes;
	}
	public void setClasses(Set<Classes> classes) {
		this.classes = classes;
	}
	
	@Column(length=20)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(length=20)
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
	
	@Column(length=11)
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	@Column(length=20)
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	
	@Column(length=20)
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(length=200)
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	
	
	@Column(length=40)
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	@Column(length=10)
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	@Column(length=10)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	
	@Column(length=11)
	public String getParentPhoneNumber() {
		return parentPhoneNumber;
	}
	public void setParentPhoneNumber(String parentPhoneNumber) {
		this.parentPhoneNumber = parentPhoneNumber;
	}
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="student")
	public Set<ClassApply> getClassApplys() {
		return classApplys;
	}
	public void setClassApplys(Set<ClassApply> classApplys) {
		this.classApplys = classApplys;
	}
	
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="student")
	public Set<ExamResult> getExamResults() {
		return examResults;
	}
	public void setExamResults(Set<ExamResult> examResults) {
		this.examResults = examResults;
	}
	
	@OneToOne(cascade={CascadeType.ALL},fetch=FetchType.EAGER)
	@JoinColumn(name="accountId")
	public StudentAccount getAccount() {
		return account;
	}
	public void setAccount(StudentAccount studentAccount) {
		this.account = studentAccount;
	}
	
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getSchoolTime() {
		return schoolTime;
	}
	public void setSchoolTime(String schoolTime) {
		this.schoolTime = schoolTime;
	}
	
	
	public String getStudentType() {
		return studentType;
	}
	public void setStudentType(String studentType) {
		this.studentType = studentType;
	}
	
	public void createStudentId(){
		String id = "";
		id+=studentType;
		id+=(this.sex.equals("男")?"M":"F");
		id+=schoolTime;
		SimpleDateFormat dateFormat = new SimpleDateFormat("HHmmss");
		id+=dateFormat.format(new Date());
		System.out.println(id);
		this.studentId = id;
	}
	
	
	
	
}
