<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 选择年级和科目 模态 -->
<div class="modal fade " id="gradeSubjectModel" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">请选择年级 和 科目后 继续</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<table class="table">
					<tr>
						<td style="width: 100px">年级:</td>
						<td>
							<div class="btn-group">
								<button type="button" class="btn btn-default" name="grade">小学一年级</button>
								<button type="button" class="btn btn-default" name="grade">小学二年级</button>
								<button type="button" class="btn btn-default" name="grade">小学三年级</button>
								<button type="button" class="btn btn-default" name="grade">小学四年级</button>
								<button type="button" class="btn btn-default" name="grade">小学五年级</button>
								<button type="button" class="btn btn-default" name="grade">小学六年级</button>
							</div> <br>
							<div class="btn-group" style="margin-top: 15px">
								<button type="button" class="btn btn-default" name="grade">初中一年级</button>
								<button type="button" class="btn btn-default" name="grade">初中二年级</button>
								<button type="button" class="btn btn-default" name="grade">初中三年级</button>
							</div>
							<div class="btn-group" style="margin-left: 30px;margin-top: 15px">
								<button type="button" class="btn btn-default" name="grade">高中一年级</button>
								<button type="button" class="btn btn-default" name="grade">高中二年级</button>
								<button type="button" class="btn btn-default" name="grade">高中三年级</button>
							</div>
						</td>
					</tr>
					<tr style="margin-top: 30px">
						<td style="width: 100px">课程:</td>
						<td>
							<div class="btn-group">
								<button type="button" class="btn btn-default" name="subject">语文</button>
								<button type="button" class="btn btn-default" name="subject">数学</button>
								<button type="button" class="btn btn-default" name="subject">英语</button>
								<button type="button" class="btn btn-default" name="subject">物理</button>
								<button type="button" class="btn btn-default" name="subject">化学</button>
								<button type="button" class="btn btn-default" name="subject">生物</button>
							</div>
						</td>
					</tr>
				</table>
				<button type="button" id="confirm" class="btn btn-primary btn-lg">确认年级和课程</button>
				<div id="e2" style="display: none;text-align: center;">
					<div style="width: 300px" class="alert alert-danger" role="alert">请选择
						年级 和 课程!</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<!-- 选择年级和科目 模态 -->
<script type="text/javascript">
$(function(){
	var grade = "";
	var course = "";
	$(".table button").click(function(){
		//alert("ok");
		//按钮点击时，添加active class效果
		var btn = $(this);
		var classString = $(this).attr("class");
		if(classString.indexOf("active")!=-1){
			$(this).removeClass("active");
		}else{
			$(this).addClass("active");
			$(this).siblings().removeClass("active");
			$(this).parent().siblings("div").find("button").removeClass("active");
		}
	});
});

</script>
