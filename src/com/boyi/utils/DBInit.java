package com.boyi.utils;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.boyi.enmu.GradeType;
import com.boyi.enmu.SubjectType;
import com.boyi.po.Course;
import com.boyi.po.Privilege;

public class DBInit {
	private static ApplicationContext atx = new ClassPathXmlApplicationContext("applicationContext.xml");
	private static SessionFactory sessionFactory = (SessionFactory) atx.getBean("sessionFactory");
	public static void main(String[] args) {
		DBInit init = new DBInit();
		//init.initCourse();
		init.initPrivilege();
		
	}
	public  void initCourse(){
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		String grade = "";
		String subject = "";
		Course course = new Course();
		for(GradeType g : GradeType.values()){
			for(SubjectType s :SubjectType.values()){
				grade= g.toString();
				subject = s.toString();
				if(grade.indexOf("小学")!=-1){
					if(subject.matches("(物理)|(化学)|(生物)")){
						continue;
					}
				}
				if(grade.indexOf("初中")!=-1){
					if(subject.equals("生物")){
						continue;
					}
				}
				course = new Course();
				course.setGrade(grade);
				course.setSubject(subject);
				session.save(course);
			}
		}
		
		session.getTransaction().commit();
		session.close();
	}
	
	public void initPrivilege(){
		ArrayList<Privilege> list = new ArrayList<Privilege>();
		list.add(new Privilege("班次管理","admin/classes/"));
		list.add(new  Privilege("课程管理","admin/course/"));
		list.add( new Privilege("考试管理","admin/exam/"));
		list.add( new Privilege("试卷管理","admin/paper/"));
		list.add( new Privilege("试题管理","admin/problem/"));
		list.add( new Privilege("文章管理","admin/article/"));
		list.add( new Privilege("学生管理","admin/student/"));
		list.add( new Privilege("教师管理","admin/teacher/"));
		list.add( new Privilege("管理员管理","admin/admin/"));
		list.add( new Privilege("系统设置","admin/config/"));
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		for(Privilege p :list){
			session.save(p);
		}
		session.getTransaction().commit();
		session.close();
	}
}
