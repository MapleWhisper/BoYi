<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	
	<title>登陆后台</title>
  </head>
   
  <body style="background-color: #f5f5f5;">
    	<div class="container">
    		<div class="row" style="margin-top: 150px; ">
				<div class="col-xs-4 col-xs-offset-4" >
					<div class="panel panel-primary" style="background:white" >
						<div class="panel-heading">
							<h2 class="panel-title">管理员登录</h2>
						</div>
						<div class="panel-body">
					<!--表单 -->
							<form action="${pageContext.request.contextPath}/adminLoginAction!login" class="form-horizontal" role="form" id="form1" name="form1" style="margin-top: 20px" method="post">
								<div class="form-group" align="center">
									<label for="inputEmail3" class="col-xs-3 control-label">用户名:</label>
									<div class="col-xs-9">
										<input type="text" class="form-control" id="admin.username" name="admin.username" >
									</div>
								</div>
								<div class="form-group" align="center">
									<label for="inputPassword3" class="col-xs-3 control-label">密码:</label>
									<div class="col-xs-9">
										<input type="password" class="form-control" name="admin.password" id="admin.password" >
									</div>
								</div>
								<div class="form-group" align="center">
									<label for="" class="col-xs-3 control-label">验证码</label>
									<div class="col-xs-5">
										<input type="text" class="form-control" name="valifCode" id="valifCode" >
									</div>
									<div class="col-xs-3">
										<img alt="验证码" class="control-label" src="${pageContext.request.contextPath}/imageAction!valifImage">
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-xs-offset-3 col-xs-10">
										<button type="submit" class="btn btn-warning">管理员登录</button>
									</div>
								</div>
								
								<div class="form-group" id="e2">
									<div class="col-xs-8 col-xs-offset-2">
										<div class="alert alert-danger alert-dismissible" role="alert">
  												<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
 												 <span id="e1">${error}</span>
										</div>
									</div>
								</div>
							</form>
							<!--登陆表单 -->
						</div>
					</div>

				</div>
			</div>
		</div>
    		
    	<script type="text/javascript">
		$(function() {  
			$("#form1").validate({
				rules:{
					'admin.username': {
						required:true
					},
					'admin.password': {
						required:true,
						minlength:2
					}
					
				},
				messages:{
					'admin.username':"请输入用户名",
					'admin.password':{
						required:"请输入密码",
						minlength:"长度需要大于3"
					}
				}
			});  
		});
		$(function(){
			var p = $("#e1").text();
			if( p.length==0){
				$("#e2").remove();
			}
		});
		</script>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
