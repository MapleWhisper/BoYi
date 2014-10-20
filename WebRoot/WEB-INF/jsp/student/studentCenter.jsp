<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
  </head>
  
  <body>
    	<div class="container">
    		<div class="row">
    			<%@ include file="head.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px ;padding-left: 100px ; padding-right: 100px ;">
    			<div class="panel panel-default" style="height: 600px" >
					<div class="panel-body">
						<div class="col-xs-3 " style="background-color: #f5f5f5;height: 570px" >
							<table class="table">
									<tr>
										<td><img src="${pageContext.request.contextPath}/image/student_default_pic.jpg" height="70px" width="70px"></img></td>
										<td>${student.name}于广路<br><a href="#">个人设置</a></td>
									</tr>
									<tr>
										<td>学号:</td><td>${student.id}1204010226</td>
									</tr>
							</table>
							 <div class="list-group">
							  <a href="#" class="list-group-item"> 查看我的消费记录 </a>
							  <a href="#" class="list-group-item">我的成绩</a>
							  <a href="#" class="list-group-item">入学测试</a>
							</div>
							
						</div><!-- col-xs-3 -->
						<div class="col-xs-9">
							<div class="row" style="height: 100px">
								
							</div>
							<div class="row">
								<div class="panel panel-default" style="height: 470px">
									<div class="panel-body" >
										<ol class="breadcrumb">
										  <li><a href="#">个人中心</a></li>
										  <li><a href="#" class="active">我的班级</a></li>
										</ol>
										<!-- 当前课程 -->
										<ul class="nav  nav-pills nav-justified" role="tablist">
										  <li class="active"><a href="#list1" title="待审核" role="tab" data-toggle="tab">在读课程<span class="badge" id="step1">${count.待审核}</span></a></li>
										  <li><a href="#list2" title="待答题" role="tab" data-toggle="tab">未开课课程<span class="badge" id="step2">${count.待答题}</span></a></li>
										  <li><a href="#list3" title="待批阅" role="tab" data-toggle="tab">已结束课程<span class="badge" id="step3">${count.待批阅}</span></a></li>
										  <li><a href="#list4" title="已完成" role="tab" data-toggle="tab">考试课程</a></li>
										</ul><!-- 申请头 -->
										
										
										<!-- 待审核 -->
										 	<div class="tab-content" style="margin-top: 20px">
										 		<div class="tab-pane active" id="list1" >
												</div>
												<div class="tab-pane active" id="list1" >
												</div>
												<div class="tab-pane active" id="list1" >
												</div>
												<div class="tab-pane active" id="list1" >
												</div>
											</div>
								</div>
							</div>
						</div><!-- col-xs-9 -->
					</div>
				</div>
    		</div>
    		
    	</div>
    	<%@ include file="../buttom.jsp" %>
  </body>
</html>
