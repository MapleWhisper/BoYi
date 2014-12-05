<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 确认报名模态-->
<div class="modal fade " id="teacherPay" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">教师充值/发工资[${teacher.name }]</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<ul class="nav nav-tabs" role="tablist" id="myTab">
					<li role="presentation" class="active"><a href="#tab1"
						role="tab" data-toggle="tab">发工资</a></li>
					<li role="presentation"><a href="#tab2" role="tab"
						data-toggle="tab">充值</a></li>
				</ul>


				<div class="tab-content">

					<!-- 发工资 -->
					<div role="tabpanel" class="tab-pane active" id="tab1">
						<form class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/admin/teacher/teacherAction!remove"
							id="form2" method="post">
							<div class="form-group">
								<label class="col-xs-3 control-label">发工资金额</label>
								<div class="col-xs-8">
									<input type="number" class="form-control" required="required"
										name="resume.amount"> <input type="hidden"
										class="form-control" name="id" value="${teacher.id}">

								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-3 control-label">收据号，备注</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" required="required"
										name="resume.note">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-offset-1 col-xs-6">
									<button type="submit" id="login"
										class="btn btn-info btn-primary" onclick="return confirm('确认要扣除工资吗？')">
											立即扣费</button>
								</div>
							</div>

						</form>

					</div>
					<!-- 发工资 -->

					<!-- 教师充值 -->
					<div role="tabpanel" class="tab-pane" id="tab2">

						<form class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/admin/teacher/teacherAction!pay"
							id="form2" method="post">
							<div class="form-group">
								<label class="col-xs-3 control-label">充值金额</label>
								<div class="col-xs-8">
									<input type="number" class="form-control" required="required"
										name="resume.amount"> <input type="hidden"
										class="form-control" name="id" value="${teacher.id}">

								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-3 control-label">收据号，备注</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" required="required"
										name="resume.note">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-offset-1 col-xs-6">
									<button type="submit" id="login"
										class="btn btn-info btn-primary" onclick="return confirm('确认要充值吗？')"
										>立即充值</button>
								</div>
							</div>

						</form>
					</div>
					<!-- 教师充值 -->
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		$("form").css("margin-top","50px");
	});
</script>
