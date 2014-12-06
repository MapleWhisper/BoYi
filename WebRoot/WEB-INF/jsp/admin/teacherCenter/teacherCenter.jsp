<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>教师中心</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.css"></link>
<style type="text/css">
	
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
												<td><button class="btn label" disabled="disabled">${c.status}</button></td>

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
				<div class="panel panel-info" >
					<div class="panel-heading">教师信息<span style="float: right;"></span></div>
					<div class="panel-body">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								role="tab" data-toggle="tab">我的资料</a></li>
							<li role="presentation"><a href="#profile" role="tab"
								data-toggle="tab">Profile</a></li>
							<li role="presentation"><a  href="#" id="edit">修改信息</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
								<form action="teacherCenterAction!update" method="post" style="text-align: center;">
								<input type="hidden" name="id" value="${teacher.id}">
								<table class="table table-hover table-condensed "
									style="text-align: center;">
									<tr>
										<td>头像:</td>
										<td class="old"><img src="${pageContext.request.contextPath}/${teacher.pic}" width="120px" height="160px"></img></td>
										<td class="new"><button id="editPic" type="button" class="btn btn-primary btn-small">修改头像</button></td>
									</tr>
									<tr>
										<td>姓名:</td>
										<td class="old">${teacher.name}</td>
										<td class="new"><input type="text" name="teacher.name" value="${teacher.name}"></td>
									</tr>
									<tr>
										<td>邮箱:</td>
										<td class="old">${teacher.email}</td>
										<td class="new"><input type="text" name="teacher.email" value="${teacher.email}"></td>
									</tr>

								</table>
									<button type="submit" class="new btn btn-primary btn-small">保存信息</button>
								</form>
								
							</div>
							<div role="tabpanel" class="tab-pane" id="profile">...</div>
							<div role="tabpanel" class="tab-pane" id="messages">...</div>
						</div>
					</div>
				</div>
				<!-- panel -end -->
			</div><!-- col-sm-3 教师详情结束 -->
			<%@ include file="../script/addTeacherModal.jsp" %>
			

		</div>
		<%@ include file="../buttom.jsp"%>
	</div>
	<script src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
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
    			
    			$("#edit").click(function(){
    				$(".old").toggle();
    				$(".new").toggle();
    				if($(this).html()=="修改信息"){
    					$(this).html("取消修改");
    				}else{
    					$(this).html("修改信息");
    				}
    			});
    			
    			$("#editPic").click(function(){
    				$("#addTeacherPicModal").modal("show");
    			});
    		});
    		
			$("form").validate();    		
    	</script>

</body>
</html>
