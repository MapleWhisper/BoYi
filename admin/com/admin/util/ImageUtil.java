package com.admin.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ImageUtil {
	private static List<String> type  = null;
	private static final long picSize = 512*1024L;
	static {
		type = new ArrayList<String>();
		type.addAll(Arrays.asList(new String[]{"jpg","png","gif","bmp"}));
	}
	
	
	
	public static boolean savaPic(InputStream is , String path , long fileSize){
		if(fileSize > picSize || !validateSuffix(path)){
			return false;
		}
		try {
			File file = new File(path);
			if(!file.getParentFile().exists()){
				file.getParentFile().mkdirs();
			}
			if(file.exists()){
				file.delete();
			}
			
			Files.copy(is, Paths.get(path)); //替换原来文件
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
	public static boolean savaPic(ServletContext context ,InputStream is , String path , long fileSize){
		String basePath = context.getRealPath("/");
		path = basePath + "/" + path;
		System.out.println(path);
		return savaPic(is, path, fileSize);
	}
	
	public static boolean validateSuffix(String path){
		if(path ==null || path.lastIndexOf(".")==-1){	//如果路径为空，返回
			return false;
		}
		String suffix = path.substring(path.lastIndexOf(".")+1).toLowerCase();
		return type.contains(suffix);
		
	}
	
}
