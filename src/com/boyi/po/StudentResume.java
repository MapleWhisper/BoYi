package com.boyi.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.boyi.enmu.ResumeType;

@Entity
@Component
public class StudentResume implements Serializable{
	private Integer id;
	private String type;		//存钱，取钱
	private Integer amount;		//存钱，扣钱的数量
	private Date tradeDate;		//交易日期
	private Integer additionAmount;	//附加费
	
	private String note;		//备注
	
	private Classes classes;	//交易课程
	private StudentAccount account;		//交易账户
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	public Date getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(Date tradeDate) {
		this.tradeDate = tradeDate;
	}
	
	
	public Integer getAdditionAmount() {
		return additionAmount;
	}
	public void setAdditionAmount(Integer additionAmount) {
		this.additionAmount = additionAmount;
	}
	
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	@ManyToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE})
	@JoinColumn(name="classesId")
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	
	@ManyToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE})
	@JoinColumn(name="accountId")
	public StudentAccount getAccount() {
		return account;
	}
	public void setAccount(StudentAccount account) {
		this.account = account;
	}
	
	
	
	
	
	 
}
