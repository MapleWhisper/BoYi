<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>管理员列表</title>
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
				
				<div class="panel panel-primary" >
					<div class="panel-heading" onclick="$('#body').toggle();">
						<h1 class="panel-title" style="font-size: 25px">全文检索(点击展开)</h1>
					</div>
					<div class="panel-body" id="body" >
						 <div class="form-group">
   						 	<div class=row>
   						 		<div class="col-xs-8">
   						 			<input type="text" id="key" name="key" class="form-control" placeholder="请输入 文章标题  文章内容  作者 类型  Id号 空格分开词">
   						 		</div>
   						 		<div class="col-xs-2">
   						 			 <button  type="submit" class="btn btn-primary btn-lg search" >检索</button>
   						 		</div>
   						 		<div class="col-xs-2">
   						 			 <a   class="btn btn-default" href="${pageContext.request.contextPath}/admin/article/articleAction">显示全部文章</a>
   						 		</div>
   						 	</div>
					      </div>
					</div>
					
				</div>
				
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h1 class="panel-title" style="font-size: 25px">文章列表 Article
							List</h1>
					</div>
					<div class="panel-body">
						<table class="table table-hover table-striped table-bordered">
							<thead>
								<tr class="info">
									<td>标题</td>
									<td>分类</td>
									<td>创建日期</td>
									<td>操作</td>
									<td>操作</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${articleList}" var="article">
									<tr>
										<td><a id="${article.id}" class="article">${article.title }</a></td>
										<td>${article.type}</td>
										<td><fm:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${article.createDate}" /></td>
										<td><a href="articleAction!edit?id=${article.id }"
											class="btn btn-info"><span
												class=" glyphicon glyphicon-edit"></span>&nbsp;&nbsp;修改</a></td>
										<td><a href="articleAction!delete?id=${article.id }"
											class="btn btn-danger" onclick="return confirm('确认要删除吗？')"><span
												class=" glyphicon  glyphicon-trash"></span>&nbsp;&nbsp;删除</a></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
						
						
						
						<div class="row">
							<div class="col-xs-6 col-xs-offset-5">
								<div class="no1">
									<a class="btn btn-primary "
										href="${pageContext.request.contextPath}/admin/article/articleAction!add">添加文章</a>
								</div>

							</div>
						</div>
						
						<!-- 分页 -->
						<%@ include file="page.jsp"%>
						<!-- 分页 -->

					</div>
					<!-- panel-body -->
				</div>
				<!-- panel panel-default -->
				<!-- 面板结束 -->
			</div>
			<!--右侧的内容 -->
		</div>
		<%@ include file="../buttom.jsp"%>
		
		<!-- 文章显示Modal -->
		<div class="modal fade " id="myModal" tabindex="-1" role="dialog"  aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="title"></h4>
		      </div>
		      <div class="modal-body" id="context">
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
		      </div>
		    </div>
		  </div>
		</div><!-- 文章显示Modal -->
	</div>

	<script
		src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#article").css("margin-right", "-30px")
					.css("font-size", " 25px");
		});
		$(function(){
			$(".article").click(function(){
				var id = $(this).attr("id");
				$.get("articleAction!show?id="+id,function(data){
					$("#title").html(data.title);
					$("#context").html(data.context);
					$("#myModal").modal("toggle");
				});
				
			});
			
			$(".search").click(function(){
				location.href="/BoYi/admin/article/articleAction!search?key="+$("#key").val();
			});
		});
	</script>

</body>
</html>
