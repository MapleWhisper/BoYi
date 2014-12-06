<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>选课页面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course/course.css">


<style type="text/css">
.ctitle {
	font-size: 19px;
}

.ccontext {
	height: 25px;
	color: gray;
	font-size: 14px;
}

.glyphicon {
	color: orange;
}
</style>

</head>



<body>
	<div class="container">
		<div class="row">
			<%@ include file="../index/loginHead.jsp"%>
		</div>
		<div class="row">

			<div class="col-xs-8 col-xs-offset-1" style="margin-top: 20px">
				<div class="panel panel-warning" id="zhu">

					<div class="panel-body">
						<%@  include file="index/top.jsp"%>

					</div>
				</div>


				<div class="panel panel-warning">
					<div class="panel-body">
						<ul id="sort">
							<li>排序</li>
							<li><a>综合</a></li>
							<li><a>价格</a></li>
							<li><a>人数</a></li>
							<li><a>最新</a></li>
						</ul>
					</div>
				</div>

				<%@  include file="index/classes.jsp"%>
			</div>
			<div class="col-xs-2">

				<div class="row" style="margin-left: 2px">
					<h3 class="page-header">热门教师</h3>
					<%@ include file="showClass/teacher.jsp"%>

				</div>



				<div class="row" style="margin-left: 2px">

					<h3 class="page-header">文档下载</h3>
					<!-- 
					<hr style="border:0;background-color:#0033cc;height:2px;">
					 -->

					<ul>
						<c:forEach items="${articleList}" var="a">
							<li><a target="_blank" href="${a.url}">${a.title }</a></li>
						</c:forEach>
					</ul>

				</div>


			</div>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
	<%@ include file="../foot.jsp"%>

	<script type="text/javascript">
		$(function() {
			$(".btn-group button").click(
					function() {
						var btn = $(this);
						btn.removeClass("active");
						btn.addClass("active");
						btn.siblings().removeClass("active");
						btn.parent().siblings().children("button").removeClass(
								"active");

						var name = btn.attr("name");
						$("#" + name).val(btn.val());
						$("#form1").submit();
					});
		});
		$(function() {
			var grade = $("#grade").val();
			var subject = $("#subject").val();
			var classType = $("#classType").val();
			//alert(grade+"-"+subject+"-"+classType);
			var tem = [ "grade", "subject", "classType" ];
			var tem1 = new Array(grade, subject, classType);
			for (var i = 0; i < 3; i++) {

				//alert("."+tem[i]+" button[value=' "+tem1[i]+" ']");
				var btn = $("." + tem[i] + " button[value='" + tem1[i] + "']");
				btn.addClass("active");
				btn.siblings().removeClass("active");
				btn.parent().siblings().children("button")
						.removeClass("active");

			}

		});
	</script>

</body>

</html>
