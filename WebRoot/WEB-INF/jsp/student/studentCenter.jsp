<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>学生中心</title>
  </head>
  
  <body>
    	<div class="container">
    		<div class="row">
    			<%@ include file="../index/loginHead.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px ;padding-left: 100px ; padding-right: 100px ;">
    			<div class="panel panel-default" style="height: 600px" >
					<div class="panel-body">
						<div class="col-xs-3 " style="background-color: #f5f5f5;height: 570px" >
							<%@ include file="part/left.jsp"%>
						</div><!-- col-xs-3 -->
						<div class="col-xs-9">
							<!-- 
							<div class="row" style="height: 100px">
								<%@ include file="part/top.jsp"%>
							</div>
							 -->
							<div class="row">
								<div class="panel panel-default" style="height: 470px">
									<div class="panel-body" >
										<ol class="breadcrumb">
										  <li>个人中心</li>
										  <li>我的班级</li>
										</ol>
										<!-- 当前课程 -->
										<ul class="nav  nav-pills nav-justified" role="tablist">
										  <li class="active"><a href="#list1" title="待审核" role="tab" data-toggle="tab">在读课程<span class="badge" id="step1">${count.待审核}</span></a></li>
										  <li><a href="#list2" title="待答题" role="tab" data-toggle="tab">未开课课程<span class="badge" id="step2">${count.待答题}</span></a></li>
										  <li><a href="#list3" title="待批阅" role="tab" data-toggle="tab">已结束课程<span class="badge" id="step3">${count.待批阅}</span></a></li>
										</ul><!-- 申请头 -->
										
										
										 	<div class="tab-content" style="margin-top: 20px">
										 		<div class="tab-pane active" id="list1" >
										 			<s:iterator value="student.classes.{?#this.status=='在读'}" var="c">
										 				<div class="panel panel-primary">
										 					<%@include file="part/class.jsp" %>
										 				</div>
										 			</s:iterator>
												</div>
												<div class="tab-pane " id="list2" >
													<s:iterator value="student.classes.{?#this.status=='未开始'}" var="c">
										 				<div class="panel panel-primary">
										 					<%@include file="part/class.jsp" %>
										 				</div>
										 			</s:iterator>
												</div>
												<div class="tab-pane " id="list3" >
													<s:iterator value="student.classes.{?#this.status=='已结束'}" var="c">
										 				<div class="panel panel-primary">
										 					<%@include file="part/class.jsp" %>
										 				</div>
										 			</s:iterator>
												</div>
											</div>
								</div>
							</div>
						</div><!-- col-xs-9 -->
					</div>
				</div>
    		</div>
    		
    	</div>
    	</div>
    	<%@ include file="../foot.jsp" %>
  </body>
</html>
