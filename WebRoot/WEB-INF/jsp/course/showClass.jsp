 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
 <head>
<%@ include file="../header.jspf" %>

<meta charset="UTF-8">
<style type="text/css">
	.container {
	width: 1100px;
}
</style>
<title>课程详情</title>
</head>
<body>
	<div>
		<%@ include file="../index/loginHead.jsp"%>
	</div>
	<div class="container" style="background-color: #ffffff">
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/indexAction">首页</a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction">选课页面</a></li>
			<li class="active"><a href="#">班级详情</a></li>
		</ol>
		<div class="page-header">
			<h1 style="text-align: center;" > ${classes.name }   </h1>
		</div>
		<div class="row">
			<div class="col-xs-9 ">
				<div class="row">
					<div class="col-xs-3">
						<img style="width: 150px; height: 230px;" class="img-thumbnail"
							src="${pageContext.request.contextPath}/${classes.teacher.pic }">
					</div>
					<div class="col-xs-5">
						<table>
							<tr>
								<td height="48px" width="100px">教&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;师:</td>
								<td height="48px" width="254px">${classes.teacher.name }</td>
							</tr>
							<tr>
								<td height="48px" width="100px">开课日期:</td>
								<td height="48px" width="254px"><fm:formatDate value="${classes.beginDate }" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<td height="48px" width="100px">上课时间:</td>
								<td height="48px" width="254px">${classes.classTime }</td>
							</tr>
							<tr>
								<td height="48px" width="100px">上课地点:</td>
								<td height="48px" width="254px">${classes.classPlace }</td>
							</tr>
							<tr>
								<td height="48px" width="100px">课时价格:</td>
								<td height="48px" width="254px">￥<span>${classes.classPrice }</span>
								</td>
							</tr>
						</table>
					</div>
					<div class="col-xs-4">
						<a class="btn btn-warning btn-lg" style="margin-top:100px;" data-toggle="modal" data-target="#confirmClass">立即报名</a>
					</div>
				</div><!-- row-end -->
				
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#tab1"
							role="tab" data-toggle="tab">课程信息</a></li>
						<li role="presentation"><a href="#tab2" role="tab"
							data-toggle="tab">教学视频</a></li>
						<li role="presentation"><a href="#tab3" role="tab"
							data-toggle="tab">招生简章</a></li>
						<li role="presentation"><a href="#tab4" role="tab"
							data-toggle="tab">课程大纲</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="tab1"></div>
						<div role="tabpanel" class="tab-pane" id="tab2"></div>
						<div role="tabpanel" class="tab-pane" id="tab3"></div>
					    <div role="tabpanel" class="tab-pane" id="tab4"></div>
					</div>
			</div><!-- col-xs-8 -->
			
			
			<!-- 右侧老师推荐 -->
			<div class="col-xs-3">
				<%@ include file="showClass/teacher.jsp"%>
				
			</div><!-- 右侧老师推荐 -->
		</div>
	</div>
	<%@ include file="../foot.jsp"%>
	<%@include file="modal/confirmClass.jsp" %>
	<%@include file="../modal/studentLogin.jsp" %>
	
	<script type="text/javascript">
		$(function(){
			
			$("#submit").click(function(){
				var id = $(this).attr("name");
				$.post("/BoYi/course/indexAction!applyClass",{"id":id},function(data){
					data = data.trim();
					if(data=="login"){
						$("#studentLogin").modal("show");
					}else if(data == "success"){
						alert("恭喜，申请提交成功");
					}else{
						alert("抱歉，申请提交失败！");
					}
					
					$("#confirmClass").modal("hide");
				});
					
			});
			
			$("#login").click(function(){
				$.post("/BoYi/loginAction!loginAjax",$("#form2").serialize(),function(data){
					data = data.trim();
					if(data=="success"){
						alert("登陆成功");
						$("#studentLogin").modal("hide");
						$("#confirmClass").modal("show");
					}else{
						$("#e1").show();
						$("#e1").fadeOut(3000);
					}
				});
			});
		});
	</script>
</body>