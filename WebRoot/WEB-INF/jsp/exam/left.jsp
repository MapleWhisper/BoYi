<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="panel panel-default" style="background-color:#ffffff;">
	<div class="panel-body">
			<div style="border:0px;margin:0px auto;height:150px;width:132px;">
			<img src="${pageContext.request.contextPath}/${student.picPath}" class="img-thumbnail" width="170px"></img>					
			</div>
			<table class="table table-condensed table-hover table-striped ">
				<tr>
					<td>姓名:</td>
				</tr>
				<tr>
					<td>${student.name}</td>
				</tr>
				<tr>
					<td>学号：</td>
				</tr>
				<tr>
					<td>${student.studentId}</td>
				</tr>
				<tr>
					<td>班级：</td>
				</tr>				
				<tr>
					<td>${exam.classes.name}</td>
				</tr>
				<tr>
					<td>考试：</td>
				</tr>
				<tr>
					<td>${exam.name}</td>
				</tr>
			</table>
	</div>
</div>
