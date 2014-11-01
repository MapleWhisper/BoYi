<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>班次管理</title>
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
						    <h1 class="panel-title" style="font-size: 25px">班次列表 Classes List</h1>
						  </div>
						  <div class="panel-body">
						  		<div class="row well">
						  			<center>
						  				<a  class="btn btn-warning btn-lg btn-block" href="${pageContext.request.contextPath}/admin/classes/classesAction!add" 
						  					style="width: 300px">添加班次</a>
						  			</center>
						  			
						  		</div>
						  		<!-- 班级导航头 -->
								<ul class="nav nav-pills nav-justified" role="tablist">
								  <li role="presentation" class="active"><a href="#list1" role="tab" data-toggle="tab">在读</a></li>
								  <li role="presentation"><a href="#lis2" role="tab" data-toggle="tab">未开始</a></li>
								  <li role="presentation"><a href="#list3" role="tab" data-toggle="tab">已结束</a></li>
								</ul>
								
								<!-- 班级内容 -->
								<div class="tab-content">
								  <div role="tabpanel" class="tab-pane active" id="list1">...</div>
								  <div role="tabpanel" class="tab-pane" id="list2">...</div>
								  <div role="tabpanel" class="tab-pane" id="list3">...</div>
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
    			$("#classes").css("margin-right","-30px").css("font-size"," 25px");
    		});
    	</script>
    	
  </body>
</html>
