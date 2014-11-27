<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>学生列表</title>
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
			<div class="col-xs-10">
				<!-- 面板开始 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">学生列表</h1>
					</div>
					<div class="panel-body">
						<table class="table table-hover table-striped table-bordered">
							<thead>
								<tr class="info">
									<td>学生学号</td>
									<td>学生姓名</td>
									<td>学生邮箱</td>
									<td>操作</td>
									<td>操作</td>
								</tr>
							</thead>

							</tbody>
								<c:forEach items="${studentList}" var="student">
									<tr>
										<td>${student.studentId }</td>
										<td>${student.name }</td>
										<td>${student.email }</td>
										<td><a href="studentAction!edit?id=${student.id }"
											class="btn btn-info"><span
												class=" glyphicon glyphicon-edit"></span>&nbsp;&nbsp;修改</a></td>
										<td><a href="studentAction!delete?id=${student.id}"
											class="btn btn-danger" onclick="return confirm('确认要删除吗？')"><span
												class=" glyphicon  glyphicon-trash"></span>&nbsp;&nbsp;删除</a></td>
									</tr>
								</c:forEach>
							
							</tbody>
							</table>
						<div class="row">
							<div class="col-xs-6 col-xs-offset-5">
								<div class="no1">
									<a class="btn btn-primary " href="studentAction!add">添加学生</a>
								</div>

							</div>
						</div>
						
						<!-- 分页 -->
						<%@ include file="page.jsp"%>
						<!-- 分页 -->
						
					</div>
					<!-- panel-body -->
				</div>
				<!-- panel panel-default -->
				<!-- 面板结束 -->
			</div>
			<!--右侧的内容 -->
		</div>
		<%@ include file="../buttom.jsp"%>
	</div>
	<script
		src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#student").css("margin-right", "-30px")
					.css("font-size", " 25px");
		});
	</script>

</body>
</html>
