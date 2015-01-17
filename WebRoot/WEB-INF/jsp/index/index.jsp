<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>

<%@ include file="../header.jspf"%>
<title>博精思弈教育</title>
<link href="${pageContext.request.contextPath}/css/index/index.css"
	rel="stylesheet"></link>
<style type="text/css">
.banner {
	position: relative;
	overflow: auto;
	background-position: center 0;
	background-size: cover;
}

.banner li {
}

.banner ul li {
	float: left;
	display: block;
	min-height: 300px;
}

.banner .dots {
	position: absolute;
	left: 600px;
	right: 0;
	bottom: 15px;
}

.banner .dots li {
	display: inline-block;
	width: 10px;
	height: 10px;
	margin: 0 4px;
	text-indent: -999em;
	border: 2px solid #fff;
	border-radius: 6px;
	cursor: pointer;
	opacity: .4;
	-webkit-transition: background .5s, opacity .5s;
	-moz-transition: background .5s, opacity .5s;
	transition: background .5s, opacity .5s;
}

.banner .dots li.active {
	background: #fff;
	opacity: 1;
}

.glyphicon{
	margin-right: 4px;
}	
</style>

</head>

<body>


	<%@include file="head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-xs-7 col-xs-offset-1" style="margin-top: 20px; ">
				<div class="row">
					<div class="col-xs-2">
						<h3>推荐课程</h3>
					</div>
					<div class="col-xs-10">
						<hr style="border:0;background-color:blue ;height:1px;" />
					</div>
				</div>
				<div class="row" style="margin-bottom: 30px;margin-left: 1px; ">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" ><a href="#primary"
								role="tab" data-toggle="tab">小学</a></li>
							<li role="presentation" class="active"><a href="#chuzhong" role="tab"
								data-toggle="tab">初中</a></li>
							<li role="presentation"><a href="#gaozhong" role="tab"
								data-toggle="tab">高中</a></li>

						</ul>
						<!-- Tab panes -->
						<div class="tab-content" style="margin-top: 20px">
							<div role="tabpanel" class="tab-pane " id="primary">
								<%@ include file="tuijian/c1.jsp"%>
							</div>
							<div role="tabpanel" class="tab-pane active" id="chuzhong">
								<%@ include file="tuijian/c2.jsp"%>

							</div>
							<div role="tabpanel" class="tab-pane" id="gaozhong">
								<%@ include file="tuijian/c3.jsp"%></div>

						</div>


				</div>
				<div class="row" style="margin-top: 10px; ">
						<div class="col-xs-2">
							<h3>推荐名师</h3>
						</div>
						<div class="col-xs-10">
							<hr style="border:0;background-color:blue ;height:1px;" />
						</div>

				</div>
				<div class="row" style="margin-bottom: 20px; ">
								<%@ include file="tuijian/s1.jsp"%>
					</div>


			</div>
			<div class="col-xs-3" style="margin-top: 20px; ">
				<!-- 登陆 -->
				<div class="row">
					<c:if test="${sessionScope.student == null}">
						<%@ include file="tuijian/login.jsp" %>
					</c:if>
					<c:if test="${sessionScope.student != null}">
					</c:if>
					
				</div><!-- 登陆 row-->
				
				<!-- 新闻动态 -->
				<div class="row">
					<div class="col-xs-11 col-xs-offset-1">
						<h3 class="page-header">新闻动态</h3>
						<%@ include file="tuijian/news.jsp" %>
					</div>


				</div><!-- 新闻动态 -->

			</div>
		</div>
		<hr>


	</div>
	<!-- container-end -->
	<%@include file="foot.jsp"%>



</body>
<script
	src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script
	src="${pageContext.request.contextPath}/js/index/unslider.min.js"></script>

<script type="text/javascript">
	$(function() {
		/*
		$(".nav-tabs a").mouseover(function() {
			$(this).tab('show');
			//locaton.href=$(this).attr("href");
		});
		*/
		$(".tab-pane").each(function(){
			if($(this).find("img").size()==0){
				$(this).append("<h3 style='text-align: center;color: gray;margin-top:70px;'>暂无课程</h3>");
			}
		});
			
	});
	$(function() {
	    $('.banner').unslider({
	    	speed: 500,               //  The speed to animate each slide (in milliseconds)
	    	delay: 3000,
	    	keys: true,               //  Enable keyboard (left, right) arrow shortcuts
	    	dots: true,               //  Display dot navigation
	    	
	    });
	});
</script>

</html>
