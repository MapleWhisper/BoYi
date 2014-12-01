<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>班次管理</title>
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
						<h1 class="panel-title" style="font-size: 25px">班次列表 Classes
							List</h1>
					</div>
					<div class="panel-body">
						<div class="row well" style="text-align: center;">
							<center>
								<a class="btn btn-warning btn-lg btn-block"
									href="${pageContext.request.contextPath}/admin/classes/classesAction!add"
									style="width: 300px">添加班次
								</a>
							</center>
						</div>
						<!-- 班级导航头 -->
						<ul class="nav nav-pills nav-justified" role="tablist">

							<li role="presentation" class="${status=='未开始'?'active':'' }"><a
								href="${pageContext.request.contextPath}/admin/classes/classesAction">
									未开始<span class="badge"><s:property
											value="classesList.{?#this.status=='未开始'}.size()" /></span>
							</a></li>
							<li role="presentation" class="${status=='在读'?'active':'' }"><a
								href="${pageContext.request.contextPath}/admin/classes/classesAction?status=在读">
									在读<span class="badge"><s:property
											value="classesList.{?#this.status=='在读'}.size()" /></span>
							</a></li>
							<li role="presentation" class="${status=='已结束'?'active':'' }"><a
								href="${pageContext.request.contextPath}/admin/classes/classesAction?status=已结束">
									已结束<span class="badge"><s:property
											value="classesList.{?#this.status=='已结束'}.size()" /></span>
							</a></li>
						</ul>

						<!-- 班级内容 -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="list1">
								<table
									class="table table-hover table-striped table-bordered table-condensed"
									style="margin-top: 10px">
									<thead>

										<tr class="info">
											<td>课程名</td>
											<td>教师名称</td>
											<td>开课时间</td>
											<td>结束时间</td>
											<td>操作</td>
											<td>操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${classesList}" var="c">
											<tr>
												<c:if test="${c.recommand}">
													<td><a href="${pageContext.request.contextPath}/admin/classes/classesAction!show?id=${c.id}">${c.name}<span class="label label-danger">推荐课程</span></a></td>
												</c:if>
												<c:if test="${not c.recommand}">
													<td>${c.name }</td>
												</c:if>
												<td>${c.teacher.name }</td>
												<td><fm:formatDate value="${c.beginDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><fm:formatDate value="${c.endDate }"
														pattern="yyyy-MM-dd" /></td>
												<td><a href="classesAction!edit?id=${c.id }"
													class="btn btn-info"><span
														class=" glyphicon glyphicon-edit"></span>&nbsp;&nbsp;修改</a></td>
												<td><a href="classesAction!delete?id=${c.id}"
													class="btn btn-danger" onclick="return confirm('确认要删除吗？')"><span
														class=" glyphicon  glyphicon-trash"></span>&nbsp;&nbsp;删除</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- panel-body -->
				</div>
				<!-- panel panel-primary -->


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
    		$(function(){
    			$("#classes").css("margin-right","-30px").css("font-size"," 25px");
    		});
    	</script>

</body>
</html>
