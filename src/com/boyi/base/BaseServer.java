package com.boyi.base;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.boyi.utils.Page;

/**
 * 公共的 Server公共接口
 * 所有的server接口必须继承此接口
 * 
 * @author Public
 * @param <T>
 */
@Repository
@Transactional
public interface BaseServer<T> {
	/**
	 * 保存实体
	 */
	public void save(T entry);
	
	/**
	 * 删除实体
	 * @param id
	 */
	public void delete(Integer id);
	
	/**
	 * 修改实体
	 * @param t
	 */
	public void update(T entry);
	
	/**
	 * 根据Id获取实例
	 * @param id 实例Id
	 * @return
	 */
	public  T getById(Integer id);
	
	
	/**
	 * 根据Id数据返回多个实例
	 * @param id 实例Id
	 * @return
	 */
	public  List<T> getByIds(Integer ids[]);
	public List<T> getByIds(List<Integer> ids);
	/**
	 * 获取所有实例
	 * @return
	 */
	public List<T> findAll();
	
	/**
	 * 得到最大的页数
	 * @param page
	 * @return
	 */
	public Integer getMaxPageNum(Page page);
	
	/**
	 * 根据Page进行分页显示
	 * @param page
	 * @return
	 */
	public List<T> findAll(Page page);
}
