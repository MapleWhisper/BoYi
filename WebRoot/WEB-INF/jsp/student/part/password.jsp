<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div role="tabpanel" class="tab-pane ${(message==null)?'':'active' }"
	id="password">
	<form
		action="${pageContext.request.contextPath}/student/studentCenterAction!updatePwd"
		name="form1" id="form1" method="post">
		<table class="table table-striped table-hover">
			<tr>
				<td></td>
				<td></td>
				<td>原密码</td>

				<td><input type="password" name="oldPwd" id="oldPwd"><br></td>
				<td></td>


			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>新密码</td>
				<td><input type="password" name="newPwd" id="newPwd"><br></td>
				<td></td>


			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>确认密码</td>
				<td><input type="password" name="newPwd1" id="newPwd1"></td>
				<td></td>

			</tr>

		</table>
		<center>
			<button type="submit" class="btn btn-primary">提交修改</button>
			<center>
				<div class="col-sm-6" id="e2">
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<div id="e1">${message }</div>
					</div>
				</div>
			</center>
		</center>

	</form>
</div>