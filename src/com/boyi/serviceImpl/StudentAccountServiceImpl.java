
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
import com.boyi.po.Student;
import com.boyi.po.StudentAccount;
import com.boyi.po.StudentResume;
import com.boyi.service.StudentAccountService;
import com.boyi.service.StudentService;
import com.boyi.utils.BoYiUtils;


/**
 * 学生账户服务类
 * 
 * @author 于广路
 *
 */
@Service()
@Transactional
public class StudentAccountServiceImpl extends BaseServerImpl<StudentAccount> implements StudentAccountService{
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;
	/**
	 * 
	 * 存钱
	 */
	public boolean add(StudentResume resume,Student student) {
		try {
			StudentAccount account = student.getAccount();
			if(account==null){
				account = new StudentAccount();
				account.setMoney(0);
				account.setStudent(student);
				student.setAccount(account);
				studentService.update(student);
				account = student.getAccount();
			}
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

}
