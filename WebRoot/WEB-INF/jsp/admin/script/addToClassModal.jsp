<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 学生加入班级模态 -->
<div class="modal fade " id="addToClassModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">请选择要加入的班级</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<table class="table table-hover table-striped table-condensed" id="table2">
					<c:forEach items="${classesList }" var="c">
						<tr>
							<td>${c.name}</td>
							<td>${c.teacher.name }</td>
							<td>${c.classType }</td>
							<td><a class="btn btn-info" href="studentAction!addToClass?id=${student.id}&cid=${c.id}">加入班级</a></td>
						</tr> 
					</c:forEach>
				</table>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<!-- 学生加入班级模态-->

