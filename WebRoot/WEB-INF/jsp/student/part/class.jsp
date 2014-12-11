<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="panel-body">
	<div class="row">
		<div class="col-xs-3" style="text-align: center;">
			<img alt="" width="100px" class="img-responsive"
				src="${pageContext.request.contextPath}/${c.teacher.pic }"> <br>
			<a
				href="${pageContext.request.contextPath}/course/indexAction!showTeacher?id=${c.teacher.id}">${c.teacher.name }</a>
		</div>
		<div class="col-xs-9">
			<span style="font-size: 17px;"><a
				href="${pageContext.request.contextPath}/course/indexAction!showClass?id=${c.id}">${c.name }</a></span>
			<hr>
			开课时间:
			<fm:formatDate type="date" value="${c.beginDate }" />
		</div>
	</div>
</div>