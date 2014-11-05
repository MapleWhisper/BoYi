<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>管理员列表</title>
	
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
						<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">管理员列表  Admin List</h1>
						  </div>
						  <div class="panel-body">
						  	 <table class="table table-hover table-striped table-bordered">
									<tr>
										<td>管理员账号</td>
										<td>管理员姓名</td>
										<td>管理员职位</td>
										<td>操作</td>
										<td>操作</td>
									</tr>
								 <c:forEach items="${adminList}" var="admin">
								 	<tr>
										<td>${admin.username }</td>
										<td>${admin.name }</td>
										<td>${admin.position }</td>
										<td><a href="adminAction!edit?id=${admin.id }" class="btn btn-info"><span class=" glyphicon glyphicon-edit"></span>&nbsp;&nbsp;修改</a></td>
										<td><a href="adminAction!delete?id=${admin.id}" class="btn btn-danger" onclick="return confirm('确认要删除吗？')"><span class=" glyphicon  glyphicon-trash"></span>&nbsp;&nbsp;删除</a></td>
									</tr>																								
								 </c:forEach>
									
									
								</table>
								<div class="row">
									<div class="col-xs-6 col-xs-offset-5">
										<div class="no1">				 
											<a class="btn btn-primary " href="adminAction!add">添加管理员</a>
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
    			$("#admin").css("margin-right","-30px").css("font-size"," 25px");
    		});
    	</script>
    	
  </body>
</html>
