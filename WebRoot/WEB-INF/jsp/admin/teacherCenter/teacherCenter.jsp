<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>教师中心</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.css"></link>

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
			<div class="col-xs-7">
				<!-- 面板开始 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">我所带的班级
							Classes List</h1>
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
										<c:forEach items="${teacher.classes}" var="c">
											<tr>
												<td>${c.name }</td>
												<td><fm:formatDate value="${c.beginDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><fm:formatDate value="${c.endDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><button class="btn" disabled="disabled">${c.status}</button></td>

												<td><a
													href="teacherCenterAction!showClasses?id=${c.id }"
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
				<!-- 面板结束 -->
			</div>
			<!--右侧的内容 -->

			<div class="col-xs-3" style="margin-left: -10px">
				<div class="panel panel-info">
					<div class="panel-heading">教师信息</div>
					<div class="panel-body">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								role="tab" data-toggle="tab">我的资料</a></li>
							<li role="presentation"><a href="#profile" role="tab"
								data-toggle="tab">Profile</a></li>
							<li role="presentation"><a href="#messages" role="tab"
								data-toggle="tab">Messages</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
								<table class="table table-hover table-condensed "
									style="text-align: center;">
									<tr>
										<td>姓名:</td>
										<td>${teacher.name}</td>
									</tr>
									<tr>
										<td>邮箱:</td>
										<td>${teacher.email}</td>
									</tr>

								</table>
							</div>
							<div role="tabpanel" class="tab-pane" id="profile">...</div>
							<div role="tabpanel" class="tab-pane" id="messages">...</div>
						</div>
					</div>
				</div>
				<!-- panel -end -->
			</div>
			<!-- col-sm-3 -->

		</div>
		<%@ include file="../buttom.jsp"%>
	</div>
	<script
	src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>
	<script type="text/javascript">
    		$(function(){
    			$("#teacherCenter").css("margin-right","-30px").css("font-size"," 25px");
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
    		});
    		$(function(){
    			$('table').dataTable();
    		});
    	</script>

</body>
</html>
