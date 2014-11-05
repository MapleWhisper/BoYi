<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>教师列表</title>
	
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
						    <h1 class="panel-title" style="font-size: 25px">教师列表  Teacher List</h1>
						  </div>
						  <div class="panel-body">
						  	 <table class="table table-hover table-striped table-bordered">
									<tr>
										<td>教师邮箱</td>
										<td>教师职工号</td>
										<td>教师姓名</td>
										<td>操作</td>
										<td>操作</td>
									</tr>
								 <c:forEach items="${teacherList}" var="tea">
								 	<tr>
										<td>${tea.email }</td>
										<td>${tea.teacherId }</td>
										<td>${tea.name }</td>
										<td><a href="teacherAction!edit?id=${tea.id }" class="btn btn-info"><span class=" glyphicon glyphicon-edit"></span>&nbsp;&nbsp;修改</a></td>
										<td><a href="teacherAction!delete?id=${tea.id}" class="btn btn-danger" onclick="return confirm('确认要删除吗？')"><span class=" glyphicon  glyphicon-trash"></span>&nbsp;&nbsp;删除</a></td>
									</tr>																								
								 </c:forEach>
									
									
								</table>
								<div class="row">
									<div class="col-xs-6 col-xs-offset-5">
										<div class="no1">				 
											<a class="btn btn-primary " href="teacherAction!add">添加教师</a>
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
    			$("#teacher").css("margin-right","-30px").css("font-size"," 25px");
    		});
    	</script>
    	
  </body>
</html>
