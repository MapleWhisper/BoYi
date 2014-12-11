<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


	<!--导航条 -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation" ">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><strong>教育公司图标</strong></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath}/indexAction">博弈教育首页</a></li>
						<li><a target="_blank" href="http://bbs.bjsyedu.com/read.php?tid=1">Bug/功能提交和反馈</a></li>
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
						
						<li><p class="navbar-text">你好:${sessionScope.admin.name}${sessionScope.teacher.name}</p></li>		
						<li ><a href="${pageContext.request.contextPath}/adminLoginAction!logout">
							<span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;退出登陆</a></li>
						
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<!--导航条 -->
