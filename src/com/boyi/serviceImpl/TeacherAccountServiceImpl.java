
package com.boyi.serviceImpl;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.boyi.base.BaseServerImpl;
import com.boyi.enmu.ResumeType;
import com.boyi.po.Teacher;
import com.boyi.po.TeacherAccount;
import com.boyi.po.TeacherResume;
import com.boyi.service.TeacherAccountService;
import com.boyi.service.TeacherServer;
import com.boyi.utils.BoYiUtils;


/**
 * 学生账户服务类
 * 
 * @author 于广路
 *
 */
@Service()
@Transactional
public class TeacherAccountServiceImpl extends BaseServerImpl<TeacherAccount> implements TeacherAccountService{
	
	@Resource(name="teacherServerImpl")
	private TeacherServer teacherServer;
	/**
	 * 
	 * 存钱
	 */
	public boolean add(TeacherResume resume,Teacher teacher) {
		try {
			TeacherAccount account = teacher.getAccount();
			if(account ==null){
				account = new TeacherAccount();
				account.setMoney(0);
				teacher.setAccount(account);
				
				account.setTeacher(teacher);
				teacherServer.update(teacher);
				account = teacher.getAccount();
			}
			System.out.println(account.getTeacher().getName());
			resume.setType(ResumeType.存入.toString());
			resume.setTradeDate(new Date());
			resume.setAccount(account);
			resume.setClasses(null);
			account.getResumes().add(resume);
			account.add(resume.getAmount());		//存钱
			this.update(account);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	/**
	 * 
	 * 取工资
	 */
	public boolean remove(TeacherResume resume,Teacher Teacher) {
		try {
			TeacherAccount account = Teacher.getAccount();
			System.out.println(account.getTeacher().getName());
			resume.setType(ResumeType.扣费.toString());
			resume.setNote("扣除工资."+resume.getNote());
			resume.setTradeDate(new Date());
			resume.setAccount(account); 
			resume.setClasses(null);
			resume.setAmount(0-resume.getAmount()); //工资取负值
			account.getResumes().add(resume);
			account.add(resume.getAmount());		//扣费
			this.update(account);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}


}
