<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>添加管理员</title>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
  </head>
  
  <body>
    	<div class="container-fluid">
    		<div class="row">
    			<%@ include file="../head.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px">
    				<!--左侧的导航条 -->
					<div class="col-xs-3">
						<%@include file="../left.jsp"%>
					</div>
					<!--左侧的导航条 -->
					
					<!--右侧的内容 -->
					<div class="col-xs-9">
						<!-- 面板开始 -->
						<div class="panel panel-danger">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">修改管理员  Edit Admin</h1>
						  </div>
						  <div class="panel-body">
						  	 <form action="${pageContext.request.contextPath}/admin/admin/adminAction!update" class="form-horizontal" role="form" id="form1" method="post">
								<div class="form-group">
									
									<label for="inputEmail3" class="col-xs-3 control-label">管理员账号</label>
									<div class="col-xs-9">
										<input type="text" class="form-control inputxt" id="username" name="admin.username" value="${admin.username }" required>
										<input type="hidden" name="admin.id" value="${admin.id }">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-xs-3 control-label">姓名</label>
									<div class="col-xs-9">
										<input type="text" class="form-control inputxt" id="name" name="admin.name" value="${admin.name }" required>
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-xs-3 control-label">职位</label>
									<div class="col-xs-9">
										<input type="text" class="form-control inputxt" name="admin.position"  id="position"value="${admin.position }" required>
									</div>
								</div>
								<div class="form-group" data-toggle="tooltip" data-placement="top" title="可多选" onmouseover="$(this).tooltip('show')">
									<label for="inputEmail3" class="col-xs-3 control-label">权限</label>
									<div class="col-xs-9">
										<c:forEach items="${privilegeList}" var="p">
											<label class="checkbox-inline">
											  <f:checkbox  path="admin.privilegeIds" name="privilegeIds" value="${p.id}"/> ${p.name}
											</label>
										</c:forEach>
									</div>
								</div>
								<div>
									
									<div class="form-group">    
										 <div class="col-xs-6 col-xs-offset-4">				
											<button type="submit" class="btn btn-primary  btn-lg "><span class="glyphicon glyphicon-floppy-saved"></span>&nbsp;&nbsp;确认修改管理员信息</button>																			 
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
    		$(function() {  
    			$("#form1").validate();
    		});
    	</script>
    	
  </body>
</html>
