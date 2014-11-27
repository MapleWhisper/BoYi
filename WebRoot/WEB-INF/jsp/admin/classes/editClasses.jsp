<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	
	<title>修改班次</title>
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
						    <h1 class="panel-title" style="font-size: 25px">修改班次  Edit Class</h1>
						  </div>
						  <div class="panel-body">
								<form action="${pageContext.request.contextPath }/admin/classes/classesAction!update" 
										class="form-horizontal" role="form" id="form1" method="post">
										<div class="form-group">
											<label  class="col-xs-2 control-label">班级名称</label>
											<div class="col-xs-10">
												<s:textfield type="text" cssClass="form-control" required="required" name="classes.name" id="name"/>
												<input type="hidden" name="id" value="${classes.id}">
											</div>
										</div>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">班级总人数</label>
											<div class="col-xs-4">
												<s:textfield type="number" cssClass="form-control " required="required" name="classes.studentNumer" id="studentNumer" />
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">班级开始日期</label>
											<div class="col-xs-4">
												<input type="text" class="form-control  " required="required" name="classes.beginDate" id="beginDate" value="${classes.beginDate }" onClick="WdatePicker()">
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">班级结束日期</label>
											<div class="col-xs-4">
												<input type="text" class="form-control  " required="required" name="classes.endDate" id="endDate" value="${classes.beginDate }" onClick="WdatePicker()">
											</div>
										</div>
										
										<hr>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">上课时间</label>
											<div class="col-xs-10">
												<s:textfield type="text" cssClass="form-control" required="required" name="classes.classTime" id="classTime" />
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">上课地点</label>
											<div class="col-xs-10">
												<s:textfield type="text" cssClass="form-control  " required="required" name="classes.classPlace" id="classPlace" />
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">班级类型</label>
											<div class="col-xs-4">
												<s:textfield type="text" cssClass="form-control  " required="required" name="classes.classType" id="classType" />
											</div>
										</div>
										
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">课程价格</label>
											<div class="col-xs-4">
												<s:textfield type="number" cssClass="form-control  " required="required" name="classes.classPrice" id="classPrice" />
											</div>
										</div>
										
										<hr>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">推荐课程</label>
											<div class="col-xs-3">
												<s:radio list="%{#{'false':'不推荐','true':'推荐'} }" name="classes.recommand"></s:radio>
											</div>
										</div>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">老师</label>
											<div class="col-xs-3">
												<s:select name="teacherId" required="required" cssClass="form-control" 
														list="teacherList" listKey="id" listValue="name" >
												</s:select>
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">所属课程</label>
											<div class="col-xs-3">
												<s:select name="courseId" required="required" cssClass="form-control" 
														list="courseList" listKey="id" listValue="grade+' '+subject" >
												</s:select>
											</div>
										</div>
										
										
										
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">课程详情/介绍</label>
											<div class="col-xs-10">
												<textarea  class="form-control" required="required" rows="8"
													 name="classes.classDetail" id="editor" >${classes.classDetail }</textarea>
											</div>
										</div>
										
										<div class="form-group" style="text-align: center;">
											<input type="submit" value="修改班级信息" id="submit"  class="btn btn-primary btn-lg"/>
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
