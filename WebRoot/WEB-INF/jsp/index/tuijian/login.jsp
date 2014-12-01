<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<form method="post" class="form-horizontal" role="form"  action="${pageContext.request.contextPath}/loginAction!login" >
						<div class="form-group">
							<label  class="col-xs-4 control-label">邮箱</label>
							<div class="col-xs-8">
								<input type="email" class="form-control" required  placeholder="请输入登陆邮箱" name="student.email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-xs-4 control-label">密码</label>
							<div class="col-xs-8">
								<input type="password" class="form-control" required placeholder="请输入邮箱密码" name="student.password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-2 col-xs-10" >
								<div class="checkbox">
									<label> <input type="checkbox"> 记住密码
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-2 col-xs-10">
								<button type="submit" class="btn btn-info">登陆</button>
								<a href="${pageContext.request.contextPath}/login/loginAction!registerUI" class="btn btn-info" role="button">注册</a>
							</div>
						</div>
					</form>