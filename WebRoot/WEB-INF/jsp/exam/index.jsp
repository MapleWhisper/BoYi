<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
<title>通知中心</title>
</head>

<body>
	<div class="container">
		<div class="row"></div>
		<div class="row" style="margin-top: 70px">
			<!--左侧的导航条 -->
			<div class="col-xs-2">
				<%@include file="left.jsp"%>
			</div>
			<!--左侧的导航条 -->

			<!--右侧的内容 -->
			<div class="col-xs-10">
					<div style="heigth:20px;text-align:center;">
						<h4>比赛标题</h4>
					</div>
					<div class="panel panel-default" style="background-color:#ffffff;">
						<div class="panel-body">
								<table class="table table-hover table-striped" style="text-align: center;">
									<tr class="info" >
										<td>比赛标题</td>
										<td>开始时间</td>
										<td>比赛状态</td>
									</tr>
									<c:forEach items="${examList}" var="e">
										<tr>
											<td ><a target="_blank" href="${pageContext.request.contextPath}/exam/examAction!show?id=${e.id}">                              
												${e.name}</a>
											</td>
											<td><fm:formatDate value="${e.beginTime}" pattern="yyyy-MM-dd HH:mm"/></td>
											
											<td ><span style="font-size: 14px" class="label">${e.status }</span></td>
										</tr>
										
									</c:forEach>
								</table>
								
								<!-- 分页 -->
								<div style="text-align: center;">
									<%@ include file="page.jsp"%>
								</div>
						</div>
					</div>
					
				
			</div>

		</div>
	</div>
	<script type="text/javascript">

		$(function(){
			
			$(".label").each(function(){
				var status = $(this).html();
				if(status == '未开始'){
					$(this).addClass("label-success");
				}else if(status == '已结束'){
					$(this).addClass("label-default");
				}else{
					$(this).addClass("label-danger");
				}
					
			});
		});
		
	</script>
</body>
</html>
