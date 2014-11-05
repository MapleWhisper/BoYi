<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>试卷列表</title>
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
 						<!-- 试卷列表 -->
    					<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h3 class="panel-title" style="font-size: 25px">试卷列表 Paper List ${sessionScope.grade } | ${sessionScope.subject }</h3>
						  </div>
						  <div class="panel-body">
						    	<table class="table table-hover table-striped table-bordered">
						    		<tr>
						    			<td>试卷标题</td>
						    			<td>试卷作者</td>
						    			<td>年级科目</td>
						    			<td>生成时间</td>
						    			<td>操作</td>
						    		</tr>
						    		<c:forEach items="${paperList }" var="p">
						    			<tr>
						    				<td><a target="_blank" href="${pageContext.request.contextPath}/admin/paper/paperAction!show?id=${p.id}">${p.title }</a></td>
						    				<td>${p.auther }</td>
						    				<td>${p.grade} ${p.subject }</td>
						    				<td><fm:formatDate value="${p.createDate}" pattern="yyyy-MM-dd"/></td>
						    				<td><a id="${p.id}" class="btn btn-sm btn-warning delete">删除</a></td>
						    				<c:if test="${resumeId !=null }">
						    					<td><a href="${pageContext.request.contextPath}/admin/apply/accept/${resumeId}/${p.id}" 
						    							class='btn btn-danger ' onClick="return confirm('确定要要使用这个试卷并发给用户答题吗，一旦确定，不可修改试卷')">使用该试卷， 并通过用户简历审核</a></td>
						    				</c:if>
						    				
						    			</tr>
						    		</c:forEach>
						    	</table>
						  </div>
						</div><!-- 试卷列表 -->
						<!-- 面板结束 -->
					</div>
					<!--右侧的内容 -->
    		</div>
    		<%@ include file="../buttom.jsp" %>
    	</div>
    	
    	<script type="text/javascript">
    		$(function(){
    			$("#paper").css("margin-right","-30px").css("font-size"," 25px");
    		});
    		
    	</script>
    	
  </body>
</html>
