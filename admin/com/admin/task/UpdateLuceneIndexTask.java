package com.admin.task;

import java.text.DateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.boyi.lucene.ArticleQuery;
import com.boyi.utils.MailSender;

@Component
public class UpdateLuceneIndexTask {
	
	@Resource(name="articleQuery")
	private ArticleQuery articleQuery;
	
	//每天凌晨1:00,下午3点 更新一次索引库
	@Scheduled(cron="0 0 1,15 * * ?")
	public void job1(){
		try {
			articleQuery.updateIndex();		//更新文章的索引库
			System.out.println("成功更新索引库");
		} catch (Exception e) {
			MailSender.send("827605162@qq.com", "article索引库更新", "更新失败！");
		}
	}
}
