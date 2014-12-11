
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>

<title>个人信息中心</title>

<head>

<title>注册页面</title>
<%@ include file="../header.jspf"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<style type="text/css">
	.context {
		margin-top: 70px ;padding-left: 100px ; padding-right: 100px ;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<%@ include file="head.jsp"%>
		</div>

		<div class="row context" >
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="col-xs-3 " style="background-color: #f5f5f5;height: 732px">
						<%@ include file="part/left.jsp"%>
					</div>
					
					<div class="col-xs-9">
						<!-- 
						<div class="row" style="height: 100px">
							<%@ include file="part/top.jsp"%>
						</div>
						 -->
						
						
						<div class="row">
							<div class="panel panel-default" style="height: 650px">
								<div class="panel-body">
									<ol class="breadcrumb">
										<li>个人中心</li>
										<li>个人设置</li>
									</ol>
									<!-- 当前课程Test -->
									<div class="row" style="margin-left: 20px;margin-right: 20px ">

										<ul class="nav nav-tabs" role="tablist">
											
												<li role="presentation" class="${(message==null)?'active':'' }"><a
													href="#ziliao" role="tab" data-toggle="tab">资料设置</a></li>
												<li role="presentation"><a href="#password" role="tab" class="${(message==null)?'':'active' }"
													data-toggle="tab">密码设置</a></li>
											<li role="presentation"><a href="#other" role="tab"
												data-toggle="tab">其它</a></li>
										</ul>
										<div class="tab-content" style="margin-top: 20px;margin-left: 10px">
											<%@ include file="part/ziliao.jsp"%>
											
											<%@ include file="part/password.jsp"%>
											
											<div role="tabpanel" class="tab-pane" id="other">123</div>
										</div>
										
									</div>
									
									
								</div>
							</div>
							<!-- 当前课程 -->

						</div>
					</div>
				</div>
			</div>
			<!-- col-xs-9 -->
		</div>
	</div>

	<!--  -->


</body>
<script type="text/javascript">
	/*
	$(function() {
		$(".nav-tabs a").mouseover(function() {
			$(this).tab('show');
		});
	});
	*/
	$(function() {
		$("#edit").click(function() {
			$(".old").toggle();
			$(".new").toggle();
			 
			if ($("#edit").html() == "修改") {
				$("#edit").html("取消修改");
			}else
		  {
				$("#edit").html("修改");
			}
			

		});
	});
	$(function() {  
		$("#form1").validate({
			rules:{
				oldPwd: {
					required:true
				},
				newPwd: {
					required:true,
					minlength:4
				},
				newPwd1: {
					required:true,
					equalTo:"#newPwd"
				}
				
			},
			messages:{
				oldPwd: {
					required:"请输入原密码"
				},
				newPwd: {
					required:"请输入密码",
						minlength:"请输入至少4位密码"
				},
				newPwd1: {
					required:"请输入确认密码",
					equalTo:"两次密码必须相同"
				}
			}
		});  
	});
	$(function() {  
		$("#form2").validate({
			rules:{
				stuBirthTime:{
					required:true
				},
				 idNumber: {  
		             required: true,  
		             maxlength: 18,  
		             minlength: 18,  
		             isIdCardNo: "#idNumber"  
		         },
				stuAddress:{
					required: true
				},
				phoneNumber:{
					required: true,  
		            minlength: 7,  
		            maxlength: 13,  
		            isTell: true,  
		            isMobile: "#phoneNumber"
				}
			},
			messages:{
				stuBirthTime:{
					required:"请输入出生日期"
				},
				idNumber: {  
	                required: "请输入身份证号",  
	                maxlength: "身份证为18个字符",  
	                minlength: "身份证为18个字符"  
	            },
				stuAddress:{
					required:"请输入详细地址"
				},
				phoneNumber:{
					 required:"请输入电话号码",  
		             minlength:"至少7位数字",  
		             maxlength:"至多13位数字",  
		             isTell:"号码格式错误" 
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



</html>
