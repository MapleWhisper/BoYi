<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid">
<div class="row">
		<%@ include file="../index/loginHead.jsp"%>
</div>

	<div id="header" style="margin-top: 30px">
		<ul>
			<li><font color="white">选课程</font></li>
			<li><a href="#">一年级</a></li>
			<li><a href="#">二年级</a></li>
			<li><a href="#"> 三年级</a></li>
			<li><a href="#"> 四年级</a></li>
			<li><a href="#"> 五年级</a></li>
			<li><a href="#">六年级</a></li>
			<li><a href="#">初一 </a></li>
			<li><a href="#">初二 </a></li>
			<li><a href="#">初三 </a></li>
			<li><a href="#"> 高一</a></li>
			<li><a href="#">高二 </a></li>
			<li><a href="#"> 高三</a></li>
		</ul>
	</div>




	<div  class="banner">
		<ul>
			<li ><img width="100%" src="${pageContext.request.contextPath}/image/index/slide/1.jpg" ></li>
			<li><img  width="100%" src="${pageContext.request.contextPath}/image/index/slide/2.jpg" ></li>
			<li><img  width="100%" src="${pageContext.request.contextPath}/image/index/slide/3.jpg" ></li>
			<li><img  width="100%" src="${pageContext.request.contextPath}/image/index/slide/4.jpg" ></li>
		</ul>
		
	</div>
</div>