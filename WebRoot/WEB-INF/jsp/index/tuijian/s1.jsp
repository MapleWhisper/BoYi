<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<s:iterator value="tlist" var="t">
	<div class="col-xs-6">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-4">
						<img width="60px" height="60px"  src="${pageContext.request.contextPath}/${t.pic}" >
					</div>
					<div class="col-xs-8">
						<a href="${pageContext.request.contextPath}/course/indexAction!showTeacher?id=${t.id}" > <s:property value="#t.name" />
						</a><br>
						教授课程:
					</div>
				</div>
				
			</div>
		</div>
	</div>

</s:iterator>
