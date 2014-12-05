package com.boyi.base;

import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.po.Problem;
import com.boyi.utils.Page;


/**
 * 
 * 公共Server实现类 所有的server实现类必须继承此实现类
 * 
 * @author public 
 *
 * @param <E>
 */
@Repository
@SuppressWarnings("unchecked")
@Transactional
public  abstract class BaseServerImpl<E> implements BaseServer<E>{
	
	/**
	 * 
	 * SpringMvc 注入 SessionFactory 所有的子类可使用本getSession方法获取Session对象
	 */
	@Resource
	private SessionFactory sessionFactory;
	
	@Resource()
	private HibernateTemplate hibernateTemplate;
	
	/**
	 * 使用抽象的父类 使得 this.getClass 获得的是子类的Class 并通过这个获得父类泛型类型
	 * 通过泛型类型获得整正的Class类型
	 */
	public BaseServerImpl() {
		ParameterizedType type =   (ParameterizedType) this.getClass().getGenericSuperclass();
		this.clazz = (Class<?>) type.getActualTypeArguments()[0];
		System.out.println(clazz.getName()+"已注册");
	}
	//继承该类的class对象
	private Class<?> clazz = null;
	
	
	/**
	 * 
	 *  getSession方法，获取到当前可用的Session对象
	 * @return
	 */
	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	/**
	 *  保存实例
	 */
	@Override
	public void save(E entry) {
		getSession().save(entry);
		getSession().flush();
	}

	
	/**
	 * 更新实例
	 * 
	 */
	@Override
	public void update(E entry) {
		getSession().update(entry);
		getSession().flush();
	}
	
	/**
	 * 
	 * 删除实例
	 */
	@Override
	public void delete(Integer id) {
		E entry = this.getById(id);
		getSession().delete(entry);
		getSession().flush();
	}
	
	/**
	 * 
	 * 通过Id获取实例
	 * 
	 */
	@Override
	public E getById(Integer id) {
		if(id!=null){
			return (E)getSession().load(clazz, id);
		}
		return null;
		
	}
	
	
	/**
	 * 
	 * 获取到所有的对象列表
	 */
	@Override
	public List<E> findAll() {
		
		return 	(List<E>) getSession().createQuery("from "+clazz.getSimpleName()+" order by id desc").list();
	}
	
	/**
	 * 
	 * 通过 Id 集合来查找实例
	 */
	@Override
	public List<E> getByIds(Integer[] ids) {
		if( ids==null || ids.length==0){
			return new ArrayList<E>();
		}
		Query query = getSession().createQuery("from "+clazz.getSimpleName() +" where id in (:ids)");
		query.setParameterList("ids", ids);
		return query.list();
	}
	
	/**
	 * 
	 * 通过 Id 集合来查找实例
	 */
	@Override
	public List<E> getByIds(List<Integer> ids) {
		if( ids==null || ids.size()==0){
			return new ArrayList<E>();
		}
		Query query = getSession().createQuery("from "+clazz.getSimpleName() +" where id in (:ids)");
		query.setParameterList("ids", ids);
		return query.list();
	}
	
	/**
	 * 得到最大的页数
	 * @param page
	 * @return
	 */
	@Override
	public Integer getMaxPageNum(Page page) {
		Integer sum = ((Number)(getSession().createQuery("select count(id) from "+clazz.getSimpleName()).iterate().next())).intValue() ;
		sum = (sum+page.getAmount()-1)/page.getAmount(); 
		page.setSum(sum);
		return sum;
	}
	
	/**
	 * 根据Page进行分页显示
	 * @param page
	 * @return
	 */
	@Override
	public List<E> findAll(Page page) {
		Query query= getSession().createQuery("from "+clazz.getSimpleName()+" order by id desc");
		query.setMaxResults(page.getAmount());							//取几条记录
		query.setFirstResult( (page.getCur()-1)*page.getAmount() );		//从哪个记录开始取
		this.getMaxPageNum(page);
		return query.list();
	}
	
	/**
	 * 获取SessionFactory工厂
	 * 
	 * @return
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
}
