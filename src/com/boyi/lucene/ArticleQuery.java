package com.boyi.lucene;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.queryparser.classic.QueryParser.Operator;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.stereotype.Component;

import com.boyi.po.Article;
import com.boyi.service.ArticleService;

@Component
public class ArticleQuery implements LuceneQuery<Article>{
	private static Directory directory = null;
	private static Analyzer analyzer = null;
	private static IndexWriterConfig conf  = null;
	private static IndexWriter indexWriter =null ;
	
	
	@Resource(name = "articleSerivceImpl")
	private ArticleService articleService;
	
	static{
		try {
			directory = FSDirectory.open(new File("./index/article"));
			analyzer = new SmartChineseAnalyzer();
			conf = new IndexWriterConfig(Version.LATEST, analyzer);
			indexWriter = new IndexWriter(directory, conf);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String key;
	
	/**
	 * 更新索引库 
	 * 定时执行
	 */
	public void updateIndex(){
		try {	
			indexWriter.deleteAll();	//删除所有索引
			List<Article> list = articleService.findAll();
			for(Article a : list){
				Document doc = ArticleDocument.toDocument(a);
					indexWriter.addDocument(doc);		//写入索引
			}
			indexWriter.commit();		//提交
			System.out.println("索引创建成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 查询索引
	 * @param key
	 * @return
	 */
	public List<Article> serch(String key){
		List<Article> list = new ArrayList<Article>();
		IndexReader indexReader = null;
		try {
			System.out.println(key);
			indexReader = DirectoryReader.open(directory);	//打开索引文件
			IndexSearcher indexSearcher = new IndexSearcher(indexReader);
			QueryParser parser = new MultiFieldQueryParser(new String[]{"id","title","context","auther","type"}, analyzer);
			parser.setDefaultOperator(Operator.AND);
			Query query = parser.parse(key);
			
			ScoreDoc docs[] = indexSearcher.search(query, 100).scoreDocs;	//最大搜索100条记录
			for(ScoreDoc sd : docs){
				Document d = indexSearcher.doc(sd.doc);
				list.add(ArticleDocument.toArticle(d));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return list;
	}
	
	@Override
	public void destroy() throws Exception {
		try {
			if(indexWriter!=null){
				indexWriter.close();
			}
			System.out.println("indexWriter对象销毁");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
