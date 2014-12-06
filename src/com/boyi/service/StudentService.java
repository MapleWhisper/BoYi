
package com.boyi.service;
import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServer;
import com.boyi.po.Student;

/**
 * 
 * 管理员登陆实现接口
 * @author 广路
 *
 */
@Transactional
public interface StudentService extends BaseServer<Student> {
	
	
	/**
	 * 判断用户用户名密码是否正确
	 * 
	 * @param admin 传入的需要验证的学生
	 * 
	 * @return 登陆得到的对象，可以判断是否为空来确认用户名和密码是否正确
	 */
	
	@Override
	public void save(Student entry);
	public Student login(Student student);

	public Student loginWhitMd5(Student student);	
}
