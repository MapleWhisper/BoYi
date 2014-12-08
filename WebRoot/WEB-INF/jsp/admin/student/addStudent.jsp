<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/js/kindeditor/themes/simple/simple.css" />
	<title>添加学生</title>
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
						    <h1 class="panel-title" style="font-size: 25px">添加学生  Add student</h1>
						  </div>
						  <div class="panel-body">
						  	 <form action="${pageContext.request.contextPath }/admin/student/studentAction!save" 
						  	 			class="form-horizontal" role="form" id="form1" method="post">
									<div class="form-group">
										<label   class="col-xs-2 control-label">*学生姓名</label>
										<div class="col-xs-3">
											<input type="text" class="form-control  " name="student.name" id="username" required="required" >
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*邮箱</label>
										<div class="col-xs-3">
											<input type="email" class="form-control  " name="student.email" id="email" required="required" >
										</div>
										<div class="col-xs-2">
											<span class="help-block">*登陆使用!请谨慎填写</span>
										</div>
									</div>
									
									<div class="form-group">
										<label   class="col-xs-2 control-label">*输入密码</label>
										<div class="col-xs-3">
											<input type="password" class="form-control" name="student.password" id="password" required="required" >
										</div>
										<div class="col-xs-3">
											<button type="button" class="btn btn-primary" id="initPwd">重置密码为123456</button>
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*确认输入密码</label>
										<div class="col-xs-3">
											<input type="password" class="form-control" id="password2" name="password2" id="password2" required="required">
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*年龄</label>
										<div class="col-xs-3">
											<input type="number" class="form-control  " name="student.age" id="age"	required="required">
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*性别</label>
										<div class="col-xs-3">
											<input type="radio" name="student.sex" id="sex"	value="男" required="required">男 <br>
											<input type="radio"  name="student.sex" id="sex"	value="女">女
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*所属学校</label>
										<div class="col-xs-3">
										<!--  
											<input type="text" class="form-control" name="student.school" id="school" required="required"	>
											-->
											<select name="student.school" class="form-control" required="required">
												<c:forTokens items="${applicationScope.system['admin.school'] }" delims="-" var="s">
													<option value="${s}">${s}</option>
												</c:forTokens>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*入学年</label>
										<div class="col-xs-3">
											<select name="student.schoolTime" class="form-control" required="required">
												<c:forEach  begin="2005" end="2040" var="y" >
													<option value="${y}">${y}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*学生类型</label>
										<div class="col-xs-3">
											<select name="student.studentType" class="form-control" required="required">
													<option value="X">小学</option>
													<option value="C">初中</option>
													<option value="G">高中</option>
													<option value="D">大学</option>
													<option value="Z">职业培训</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">学生电话</label>
										<div class="col-xs-3">
											<input type="number" class="form-control" name="student.phoneNumber" id="phoneNumber"  >
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">身份证号</label>
										<div class="col-xs-3">
											<input type="number" class="form-control  " name="student.idNumber" id="idNumber"	>
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">父母姓名</label>
										<div class="col-xs-3">
											<input type="text" class="form-control  " name="student.parentName" id="parentName"	>
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">父母手机号</label>
										<div class="col-xs-3">
											<input type="text" class="form-control  " name="student.parentPhoneNumber" id="parentPhoneNumber"	>
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">城市</label>
										<div class="col-xs-3">
											<input type="text" class="form-control  " name="student.city" id="city"	>
										</div>
									</div>
									
									<div>
										<div class="form-group">    
											 <div class="col-xs-6 col-xs-offset-4">
												<button type="submit" class="btn btn-primary  btn-lg ">保存学生</button>																			 
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
    	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
    	<script type="text/javascript">
    		$(function(){
    			$("#student").css("margin-right","-30px").css("font-size"," 25px");
    		});
    		$(function(){
				$("#form1").validate({
					rules:{
						'student.password': {
							required:true,
							minlength:6
						},
						password2: {
							required:true,
							minlength:6,
							equalTo:"#password"
						}
					}
				});    			
    		})
    		$(function(){
    			$("#initPwd").click(function(){
    				$("#password").val("123456");
    				$("#password2").val("123456");
    				
    			});
    		});
    	</script>
    	
  </body>
</html>
