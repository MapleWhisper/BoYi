<%@page import="java.text.DateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>课程详情</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.css"></link>
<script
	src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>

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
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">班级详情 Class
							Detail</h1>
					</div>
					<div class="panel-body"><h1>${classes.name}</h1></div>
				</div>
				<!-- 班级详情 -->
			
			
			<!-- 班级记录 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">班级记录 Class
							Record</h1>
					</div>
					<div class="panel-body">
						<div style="text-align: center;">
							<span class="well">今天是<%=DateFormat.getDateInstance(DateFormat.FULL).format(new Date() ) %></span>
							<a class="btn btn-primary btn-lg" onclick="return confirm('你确定要添加今天的班级记录吗')"
							   href="${pageContext.request.contextPath}/admin/classes/classesAction!addRecord?id=${classes.id}">添加今天的班级记录</a>
							
							<hr>
						</div>
						<table class="table table-hover table-striped table-bordered table-condensed">
							<thead>
								<tr class="info">
									<td>记录日期</td>
									<td>操作</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${classes.classRecords}" var="record">
									<tr class="apply">
										<td><fm:formatDate value="${record.date }"
												type="date" dateStyle="full" /></td>

										<td><a href="${pageContext.request.contextPath}/admin/classes/classesAction!showRecord?id=${record.id }" 
											class="btn btn-info">查看</a></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</div><!-- 班级记录 -->

			<!-- 班级申请 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">班级申请 Class
							Apply</h1>
					</div>
					<div class="panel-body">
						<table
							class="table table-hover table-striped table-bordered table-condensed">
							<thead>
								<tr class="info">
									<td>申请学生</td>
									<td>申请时间</td>
									<td>邮箱</td>
									<td>申请状态</td>
									<td>操作</td>
									<td>操作</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${classes.classApplies}" var="apply">
									<tr class="apply">
										<td>${apply.student.name }</td>
										<td><fm:formatDate value="${apply.applyDate }"
												type="both"  /></td>
										<td>${apply.student.email }</td>
										<td><span style="font-size: 14px" class="label">${apply.status }</span></td>

										<td><a href="${pageContext.request.contextPath}/admin/classes/classesAction!accept?id=${apply.id }" 
											class="btn btn-info">接受</a></td>
										<td><a href="${pageContext.request.contextPath}/admin/classes/classesAction!refuse?id=${apply.id }"
											class="btn btn-danger">拒绝</a></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</div>
				
				<!-- 班级申请 -->
				

				<!-- 学生列表开始 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">学生信息 Student
							Info List</h1>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active">
								<table
									class="table table-hover table-striped table-bordered table-condensed"
									id="table2">
									<thead>
										<tr class="info">
											<td>序号</td>
											<td>姓名</td>
											<td>学号</td>
											<td>邮箱</td>
											<td>余额</td>
											<td>操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${classes.students}" var="s" varStatus="sta">
											<tr>
												<td>${sta.count }</td>
												<td><a href="${pageContext.request.contextPath}/admin/student/studentAction!show?id=${student.id}">${s.name }</a></td>
												<td>${s.studentId }</td>
												<td>${s.email }</td>
												<td class="money" id="${s.account.money}">${s.account.money}元</td>

												<td><a href="${pageContext.request.contextPath}/admin/classes/classesAction!edit?id=${c.id }"
													class="btn btn-info"><span
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
				<!-- panel panel-default -->
				<!-- 学生列表结束 -->


				<!-- 考试信息 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">考试列表 Exam
							List</h1>
					</div>
					<div class="panel-body">
						<table class="table table-hover table-striped table-bordered"
							style="text-align: center;" id="table1">
							<thead>
								<tr>
									<td>考试标题</td>
									<td>开始时间</td>
									<td>考试状态</td>
									<td>成绩查看/批阅</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${classes.exams}" var="e">
									<tr class="exam">
										<td><a target="_blank"
											href="${pageContext.request.contextPath}/exam/examAction">
												${e.name}</a></td>
										<td><fm:formatDate value="${e.beginTime}"
												pattern="yyyy-MM-dd HH:mm" /></td>

										<td><span style="font-size: 14px" class="label">${e.status }</span></td>
										<td><a type="button"
											href="${pageContext.request.contextPath}/admin/teacherCenter/teacherCenterAction!showResult?id=${e.id}"
											class="btn btn-info">查看</a></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 考试信息 -->


			</div>
			<!--右侧的内容 -->


		</div>
		</div>

		<%@ include file="../buttom.jsp"%>

	<script type="text/javascript">
    		$(function(){
    			$("#classes").css("margin-right","-30px").css("font-size"," 25px");
    		});

    		$(function(){
    			$(".apply .label").each(function(){
    				var status = $(this).html();
    				if(status == '已完成'){
    					$(this).addClass("label-success");
    					$(this).parent().siblings().children("a").remove();
    				}else if(status == '已拒绝'){
    					$(this).addClass("label-default");
    					$(this).parent().siblings().children("a").remove();
    				}else{
    					$(this).addClass("label-danger");
    				}
    					
    			});
    			
    			$(".exam .label").each(function(){
    				var status = $(this).html();
    				if(status == '正在考试'){
    					$(this).addClass("label-danger");
    				}else if(status == '未开始'){
    					$(this).addClass("label-success");
    				}else{
    					$(this).addClass("label-default");
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
    			
    		});
    		
    	</script>

</body>
</html>
