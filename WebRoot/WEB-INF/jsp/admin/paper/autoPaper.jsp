<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>自动组卷页面</title>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="../head.jsp"%>
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

				<!-- 生成试卷 -->
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title" style="font-size: 25px">自动组卷系统
							Auto-generating Test Paper</h3>
					</div>
					<div class="panel-body">
						<!-- 自动生成试卷 参数设置 表单 -->
						<form class="form-horizontal" id="form1"  target="_blank"
							action="${pageContext.request.contextPath}/admin/paper/autoPaperAction!get"
							role="form" method="post">
							
							<div class="form-group">
								<label class="col-xs-2 control-label">单选题数目</label>
								<div class="col-xs-4">
									<input type="number" class="form-control digits" id="" required 
										name="paper.singleNumber">
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label">多选题数目</label>
								<div class="col-xs-4">
									<input type="number" class="form-control digits" id=""	required
										name="paper.multChoiceNumber">
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label">判断题数目</label>
								<div class="col-xs-4">
									<input type="number" class="form-control digits" id=""	required
										name="paper.judgeNumber">
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label">简答题数目</label>
								<div class="col-xs-4">
									<input type="number" class="form-control digits" id=""	required
										name="paper.questionNumber">
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label">年级</label>
								<div class="col-xs-4">
									<input type="text" class="form-control" id=""  	required
										name="paper.grade" value="${sessionScope.grade}">
								</div>
								
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label">科目</label>
								<div class="col-xs-4">
									<input type="text" class="form-control" id="" 	required
										name="paper.subject" value="${sessionScope.subject}">
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-6 col-xs-offset-4">
									<button id="submit" type="submit" class="btn btn-warning btn-lg">生成试卷</button>
								</div>
									
							</div>

						</form>
						<!-- 自动生成试卷 参数设置 表单 -->
					</div>
				</div>
				<!-- 生成试卷 -->



				<!-- 面板结束 -->
			</div>
			<!--右侧的内容 -->
		</div>
		<%@ include file="../buttom.jsp"%>
	</div>

	<script type="text/javascript">
    		$(function(){
    			$("#paper").css("margin-right","-30px").css("font-size"," 25px");
    		});
    		$(function() {  
    			$("#form1").validate();
    		});
    	</script>

</body>
</html>
