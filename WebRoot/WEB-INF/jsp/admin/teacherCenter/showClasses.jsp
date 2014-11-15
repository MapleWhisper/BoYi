<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>教师中心</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.css"></link>
	<script src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>
	
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
					
					<!-- 班级详情 -->
					<div class="col-xs-10">
						<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">班级详情  Class Detail</h1>
						  </div>
						  <div class="panel-body">
						  	...班级介绍
						  </div>
					</div><!-- 班级详情 -->
					
					<!-- 考试信息 -->
						<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">考试列表 Exam List</h1>
						  </div>
						  <div class="panel-body">
						  		<table  class="table table-hover table-striped table-bordered" style="text-align: center;" id="table1">
						  			<thead>
						  				<tr  >
											<td>考试标题</td>
											<td>开始时间</td>
											<td>考试状态</td>
											<td>成绩查看/批阅</td>
										</tr>
						  			</thead>
						  			<tbody>
						  				<c:forEach items="${classes.exams}" var="e">
										<tr>
											<td ><a target="_blank" href="${pageContext.request.contextPath}/exam/examAction">                              
												${e.name}</a>
											</td>
											<td><fm:formatDate value="${e.beginTime}" pattern="yyyy-MM-dd HH:mm"/></td>
											
											<td ><span style="font-size: 14px" class="label">${e.status }</span></td>
											<td><a type="button" href="${pageContext.request.contextPath}/admin/teacherCenter/teacherCenterAction!showResult?id=${e.id}" 
													class="btn btn-info">查看</a></td>
										</tr>
										
										</c:forEach>
						  			</tbody>
								</table>
						  </div>
					</div>
						  
						<!-- 面板开始 -->
						<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">学生信息 Student Info List</h1>
						  </div>
						  <div class="panel-body">
								
								<!-- 班级内容 -->
								<div class="tab-content">
								  <div role="tabpanel" class="tab-pane active"  >
								  		 <table class="table table-hover table-striped table-bordered table-condensed"  id="table2">
								  		 <thead>
								  		 	<tr class="info">
												<td>学号</td>
												<td>姓名</td>
												<td>邮箱</td>
												<td>操作</td>
											</tr>
								  		 </thead>
										<tbody>
											 <c:forEach items="${classes.students}" var="s">
										 	<tr>
												<td>${s.studentId }</td>
												<td>${s.name }</td>
												<td>${s.email }</td>
												
												<td><a href="../classes/classesAction!edit?id=${c.id }" class="btn btn-info"><span class=" glyphicon glyphicon-zoom-in"></span>&nbsp;&nbsp;查看</a></td>
											</tr>																								
											 </c:forEach>
										</tbody>
										
										</table>
								  </div>
								</div>
						  </div><!-- panel-body -->
						</div><!-- panel panel-default -->
						<!-- 面板结束 -->
					</div><!--右侧的内容 -->
					
					
    		</div>
    		
    		<%@ include file="../buttom.jsp" %>
    	</div>
    	
    	<script type="text/javascript">
    		$(function(){
    			$("#teacherCenter").css("margin-right","-30px").css("font-size"," 25px");
    		});

    		$(function(){
    			$(".label").each(function(){
    				var status = $(this).html();
    				if(status == '未开始'){
    					$(this).addClass("label-success");
    				}else if(status == '已结束'){
    					$(this).addClass("label-default");
    				}else{
    					$(this).addClass("label-danger");
    				}
    					
    			});
    		});
    		$(function(){
    			$('#table1').dataTable();
    			$('#table2').dataTable();
    		});
    		
    		
    	</script>
    	
  </body>
</html>
