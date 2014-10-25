package com.boyi.po;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.stereotype.Component;
@Entity
@Component

public class Course implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="course")
	private Set<Classes>classes;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Set<Classes> getClasses() {
		return classes;
	}
	public void setClasses(Set<Classes> classes) {
		this.classes = classes;
	}
	

}
