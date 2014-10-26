package com.boyi.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.boyi.enmu.GradeType;
import com.boyi.enmu.SubjectType;
import com.boyi.po.Course;

public class DBInit {
	private static ApplicationContext atx = new ClassPathXmlApplicationContext("applicationContext.xml");
	private static SessionFactory sessionFactory = (SessionFactory) atx.getBean("sessionFactory");
	public static void main(String[] args) {
		DBInit init = new DBInit();
		init.initCourse();
		
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
}
