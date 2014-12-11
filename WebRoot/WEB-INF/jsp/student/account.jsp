<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>学生中心/我的账户</title>
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.css"></link>
	<style type="text/css">
.table > thead > tr > th,
.table > tbody > tr > th,
.table > tfoot > tr > th,
.table > thead > tr > td,
.table > tbody > tr > td,
.table > tfoot > tr > td {
  border-top: 0px solid #ddd;
}
</style>
  </head>
  
  <body>
    	<div class="container">
    		<div class="row">
    			<%@ include file="../index/loginHead.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px ;padding-left: 100px ; padding-right: 100px ;">
    			<div class="panel panel-default"  >
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
										  <li>我的账户</li>
										</ol>
										<div class="panel-body ">
											<div class="row">
												
												<div class="col-xs-6">
													
													<table class="table info">
														<tr>
															<td >学号:</td>
															<td >${student.studentId }</td>
														</tr>
														<tr>
															<td>邮箱:</td>
															<td>${student.email }</td>
														</tr>
														<tr>
															<td>电话号码:</td>
															<td>${student.phoneNumber }</td>
														</tr>
													</table>
												</div>
												<div class="col-xs-6">
													账户余额：
													<h2>${student.account.money }元</h2>
													
												</div>
												
											</div>
											
										
										</div>
									</div>
									<!-- 班级详情 -->
								
								
									<!--学生账户 -->
									<div class="panel panel-info">
										<div class="panel-heading">
											<h1 class="panel-title" style="font-size: 25px">扣费记录</h1>
										</div>
										<div class="panel-body">
											<table class="table table-hover table-striped table-bordered table-condensed">
												<thead>
													<tr class="info">
														<td>记录Id</td>
														<td>记录时间</td>
														<td>班级</td>
														<td>班级类型</td>
														<td>金额</td>
														<td>附加费</td>
														<td>类型</td>
														<td>备注</td>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${student.account.resumes}" var="r">
														<tr >
														<td>${r.id }</td>
														<td><fm:formatDate value="${r.tradeDate}"
																	type="both" /></td>
														<td>${r.classes.name }</td>
														<td>${r.classes.classType}</td>
														<td class="money" id="${r.amount}">${r.amount}</td>
														<td>${r.additionAmount}</td>
														<td>${r.type}</td>
														<td>${r.note }</td>
														</tr>
													</c:forEach>
												</tbody>
					
											</table>
										</div>
									</div><!-- 学生账户 -->
								</div>
							</div>
						</div><!-- col-xs-9 -->
					</div>
				</div>
    		</div>
    		
    	</div>
    	<%@ include file="../foot.jsp" %>
    	<script src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
		<script	src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>
  </body>
</html>
