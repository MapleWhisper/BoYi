<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>考试管理</title>
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
						    <h1 class="panel-title" style="font-size: 25px">考试列表 Exam List</h1>
						  </div>
						  <div class="panel-body">
						  		<div class="row well">
						  			<center>
						  				<a  class="btn btn-primary btn-lg btn-block" href="${pageContext.request.contextPath}/admin/exam/examAction!add" 
						  					style="width: 300px">添加考试</a>
						  			</center>
						  			
						  		</div>
						  		<!-- 班级导航头 -->
								<ul class="nav nav-pills nav-justified" role="tablist">
									
								   <li role="presentation" class="${status=='未开始'?'active':' ' }"><a href="${pageContext.request.contextPath}/admin/exam/examAction" >
								   			未开始<span class="badge" >${count.未开始 }</span></a>
								   	</li>
								   <li role="presentation" class="${status=='正在考试'?'active':' ' }"><a href="${pageContext.request.contextPath}/admin/exam/examAction?status=正在考试" >
								   			正在考试<span class="badge" >${count.正在考试 }</span></a>
								   	</li>
								   <li role="presentation" class="${status=='已结束'?'active':' ' }"><a href="${pageContext.request.contextPath}/admin/exam/examAction?status=已结束" >
								   			已结束</a>
								   			<!-- <span class="badge" >${count.正在考试 }</span> -->
								   	</li>
								</ul>
								
								<!-- 班级内容 -->
								<div class="tab-content">
								  <div role="tabpanel" class="tab-pane active" id="list1" >
								  		 <table class="table table-hover table-striped table-bordered table-condensed" style="margin-top: 10px">
											<tr class="info">
												<td>考试名</td>
												<td>考试开始时间</td>
												<td>考试结束时间</td>
												<td>操作</td>
												<td>操作</td>
											</tr>
										 <c:forEach items="${examList}" var="e">
										 	<tr>
												<td>${fn:substring(e.name,0,20) }</td>
												<td><fm:formatDate value="${e.beginTime  }" pattern="yyyy-MM-dd HH:mm"/></td>
												<td><fm:formatDate value="${e.endTime }" pattern="yyyy-MM-dd HH:mm"/></td>
												<td><a href="examAction!edit?id=${e.id }" class="btn btn-info"><span class=" glyphicon glyphicon-edit"></span>&nbsp;&nbsp;修改</a></td>
												<td><a href="examAction!delete?id=${e.id}" class="btn btn-danger" onclick="return confirm('确认要删除吗？')"><span class=" glyphicon  glyphicon-trash"></span>&nbsp;&nbsp;删除</a></td>
											</tr>																								
										 </c:forEach>
											
											
										</table>
								  </div>
								</div>
						  </div><!-- panel-body -->
						</div><!-- panel panel-primary -->
						
						
						<!-- 面板结束 -->
					</div>
					<!--右侧的内容 -->
					
    		</div>
    		<%@ include file="../buttom.jsp" %>
    	</div>
    	<script type="text/javascript">
    		$(function(){
    			$("#exam").css("margin-right","-30px").css("font-size"," 25px");
    		});
    	</script>
    	
  </body>
</html>
