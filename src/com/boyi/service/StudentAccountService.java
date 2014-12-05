
package com.boyi.service;

import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServer;
import com.boyi.po.Student;
import com.boyi.po.StudentAccount;
import com.boyi.po.StudentResume;

/**
 * 
 * 管理员登陆实现接口
 * @author 广路
 *
 */
@Transactional
public interface StudentAccountService extends BaseServer<StudentAccount> {
	public boolean add(StudentResume resume,Student student);
}
