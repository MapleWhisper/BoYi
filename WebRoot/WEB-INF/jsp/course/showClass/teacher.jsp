<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="row">
	<h3 class="page-header" style="margin-left: 10px;">名师推荐</h3>
</div>
<c:forEach items="${ teacherList}" var="t">
	<div class="row">
		<div class="col-xs-5">
			<img height="80px" width="80px" src="${pageContext.request.contextPath}/${t.pic}">
		</div>
		<div class="col-xs-7">
			
			<table>
				<tr>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/course/indexAction!showTeacher?id=${t.id}">${t.name }</a></td>
				</tr>
			</table>
		</div>
	</div>
	<HR>
</c:forEach>
