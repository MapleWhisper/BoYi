<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 确认报名模态-->
<div class="modal fade " id="confirmClass" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">确认要报名吗？</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<div class="row" style="text-align: center;">
					<h3 class="page-header">请及时到哈尔滨南岗区<br>邮政街321号博弈教育确认您的报名。</h3>
					<a href="#" class="btn btn-primary btn-lg" id="submit" name="${classes.id}">提交报名申请</a>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
