<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 添加教师图片 模态 -->
<div class="modal fade " id="addTeacherPicModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">请上传教师图片</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<div class="row">
					<div class="col-xs-5">
						<h3>原头像</h3>
						<img src="${pageContext.request.contextPath}/${teacher.pic}" width="240" height="320">
					</div>
					<div class="col-xs-1">
						<div style="width: 1px;height:380px;background-color: #ddd">
						</div>
					</div>
					<div class="col-xs-6">
						<form action="teacherCenterAction!addPic" method="post"
							enctype="multipart/form-data" class='form-horizontal' style="margin-top: 70px">
							<div class="form-group">
								<label class="col-sm-4 control-label">请选择头像</label>
								<div class="col-sm-8">
									<input type="file" name="pic" required="required" accept="image/jpeg,image/png,image/gif,image/bmp">
									<input type="hidden" name="id" value="${teacher.id}">
								</div>
								
							</div>
							
							<button type="submit" id="confirm" class="btn btn-primary btn-lg">确认上传教师图片</button>
							<ul style="color: red">
								<li>*请上传 jpg,png,bmp,gif格式的照片</li>
								<li>*照片大小不可以超过512KB</li>
							</ul>
						</form>
					</div>

				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
