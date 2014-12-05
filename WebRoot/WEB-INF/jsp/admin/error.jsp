<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="header.jspf" %>
  </head>
  
  <body>
    	<div class="container">
    		<div class="row" style="margin-top: 70px ">
    				<div class="jumbotron" style="text-align: center;">
					  <h2>${meg}</h2>
					  <br>
					  <p id="cnt" style="color: red">4秒后返回主页...</p> <p><a class="btn btn-primary" href="/BoYi/admin/indexAction">点我立即返回</a></p>
					 
					</div>
    		</div>
    		
    	</div>
    	<script type="text/javascript">
    		var cnt = 5;
	    	function count(){
				cnt--;
				if(cnt>0){
					$("#cnt").html(cnt+"秒后返回主页...");
				}else{
					location.href='/BoYi/admin/indexAction';
				}
			};
			$(function(){
				//setTimeout("'", 3000);
	    		
	    		setInterval('count()', 1000);
			});
    		
    		
    	</script>
  </body>
</html>
