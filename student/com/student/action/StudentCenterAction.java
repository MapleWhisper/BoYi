 package com.student.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.activation.MimetypesFileTypeMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.admin.util.ImageUtil;
import com.boyi.base.BaseAction;
import com.boyi.po.Student;
import com.boyi.service.StudentService;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/student")
@Action(value="studentCenterAction",results={
		@Result(name="toPersonalInfo",type="redirectAction",location="studentCenterAction!PersonalSet"),
		@Result(name="index",type="redirectAction",location="indexAction"),
		@Result(name="studentCenter",location="/WEB-INF/jsp/student/studentCenter.jsp"),
		@Result(name="personalInfo",location="/WEB-INF/jsp/student/personalInfo.jsp"),
		@Result(name="personalInfo1",location="/WEB-INF/jsp/student/personalInfo.jsp"),
})
public class StudentCenterAction extends BaseAction{

	@Resource(name="studentServiceImpl")
	private StudentService studentService; 
	
	private File pic;
	private String picFileName;
	private String picContentType;
	
	private Student student;
	

	
	@Override
	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		//		Student student = studentService.getById(stu.getId());
		Student stu = (Student) session.getAttribute("student");
		this.student = studentService.getById(stu.getId());
		return "studentCenter";
	}
	public String PersonalSet(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		Student stu = (Student) session.getAttribute("student");
		this.student = studentService.getById(stu.getId());
		return "personalInfo";
	}
	
	/**
	 * 修改学生密码
	 * @return
	 */
	public String updatePwd(){
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		Student stu = (Student) session.getAttribute("student");
		stu = studentService.getById(stu.getId());
		this.student = stu;
		String oldPwd=request.getParameter("oldPwd");
		String newPwd=request.getParameter("newPwd");
		System.out.println(stu.getPassword());
		System.out.println(oldPwd);
		if(!stu.getPassword().equals(oldPwd)){
			request.setAttribute("message","原密码输入错误！");
			return "personalInfo1";
		}else{
			stu.setPassword(newPwd);
			studentService.update(stu);
			request.setAttribute("message","密码修改成功！");
			return "personalInfo1";
		}
	}
	
	/**
	 * 修改学生信息
	 * @return
	 */
	public String updateInfo() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
			Student stu=(Student)session.getAttribute("student");
			stu = studentService.getById(stu.getId());
			//String fileName []=uploadPhoto(request,stu);
			if(pic!=null){
				String path = "image/student/pic/"+stu.getId()+picFileName.substring(picFileName.lastIndexOf("."));
				ImageUtil.savaPic(ServletActionContext.getServletContext(), new FileInputStream(pic), path, pic.length());
				stu.setPicPath(path);
			}
			
			String birth=request.getParameter("stuBirthTime");
			DateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
			String idNumber=request.getParameter("idNumber");
			String address =request.getParameter("stuAddress");
			String phoneNumber =request.getParameter("phoneNumber");
			stu.setAddress(address);
			stu.setIdNumber(idNumber);
			stu.setPhoneNumber(phoneNumber);
			stu.setBirth(sdf.parse(birth));
			stu.setSex(student.getSex());
			studentService.update(stu);
			session.setAttribute("student", stu);
			request.setAttribute("student",stu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "toPersonalInfo";
	}
	/*
	private String[] uploadPhoto(HttpServletRequest request,Student stu){
		String fileName [] = new String[2];
		MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);
		MultipartFile file = multipartRequest.getFile("pic");
		String path = request.getServletContext().getRealPath("/");
		path = path + "/image/student/"+stu.getId()+"/";
		new File(path).mkdirs();

		if(file!=null && !"".equals(file.getOriginalFilename() )){		//图片上传部分
			String  a=file.getOriginalFilename().toLowerCase();
			String [] s=new String[]{"bmp","jpg","gif","png"};
			boolean flag = false;
			for(int i=0;i<s.length;i++){
				if(a.endsWith(s[i])){
					flag=true;
					break;
				}
			}
			if(!flag){//文件后缀不正确
				request.setAttribute("error", "文件格式不正确");
				return fileName;
			}
			if(file.getSize() > 1024*1024*8){	//如果文件大于1M，返回
				request.setAttribute("error", "图片大太，小于1MB");
				return fileName;
			}


			try {
				String p1= path+"Pic"+stu.getId()+file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
				File f = new File(p1);	//如果文件存在，那么删除文件
				if(f.exists()){
					f.delete();
				}
				Files.copy(file.getInputStream(), Paths.get( p1 )  );
				fileName[0] = "image/user/"+stu.getId()+"/Pic"+stu.getId()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				System.out.println("上传头像成功"+fileName[0]);
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return fileName;
	}
	*/
	
	public StudentService getStudentService() {
		return studentService;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public File getPic() {
		return pic;
	}
	public void setPic(File pic) {
		this.pic = pic;
	}
	public String getPicFileName() {
		return picFileName;
	}
	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}
	public String getPicContentType() {
		return picContentType;
	}
	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	
}
