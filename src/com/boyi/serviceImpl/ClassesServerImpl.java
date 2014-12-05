package com.boyi.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.base.BaseServerImpl;
import com.boyi.po.Classes;
import com.boyi.service.ClassesServer;
import com.boyi.utils.Page;


/**
 * 管理员登陆服务实现类
 * 
 * @author 于广路
 * 
 */

@Service
@SuppressWarnings("unchecked")
@Transactional
public class ClassesServerImpl extends BaseServerImpl<Classes> implements ClassesServer {
		@Override
		public List<Classes> findAllByStatus(String status) {
			String hql  = "from Classes c where c.status = ?";
			return getSession().createQuery(hql).setString(0, status).list();
		}
		
		/**
		 * 查找 选课主页的 课程
		 */
		@Override
		public List<Classes> findIndexAll(String grade, String subject,
			String sort, Page page) {
			String s = "";
			if (sort.equals("价格")){
				s = " c.classPrice";
			}else if (sort.endsWith("人数") ){
				s = " c.studentNumber desc";
			}else{
				s = " id desc";
			}
			String hql = "from Classes c where c.status <> ? and c.course.grade like ? and c.course.subject like ? order by "+ s;
			System.out.println(hql+s+grade+subject+sort);
			Query query= getSession().createQuery(hql);
			query.setString(0, "已结束")
			.setString(1, "%"+grade+"%")
			.setString(2, "%"+subject+"%");
			query.setMaxResults(page.getAmount());							//取几条记录
			query.setFirstResult( (page.getCur()-1)*page.getAmount() );		//从哪个记录开始取
			getMaxPageNum(page);
			return query.list();
		}
		
		@Override
		public List<Classes> findRecommand() {
			 String hql="from Classes c where c.recommand=?";

			 return  getSession().createQuery(hql).setBoolean(0, true).list();
		}
		
}
