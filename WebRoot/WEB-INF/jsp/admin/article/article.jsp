<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>管理员列表</title>
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
						<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">文章列表  Article List</h1>
						  </div>
						  <div class="panel-body">
							<table class="table table-hover table-striped table-bordered">
								<tr class="info">
									<td>标题</td>
									<td>分类</td>
									<td>创建日期</td>
									<td>操作</td>
									<td>操作</td>
								</tr>		     
							 <c:forEach items="${articleList}" var="article">
							 	<tr>
									<td>${article.title }</td>
									<td>${article.type}</td>
									<td><fm:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.createDate}"/></td>
									<td><a href="articleAction!edit?id=${article.id }" class="btn btn-info"><span class=" glyphicon glyphicon-edit"></span>&nbsp;&nbsp;修改</a></td>
									<td><a href="articleAction!delete?id=${article.id }" class="btn btn-danger" onclick="return confirm('确认要删除吗？')"><span class=" glyphicon  glyphicon-trash"></span>&nbsp;&nbsp;删除</a></td>
								</tr>																								
							 </c:forEach>
								
							</table>
							<div class="row">
								<div class="col-xs-6 col-xs-offset-5">
									<div class="no1">				 
										<a class="btn btn-primary " href="${pageContext.request.contextPath}/admin/article/articleAction!add">添加文章</a>
									</div>
	
								</div>
							</div>
	
						</div><!-- panel-body -->
						</div><!-- panel panel-default -->
						<!-- 面板结束 -->
					</div>
					<!--右侧的内容 -->
    		</div>
    		<%@ include file="../buttom.jsp" %>
    	</div>
    	
    	<script type="text/javascript">
    		$(function(){
    			$("#article").css("margin-right","-30px").css("font-size"," 25px");
    		});
    	</script>
    	
  </body>
</html>
