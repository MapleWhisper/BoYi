<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	
	<title>修改文章</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/js/kindeditor/themes/simple/simple.css" />
  </head>
  
  <body>
    	<div class="container-fluid">
    		<div class="row">
    			<%@ include file="../head.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px">
    				<!--左侧的导航条 -->
					<div class="col-xs-2">
						<%@include file="../left.jsp"%>
					</div>
					<!--左侧的导航条 -->
					
					<!--右侧的内容 -->
					<div class="col-xs-10">
						<!-- 面板开始 -->
						<div class="panel panel-danger">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">修改文章  Edit Article</h1>
						  </div>
						  <div class="panel-body">
								<form action="${pageContext.request.contextPath }/admin/article/articleAction!update" class="form-horizontal" role="form" id="form1" method="post">
										<div class="form-group">
											<label  class="col-xs-1 control-label">文章标题</label>
											<div class="col-xs-11">
												<input type="text" class="form-control" required name="article.title" id="title" value="${article.title }" >
												<input type="hidden"  name="article.id"  value="${article.id }" >
											</div>
										</div>
										
										<div class="form-group" >
											<label  class="col-xs-1 control-label">文章类别：</label>
											<div class="col-xs-11" >
												<s:radio list="%{#{'主页新闻':'主页新闻','帮助文章':'帮助文章','后台通知':'后台通知','资料下载':'资料下载' }}"  name="article.type"/>
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-1 control-label">文章连接Url：</label>
											<div class="col-xs-11" >
												<input type="url" name="article.url" class="form-control" required="required" value="${article.url }">
												<span style="color: red">*** 主页新闻，帮助文章，资料下载  该项必须填写 内容随便填写 ***</span>
											</div>
										</div>
										
										<div class="form-group">
											<label  class="col-xs-1 control-label">文章内容：</label>
											<div class="col-xs-11">
												<textarea id="editor" class="form-control" name="article.context" rows="25" >${article.context }</textarea>
											</div>
										</div>
										
										<div class="form-group">
											<center><input type="submit" value="提交文章" id="submit"  class="btn btn-primary btn-lg"/></center>
										</div>
										
								</form>
	
						</div><!-- panel-body -->
						</div><!-- panel panel-default -->
						<!-- 面板结束 -->
					</div>
					<!--右侧的内容 -->
    		</div>
    		<%@ include file="../buttom.jsp" %>
    	</div>
    	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
    	
		<script charset="utf-8" src="${pageContext.request.contextPath}/js/kindeditor/kindeditor-min.js"></script>
		<script charset="utf-8" src="${pageContext.request.contextPath}/js/kindeditor/lang/zh_CN.js"></script>
    	<script type="text/javascript">
    		$(function(){
    			$("#article").css("margin-right","-30px").css("font-size"," 25px");
    		});
		//Html editor
		KindEditor.ready(function(K) {
			editor = K.create('#editor', {
				uploadJson : '/BoYi/js/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '/BoYi/js/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true
			});
		});
		$(function() {  
			$("#form1").validate();
		});
		</script>
    	
  </body>
</html>
