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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.stereotype.Controller;
@Entity
@Controller
public class Teacher implements Serializable {
	
	private int id;						//Id
	private String teacherId;				//教工号
	
	private String name;
	private String pic;
	//登录信息
	private String email;			//邮箱
	private String password;		//密码
	private boolean recommand;			//是否是推荐课程
	
	private Set<Classes> classes;	//所教课程
	private TeacherAccount account;		//

	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getId() {
		return id;
	}

	
	public void setId(int id) {
		this.id = id;
	}
	
	@OneToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE},mappedBy="teacher")
	public Set<Classes> getClasses() {
		return classes;
	}

	public void setClasses(Set<Classes> classes) {
		this.classes = classes;
	}

	@Column(length=20)
	public String getTeacherId() {
		return teacherId;
	}


	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
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

	@Column(length=20)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(length=200)
	public String getPic() {
		return pic;
	}


	public void setPic(String pic) {
		this.pic = pic;
	}


	public boolean isRecommand() {
		return recommand;
	}


	public void setRecommand(boolean recommand) {
		this.recommand = recommand;
	}

	
	@OneToOne(cascade={CascadeType.ALL},fetch=FetchType.EAGER,mappedBy="teacher")
	public TeacherAccount getAccount() {
		return account;
	}

	public void setAccount(TeacherAccount account) {
		this.account = account;
	}
	
	
}
