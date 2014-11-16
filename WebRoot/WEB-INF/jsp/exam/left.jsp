<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="panel panel-default" style="background-color:#ffffff;">
	<div class="panel-body">
			<div style="border:1px solid red;margin:0px auto;height:150px;width:132px;">
				<img src="#">
			</div>
			<table class="table table-condensed table-hover table-striped ">
				<tr>
					<td>姓名:张三</td>
				</tr>
				<tr>
					<td>学号：123</td>
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
