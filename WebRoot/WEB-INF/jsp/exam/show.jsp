<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="header.jspf"%>
<title>${paper.title}</title>
<style type="text/css">
.quest {
	font-size: medium;
	margin-top: 20px
}

.questArea {
	margin-top: 10px;
	padding-left: 50px
}

.nav-left {
	position: fixed;
	width: 150px;
	height: 100px
}

.error {
	color: red
}

.block {
	display: block;
}

</style>
</head>

<body style="background-color:#efeee4;">
	<div class="header">
		<p style="font-size:30px;font-weight:bold">${exam.name}</p>
				<p style="font-size:20px;">开始时间<fm:formatDate
						value="${exam.beginTime}" pattern="yyyy-MM-dd HH:mm" /><br>
					结束时间<fm:formatDate value="${exam.endTime}"
						pattern="yyyy-MM-dd HH:mm" />
				</p>
	</div>
	<div class="container-fluid">
		<!-- 注释掉的内容，和上面的效果一样 -->
		<!-- <div class="row">
			<div class="page-header " style="text-align: center;">
				<h2 class="text-primary">${exam.name}</h2>
				<small class="text-info"> 开始时间<fm:formatDate
						value="${exam.beginTime}" pattern="yyyy-MM-dd HH:mm" /><br>
					结束时间<fm:formatDate value="${exam.endTime}"
						pattern="yyyy-MM-dd HH:mm" />
				</small>
			</div>
		</div>
		-->
		<div class="row">
			<!--左侧的导航条 -->
			<div class="col-xs-2">
				<%@include file="left.jsp"%>
				<div class="panel panel-default">
					<div class="panel-body">
						<p style="margin-bottom:8px;">剩余时间: <span id="time" style="color: red">${leftTime}</span></p>
						<p style="margin-bottom:8px;"><button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#myModal">一起考试的小伙伴</button>
						</p>
						<p style="font-size:20px;">考试须知:</p>
						<p>试卷可以多次提交<br>每次提交覆盖之前的答案<br>如果提交答案为空<br>将保留最近一次不为空值的答案<br>祝你考试顺利!<br></p>
						<p style="font-size:20px;">考试注意:</p>
						<p>${exam.note}</p>
					</div>
				</div>

			</div>
			<!--左侧的导航条 -->

			<!--右侧的内容 -->
			<div class="col-xs-10">
				<form
					action="${pageContext.request.contextPath}/exam/examAction!update"
					method="post" id="form1">
					<input type="hidden" name="id" value="${exam.id}">
					<input type="hidden" value="${exam.status }" id="status">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<!-- 单选题 -->
						<div class="panel panel-primary">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne" aria-expanded="true"
										aria-controls="collapseOne"> 第一部分 单选题
										共${paper.singleNumber}题</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<!--单选题 -->
									<c:forEach items="${paper.singleList}" var="pro" varStatus="s">
										<div style="margin-left: 50px">
											<div class="quest">
												<code>第${s.count}题</code>
												${pro.title }
											</div>
											<div class="radio">
												<label><input type="radio" value="A"
													name="${pro.id}" required>A:${pro.optA }</label>
											</div>
											<div class="radio">
												<label><input type="radio" value="B"
													name="${pro.id}">B:${pro.optB }</label>
											</div>
											<div class="radio">
												<label><input type="radio" value="C"
													name="${pro.id}">C:${pro.optC }</label>
											</div>
											<div class="radio">
												<label><input type="radio" value="D"
													name="${pro.id}">D:${pro.optD }</label>
											</div>
										</div>
									</c:forEach>
									<center>
										<input type="submit" value="保存试卷"
											onClick="return confirm('确定要提交吗？')"
											class="btn btn-primary btn-lg" />
									</center>

								</div>
							</div>
						</div>
						<!-- 单选题 -->

						<!-- 判断题 -->
						<div class="panel panel-primary">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">第二部分 判断题
										共${paper.judgeNumber}题</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<c:forEach items="${paper.judegeList}" var="pro" varStatus="s">
										<div style="margin-left: 50px">
											<div class="quest">
												<code>第${s.count}题</code>
												${pro.title }
											</div>
											<div class="radio">
												<label><input type="radio" value="对"
													name="${pro.id}" required>A:对</label>
											</div>
											<div class="radio">
												<label><input type="radio" value="错"
													name="${pro.id}">B:错</label>
											</div>
										</div>
									</c:forEach>
									<center>
										<input type="submit" value="保存试卷"
											onClick="return confirm('确定要提交吗？')"
											class="btn btn-primary btn-lg" />
									</center>
								</div>
							</div>
						</div>
						<!-- 判断题  -->

						<!-- 简答题 -->
						<div class="panel panel-primary">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree"> 第三部分
										问答题 共${paper.questionNumber}题 </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									<c:forEach items="${paper.questionList}" var="pro"
										varStatus="s">
										<c:set var="id" value="${pro.id}" />
										<div class="quest">
											<code>第${s.count}题</code>
											${pro.title }
										</div>
										<div class="questArea">
											<textarea class="form-control" required rows="6"
												id="${pro.id}" name="${pro.id}">${ pro.userAns }</textarea>
										</div>
									</c:forEach>
									<center>
										<input type="submit" value="保存试卷"
											onClick="return confirm('确定要提交吗？')"
											class="btn btn-primary btn-lg" />
									</center>
								</div>
							</div>
						</div>
						<!-- 简答题 -->

					</div>
					<!-- panel-group -->
				</form>
			</div>
			<!-- col-xs-10 -->

			<!-- 一起考试小伙伴 模态 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">参加考试的成员</h4>
						</div>
						<div class="modal-body">
							<table class="table table-border table-striped">
								<tr>
									<td>id</td>
									<td>学号</td>
									<td>姓名</td>
								</tr>
								<c:forEach items="${exam.classes.students}" var="stu"
									varStatus="s">
									<tr>
										<td>${ s.count}</td>
										<td>${stu.studentId }</td>
										<td>${stu.name }</td>

									</tr>
								</c:forEach>

							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 一起考试小伙伴 模态 -->

		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
	<script type="text/javascript">
		//倒计时
		var cnt = setInterval("count()", 1000);
		function count() {
			var time = $("#time").html();
			var hour = parseInt(time.split(':')[0]);
			var min = parseInt(time.split(':')[1]);
			var sec = parseInt(time.split(':')[2]);
			if (min <= 0 && sec <= 1) {
				$("#form1").submit();
				clearInterval(cnt);
			}
			if (sec == 0) {
				sec = 59;
				if (min == 0) {
					min = 59;
					hour--;
				} else {
					min--;
				}
			} else {
				sec--;
			}
			$("#time").html(hour + ":" + min + ":" + sec);
		};
		$(function() {
			$(document).bind("contextmenu", function() {
				return false;
			});
			$(document).bind("selectstart", function() {
				return false;
			});
			$(document).bind("selectstart", function() {
				return false;
			});
			$(document).bind("paste", function() {
				return false;
			});
			$(document).bind("copy", function() {
				return false;
			});
			$(document).bind("cut", function() {
				return false;
			});
			
			if($("#status").val() == "已结束"){
				$("input").attr("disabled","disabled");
				$("textarea").attr("disabled","disabled");
			}
		});

		$(function() {
			$("#form1").validate();

			$("#form1").submit(
					function() {
						$.post("examAction!update", $("#form1").serialize(),
								function() {
									alert("提交成功");
								});
						return false;
					});
		});
		
	</script>

</body>
</html>
