<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
<%@ include file="../header.jspf"%>

<meta charset="UTF-8">
<style type="text/css">
.container {
	width: 1100px;
}
.ctitle {
	font-size: 19px;
}

.ccontext {
	height: 25px;
	color: gray;
	font-size: 14px;
}

.glyphicon {
	color: orange;
}
</style>
<title>教师详情</title>
</head>
<body>
	<div>
		<%@ include file="../index/loginHead.jsp"%>
	</div>
	<div class="container" style="background-color: #ffffff">
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/indexAction">首页</a></li>
			<li><a
				href="${pageContext.request.contextPath}/course/indexAction">选课页面</a></li>
			<li class="active"><a href="#">教师详情</a></li>
		</ol>
		<div class="page-header">
			<h1 style="text-align: center;">${teacher.name}教师简介</h1>
		</div>
		<div class="row">
			<div class="col-xs-9 ">
				<div class="row well" style="background-color: #fafafa">
					<div class="col-xs-3" style="height: 150px;">
						<img style="width: 150px" class="img-thumbnail"
							src="${pageContext.request.contextPath}/${teacher.pic}">
					</div>
					<div class="col-xs-6">
						<table>
							<tr>
								<td height="48px" width="100px">教&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;师：</td>
								<td height="48px" width="254px">${teacher.name }</td>
							</tr>
							<tr>
								<td height="48px" width="100px">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
								<td height="48px" width="254px">${teacher.email }</td>
							</tr>
							<tr>
								<td height="48px" width="100px">教授课程：</td>
								<td height="48px" width="254px">初中语文</td>
							</tr>

						</table>
					</div>
					<div class="col-xs-3">
						<a class="btn btn-warning btn-lg" style="margin-top:50px;"
							data-toggle="modal" data-target="#confirmClass">查看教师空间</a>
					</div>
				</div>
				<!-- row-end -->
				<div class="row">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#tab1"
						role="tab" data-toggle="tab">所带班级</a></li>
					<li role="presentation"><a href="#tab2" role="tab"
						data-toggle="tab">教师简介</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<!-- 所带班级 -->
					<div role="tabpanel" class="tab-pane active" id="tab1">
						<c:forEach items="${teacher.classes}" var="c">

						<div>
							<div class="panel panel-warning">
								<div class="panel-body ">
									<div class="row">
										<div class="col-xs-2" style="text-align: center;">
											<img
												src="${pageContext.request.contextPath}/${c.teacher.pic}"
												height="80" width="80" /> <br> ${c.teacher.name}
										</div>
										<div class="col-xs-8">
											<table>
												<tr class="ctitle">
													<td><a
														href="${pageContext.request.contextPath}/course/indexAction!showClass?id=${c.id}"><span
															class="glyphicon glyphicon-bookmark"></span>${c.name }</a></td>
													<td></td>
												</tr>
												<tr class="ccontext">
													<td><span class="glyphicon glyphicon-time"></span>
														开课时间：<fm:formatDate value="${c.beginDate}"
															pattern="yyyy-MM-dd" /></td>

												</tr>
												<tr class="ccontext">
													<td><span class="glyphicon glyphicon-heart"></span>适合于：${c.course.grade}学生</td>
												</tr>

												<tr class="ccontext">
													<td><span class="glyphicon glyphicon-usd"></span>价格:${c.classPrice }</td>
													<td><span class="glyphicon glyphicon-user"></span>人数:${c.studentNumber}</td>
												</tr>
											</table>
										</div>

										<div class="col-xs-2">
											<a type="button" class="btn btn-warning"
												href="${pageContext.request.contextPath}/course/indexAction!showClass?id=${c.id}"
												style="margin-top: 40px">去选课</a>
										</div>
									</div>
									<!-- row end -->
								</div>
								<!-- panel body end -->
							</div>
							<!-- panel end -->
						</div>
						<!-- 班级结束 -->

						</c:forEach>
					</div>
					<!-- 所带班级 -->
					<div role="tabpanel" class="tab-pane" id="tab2"></div>
					<div role="tabpanel" class="tab-pane" id="tab3">${classes.course.courseDetail }</div>
				</div>
				</div>
			</div>
			<!-- col-xs-8 -->


			<!-- 右侧老师推荐 -->
			<div class="col-xs-3">
				<%@ include file="showClass/teacher.jsp"%>

			</div>
			<!-- 右侧老师推荐 -->
		</div>
	</div>
	<%@ include file="../foot.jsp"%>


	
</body>