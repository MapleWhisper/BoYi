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
						  	 <form action="${pageContext.request.contextPath }/admin/student/studentAction!update" 
						  	 			class="form-horizontal" role="form" id="form1" method="post">
									<div class="form-group">
										<label   class="col-xs-2 control-label">*学生姓名</label>
										<div class="col-xs-3">
											<input type="text" class="form-control  " name="student.name" id="username" required="required" value="${student.name}">
											<input type="hidden" name="id"  value="${student.id}">
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*邮箱</label>
										<div class="col-xs-3">
											<input type="email" class="form-control  " name="student.email" id="email" required="required" value="${student.email}">
										</div>
										<div class="col-xs-2">
											<span class="help-block">*登陆使用!请谨慎填写</span>
										</div>
									</div>
									
									<div class="form-group">
										<label   class="col-xs-2 control-label">*输入密码</label>
										<div class="col-xs-3">
											<input type="password" class="form-control" name="student.password" id="password" required="required" value="${student.password}">                   
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*确认输入密码</label>
										<div class="col-xs-3">
											<input type="password" class="form-control" id="password2" name="password2" required="required" value="${student.password}">
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*年龄</label>
										<div class="col-xs-3">
											<input type="number" class="form-control  " name="student.age" id="age"	required="required" value="${student.age}">
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">*性别</label>
										<div class="col-xs-3">
											<s:radio list="%{#{'男':'男','女':'女' }}" name="student.sex"> </s:radio>
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">学生学号</label>
										<div class="col-xs-3">
											<input type="number" class="form-control" name="student.studentId" id="studentId"  value="${student.studentId}">
										</div>
										<div class="col-xs-3">
											<span class="help-block">*可留空，系统将自动生成学号</span>
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">学生电话</label>
										<div class="col-xs-3">
											<input type="number" class="form-control" name="student.phoneNumber" id="phoneNumber" value="${student.phoneNumber}" >				
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">身份证号</label>
										<div class="col-xs-3">
											<input type="number" class="form-control  " name="student.idNumber" id="idNumber"	value="${student.idNumber}">
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">父母姓名</label>
										<div class="col-xs-3">
											<input type="text" class="form-control  " name="student.parentName" id="parentName"	value="${student.parentName}">
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">父母手机号</label>
										<div class="col-xs-3">
											<input type="text" class="form-control  " name="student.parentPhoneNumber" id="parentPhoneNumber"	value="${student.parentPhoneNumber}">
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">城市</label>
										<div class="col-xs-3">
											<input type="text" class="form-control  " name="student.city" id="city"	value="${student.city}">
										</div>
									</div>
									<div class="form-group">
										<label   class="col-xs-2 control-label">住址</label>
										<div class="col-xs-6">
											<input type="text" class="form-control  " name="student.address" id="address"	value="${student.address}">
										</div>
									</div>
									<div>
										<div class="form-group">    
											 <div class="col-xs-6 col-xs-offset-4">
												<button type="submit" class="btn btn-primary  btn-lg ">修改学生信息</button>																			 
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
    	</script>
    	
  </body>
</html>
