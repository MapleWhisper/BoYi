<%@page import="java.text.DateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>今日签到</title>
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
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">班级详情 Class
							Detail</h1>
					</div>						
					<div class="panel-body"><h1>${classRecord.classes.name}</h1></div>
				</div>
				<!-- 班级详情 -->
			
			
				<!-- 班级记录详情 -->
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">班级记录 Class
							Record </h1>
					</div>
					<div class="panel-body">
						<div style="text-align: center;">
							<span class="well">今天是<%=DateFormat.getDateInstance(DateFormat.FULL).format(new Date() ) %></span>
							<hr>
							<span class="well">该记录日期为<span style="color: red;"><fm:formatDate value="${classRecord.date }"
												type="date" dateStyle="full" /></span></span>
							<hr>
						</div>
						
						<table class="table table-hover table-striped table-bordered table-condensed">
							<thead>
								<tr class="info">
									<td>序号</td>
									<td>学生Id</td>
									<td>学生姓名</td>
									<td>余额</td>
									<td>是否签到</td>
									<td>签到</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${classRecord.classes.students}" var="s" varStatus="sta">
									<tr >
										<td>${sta.count }</td>
										<td>${s.studentId }</td>
										<td>${s.name }</td>
										<td class="money" id="${s.account.money}">${s.account.money}元</td>
										<c:if test="${classRecord.records[s.id]=='true'}">
											<td><button class="btn btn-default"><span class="glyphicon glyphicon-ok"></span> 已签到</button></td>
											<td><a class="btn btn-default " disabled="disabled">已签到</a></td>
										</c:if>
										<c:if test="${classRecord.records[s.id]=='false'}">
											<td><button class="btn btn-default btn-primary"><span class="glyphicon glyphicon-remove"></span> 未签到</button></td>
											<td><a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/classes/classesAction!sign?id=${classRecord.id}&sId=${s.id}"
													onclick="return confirm('确认要签到吗？签到后不能修改')">签到</a>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</div><!-- 班级记录详情 -->


			</div>
			<!--右侧的内容 -->


		</div>

		<%@ include file="../buttom.jsp"%>
	</div>

	<script type="text/javascript">
    		$(function(){
    			$("#classes").css("margin-right","-30px").css("font-size"," 25px");
    		});

    		$(function(){
    			
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
