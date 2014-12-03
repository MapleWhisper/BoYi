<%@page import="java.text.DateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>学生详情</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.css"></link>
<script
	src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>

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
	<div class="container-fluid">
		<div class="row">
			<%@ include file="../head.jsp"%>
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
				<div class="panel panel-info">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">学生详情 Student
							Detail</h1>
					</div>
					<div class="panel-body ">
						<div class="row">
							<div class="col-xs-2" style="text-align: center;" >
								
								<img  class="class="img-thumbnail"" src="${pageContext.request.contextPath}/${student.picPath}"
											height="100px" width="100px"></img>
										<br>
										<h3>${student.name }</h3>
							</div>
							<div class="col-xs-4">
								
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
								 <button class="btn btn-warning">点此充值</button>
								
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
						<div style="text-align: center;">
							<span class="well">今天是<%=DateFormat.getDateInstance(DateFormat.FULL).format(new Date() ) %></span>
							<hr>
						</div>
						<table class="table table-hover table-striped table-bordered table-condensed">
							<thead>
								<tr class="info">
									<td>记录Id</td>
									<td>记录时间</td>
									<td>课程</td>
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

			
				<div class="panel panel-info">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">学生报名的班级</h1>
					</div>
					<div class="panel-body">

						<!-- 班级内容 -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="list1">
								<table
									class="table table-hover table-striped table-bordered table-condensed"
									style="margin-top: 10px">
									<thead>
										<tr class="info">
											<td>课程名</td>
											<td>开课时间</td>
											<td>结束时间</td>
											<td>状态</td>
											<td>操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${student.classes}" var="c">
											<tr>
												<td>${c.name }</td>
												<td><fm:formatDate value="${c.beginDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><fm:formatDate value="${c.endDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><button class="btn label" disabled="disabled">${c.status}</button></td>

												<td><a
													href="${pageContext.request.contextPath}/admin/classes/classesAction!show?id=${c.id }"
													class="btn btn-info" target="_blank"><span
														class=" glyphicon glyphicon-zoom-in"></span>&nbsp;&nbsp;查看</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- panel-body -->
				</div>



			</div>
			<!--右侧的内容 -->


		</div>
		</div>

		<%@ include file="../buttom.jsp"%>

	<script type="text/javascript">
    		$(function(){
    			$("#student").css("margin-right","-30px").css("font-size"," 25px");
    		});

    		$(function(){
    			$(".label").each(function(){
    				var status = $(this).html();
    				if(status == '未开始'){
    					$(this).addClass("btn-success");
    				}else if(status == '已结束'){
    					$(this).addClass("btn-default");
    				}else{
    					$(this).addClass("btn-danger");
    				}
    			});
    			
    			$(".money").each(function(){
    				var m = $(this).attr("id");
    				if(m<0){
    					$(this).addClass("danger");
    				}else{
    					$(this).addClass("success");
    				}
    			});
    			
    			$(".info tr td:even").css("text-align","right");
    			$(".info tr td:odd").css("text-align","left");
    		});
    		
    	</script>

</body>
</html>
