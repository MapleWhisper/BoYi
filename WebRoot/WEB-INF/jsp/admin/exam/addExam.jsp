<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	
	<title>添加考试</title>
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
						    <h1 class="panel-title" style="font-size: 25px">添加考试  Add Exam</h1>
						  </div>
						  <div class="panel-body">
								<form action="${pageContext.request.contextPath }/admin/exam/examAction!save" 
										class="form-horizontal" role="form" id="form1" method="post">
										<div class="form-group">
											<label  class="col-xs-2 control-label">考试名称</label>
											<div class="col-xs-10">
												<input type="text" class="form-control " required name="exam.name" id="name" >
											</div>
										</div>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">考试开始日期</label>
											<div class="col-xs-4">
												<input type="datetime" class="form-control" required 
														name="exam.beginTime" id="beginTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s'})">                              
											</div>
										</div>
										<div class="form-group" >
											<label  class="col-xs-2 control-label">考试结束日期</label>
											<div class="col-xs-4">
												<input type="datetime" class="form-control" required 
													name="exam.endTime" id="endTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s'})">
											</div>
										</div>
										
										<hr>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">试卷</label>
											<div class="col-xs-3">
												<select name="paperId" required class="form-control" >
													<c:forEach items="${paperList}" var="p">
														<option value="${p.id}" class="paperId">${p.title}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-xs-3">
												<button class="btn btn-primary" type="button" id="showPaper">点此查看试卷</button>
											</div>
										</div>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">考试班级</label>
											<div class="col-xs-3">
												<select name="classesId" required class="form-control">
													<c:forEach items="${classesList}" var="c">
														<option value="${c.id}">${c.name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										
										<div class="form-group" >
											<label  class="col-xs-2 control-label">考试须知</label>
											<div class="col-xs-10">
												<textarea  class="form-control" required name="exam.note" id="editor" ></textarea>
											</div>
										</div>
										
										<div class="form-group">
											<center><input type="submit" value="提交考试" id="submit"  class="btn btn-primary btn-lg"/></center>
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
		<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
    	<script type="text/javascript">
    		$(function(){
    			$("#exam").css("margin-right","-30px").css("font-size"," 25px");
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
		$(function(){
			$("#showPaper").click(function(){
				var id =$(".paperId:selected").val();
				if(id !=null){
					//location.href="../paper/paperAction!show?id="+id;
					window.open("../paper/paperAction!show?id="+id);
				}
			});
		});
		</script>
    	
  </body>
</html>
