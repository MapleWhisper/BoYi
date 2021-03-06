<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>系统设置列表</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.css"></link>

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
			<div class="col-xs-10">
				<!-- 面板开始 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">系统设置列表</h1>
					</div>
					<div class="panel-body">
						<table class="table table-hover table-striped table-bordered">
							<thead>
								<tr class="info">
									<td>参数名</td>
									<td>参数值</td>
									<td>操作</td>
									<td>说明</td>
								</tr>
							</thead>

							</tbody>
							<tr>
								<td>admin.email</td>
								<td><input type="text"
									value="${applicationScope.system['admin.email']}"
									name="admin.email"></td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>系统管理员邮箱,用于发送邮件通知</td>
							</tr>
							<tr>
								<td>admin.qq</td>
								<td><input type="text"
									value="${applicationScope.system['admin.qq']}" name="admin.qq"></td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>系统管理员qq,系统主页QQ聊天</td>
							</tr>
							<tr>
								<td>admin.school</td>
								<td><input type="text"
									value="${applicationScope.system['admin.school']}" name="admin.school"></td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>学校列表，添加学生显示，学校之间使用'-'分开</td>
							</tr>

							<tr>
								<td>page.articleAmountPerPage</td>
								<td><input type="text"
									value="${applicationScope.system['page.articleAmountPerPage']}"
									name="page.articleAmountPerPage">条/页</td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>文章管理每页显示的文章条数</td>
							</tr>
							
							<tr>
								<td>page.studentAmountPerPage</td>
								<td><input type="text"
									value="${applicationScope.system['page.studentAmountPerPage']}"
									name="page.studentAmountPerPage">条/页</td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>学生管理管理每页显示的学生条数</td>
							</tr>
							<tr>
								<td>company.phoneNumber</td>
								<td><input type="text"
									value="${applicationScope.system['company.phoneNumber']}"
									name="company.phoneNumber"></td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>公司电话</td>
							</tr>
							<tr>
								<td>index.slide1Href</td>
								<td><input type="text"
									value="${applicationScope.system['index.slide1Href']}"
									name="index.slide1Href"></td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>首页第1幻灯片链接</td>
							</tr>
							<tr>
								<td>index.slide2Href</td>
								<td><input type="text"
									value="${applicationScope.system['index.slide2Href']}"
									name="index.slide2Href"></td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>首页第2幻灯片链接</td>
							</tr>
							<tr>
								<td>index.slide3Href</td>
								<td><input type="text"
									value="${applicationScope.system['index.slide3Href']}"
									name="index.slide3Href"></td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>首页第3幻灯片链接</td>
							</tr>
							<tr>
								<td>index.slide4Href</td>
								<td><input type="text"
									value="${applicationScope.system['index.slide4Href']}"
									name="index.slide4Href"></td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>首页第4幻灯片链接</td>
							</tr>
							<tr>
								<td>company.name</td>
								<td><input type="text"
									value="${applicationScope.system['company.name']}"
									name="company.name"></td>
								<td><button class="btn btn-primary edit" type="button">修改参数</button></td>
								<td>公司名称</td>
							</tr>
							</tbody>
						</table>


					</div>
					<!-- panel-body -->
				</div>
				<!-- panel panel-default -->
				<!-- 面板结束 -->
			</div>
			<!--右侧的内容 -->
		</div>
		<%@ include file="../buttom.jsp"%>
	</div>
	<script
		src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#config").css("margin-right", "-30px").css("font-size", " 25px");
		});
		$(function(){
			$(".edit").click(function(){
				if(confirm("确定要修改吗")){
					var $input = $(this).parent("td").prev().find("input");
					var name = $input.attr("name");
					var value= $input.val();
					$.post("/BoYi/admin/config/configAction!saveProperties",{"name":name,"value":value},function(){
						alert('修改成功！')
					})
				}else{
					return;
				}
			})
		})
	</script>

</body>
</html>
