<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>试卷/成绩 查看批阅</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.css"></link>
	<script src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>
	
  </head>
  
  <body>
    	<div class="container-fluid">
    		<div class="row">
    			<%@ include file="../head.jsp" %>
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
						
						<!-- 导航 -->
						<ol class="breadcrumb">
						  <li><a href="teacherCenterAction">教师中心</a></li>
						  <li><a href="teacherCenterAction!showClasses?id=${exam.classes.id}">班级详情</a></li>
						  <li class="active">试卷查看/批阅</li>
						</ol><!-- 导航 -->
						
						<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">
						    	考试：${exam.name }</h1>
						  </div>
						  <div class="panel-body">
								
								<!-- 班级内容 -->
								<div class="tab-content">
								  <div role="tabpanel" class="tab-pane active"  >
								  		 <table class="table table-hover table-striped table-bordered table-condensed"  id="table2">
								  		 <thead>
								  		 	<tr class="info">
												<td>学号</td>
												<td>姓名</td>
												<td>答卷</td>
												<td>成绩</td>
												<td>操作</td>
											</tr>
								  		 </thead>
										<tbody>
											 <c:forEach items="${exam.results}" var="r">
											 	<tr>
													<td>${r.student.id }</td>
													<td>${r.student.name }</td>
													<td><a href="${pageContext.request.contextPath}/admin/paper/paperAction!checkPaper?id=${r.id}"  class="btn btn-info">查看答卷</a></td>		
													<td style="width: 30px">
															<input type="text" class="form-control" name="score" id="score" value="${r.score }"/>
													</td>
													<td><button type="button" class="btn btn-info score" name="${r.id}">保存成绩</button></td>
												</tr>																								
											 </c:forEach>
										</tbody>
										
										</table>
								  </div>
								</div>
						  </div><!-- panel-body -->
						</div><!-- panel panel-default -->
						<!-- 面板结束 -->
					</div><!--右侧的内容 -->
					</div>
					
    		
    		<%@ include file="../buttom.jsp" %>
    	</div>
    	
    	<script type="text/javascript">
    		$(function(){
    			$("#teacherCenter").css("margin-right","-30px").css("font-size"," 25px");
    		});

    		$(function(){
    			$('#table1').dataTable();
    			$('#table2').dataTable();
    			
    			$(".score").click(function(){
					var id = $(this).attr("name");
					var score = $("#score").val();
					if(score <0 || score >100){
						alert("成绩必须为整数 且大于0 小于等于100");
						return;
					}
					$.post("../paper/paperAction!setScore",{"id":id,"score":score},function(data){
						alert("修改成功");
					});
				});
    		});
    		
    		
    	</script>
    	
  </body>
</html>
