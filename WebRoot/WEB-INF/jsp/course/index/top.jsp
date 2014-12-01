<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<form action="${pageContext.request.contextPath}/course/indexAction" id="form1">
	<input type="hidden" name="grade" value="${grade}" id="grade">
	<input type="hidden" name="subject" value="${subject }" id="subject">
	<input type="hidden" name="classType" value="${classType }" id="classType">
<table class="table" id="select">
	<tr>
		<td style="border-right: 1px solid #ddd;" class="well">年级：</td>
		<td ><div class="btn-group grade">
				<button type="button" class="btn btn-default active" name="grade" value="">不限</button>
				<button type="button" class="btn btn-default" name="grade" value="小学一年级">一年级</button>
				<button type="button" class="btn btn-default" name="grade" value="小学二年级">二年级</button>
				<button type="button" class="btn btn-default" name="grade" value="小学三年级">三年级</button>
				<button type="button" class="btn btn-default" name="grade" value="小学四年级">四年级</button>
				<button type="button" class="btn btn-default" name="grade" value="小学五年级">五年级</button>
				<button type="button" class="btn btn-default" name="grade" value="小学六年级">六年级</button>

			</div>
			<br>
			<div class="btn-group grade">
				
				<button type="button" class="btn btn-default" name="grade" 
					style="margin-top: 15px" value="初中一年级">初一</button>
				<button type="button" class="btn btn-default" name="grade"
					style="margin-top: 15px" value="初中二年级">初二</button>
				<button type="button" class="btn btn-default" name="grade"
					style="margin-top: 15px" value="初中三年级">初三</button>
				<button type="button" class="btn btn-default" name="grade"
					style="margin-top: 15px" value="高中一年级">高一</button>
				<button type="button" class="btn btn-default" name="grade"
					style="margin-top: 15px" value="高中二年级">高二</button>
				<button type="button" class="btn btn-default" name="grade"
					style="margin-top: 15px" value="高中三年级">高三</button>
			</div>
		</td>
	</tr>
	<tr>
		<td style="border-right: 1px solid #ddd;" class="well ">学科：</td>
		<td><div class="btn-group subject">
				<button type="button" class="btn btn-default active" name="subject" value="">不限</button>
				<button type="button" class="btn btn-default" name="subject" value="语文">语文</button>
				<button type="button" class="btn btn-default" name="subject" value="数学">数学</button>
				<button type="button" class="btn btn-default" name="subject" value="英语">英语</button>
				<button type="button" class="btn btn-default" name="subject" value="生物">生物</button>
				<button type="button" class="btn btn-default" name="subject" value="化学">化学</button>
				<button type="button" class="btn btn-default" name="subject" value="物理">物理</button>
			</div>
		</td>
	</tr>
	<tr>
		<td style="border-right: 1px solid #ddd;" class="well classesType">班级类型：</td>
		<td><div class="btn-group classType">
				<button type="button" class="btn btn-default active" name="classType">不限</button>
				<button type="button" class="btn btn-default" name="classType">暑假班</button>
				<button type="button" class="btn btn-default" name="classType">寒假班</button>
				<button type="button" class="btn btn-default" name="classType">周末班</button>
			</div></td>
	</tr>
</table>
</form>
