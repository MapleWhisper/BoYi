
package com.boyi.serviceImpl;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.boyi.base.BaseServerImpl;
import com.boyi.po.Student;
import com.boyi.service.StudentService;
import com.boyi.utils.BoYiUtils;


/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 *
 */
@Service()
@Transactional
public class StudentServiceImpl extends BaseServerImpl<Student> implements StudentService{
	/**
	 * 判断用户用户名密码是否正确
	 * 
	 * @return true:正确
	 * 		   false:不正确	
	 */
	@Override
	public Student login(Student student) {
		Student s = (Student) getSessionFactory().openSession().createQuery("from Student a where a.email = ? and a.password= ? ")
				.setParameter(0, student.getEmail()).setParameter(1, student.getPassword()).uniqueResult();
		return s;
	}

	@Override
	public Student loginWhitMd5(Student student) {
		Student u = (Student) getSessionFactory().openSession().createQuery("from Student a where a.email = ?  ")
				.setParameter(0, student.getEmail()).uniqueResult();
		if(BoYiUtils.MD5String(u.getPassword()).equals(student.getPassword())){
			//如果数据库中密码的Md5 和 Coookie中的相等， 那么返回true
			return u;
		}
		return null;
	}

}
