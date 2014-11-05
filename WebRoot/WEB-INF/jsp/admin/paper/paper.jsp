<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>管理员列表</title>
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
						
						<!-- 生成试卷 -->
    					<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h3 class="panel-title" style="font-size: 25px" >自动组卷系统 Auto-generating Test Paper</h3>
						  </div>
						  <div class="panel-body">
						   	 <center><a href="${pageContext.request.contextPath}/admin/paper/autoPaperAction" id="autoPaper" class="btn btn-info btn-lg">自动组卷系统</a></center>
						   	 <center id="e1" style="display: none">
		    						 <div style="width: 300px" class="alert alert-danger" role="alert">请先在下面列表中选择 年级 和 课程!</div>
		    				</center>
						  </div>
						</div><!-- 生成试卷 -->
						
						
						<!--试题分类 -->
							<div class="panel panel-primary">
								 <div class="panel-heading">
									    <h3 class="panel-title" style="font-size: 25px">试卷分类 Paper Classification </h3>
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
													<br>
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
		    						 			 			查看试卷</a></center>
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
    			$("#paper").css("margin-right","-30px").css("font-size"," 25px");
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
    			});
    		});
    		
    		$(function(){
    			$("#autoPaper").click(function(){
    				if($("button.active").size()!=2){
    					$("#e1").toggle();
    					$("#e1").fadeOut(3000);
    					return false;
    				}else{
    					var grade  = $("button[name='grade'].active").html();
    					var subject = $("button[name='subject'].active").html();
    					$.post("/BoYi/admin/paper/paperAction!list",{"grade":grade,"subject":subject});
    					return true;
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
    					$.post("/BoYi/admin/paper/paperAction!list",{"grade":grade,"subject":subject},function(){
    						location.href="/BoYi/admin/paper/paperAction!list";
    					});
    				}
    			});
    		});
    	</script>
    	
  </body>
</html>
