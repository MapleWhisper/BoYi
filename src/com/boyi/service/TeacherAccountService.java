
package com.boyi.service;

import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServer;
import com.boyi.po.Teacher;
import com.boyi.po.TeacherAccount;
import com.boyi.po.TeacherResume;

/**
 * 
 * 管理员登陆实现接口
 * @author 广路
 *
 */
@Transactional
public interface TeacherAccountService extends BaseServer<TeacherAccount> {
	public boolean add(TeacherResume resume,Teacher teacher);
	public boolean remove(TeacherResume resume,Teacher Teacher);
}
