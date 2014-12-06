<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
<div class="row">
		<%@ include file="loginHead.jsp"%>
</div>

	<div id="header" style="margin-top: 30px">
		<ul>
			<li><font color="white">选课程</font></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=小学一年级">一年级</a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=小学二年级">二年级</a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=小学三年级"> 三年级</a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=小学四年级"> 四年级</a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=小学五年级"> 五年级</a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=小学六年级">六年级</a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=初中一年级">初一 </a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=初中二年级">初二 </a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=初中三年级">初三 </a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=高中一年级"> 高一</a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=高中二年级">高二 </a></li>
			<li><a href="${pageContext.request.contextPath}/course/indexAction?grade=高中三年级"> 高三</a></li>
			<li><a href="http://bbs.bjsyedu.com" target="_blank"> 逛论坛</a></li>
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