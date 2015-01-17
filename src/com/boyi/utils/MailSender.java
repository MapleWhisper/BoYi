package com.boyi.utils;

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
		 prop.put( " mail.smtp.auth " ,  " true " ) ;  //  灏嗚繖涓弬鏁拌涓簍rue锛岃鏈嶅姟鍣ㄨ繘琛岃璇?璁よ瘉鐢ㄦ埛鍚嶅拰瀵嗙爜鏄惁姝ｇ‘ 
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
		helper.setSubject("娴嬭瘯閭欢");
		
		helper.setText("<html><h2>杩欐槸娴嬭瘯閭欢鍐呭<h2><html>",true);
		
		mailSender.send(message);
		System.out.println("閭欢鍙戦?鎴愬姛");
		*/
		
	}
	
	/**
	 * 鍙戦?閭欢
	 * 
	 * @param from	鍙戦?浜虹殑鍚嶇О
	 * @param to	鍙戦?鍒扮殑閭鍦板潃
	 * @param subject	閭欢鏍囬
	 * @param htmlText	閭欢鍐呭
	 */
	public static void send(String to ,String subject , String htmlText){
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			helper.setTo(to);
			helper.setFrom(new InternetAddress(MimeUtility.encodeText("鍗氬紙鏁欒偛")+"<boyieduzhaopin@163.com>"));
			helper.setSubject(subject);
			helper.setText(htmlText,true);
			
		} catch (Exception e) {
			System.out.println("閭欢鍙戦?澶辫触");
			e.printStackTrace();
		}
		mailSender.send(message);
		System.out.println("閭欢鍙戦?鎴愬姛");
	}
	
	
}
