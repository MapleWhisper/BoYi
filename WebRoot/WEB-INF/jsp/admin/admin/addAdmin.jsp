<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>添加管理员</title>
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
						<div class="panel panel-danger">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">添加管理员  Add Admin</h1>
						  </div>
						  <div class="panel-body">
						  	 <form action="${pageContext.request.contextPath }/admin/admin/adminAction!save" class="form-horizontal" role="form" id="form" method="post">
									<div class="form-group">
										
										<label for="inputEmail3" class="col-xs-2 control-label">管理员账号</label>
										<div class="col-xs-10">
											<input type="text" class="form-control  " name="admin.username" id="username" >
										</div>
									</div>
									
									<div class="form-group">
										<label for="inputEmail3" class="col-xs-2 control-label">输入密码</label>
										<div class="col-xs-10">
											<input type="text" class="form-control  " name="admin.password" id="username">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-xs-2 control-label">确认输入密码</label>
										<div class="col-xs-10">
											<input type="text" class="form-control  " id="username">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-xs-2 control-label">姓名</label>
										<div class="col-xs-10">
											<input type="text" class="form-control  " name="admin.name" id="username"	>
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-xs-2 control-label">职位</label>
										<div class="col-xs-10">
											<input type="text" class="form-control  " name="admin.position" id="username"	>
										</div>
									</div>
									<div class="form-group" data-toggle="tooltip" data-placement="top" title="可多选" onmouseover="$(this).tooltip('show')">
										<label for="inputEmail3" class="col-xs-2 control-label">权限</label>
										<div class="col-xs-10">
											<c:forEach items="${privilegeList}" var="p">
												<label class="checkbox-inline">
												  <input type="checkbox"  name="admin.privilegeIds" value="${p.id}"/> ${p.name}
												</label>
											</c:forEach>
										</div>
									</div>
									<div>
										<div class="form-group">    
											 <div class="col-xs-6 col-xs-offset-4">
												<button type="submit" class="btn btn-primary  btn-lg ">提交管理员</button>																			 
											 </div>
										</div>
									</div>
							</form>
						  </div><!-- panel-body -->
						</div><!-- panel panel-default -->
						<!-- 面板结束 -->
					</div>
					<!--右侧的内容 -->
    		</div>
    		<%@ include file="../buttom.jsp" %>
    	</div>
    	
    	<script type="text/javascript">
    		$(function(){
    			$("#admin").css("margin-right","-30px").css("font-size"," 25px");
    		});
    	</script>
    	
  </body>
</html>
