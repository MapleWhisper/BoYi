package com.boyi.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServerImpl;
import com.boyi.enmu.ResumeType;
import com.boyi.po.ClassRecord;
import com.boyi.po.Classes;
import com.boyi.po.Student;
import com.boyi.po.StudentAccount;
import com.boyi.po.StudentResume;
import com.boyi.po.Teacher;
import com.boyi.po.TeacherAccount;
import com.boyi.po.TeacherResume;
import com.boyi.service.ClassRecordService;
import com.boyi.service.StudentAccountService;
import com.boyi.service.TeacherAccountService;

@Service
@Transactional
public class ClassRecordServiceImpl extends BaseServerImpl<ClassRecord> implements ClassRecordService{
	
	@Resource(name="studentAccountServiceImpl")
	private StudentAccountService studentAccountService;
	
	@Resource(name="teacherAccountServiceImpl")
	private TeacherAccountService teacherAccountService;
	@Override
	public ClassRecord getById(Integer id) {
		
		ClassRecord classRecord = super.getById(id);
		if(classRecord!=null){	//如果有该课程记录
			
			Map<Integer,Boolean> records = classRecord.getRecords();
			Set<Student> students = classRecord.getClasses().getStudents();
			if(records.size()!=students.size()){		//如果记录数和 学生总数不一致
				for(Student s :students){
					if(!records.containsKey(s.getId())){	//如果没有改学生的记录，就把学生添加到记录中
						records.put(s.getId(), false);
					}
				}
				classRecord.store();
				this.update(classRecord);
			}
			
		}
		return classRecord;
	}
	
	/**
	 * 签到，给指定的学生签到
	 */
	@Override
	public boolean sign(ClassRecord classRecord, Student stu) {
		boolean flag = false;
		Map<Integer,Boolean> records = classRecord.getRecords();
		try {
			
			StudentAccount account = stu.getAccount();
			System.out.println(account.getStudent().getName());
			
			Classes classes = classRecord.getClasses();
			
			
			StudentResume resume = new StudentResume();		//记录日志		
			resume.setTradeDate(new Date());
			resume.setAccount(account);
			resume.setAmount(0-classes.getClassPrice());
			resume.setClasses(classes);
			resume.setType(ResumeType.扣费.toString());
			account.getResumes().add(resume);
			account.remove(classes.getClassPrice());	//扣钱
			studentAccountService.update(account);		//保存扣费日志 和 余额
			
			records.put(stu.getId(), true);	//把学生记录改为签到
			classRecord.store();//	Map 转化成 字符串
			this.update(classRecord);		//修改是否签到
			flag = true;
			
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		
		return flag;
	}
	
	/**
	 * 签到，给指定的老师签到
	 */
	@Override
	public boolean sign(ClassRecord classRecord, Teacher tea) {
		boolean flag = false;
		try {
			
			TeacherAccount account = tea.getAccount();
			if(account==null){					//如果教师的账户为空，那么给教师生成账号
				account = new TeacherAccount();
				account.setTeacher(tea);
				account.setMoney(0);
				tea.setAccount(account);
				teacherAccountService.save(account);
			}
			
			Classes classes = classRecord.getClasses();
			
			
			TeacherResume resume = new TeacherResume();		//记录日志		
			resume.setTradeDate(new Date());
			resume.setAccount(account);
			resume.setAmount(classes.getClassPrice());
			resume.setClasses(classes);
			resume.setType(ResumeType.存入.toString());
			account.getResumes().add(resume);
			account.add(classes.getClassPrice());	//给教师加钱
			teacherAccountService.update(account);		//保存扣费日志 和 余额
			
			classRecord.setTrecord(true);	//把教师记录改为签到
			this.update(classRecord);		//修改是否签到
			flag = true;
			
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	@Override
	public void save(ClassRecord entry) {

		this.save1(entry);
	}
	
	/**
	 * 
	 * 创建课程记录
	 */
	@Override
	public boolean save1(ClassRecord entry) {

		String hql = "from ClassRecord c where c.classes= ? and c.date >=? and c.date <? ";
		Calendar start = Calendar.getInstance();
		Calendar end = (Calendar) start.clone();
		end.add(Calendar.DAY_OF_MONTH, 1);
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		@SuppressWarnings("rawtypes")
		List list = getSession().createQuery(hql).
				setParameter(0, entry.getClasses()).
				setString(1,fm.format(start.getTime())).
				setString(2, fm.format(end.getTime())).
				list();
		System.out.println(list.size());
		if(list.size()>=1){
			System.out.println("创建失败，今天已经创建过记录了");
			return false;
		}
		super.save(entry);
		return true;
	}
	
}
