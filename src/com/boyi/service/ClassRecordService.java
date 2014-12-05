package com.boyi.service;


import com.boyi.base.BaseServer;
import com.boyi.po.ClassRecord;
import com.boyi.po.Student;
import com.boyi.po.Teacher;

public interface ClassRecordService extends BaseServer<ClassRecord>{
	@Override
	public ClassRecord getById(Integer id);

	public boolean sign(ClassRecord classRecord, Student stu);
	public boolean sign(ClassRecord classRecord, Teacher tea);
	
	@Override
	public void save(ClassRecord entry);
	
	public boolean save1(ClassRecord entry);
}
