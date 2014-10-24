<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>管理员列表</title>
  </head>
  
  <body>
    	<div class="container">
    		<div class="row">
    			<%@ include file="../head.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px">
    				<!--左侧的导航条 -->
					<div class="col-xs-3">
						<%@include file="../left.jsp"%>
					</div>
					<!--左侧的导航条 -->
					
					<!--右侧的内容 -->
					<div class="col-xs-9">
						<!-- 面板开始 -->
							<!--搜索提示栏 -->
						  	<div class="panel panel-primary">
								 <div class="panel-heading">
									    <h3 class="panel-title" style="font-size: 25px">搜索试题|添加试题 Search/Add Problem</h3>
							      </div>
								 <div class="panel-body">
		    						 <div class="form-group">
		    						 	<div class=row>
		    						 		<div class="col-xs-8">
		    						 			<input type="text" id="key" class="form-control" placeholder="输入试卷标题 标签 关键字">
		    						 		</div>
		    						 		<div class="col-xs-2">
		    						 			 <button  id="problemList" class="btn btn-default">搜索试题</button>
		    						 		</div>
		    						 	</div>
								      </div>
								      <div class="form-group">
		    						 	<center><a href="${pageContext.request.contextPath}/admin/problem/problemAction!add" class="btn btn-lg btn-primary">添加试题</a></center>
								      </div>
								</div>
							</div><!--搜索提示栏 -->
							 
		    				<!--试题分类 -->
							<div class="panel panel-primary">
								 <div class="panel-heading">
									    <h3 class="panel-title" style="font-size: 25px">试题分类 Problem Classification </h3>
							      </div>
								 <div class="panel-body">
		    						 <div class="form-group">
		    						 		<table class="table" >
											<tr>	
												<td style="width: 100px">年级:</td>
												<td>
													<div class="btn-group">
													  <button type="button" class="btn btn-default" name="grade" >小学一年级</button>
													  <button type="button" class="btn btn-default" name="grade" >小学二年级</button>
													  <button type="button" class="btn btn-default" name="grade" >小学三年级</button>
													  <button type="button" class="btn btn-default" name="grade" >小学四年级</button>
													  <button type="button" class="btn btn-default" name="grade" >小学五年级</button>
													  <button type="button" class="btn btn-default" name="grade" >小学六年级</button>
													</div>
													<div class="btn-group" style="margin-top: 15px">
														<button type="button" class="btn btn-default" name="grade" >初中一年级</button>
														<button type="button" class="btn btn-default" name="grade" >初中二年级</button>
														<button type="button" class="btn btn-default" name="grade" >初中三年级</button>
													</div>
													<div class="btn-group" style="margin-left: 30px;margin-top: 15px">
														<button type="button" class="btn btn-default" name="grade" >高中一年级</button>
														<button type="button" class="btn btn-default" name="grade" >高中二年级</button>
														<button type="button" class="btn btn-default" name="grade" >高中三年级</button>
													</div>
												</td>
											</tr>
											<tr style="margin-top: 30px">	
												<td style="width: 100px">课程:</td>
												<td>
													<div class="btn-group">
													  <button type="button" class="btn btn-default" name="subject" >语文</button>
													  <button type="button" class="btn btn-default" name="subject" >数学</button>
													  <button type="button" class="btn btn-default" name="subject" >英语</button>
													  <button type="button" class="btn btn-default" name="subject" >物理</button>
													  <button type="button" class="btn btn-default" name="subject" >化学</button>
													  <button type="button" class="btn btn-default" name="subject" >生物</button>
													</div>
												</td>
											</tr>
											</table>
													<center><a  id="scanProblem" class="btn btn-primary " >
		    						 			 			查看试题</a></center>
		    						 			 	<center id="e2" style="display: none">
		    						 			 		<div style="width: 300px" class="alert alert-danger" role="alert">请选择需要查看试题的 年级 和 课程!</div>
		    						 			 	</center>
		    						 	</div>
								      </div><!-- panel-body -->
								</div><!-- panel panel-primary -->
								
							</div><!--试题分类 -->      
						<!-- 面板结束 -->
					</div>
					<!--右侧的内容 -->
    		</div>
    		<%@ include file="../buttom.jsp" %>
    	</div>
    	
    	<script type="text/javascript">
    		$(function(){
    			$("#problem").css("margin-right","-30px").css("font-size"," 25px");
    		});
    		$(function(){
    			var grade = "";
    			var course = "";
    			$(".table button").click(function(){
    				//alert("ok");
    				//按钮点击时，添加active class效果
    				var btn = $(this);
    				var classString = $(this).attr("class");
    				if(classString.indexOf("active")!=-1){
    					$(this).removeClass("active");
    				}else{
    					$(this).addClass("active");
    					$(this).siblings().removeClass("active");
    					$(this).parent().siblings("div").find("button").removeClass("active");
    				}
    				
    				var name = btn.attr("name");
    				if(name=="workPlace"){
    					workPlace = btn.text();
    				}
    				if(name=="position" ){
    					position = btn.text();
    				}
    				if(name=="type"){
    					type = btn.text();
    				}
    			});
    		});
    		$(function(){
    			$("#scanProblem").click(function(){
    				if($("button.active").size()!=2){
    					$("#e2").toggle();
    					$("#e2").fadeOut(3000);
    				}else{
    					var grade  = $("button[name='grade'].active").html();
    					var subject = $("button[name='subject'].active").html();
    					$.post("/BoYi/admin/problem/problemAction!list?cur=1",{"grade":grade,"subject":subject});
    				}
    			});
    		});
    	</script>
    	
  </body>
</html>
