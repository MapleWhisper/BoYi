
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>

<title>个人信息中心</title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js">
</script>
<head>
<%@ include file="../header.jspf" %>
<title>注册页面</title>
<script
	src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
</head>
</head>
<body>
	<div class="container">
		<div class="row">
    			<%@ include file="head.jsp" %>
    		</div>

		<div class="row"
			style="margin-top: 70px ;padding-left: 100px ; padding-right: 100px ;">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="col-xs-3 "
						style="background-color: #f5f5f5;height: 732px">
						<table class="table">
							<tr>
								<td><img src="${pageContext.request.contextPath}/${student.picPath}" height="70px" width="70px"></img></td>
								<td>你好，${student.name }<br> <a href="${pageContext.request.contextPath}/student/studentCenterAction!PersonalSet">个人设置</a></td>
							</tr>
							<tr>
								<td>学号:</td><td colspan="2">${student.studentId }</td>
							</tr>
						</table>
						<div class="list-group">
							<a href=" " class="list-group-item"> 查看我的消费记录 </a> <a href=" "
								class="list-group-item">我的成绩</a> <a href=" "
								class="list-group-item">入学测试</a>
						</div>

					</div>
					<!-- col-xs-3 -->
					<div class="col-xs-9">
						<div class="row" style="height: 100px"></div>
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
											<li></li>
											<c:if test="${message!=null }">
											<li role="presentation" ><a href="#ziliao"
												role="tab" data-toggle="tab">资料设置</a></li>
											<li role="presentation" class="active"><a href="#password" role="tab"
												data-toggle="tab">密码设置</a></li>
											</c:if>
											<c:if test="${message==null }">
											<li role="presentation" class="active"><a href="#ziliao"
												role="tab" data-toggle="tab">资料设置</a></li>
											<li role="presentation"><a href="#password" role="tab"
												data-toggle="tab">密码设置</a></li>
											</c:if>
											<li role="presentation""><a href="#other" role="tab"
												data-toggle="tab">其它</a></li>
										</ul>
										<div class="tab-content"
											style="margin-top: 20px;margin-left: 10px">
											<c:if test="${message!=null }">
											<div role="tabpanel" class="tab-pane" id="ziliao">
											</c:if>
											<c:if test="${message==null }">
											<div role="tabpanel" class="tab-pane active" id="ziliao">
											</c:if>
												<form action="${pageContext.request.contextPath}/student/studentCenterAction!updateInfo" method="post" id="form2" name="form2" enctype="multipart/form-data">
													<div class="row">
														<div class="col-sm-8">
															<table width="100%" border="0" class="ft14">
																<tr>
																	<td width="22%" height="50"
																		class="textR pdright40 ftgray03">真实姓名:</td>
																	<td width="78%">
																		<div class="old" id="old_geren_name"
																			style="display: block;">${student.name }</div>
																		<div class="new" id="new_geren_name"
																			style="display: none;">
																			<input type="text" class="ipText01 wid150 ft14"
																				value="${student.name }" id="stuName" name="stuName"
																				readonly="readonly" /> <span
																				style="color:#838383;font-size:12px;">&nbsp;不能修改</span>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td height="50" class="textR pdright40 ftgray03">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
																	<td>
																		<div class="old" id="old_geren_sex"
																			style="display: block;">${student.sex}</div>
																		<div class="new" style="display: none;"
																			id="new_geren_sex">
																			<span class="pdright20">
																				${student.sex}
																			</span>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td height="50" class="textR pdright40 ftgray03">所在年级:</td>
																	<td>
																		<div class="old" id="old_xuexiao_class"
																			style="display:block;">小学一年级</div>
																		<div class="new" style="display:none;"
																			id="new_xuexiao_class">
																			<span class="fn-left pdright20"> <select
																				id="stuGrade" name="stuGradeId" class="ipSelect03">
																					<option value="0" selected='selected'>请选择年级</option>
																					<option value="1">小学一年级</option>
																					<option value="2">小学二年级</option>
																					<option value="3">小学三年级</option>
																					<option value="4">小学四年级</option>
																					<option value="5">小学五年级</option>
																					<option value="6">小学六年级</option>
																					<option value="7">初中一年级</option>
																					<option value="8">初中二年级</option>
																					<option value="9">初中三年级</option>
																					<option value="10">高中一年级</option>
																					<option value="11">高中二年级</option>
																					<option value="12">高中三年级</option>
																			</select>
																			</span>
																		</div>
																	</td>
																</tr>

																<tr>
																	<td height="50" class="textR pdright40 ftgray03">出生日期:</td>
																	<td>

																		<div class="old" style="display: block;"><fm:formatDate value="${student.birth }"/></div>
																		<div class="new" style="display: none;">
																			<span class="fn-left pdright10"> <input
																				name="stuBirthTime" type="text" id="stuBirthTime"
																				class="ipText01 ft14" value="<fm:formatDate value="${student.birth }"/>"
																				onclick="WdatePicker();" />

																			</span>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td height="50" class="textR pdright40 ftgray03">证件号码:</td>
																	<td>
																		<div class="old" id="old_geren_card"
																			style="display: block;">${student.idNumber }</div>
																		<div class="new" style="display: none;"
																			id="new_geren_card">
																			<span class="fn-left pdright20"><input
																				class="ipText01 ft14" name="idNumber" type="text"
																				id="idNumber" value="${student.idNumber }" /></span>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td height="50" class="textR pdright40 ftgray03">详细地址:</td>
																	<td>
																		<div class="old" id="old_xuexiao_address"
																			style="display: block;">${student.address }</div>
																		<div class="new" style="display: none;"
																			id="new_xuexiao_address">
																			<input class="ipText01 wid300" name="stuAddress"
																				type="text" id="stuAddress" value="${student.address }" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td height="50" class="textR pdright40 ftgray03">个人手机号:</td>
																	<td>
																		<div class="old" id="old_fumu_mphone"
																			style="display: block;">${student.phoneNumber }</div>
																		<div class="new" id="new_fumu_mphone"
																			style="display: none;">
																			<span class="fn-left pdright20"><input
																				class="ipText01 wid150 ft14" type="text"
																				name="phoneNumber" value="${student.phoneNumber }"
																				id="phoneNumber" /></span>
																		</div>
																	</td>
																</tr>



															</table>




														</div>
														<div class="col-sm-4">
															<div class="user-photo-box">
																<dl>
																	<dt>
																			<img src="${pageContext.request.contextPath}/${student.picPath}" width="100" height="100" class="picImg" />
																	</dt>
																	<dd>
																		<div class="form-group new">
																			更改图像<label for="exampleInputFile"></label> <input type="file" id="pic" name="pic">
																		</div>
																	</dd>
																</dl>
															</div>
														</div>

														


													</div>
													<div class="row">
															<div class="col-sm-3 col-sm-offset-1">
																<div class="new" style="display: none;">
																	<button type="submit" class="btn btn-primary">提交</button>
																</div>
															</div>
															<div class="col-sm-3 ">
																<button type="button" class="btn btn-primary" id="edit">修改</button>
															</div>

														</div>



												</form>

											</div>
											<c:if test="${message!=null }">
											  <div role="tabpanel" class="tab-pane active" id="password">
											  </c:if>
											  <c:if test="${message==null }">
											  <div role="tabpanel" class="tab-pane" id="password">
											  </c:if>
												<form action="student/studentCenterAction!updatePwd" name="form1" id="form1" method="post">
													<table class="table table-striped table-hover">
														<tr>
															<td></td>
															<td></td>
															<td>原密码</td>

															<td><input type="password" name="oldPwd" id="oldPwd"><br></td>
															<td></td>


														</tr>
														<tr>
															<td></td>
															<td></td>
															<td>新密码</td>
															<td><input type="password" name="newPwd" id="newPwd"><br></td>
															<td></td>


														</tr>
														<tr>
															<td></td>
															<td></td>
															<td>确认密码</td>
															<td><input type="password" name="newPwd1"
																id="newPwd1"></td>
															<td></td>

														</tr>

													</table>
													<center>
														<button type="submit" class="btn btn-primary">提交修改</button>
														<center><div class="col-sm-6" id="e2">
															<div class="alert alert-danger alert-dismissible" role="alert">
  																<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
 												 				<div id="e1">${message }</div>
															</div>
														</div>
													</center>
													</center>
													
												</form>
											</div>
										
											<div role="tabpanel" class="tab-pane active" id="other"></div>
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
		</div>

	</div>
	<!--  -->


</body>
<script type="text/javascript">
	$(function() {
		$(".nav-tabs a").mouseover(function() {
			$(this).tab('show');
		});
	});
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
