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
		<a href=" " class="list-group-item"> 查看我的消费记录 </a> <a href=" "
			class="list-group-item">我的成绩</a> <a href=" " class="list-group-item">入学测试</a>
	</div>


