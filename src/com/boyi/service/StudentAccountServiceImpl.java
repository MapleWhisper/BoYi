
package com.boyi.service;


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
import com.boyi.po.StudentAccount;
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
	

}
