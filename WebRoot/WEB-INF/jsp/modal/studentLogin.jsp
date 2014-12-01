<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 确认报名模态-->
<div class="modal fade " id="studentLogin" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">您还没有登陆，请先登陆</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/loginAction!login">
						<div class="form-group">
							<label  class="col-xs-2 control-label">用户名</label>
							<div class="col-xs-8">
								<input type="email" class="form-control" required="required"
									placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-xs-2 control-label">密码</label>
							<div class="col-xs-8">
								<input type="password" class="form-control" required id="inputPassword3"
									placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-2 col-xs-4">
								<div class="checkbox">
									<label> <input type="checkbox"> 记住密码
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-1 col-xs-6">
								<button type="submit" class="btn btn-info btn-primary">登陆</button>
							</div>
							<div class="col-xs-4">
								<button type="submit" class="btn btn-default">没有账号?，点我去注册!</button>
							</div>

						</div>
					</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
