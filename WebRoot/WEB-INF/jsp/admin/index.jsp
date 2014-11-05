<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
	<title>通知中心</title>
  </head>
  
  <body>
    	<div class="container-fluid">
    		<div class="row">
    			<%@ include file="head.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px">
    				<!--左侧的导航条 -->
					<div class="col-xs-2">
						<%@include file="left.jsp"%>
					</div>
					<!--左侧的导航条 -->
					
					<!--右侧的内容 -->
					<div class="col-xs-10">
						<!-- 面板开始 -->
						<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h1 class="panel-title" style="font-size: 25px">通知中心  Notification Center</h1>
						  </div>
						  <div class="panel-body">
						  	<ul class='list-group'>
						    	<c:forEach items="${ articleList }" var="a">
						    		<li class="list-group-item">
						    			<span class="glyphicon glyphicon-play" style="color: orange;"></span>
						    			<span><a id="${a.id}" class="article" >
						    					${a.title }</a></span>
						    					<span style="float: right"><fm:formatDate pattern="yyyy-MM-dd HH:mm" value="${ a.createDate }"/></span>
						    		</li>
						    	</c:forEach>
						    </ul>
						  </div><!-- panel-body -->
						</div><!-- panel panel-default -->
						<!-- 面板结束 -->
					</div>
					<!--右侧的内容 -->
    		</div>
    		
    	</div>
    	<!-- 文章显示Modal -->
		<div class="modal fade " id="myModal" tabindex="-1" role="dialog"  aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="title"></h4>
		      </div>
		      <div class="modal-body" id="context">
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
		      </div>
		    </div>
		  </div>
		</div><!-- 文章显示Modal -->
    	<%@ include file="buttom.jsp" %>
    	<script type="text/javascript">
    		$(function(){
    			$("#notification").css("margin-right","-30px").css("font-size"," 25px");
    		});
    		$(function(){
    			$(".article").click(function(){
    				var id = $(this).attr("id");
    				$.get("article/articleAction!show?id="+id,function(data){
    					$("#title").html(data.title);
    					$("#context").html(data.context);
    					$("#myModal").modal("toggle");
    				});
    				
    			});
    		});
    	</script>
  </body>
</html>
