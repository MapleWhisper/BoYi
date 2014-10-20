<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
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
				  		<form class="form-horizontal" style="margin-top: 50px" id="form1" method="post" action="loginAction!register">
						    <div class="form-group">
						      <label  class="col-xs-3 control-label" >*邮箱</label>
						      <div class="col-xs-7">
						        <input type="email" class="form-control" required id="inputEmail" placeholder="Email" id="email" name="student.email">
						      </div>
						    </div>
						    <div class="form-group">
						      <label  class="col-xs-3 control-label">*登陆密码</label>
						      <div class="col-xs-7">
						        <input type="password" class="form-control"  placeholder="Password" id="password" name="student.password">
						      </div>
						    </div>
						    <div class="form-group">
						      <label class="col-xs-3 control-label">*确认密码</label>
						      <div class="col-xs-7">
						        <input type="password" class="form-control" required  placeholder="RePassword" id="password2" name="password2">
						      </div>
						    </div>
						    <div class="form-group">
						      <div class="col-xs-5 col-xs-offset-3">
						        <button type="submit" class="btn btn-primary btn-lg">立即注册</button>
						      </div>
						    </div>
						    <div class="form-group">
						      <div class="col-xs-7 col-xs-offset-1">
									<c:if test="${meg =='error' }">
										<div class="alert alert-danger alert-dismissible" role="alert">
  												<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
 												 <span id="e1">注册失败，邮箱可能已注册<span>
										</div>
									</c:if>						      	
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
    	<%@ include file="../buttom.jsp" %>
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
					},
					password2: {
						required:true,
						minlength:2,
						equalTo:"#password"
					}
				}
			});  
		});
    	</script>
  </body>
</html>
