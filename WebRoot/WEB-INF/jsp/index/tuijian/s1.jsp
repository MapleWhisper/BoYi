<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<s:iterator value="tlist" var="t">
	<div class="col-xs-6">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-4">
						<img src="${pageContext.request.contextPath}/image/index/laoshi.jpg"
							height="50" width="70">
					</div>
					<div class="col-xs-8">
						<a href="" > <s:property value="#t.name" />
						</a><br>
						<button type="button" class="btn btn-warning"
							style="margin-top: 2px"  >去看看</button>
						 

					</div>
				</div>
				<div class="row">
					<div class="col-xs-10">
						主要课程：
						<s:property value="#t.id" />
					</div>

				</div>
				<div class="row">
					<div class="col-xs-10">
						评价：
						<s:property value="#t.password" />
					</div>
				</div>
			</div>
		</div>
	</div>

</s:iterator>
