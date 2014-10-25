<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	
	<title>管理员列表</title>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
  </head>
  
  <body>
    	<div class="container">
    		<div class="row">
    			<%@ include file="../head.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px">
    				<!--左侧的导航条 -->
					<div class="col-xs-3">
						<%@include file="../left.jsp"%>
					</div>
					<!--左侧的导航条 -->
					
					<!--右侧的内容 -->
					<div class="col-xs-9">
						<!-- 面板开始 -->
						<div class="panel panel-danger">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">添加文章  Add Article</h1>
						  </div>
						  <div class="panel-body">
								<form action="${pageContext.request.contextPath }/admin/article/articleAction!save" class="form-horizontal" role="form" id="form1" method="post">
										<div class="form-group">
											<label  class="col-xs-2 control-label">文章标题</label>
											<div class="col-xs-10">
												<input type="text" class="form-control inputxt" required name="article.title" id="title" >
											</div>
										</div>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">文章类别：</label>
											<div class="col-xs-4">
												<input type="radio" name="article.type" value="主页新闻" required>主页新闻
												<br>
												<input type="radio" name="article.type" value="帮助文章">帮助文章
												<br>
												<hr>
												<input type="radio" name="article.type" value="后台通知">后台通知
												<br>
											</div>
										</div>
										
										<div class="form-group">
											<label  class="col-xs-2 control-label">文章内容：</label>
											<div class="col-xs-10">
												<textarea id="editor" class="form-control" name="article.context" rows="25"></textarea>
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
    	<link rel="stylesheet"  href="${pageContext.request.contextPath}/js/kindeditor/themes/simple/simple.css" />
		<script charset="utf-8" src="${pageContext.request.contextPath}/js/kindeditor/kindeditor-min.js"></script>
		<script charset="utf-8" src="${pageContext.request.contextPath}/js/kindeditor/lang/zh_CN.js"></script>
    	<script type="text/javascript">
    		$(function(){
    			$("#article").css("margin-right","-30px").css("font-size"," 25px");
    		});
		//Html editor
		KindEditor.ready(function(K) {
			editor = K.create('#editor', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				items : [
					'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
					'insertunorderedlist', '|', 'emoticons', 'image', 'link']
			});

		});
		$(function() {  
			$("#form1").validate();
		});
		</script>
    	
  </body>
</html>