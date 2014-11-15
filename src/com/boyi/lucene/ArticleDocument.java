package com.boyi.lucene;

import java.util.Date;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.LongField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.document.Field.Store;

import com.boyi.po.Article;

public class ArticleDocument {
	public static Article toArticle(Document document ){
		Article a =new Article();
		a.setId(Integer.parseInt(document.get("id")));
		a.setAuther(document.get("auther"));
		a.setContext(document.get("context"));
		a.setTitle(document.get("title"));
		a.setType(document.get("type"));
		a.setCreateDate( new Date(Long.parseLong(document.get("createDate")) ));
		return a;
	}
	
	public static Document toDocument(Article a){
		Document doc = new Document();
		doc.add(new TextField("title",a.getTitle(),Store.YES ));
		doc.add(new TextField("context", a.getContext(),Store.NO));
		doc.add(new IntField("id", a.getId(), Store.YES));
		doc.add(new TextField("auther", a.getAuther()==null?"":a.getAuther(), Store.YES));
		doc.add(new TextField("type",a.getType(), Store.YES));
		doc.add(new LongField("createDate", a.getCreateDate().getTime(), Store.YES));
		return doc;
	}
}
