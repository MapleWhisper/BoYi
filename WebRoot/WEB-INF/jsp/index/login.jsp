<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>登陆系统</title>
  </head>
  
  <body>
    	<div class="container">
    		<div class="row">
    			<%@ include file="loginHead.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px;padding-left: 200px;padding-right: 200px">
    		
    			<div class="panel panel-default" style="height: 400px">
				  <div class="panel-heading">
				    <h3 class="panel-title">用户登录</h3>
				   </div>
				   <div class="col-xs-8">
				  <div class="panel-body">
				  		<form class="form-horizontal" id="form1" style="margin-top: 80px" method="post" action="loginAction!login">
						    <div class="form-group">
						      <label  class="col-xs-2 control-label">邮箱</label>
						      <div class="col-xs-7">
						        <input type="email" class="form-control" id="inputEmail" required  placeholder="邮箱" name="student.email">
						      </div>
						    </div>
						    <div class="form-group">
						      <label  class="col-xs-2 control-label">密码</label>
						      <div class="col-xs-7">
						        <input type="password" class="form-control" id="inputPassword" required placeholder="密码" name="student.password">
						        <div class="checkbox">
						          <label>
						            <input type="checkbox" name="remberPwd" value="true"> 记住密码
						          </label>
						        </div>
						      </div>
						    </div>
						    <div class="form-group">
						      <div class="col-xs-5 col-xs-offset-2">
						      	
						        <button type="submit" class="btn btn-primary btn-lg">登陆</button>
						      </div>
						    </div>
						    <div class="form-group">
						      <div class="col-xs-7 col-xs-offset-1">
									<c:if test="${meg =='error' }">
										<div class="alert alert-danger alert-dismissible" role="alert">
  												<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
 												 <span id="e1">账号或者密码错误<span>
										</div>
									</c:if>						      	
						      </div>
						    </div>
						</form>
				  </div>
				  </div><!-- col-xs-8 -->
				  	<div class="col-xs-1">
				  		<div style="width: 1px;height:300px;background-color: #ddd;margin-top: 30px;">
						</div>
				  	</div>
				 	 <div class="col-xs-3"  style="margin-top: 80px">
				 	 	
				 	 	<div style="text-align: center;">
							  	<p>还不是博弈教育用户？</p><br>
							<a href="${pageContext.request.contextPath}/loginAction!registerUI" class="btn btn-warning btn-lg">立即注册</a>
						</div>
    				</div><!-- col-xs-4 -->
				</div><!-- panel -->
    			
    		</div><!-- row-end -->
    		
    	</div>
    	<%@ include file="../foot.jsp" %>
    	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
  		<script type="text/javascript">
    	$(function() {  
			$("#form1").validate({
				rules:{
					'student.email': {
						required:true,
						email:true
					},
					'student.password': {
						required:true,
						minlength:2
					}
				}
			});  
		});
    	</script>
  </body>
</html>
