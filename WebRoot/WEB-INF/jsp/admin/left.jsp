<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<ul class="list-group" role="tablist" id="nav">
		<li role="presentation" class="list-group-item pre " id="notification">
			<span class="glyphicon glyphicon-envelope"></span>
			<a href="${pageContext.request.contextPath}/admin/indexAction">
				通知中心
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
		
		<li role="presentation" class="list-group-item pre " id="teacherCenter" style="display: ${(teacher==null)?'none':''}">
			<span class="glyphicon glyphicon-user"></span>
			<a href="${pageContext.request.contextPath}/admin/teacherCenter/teacherCenterAction">
				教师中心
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
</ul>

<ul class="list-group" role="tablist" id="nav">
		<li role="presentation" class="list-group-item pre " id="classes">
			<span class="glyphicon glyphicon-tasks"></span>
			<a href="${pageContext.request.contextPath}/admin/classes/classesAction">
				班次管理
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
		<li role="presentation" class="list-group-item pre " id="course">
			<span class="glyphicon glyphicon-th-list"></span>
			<a href="${pageContext.request.contextPath}/admin/course/courseAction">
				课程管理
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
		<li role="presentation" class="list-group-item pre " id="exam">
			<img src="${pageContext.request.contextPath}/image/paper.png"></img>
			<a href="${pageContext.request.contextPath}/admin/exam/examAction">
				考试管理
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
			<a href="${pageContext.request.contextPath}/admin/student/studentAction">
				学生管理
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
		<li role="presentation" class="list-group-item pre " id="teacher">
			<span class="glyphicon glyphicon-user"></span>
			<a href="${pageContext.request.contextPath}/admin/teacher/teacherAction">
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
		<li role="presentation" class="list-group-item pre " id="config" >
			<span class="glyphicon glyphicon-cog"></span>
			<a href="${pageContext.request.contextPath}/admin/config/configAction">
				系统设置
				<span style="float: right;"><span class="glyphicon glyphicon-chevron-right"></span></span>
			</a>
		</li>
</ul>
