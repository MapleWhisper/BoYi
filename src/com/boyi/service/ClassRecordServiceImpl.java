package com.boyi.service;

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

@Service
@Transactional
public class ClassRecordServiceImpl extends BaseServerImpl<ClassRecord> implements ClassRecordService{
	
	@Resource(name="studentAccountServiceImpl")
	private StudentAccountService studentAccountService;
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
				this.updata(classRecord);
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
			Classes classes = classRecord.getClasses();
			
			records.put(stu.getId(), true);	//把学生记录改为签到
			classRecord.store();//	Map 转化成 字符串
			
			StudentResume resume = new StudentResume();		//记录日志		
			resume.setTradeDate(new Date());
			resume.setAccount(account);
			resume.setAmount(0-classes.getClassPrice());
			resume.setClasses(classes);
			resume.setType(ResumeType.扣费.toString());
			account.getResumes().add(resume);
			account.remove(classes.getClassPrice());	//扣钱
			studentAccountService.updata(account);		//保存扣费日志 和 余额
			
			
			this.save(classRecord);		//修改是否签到
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
