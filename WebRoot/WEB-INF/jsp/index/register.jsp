<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body>
    	<div class="container">
    		<div class="row">
    			<%@ include file="loginHead.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px;padding-left: 200px;padding-right: 200px">
    		
    			<div class="panel panel-default" style="height: 400px">
				  <div class="panel-heading">
				    <h3 class="panel-title">邮箱注册</h3>
				   </div>
				   <div class="col-xs-8">
				  <div class="panel-body">
				  		<form class="form-horizontal" style="margin-top: 80px">
						    <div class="form-group">
						      <label for="inputEmail" class="col-xs-3 control-label">*邮箱</label>
						      <div class="col-xs-7">
						        <input type="email" class="form-control" id="inputEmail" placeholder="Email">
						      </div>
						    </div>
						    <div class="form-group">
						      <label for="inputPassword" class="col-xs-3 control-label">*登陆密码</label>
						      <div class="col-xs-7">
						        <input type="password" class="form-control" id="inputPassword" placeholder="Password">
						      </div>
						    </div>
						    <div class="form-group">
						      <label for="inputPassword" class="col-xs-3 control-label">*确认密码</label>
						      <div class="col-xs-7">
						        <input type="password" class="form-control" id="inputPassword" placeholder="Password">
						      </div>
						    </div>
						    <div class="form-group">
						      <div class="col-xs-5 col-xs-offset-3">
						      	
						        <button type="submit" class="btn btn-primary btn-lg">立即注册</button>
						      </div>
						    </div>
						</form>
				  </div>
				  </div><!-- col-xs-8 -->
				 	 <div class="col-xs-4"  style="margin-top: 80px">
				 	 	<div>
				 	 		<center>
							  	<p>已有账号</p><br>
							<a  href="${pageContext.request.contextPath}/loginAction!loginUI" class="btn btn-waring btn-primary ">立即登陆</a>
							</center>
						</div>
    					
    				</div><!-- col-xs-4 -->
				</div><!-- panel -->
    			
    		
    		
    		
    			
    		</div><!-- row-end -->
    		
    	</div>
    	<%@ include file="buttom.jsp" %>
  </body>
</html>
