package com.zhaopin.utils;

import java.util.Properties;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailSender {
	private static JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	private static JavaMailSenderImpl mailSender2 = new JavaMailSenderImpl();
	static{
		 Properties prop  =   new  Properties() ;
		 prop.put( " mail.smtp.auth " ,  " true " ) ;  //  将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确 
		 prop.put( " mail.smtp.timeout " ,  " 25000 " ) ;
		 
		 mailSender.setJavaMailProperties(prop);
		 mailSender.setHost("smtp.163.com");  
		 mailSender.setUsername("boyieduzhaopin@163.com");
		 mailSender.setPassword("013579"); 
		 mailSender.setDefaultEncoding("utf-8");

		 mailSender2.setJavaMailProperties(prop);
		 mailSender2.setHost("smtp.163.com");  
		 mailSender2.setUsername("boyieduzhaopin2@163.com");
		 mailSender2.setPassword("013579"); 
		 mailSender2.setDefaultEncoding("utf-8");
	}
	
	public static void main(String[] args) throws MessagingException {
		
		/*
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setTo("827605162@qq.com");
		helper.setFrom("boyieduzhaopin@163.com");
		helper.setSubject("测试邮件");
		
		helper.setText("<html><h2>这是测试邮件内容<h2><html>",true);
		
		mailSender.send(message);
		System.out.println("邮件发送成功");
		*/
		
	}
	
	/**
	 * 发送邮件
	 * 
	 * @param from	发送人的名称
	 * @param to	发送到的邮箱地址
	 * @param subject	邮件标题
	 * @param htmlText	邮件内容
	 */
	public static void send(String to ,String subject , String htmlText){
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			helper.setTo(to);
			helper.setFrom(new InternetAddress(MimeUtility.encodeText("博弈教育")+"<boyieduzhaopin@163.com>"));
			helper.setSubject(subject);
			helper.setText(htmlText,true);
			
		} catch (Exception e) {
			System.out.println("邮件发送失败");
			e.printStackTrace();
		}
		mailSender.send(message);
		System.out.println("邮件发送成功");
	}
	
	
}
