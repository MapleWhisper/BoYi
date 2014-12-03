package com.boyi.po;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.alibaba.druid.support.json.JSONParser;
import com.alibaba.fastjson.JSON;

/**
 * 班级记录，用来每日打卡
 * @author 广路
 *
 */
@Entity
@Component
public class ClassRecord {
	
	private Integer id;
	private Classes classes;
	
	private Date date;
	
	private String record;
	
	private Map<Integer, Boolean> records;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE})
	@JoinColumn(name="classesId")
	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}
	
	@SuppressWarnings("unchecked")
	@Transient
	public Map<Integer, Boolean> getRecords() {
		if(this.records == null){
			if(this.record==null || this.record.length()==0){
				records = new HashMap<Integer,Boolean>();
			}else{
				records =  JSON.parseObject(record, HashMap.class);
			}
			
		}
		return records;
	}

	public void setRecords(Map<Integer, Boolean> records) {
		this.records = records;
	}

	/**
	 * 将Map转化为字符串，存储到数据库
	 */
	public void store(){
		if(this.records!=null){
			String r = JSON.toJSONString(records);
			this.record = r;
		}
	}
	
	
	
}
