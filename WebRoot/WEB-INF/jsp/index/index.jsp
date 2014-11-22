<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>

<%@ include file="../header.jspf"%>
<title>博精思弈教育学校</title>
<link href="${pageContext.request.contextPath}/css/index/index.css"
	rel="stylesheet"></link>
<style type="text/css">
.banner {
	position: relative;
	overflow: auto;
}

.banner li {
}

.banner ul li {
	float: left;
	display: block;
	min-height: 350px;
}

.banner .dots {
	position: absolute;
	left: 600px;
	right: 0;
	bottom: 20px;
}

.banner .dots li {
	display: inline-block;
	width: 10px;
	height: 10px;
	margin: 0 4px;
	text-indent: -999em;
	border: 2px solid #fff;
	border-radius: 6px;
	cursor: pointer;
	opacity: .4;
	-webkit-transition: background .5s, opacity .5s;
	-moz-transition: background .5s, opacity .5s;
	transition: background .5s, opacity .5s;
}

.banner .dots li.active {
	background: #fff;
	opacity: 1;
}
</style>

</head>

<body>


	<%@include file="head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-xs-7 col-xs-offset-1" style="margin-top: 20px; ">
				<div class="row">
					<div class="col-xs-3">
						<font size="5">推荐课程</font>
					</div>
					<div class="col-xs-9">
						<hr style="border:0;background-color:blue ;height:1px;" />
					</div>
				</div>
				<div class="row">
					<div class="row" style="margin-bottom: 20px; ">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#primary"
								role="tab" data-toggle="tab">小学</a></li>
							<li role="presentation"><a href="#chuzhong" role="tab"
								data-toggle="tab">初中</a></li>
							<li role="presentation"><a href="#gaozhong" role="tab"
								data-toggle="tab">高中</a></li>

						</ul>
						<!-- Tab panes -->
						<div class="tab-content" style="margin-top: 20px">
							<div role="tabpanel" class="tab-pane active" id="primary">
								<div class="col-xs-6">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-4">
													<img
														src="${pageContext.request.contextPath}/image/index/laoshi.jpg"
														height="50" width="70">
												</div>
												<div class="col-xs-8">
													<a href=""><font size="4" color="orange">数据</font> </a><br>
												</div>
											</div>
											<div class="row">
												<div class="col-xs-4"></div>
												<div class="col-xs-4">价格：数据</div>
												<div class="col-xs-4">
													人数：<font color="orange">数据</font>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-6">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-4">
													<img
														src="${pageContext.request.contextPath}/image/index/laoshi.jpg"
														height="50" width="70">
												</div>
												<div class="col-xs-8">
													<a href=""><font size="4" color="orange">数据</font> </a><br>
												</div>
											</div>
											<div class="row">
												<div class="col-xs-4"></div>
												<div class="col-xs-4">价格：数据</div>
												<div class="col-xs-4">
													人数：<font color="orange">数据</font>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div role="tabpanel" class="tab-pane" id="chuzhong"></div>
							<div role="tabpanel" class="tab-pane" id="gaozhong"></div>

						</div>
					</div>


				</div>
				<div class="row" style="margin-top: 10px; ">
					<div class="row">
						<div class="col-xs-3">
							<font size="5">推荐名师</font>
						</div>
						<div class="col-xs-9">
							<hr style="border:0;background-color:blue ;height:1px;" />
						</div>
					</div>
					<div class="row" style="margin-bottom: 20px; ">

						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#Tprimary"
								role="tab" data-toggle="tab">小学</a></li>
							<li role="presentation"><a href="#Tchuzhong" role="tab"
								data-toggle="tab">初中</a></li>
							<li role="presentation"><a href="#Tgaozhong" role="tab"
								data-toggle="tab">高中</a></li>

						</ul>
						<!-- Tab panes -->
						<div class="tab-content" style="margin-top: 20px">
							<div role="tabpanel" class="tab-pane active" id="Tprimary">

								<div class="col-xs-6">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-4">
													<img
														src="${pageContext.request.contextPath}/image/index/laoshi.jpg"
														height="50" width="70">
												</div>
												<div class="col-xs-8">
													<a href=""><font size="4" color="orange">数据</font> </a><br>
												</div>
											</div>
											<div class="row">
												<div class="col-xs-4"></div>
												<div class="col-xs-4">价格：数据</div>
												<div class="col-xs-4">
													人数：<font color="orange">数据</font>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-6">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-4">
													<img
														src="${pageContext.request.contextPath}/image/index/laoshi.jpg"
														height="50" width="70">
												</div>
												<div class="col-xs-8">
													<a href=""><font size="4" color="orange">数据</font> </a><br>
												</div>
											</div>
											<div class="row">
												<div class="col-xs-4"></div>
												<div class="col-xs-4">价格：数据</div>
												<div class="col-xs-4">
													人数：<font color="orange">数据</font>
												</div>
											</div>
										</div>
									</div>
								</div>


							</div>
							<div role="tabpanel" class="tab-pane" id="Tchuzhong"></div>
							<div role="tabpanel" class="tab-pane" id="Tgaozhong"></div>

						</div>

					</div>

				</div>


			</div>
			<div class="col-xs-3" style="margin-top: 50px; ">
				<div class="row">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label for="inputEmail3" class="col-xs-4 control-label">用户名</label>
							<div class="col-xs-8">
								<input type="email" class="form-control" id="inputEmail3"
									placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-xs-4 control-label">密码</label>
							<div class="col-xs-8">
								<input type="password" class="form-control" id="inputPassword3"
									placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-2 col-xs-10">
								<div class="checkbox">
									<label> <input type="checkbox"> 记住密码
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-2 col-xs-10">
								<button type="submit" class="btn btn-info">登陆</button>
								<button type="submit" class="btn btn-info">注册</button>
							</div>

						</div>
					</form>
				</div>
				<div class="row">
					<div class="col-xs-11 col-xs-offset-1">
						<font size="3"> <b>日常处理</b></font>
						<hr>
						<ul>
							<li><a>事务处理事务处理</a>
							<li><a><font color="orange">事务处理事务处理</font></a>
							<li><a>事务处理事务处理</a>
						</ul>
					</div>


				</div>
				<div class="row" style="margin-top: 25px; ">
					<div class="col-xs-11 col-xs-offset-1">
						<img src="image/tietu.jpg" height="80" width="250">
					</div>
				</div>
				<div class="row" style="margin-top: 25px; ">
					<div class="col-xs-11 col-xs-offset-1">
						<img src="image/tietu.jpg" height="80" width="250">
					</div>
				</div>
				<div class="row" style="margin-top: 25px; ">
					<div class="col-xs-11 col-xs-offset-1">
						<img src="image/tietu.jpg" height="80" width="250">
					</div>
				</div>

			</div>
		</div>
		<hr>


	</div>
	<!-- container-end -->
	<%@include file="foot.jsp"%>



</body>
<script
	src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script
	src="${pageContext.request.contextPath}/js/index/unslider.min.js"></script>

<script type="text/javascript">
	$(function() {
		$(".nav-tabs a").mouseover(function() {
			$(this).tab('show');
			//locaton.href=$(this).attr("href");
		});
	});
	$(function() {
	    $('.banner').unslider({
	    	speed: 500,               //  The speed to animate each slide (in milliseconds)
	    	delay: 3000,
	    	keys: true,               //  Enable keyboard (left, right) arrow shortcuts
	    	dots: true,               //  Display dot navigation
	    	fluid: false              //  Support responsive design. May break non-responsive designs
	    });
	});
</script>

</html>
