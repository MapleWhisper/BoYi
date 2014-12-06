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
						<li><a href="${pageContext.request.contextPath}/indexAction">博弈教育</a></li>
						<li><a href="${pageContext.request.contextPath}/course/indexAction">选课页面</a></li>
						<li><a href="${pageContext.request.contextPath}/student/studentCenterAction">学生中心</a></li>
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
					 <c:if test="${ sessionScope.student ==null}">
					 		<li><a href="${pageContext.request.contextPath}/loginAction!loginUI">登陆</a></li>
     					 <li><a href="${pageContext.request.contextPath}/loginAction!registerUI">注册</a></li>
					 </c:if>
					  <c:if test="${sessionScope.student !=null}">
					 		<li><a href="${pageContext.request.contextPath}/student/studentCenterAction">你好，${student.name },[学生中心]</a></li>
     					 <li><a href="${pageContext.request.contextPath}/loginAction!logout">退出登录</a></li>
					 </c:if>
     				 
     				 <li><a href="${pageContext.request.contextPath}/indexAction">返回博弈教育首页</a></li>
     				</ul>
				</div>
				
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<!--导航条 -->
