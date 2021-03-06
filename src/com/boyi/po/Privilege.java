package com.boyi.po;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Privilege implements Serializable{
	private Integer id;
	private String name;
	private String url;
	private Set<Admin> admins;
	
	public Privilege() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Privilege(String name, String url) {
		super();
		this.name = name;
		this.url = url;
	}



	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(unique=true)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@ManyToMany(mappedBy="privileges",cascade={CascadeType.PERSIST,CascadeType.MERGE})
	public Set<Admin> getAdmins() {
		return admins;
	}
	public void setAdmins(Set<Admin> admins) {
		this.admins = admins;
	}
	
	
}
