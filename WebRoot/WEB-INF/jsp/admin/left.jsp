<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<ul class="list-group" role="tablist" id="nav">
		<li role="presentation" class="list-group-item pre " id="notification">
			<span class="glyphicon glyphicon-envelope"></span>
			<a href="${pageContext.request.contextPath}/admin/indexAction">
				通知中心
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
</ul>

<ul class="list-group" role="tablist" id="nav">
		<li role="presentation" class="list-group-item pre " id="course">
			<span class="glyphicon glyphicon-th-list"></span>
			<a href="${pageContext.request.contextPath}/admin/course/courseAction">
				课程管理
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
		<li role="presentation" class="list-group-item pre " id="paper">
			<span class="glyphicon glyphicon-tags"></span>
			<a href="${pageContext.request.contextPath}/admin/paper/paperAction">
				试卷管理
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
		<li role="presentation" class="list-group-item pre " id="problem">
			<span class="glyphicon glyphicon-tag"></span>
			<a href="${pageContext.request.contextPath}/admin/problem/problemAction">
				试题管理
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
		<li role="presentation" class="list-group-item pre " id="article" >
			<span class="glyphicon glyphicon-list-alt"></span>
			<a href="${pageContext.request.contextPath}/admin/article/articleAction">
				文章管理
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
</ul>

<ul class="list-group" role="tablist" id="nav">

		<li role="presentation" class="list-group-item pre " id="student">
			<span class="glyphicon glyphicon-user"></span>
			<a href="${pageContext.request.contextPath}/admin/admin/adminAction">
				学生管理
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
		<li role="presentation" class="list-group-item pre " id="teacher">
			<span class="glyphicon glyphicon-user"></span>
			<a href="${pageContext.request.contextPath}/admin/admin/adminAction">
				教师管理
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
		<li role="presentation" class="list-group-item pre " id="admin" >
			<span class="glyphicon glyphicon-user"></span>
			<a href="${pageContext.request.contextPath}/admin/admin/adminAction">
				管理员管理
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
</ul>
