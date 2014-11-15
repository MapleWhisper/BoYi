package com.boyi.lucene;

import java.util.List;

import org.springframework.beans.factory.DisposableBean;

public interface LuceneQuery<T> extends DisposableBean {
	//更新索引
	public void updateIndex();
	
	//检索
	public List<T> serch(String key);
}
