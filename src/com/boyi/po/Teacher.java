package com.boyi.po;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.stereotype.Controller;
@Entity
@Controller
public class Teacher implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="class_id")
	private Classes classes;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	
	
	
}
