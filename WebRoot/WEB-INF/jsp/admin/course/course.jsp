<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>课程管理</title>
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
						<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">课程列表 Course List</h1>
						  </div>
						  <div class="panel-body">
						  
						  		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
									  <div class="panel panel-default">
									    <div class="panel-heading">
									      <h4 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									          		高中组
									        </a>
									      </h4>
									    </div>
									    <div id="collapseOne" class="panel-collapse collapse " role="tabpanel">
									      <div class="panel-body">
									      		<table class="table table-hover table-striped table-bordered">
									      			<tr class="warning">
									      					<td>年级</td>
									      					<td>科目</td>
									      					<td>描述</td>
									      			</tr>
									      			<c:forEach items="${seniorlist}" var="c">
									      				<tr >
									      					<td>${c.grade }</td>
									      					<td>${c.subject }</td>
									      					<td><button  class="btn btn-primary course" id="${c.id}">点我 [查看|修改] 课程详情</button></td>
									      				</tr>
									      			</c:forEach>
									      		</table>
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default">
									    <div class="panel-heading">
									      <h4 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									         		初中组
									        </a>
									      </h4>
									    </div>
									    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel">
									      <div class="panel-body">
									      		<table class="table table-hover table-striped table-bordered">
									      			<tr class="warning">
									      					<td>年级</td>
									      					<td>科目</td>
									      					<td>描述</td>
									      			</tr>
									      			<c:forEach items="${middlelist}" var="c">
									      				<tr>
									      					<td>${c.grade }</td>
									      					<td>${c.subject }</td>
									      					<td><button  class="btn btn-primary course" id="${c.id}"> 点我 [查看|修改] 课程详情</button></td>
									      				</tr>
									      			</c:forEach>
									      		</table>
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default">
									    <div class="panel-heading">
									      <h4 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									       			   小学组
									        </a>
									      </h4>
									    </div>
									    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel">
									      <div class="panel-body">
									      		<table class="table table-hover table-striped table-bordered">
									      			<tr class="warning">
									      					<td>年级</td>
									      					<td>科目</td>
									      					<td>描述</td>
									      			</tr>
									      			<c:forEach items="${primarylist}" var="c">
									      				<tr>
									      					<td>${c.grade }</td>
									      					<td>${c.subject }</td>
									      					<td><button  class="btn btn-primary course" id="${c.id}">点我 [查看|修改] 课程详情</button></td>
									      				</tr>
									      			</c:forEach>
									      		</table>
									      </div>
									    </div>
									  </div>
									</div>
						  		
						  
						  </div><!-- panel-body -->
						</div><!-- panel panel-primary -->
						
						
						<!-- 面板结束 -->
					</div>
					<!--右侧的内容 -->
					
    		</div>
    		<%@ include file="../buttom.jsp" %>
    	</div>
    	<!-- 课程详情显示 模态-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		      	
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title"  id="title"></h4>
		      </div>
		      <div class="modal-body" >
		      		<textarea id="editor"></textarea>
		      		<button type="button" class="btn btn-default  save" >保存课程详情</button>
		      </div>
		      <div class="modal-footer">
		      	
		        <button type="button" class="btn btn-default btn-primary btn-lg" data-dismiss="modal">关闭</button>
		      </div>
		    </div>
		  </div>
		</div><!-- 课程详情显示 模态-->
		<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
		<script src="${pageContext.request.contextPath}/js/ckeditor/jquery.js"></script>
    	<script type="text/javascript">
    		$(function(){
    			$("#course").css("margin-right","-30px").css("font-size"," 25px");
    		});
    		$(function() {
    			$( 'textarea#editor' ).ckeditor();
    		});
    		$(function(){
    			$(".course").click(function(){
    				var id = $(this).attr("id");
    				$.get("courseAction!show?id="+id,function(data){
    					$("#title").text(data.grade+data.subject);
    					$(".save").attr("id",data.id);
    					$("#editor").val(data.courseDetail);
    					
    					$("#myModal").modal("toggle");
    				});
    			});
    			$(".save").click(function(){
    				var id = $(this).attr("id");
    				var context = $("#editor").val();
    				$.post("courseAction!update",{"id":id,"courseDetail":context},function(){
    					alert("修改成功");
    					$("#myModal").modal("hide");
    				});
    			});
    		});
    		
    	</script>
    	
  </body>
</html>
