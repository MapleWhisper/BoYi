<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎来到博弈教育</title>
  </head>
  
  <body>
  		<script>
  			location.href="/BoYi/indexAction";
  		</script>
  		
  </body>
</html>
