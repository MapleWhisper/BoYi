<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>试卷显示|${paper.title}</title>
	<style type="text/css">
		.quest {font-size: medium;margin-top: 50px}
		.questArea {margin-top: 10px;padding-left: 50px}
		.nav-left {position: fixed;width: 60px;height: 60px}
		table {text-align: center;}
	</style>
  </head>
  
  <body>
    	<div class="container-fluid">
    		<%@ include file="../head.jsp" %>
    		<div class="row" style="margin-top: 70px">
    			<div class="col-xs-2">
					<%@ include file="../left.jsp" %>
    			</div>
    			<div class="col-xs-10">
    					<div  style="text-align: center;margin-top: 100px">
    						<div class="col-xs-6">
    							<h2 >${paper.title }</h2>
    						</div>
    						<div class="col-xs-6">
    							<!-- 	用户信息 -->
								<table class="table table-striped table-hover table-bordered">
									<tr class="warning">
										<td>学生学号</td>
										<td>学生姓名</td>
										<td>返回</td>
									</tr>
									<tr>
										<td>${examResult.student.id}</td>
										<td>${examResult.student.name}</td>
										<td><a type="button" class="btn btn-info" href="../teacherCenter/teacherCenterAction!showResult?id=${examResult.exam.id}">《《返回学生列表</a></td>
									</tr>
								</table><!-- 	用户信息 -->
    						</div>
						</div>
					<div class="row">
						<!--左侧的导航条 -->
					  <div class="col-xs-1">
				  			<ul class="nav nav-pills nav-stacked nav-left" role="tablist" id="nav" >
			  					  <li role="presentation" class="pre active"><a href="#part1" >单选</a></li>
								  <li role="presentation" class="pre"><a href="#part2" >多选</a></li>
								  <li role="presentation" class="pre"><a href="#part3" >判断</a></li>
								  <li role="presentation" class="pre"><a href="#part4" >简答</a></li>
								  <li role="presentation" class="pre"><a href="#part5" >成绩</a></li>
							</ul>
					  </div><!--左侧的导航条 -->
					  <div class="col-xs-11">
					  
					   <form action="${pageContext.request.contextPath}/admin/paper/answer" method="post">
					   		<input type="hidden" name="id" value="${paper.id}">
						<!--单选题 -->
						<div class="panel panel-primary" id="part1">
						  <div class="panel-heading">
						    <h3 class="panel-title">第一部分 单选题      共${paper.singleNumber}题</h3>
						  </div>
						  <div class="panel-body">
						  		<c:forEach items="${paper.singleList}" var="pro" varStatus="s">
							  		<div style="margin-left: 50px">
								  		<div class="quest"><code>第${s.count}题</code> ${pro.title }</div>
										<div class="radio"><label><input type="radio" value="A" name="${pro.id}">A:${pro.optA }</label></div>
										<div class="radio"><label><input type="radio" value="B" name="${pro.id}">B:${pro.optB }</label></div>
										<div class="radio"><label><input type="radio" value="C" name="${pro.id}">C:${pro.optC }</label></div>
										<div class="radio"><label><input type="radio" value="D" name="${pro.id}">D:${pro.optD }</label></div>
										<table  class="table table-striped table-hover table-bordered">
											<tr>
												<td>用户答案</td>
												<td>参考答案</td>
												<td>对错</td>
											</tr>
											<tr>
												<td>${pro.userAns}</td>
												<td>${pro.answer}</td>
												<c:if test="${ pro.userAns == pro.answer}">
													<td ><button class='btn btn-success sin'  disabled="disabled">正确</button></td>
												</c:if>
												<c:if test="${ pro.userAns != pro.answer}">
													<td ><button class='btn btn-danger sin' disabled="disabled">错误</button></td>
												</c:if>
												
											</tr>
										</table>
									</div>
									
								</c:forEach>
						  </div>
						</div>
						
						<!-- 多选题 -->
						<div class="panel panel-primary" id="part2">
						  <div class="panel-heading">
						    <h3 class="panel-title">第二部分 多选题  共${paper.multChoiceNumber}题</h3>
						  </div>
						  <div class="panel-body">
						  		<c:forEach items="${paper.multChoiceList}" var="pro" varStatus="s">
						    	<div style="margin-left: 50px">
								  		<div class="quest"><code>第${s.count}题</code> ${pro.title }</div>
										<div class="checkBox"><label><input type="checkBox" value="A" name="${pro.id}">A:${pro.optA }</label></div>
										<div class="checkBox"><label><input type="checkBox" value="B" name="${pro.id}">B:${pro.optB }</label></div>
										<div class="checkBox"><label><input type="checkBox" value="C" name="${pro.id}">C:${pro.optC }</label></div>
										<div class="checkBox"><label><input type="checkBox" value="D" name="${pro.id}">D:${pro.optD }</label></div>
										<table  class="table table-striped table-hover table-bordered">
											<tr>
												<td>用户答案</td>
												<td>参考答案</td>
												<td>对错</td>
											</tr>
											<tr>
												<td>${pro.userAns}</td>
												<td>${pro.answer}</td>
												<c:if test="${ pro.userAns == pro.answer}">
													<td ><button class='btn btn-success jud'  disabled="disabled">正确</button></td>
												</c:if>
												<c:if test="${ pro.userAns != pro.answer}">
													<td ><button class='btn btn-danger jud' disabled="disabled">错误</button></td>
												</c:if>
											</tr>
										</table>
								</div>
								
								</c:forEach>
						  </div>
						</div>
						
						<!--判断题 -->
						<div class="panel panel-primary" id="part3">
						  <div class="panel-heading">
						    <h3 class="panel-title">第三部分 判断题 共${paper.judgeNumber}题</h3>
						  </div>
						  <div class="panel-body">
						  		<c:forEach items="${paper.judegeList}" var="pro" varStatus="s">
						    	<div style="margin-left: 50px">
							  		<div class="quest"><code>第${s.count}题</code> ${pro.title }</div>
									<div class="radio"><label><input type="radio" value="对" name="${pro.id}">A:对</label></div>
									<div class="radio"><label><input type="radio" value="错" name="${pro.id}">B:错</label></div>
									<table  class="table table-striped table-hover table-bordered">
											<tr>
												<td>用户答案</td>
												<td>参考答案</td>
											</tr>
											<tr>
												<td>${pro.userAns}</td>
												<td>${pro.answer}</td>
											</tr>
										</table>
								</div>
								
								</c:forEach>
						  </div>
						</div>
						
						<!-- 问答题 -->
						<div class="panel panel-primary" id="part4">
						  <div class="panel-heading">
						    <h3 class="panel-title">第四部分 问答题 共${paper.questionNumber}题</h3>
						  </div>
						  <div class="panel-body">
						 		 <c:forEach items="${paper.questionList}" var="pro" varStatus="s">
						 		 	
							    	<div class="quest"><code>第${s.count}题</code> ${pro.title } </div>
							    	<div class="questArea">
							    		<div class="alert alert-info" role="alert">用户答案：${ pro.userAns }</div>
							    		<div class="well" role="alert">参考答案：${pro.answer }</div>
									</div>
							    	
							    	
						    	</c:forEach>
						    	<div id="part5" style="margin-top: 100px;text-align: center;" >
						    		<!-- 	用户信息 -->	
						    		<h2 class="text-warning">学生信息</h2>
						    		<table class="table table-striped table-hover table-bordered">
									<tr class="warning">
										<td>学生学号</td>
										<td>学生姓名</td>
										<td >成绩</td>
										<td>提交</td>
										<td>返回</td>
									</tr>
									<tr>
										<td>${examResult.student.id}</td>
										<td>${examResult.student.name}</td>
										<td style="width: 100px"><input type="number" class="form-control" name="score" id="score" value="${examResult.score }"/></td>
										<td><button type="button" class="btn btn-primary score" name="${examResult.id}">保存成绩</button></td>
										<td><a type="button" class="btn btn-info" href="../teacherCenter/teacherCenterAction!showResult?id=${examResult.exam.id}">《《返回学生列表</a></td>
									</tr>		
									</table>	
									
									<hr>
									
									<!-- 成绩统计 -->	
									<h2 class="text-info">成绩统计</h2>
						    		<table class="table table-striped table-hover table-bordered">
										<tr class="info">
											<td>单选题</td>
											<td>判断题</td>
										</tr>
										<tr>
											<td id="sin">${paper.singleNumber}</td>
											<td id="jud">${paper.judgeNumber}</td>
										</tr>		
									</table>	
								</div>
						  </div>
						 	 
						</div>
						
					   </form>
					   </div>
					</div> <!-- 第一行结束 -->
    			</div>
    		</div>
    		
    	</div>
    	<script type="text/javascript">
	    	$(function(){
				$("#paper").css("margin-right","-30px").css("font-size"," 25px");
			});
			$(function(){
				$(".pre").click(function(){
					//alert("ok");
					$(this).addClass("active");
					$(this).siblings().removeClass("active");
				});
				
				$(".score").click(function(){
					var id = $(this).attr("name");
					var score = $("#score").val();
					if(score <0 || score >100){
						alert("成绩必须为整数 且大于0 小于等于100");
						return;
					}
					$.post("../paper/paperAction!setScore",{"id":id,"score":score},function(data){
						alert("修改成功");
					});
				});
				
				$("#sin").html( "正确:"+$(".btn-success.sin").size()+"题/共"+$("#sin").html()+"题" );
				$("#jud").html( "正确:"+$(".btn-success.jud").size()+"题/共"+$("#jud").html()+"题" );
			});
			
		</script>
    	<%@ include file="../buttom.jsp" %>
  </body>
</html>
