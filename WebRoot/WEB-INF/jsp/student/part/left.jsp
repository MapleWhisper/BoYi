<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

	<table class="table">
		<tr>
			<td><img
				src="${pageContext.request.contextPath}/${student.picPath}"
				height="70px" width="70px"></img></td>
			<td>你好，${student.name }<br> <a
				href="${pageContext.request.contextPath}/student/studentCenterAction!PersonalSet">个人设置</a></td>
		</tr>
		<tr>
			<td>学号:</td>
			<td colspan="2">${student.studentId }</td>
		</tr>
	</table>
	<div class="list-group">
		<a href="${pageContext.request.contextPath}/student/studentCenterAction" class="list-group-item"> 我的班级 </a> 
		<a href="${pageContext.request.contextPath}/student/studentCenterAction!showAccount" class="list-group-item"> 我的账户 </a> 
		<a href="${pageContext.request.contextPath}/exam/examAction" class="list-group-item"> 考试系统 </a>
	</div>


