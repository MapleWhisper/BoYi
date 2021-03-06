<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	
	<title>添加班次</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/js/kindeditor/themes/simple/simple.css" />
	
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
						    <h1 class="panel-title" style="font-size: 25px">添加班次  Add Classes</h1>
						  </div>
						  <div class="panel-body">
								<form action="${pageContext.request.contextPath }/admin/classes/classesAction!save" 
										class="form-horizontal" role="form" id="form1" method="post">
										<div class="form-group">
											<label  class="col-xs-2 control-label">班级名称</label>
											<div class="col-xs-10">
												<input type="text" class="form-control " required name="classes.name" id="name" >
											</div>
										</div>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">班级总人数</label>
											<div class="col-xs-4">
												<input type="number" class="form-control " required name="classes.studentNumber" id="studentNumber" >
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">班级开始日期</label>
											<div class="col-xs-4">
												<input type="text" class="form-control " required name="classes.beginDate" id="beginDate" onClick="WdatePicker()">
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">班级结束日期</label>
											<div class="col-xs-4">
												<input type="text" class="form-control  " required name="classes.endDate" id="endDate" onClick="WdatePicker()">
											</div>
										</div>
										
										<hr>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">上课时间</label>
											<div class="col-xs-10">
												<input type="text" class="form-control  " required name="classes.classTime" id="classTime" >
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">上课地点</label>
											<div class="col-xs-10">
												<input type="text" class="form-control  " required name="classes.classPlace" id="classPlace" >
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">班级类型</label>
											<div class="col-xs-4">
												<select class="form-control " name="classes.classType" id="classType">
													<c:forEach items="${applicationScope.classTypes }" var="c">
														<option value="${c}">${c }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">课时价格</label>
											<div class="col-xs-4">
												<input type="number" class="form-control  " required name="classes.classPrice" id="classPrice" >
											</div>
										</div>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">教师课时费价格</label>
											<div class="col-xs-4">
												<input type="number" class="form-control  " required name="classes.teacherPrice" id="classPrice" >
											</div>
										</div>
										<hr>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">推荐课程</label>
											<div class="col-xs-3">
												<input type="radio" name="classes.recommand" value="false" checked="checked">不推荐<br>
												
												<input type="radio" name="classes.recommand" value="true">推荐
											</div>
										</div>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">老师</label>
											<div class="col-xs-3">
												<select name="teacherId" required class="form-control">
													<c:forEach items="${teacherList}" var="tea">
														<option value="${tea.id}">${tea.name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">所属课程</label>
											<div class="col-xs-3">
												<select name="courseId" required class="form-control">
													<c:forEach items="${courseList}" var="c">
														<option value="${c.id}">${c.grade } ${c.subject }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										
										
										
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">课程详情/介绍</label>
											<div class="col-xs-10">
												<textarea  class="form-control  " required name="classes.classDetail" id="editor" ></textarea>
											</div>
										</div>
										
										<div class="form-group" style="text-align: center;">
											<input type="submit" value="添加班级" id="submit"  class="btn btn-primary btn-lg"/>
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
    	
		<script charset="utf-8" src="${pageContext.request.contextPath}/js/kindeditor/kindeditor-min.js"></script>
		<script charset="utf-8" src="${pageContext.request.contextPath}/js/kindeditor/lang/zh_CN.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
		<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
    	<script type="text/javascript">
    		$(function(){
    			$("#").css("margin-right","-30px").css("font-size"," 25px");
    		});
		//Html editor
		KindEditor.ready(function(K) {
			editor = K.create('#editor', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				items : [
					'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
					'insertunorderedlist', '|', 'emoticons', 'image', 'link']
			});

		});
		$(function() {  
			$("#form1").validate();
		});
		</script>
    	
  </body>
</html>
