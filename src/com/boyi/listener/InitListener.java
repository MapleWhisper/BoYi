package com.boyi.listener;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.boyi.enmu.ClassType;

@WebListener
public class InitListener implements ServletContextListener{

	private Properties sysPro;	//系统配置文件
	private File file;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//加载系统配置文件
		this.readProperties(sce);
		this.readEnum(sce);
	}		
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
	
	/**
	 * 
	 * 加载配置文件
	 * 读取system.properties到application中
	 */
	private  void readProperties(ServletContextEvent sce){
		System.out.println("加载system.properties...");
		String path = this.getClass().getClassLoader().getResource("system.properties").getPath();
		this.sysPro = new Properties();
		path = path.replace("%20", " ");
		this.file = new File(path);
		InputStream is = null;
		try {
			is = new FileInputStream(file);
			ServletContext application = sce.getServletContext();
			this.sysPro.load(is);
			application.setAttribute("system", sysPro);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(is!=null){
					is.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 读取系统数据字典
	 */
	private void readEnum(ServletContextEvent sce){
		System.out.println("加载数据字典......");
		ServletContext application = sce.getServletContext();
		
		//加载班级类型
		List<String> classTypes  = new ArrayList<String>();
		for(ClassType c : ClassType.values()){
			classTypes.add(c.toString());
		}
		application.setAttribute("classTypes", classTypes);
		
		
	}
}
