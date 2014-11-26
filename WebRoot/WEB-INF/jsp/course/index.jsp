<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>
<title>选课页面</title>
<script
	src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>


</head>

<style>
#zhu {
	font-size: 20px;
}

#sort {
	list-style: none; /* 将默认的列表符号去掉 */
	padding: 0; /* 将默认的内边距去掉 */
	margin: 0; /* 将默认的外边距去掉 */
}

#sort li {
	float: left;
}

#sort li a {
	text-decoration: none;
	padding: 8px; 
}

.table > thead > tr > th,
.table > tbody > tr > th,
.table > tfoot > tr > th,
.table > thead > tr > td,
.table > tbody > tr > td,
.table > tfoot > tr > td {
  border: 0px solid #ddd;
}

</style>


<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-1" style="margin-top: 20px">
				<div class="panel panel-warning" id="zhu">

					<div class="panel-body">
						<table class="table" >
							<tr>
								<td style="border-right: 1px solid #ddd;" class="well">年级：</td>
								<td><div class="btn-group">
										<button type="button" class="btn btn-default" name="xiao">不限</button>
										<button type="button" class="btn btn-default" name="xiao">一年级</button>
										<button type="button" class="btn btn-default" name="xiao">二年级</button>
										<button type="button" class="btn btn-default" name="xiao">三年级</button>
										<button type="button" class="btn btn-default" name="xiao">四年级</button>
										<button type="button" class="btn btn-default" name="xiao">五年级</button>
										<button type="button" class="btn btn-default" name="xiao">六年级</button>
										<br />
										<button type="button" class="btn btn-default" name="xiao"
											style="margin-top: 15px">初一</button>
										<button type="button" class="btn btn-default" name="xiao"
											style="margin-top: 15px">初二</button>
										<button type="button" class="btn btn-default" name="xiao"
											style="margin-top: 15px">初三</button>
										<button type="button" class="btn btn-default" name="xiao"
											style="margin-top: 15px">高一</button>
										<button type="button" class="btn btn-default" name="xiao"
											style="margin-top: 15px">高二</button>
										<button type="button" class="btn btn-default" name="xiao"
											style="margin-top: 15px">高三</button>
									</div>
								</td>
							</tr>
							<tr>
								<td style="border-right: 1px solid #ddd;" class="well">学科：</td>
								<td><div class="btn-group">
										<button type="button" class="btn btn-default" name="classes">语文</button>
										<button type="button" class="btn btn-default" name="classes">数学</button>
										<button type="button" class="btn btn-default" name="classes">英语</button>
										<button type="button" class="btn btn-default" name="classes">生物</button>
										<button type="button" class="btn btn-default" name="classes">化学</button>
										<button type="button" class="btn btn-default" name="classes">物理</button>
									</div>
								</td>
							</tr>
							<tr>
								<td style="border-right: 1px solid #ddd;" class="well">班级类型：</td>
								<td><div class="btn-group">
										<button type="button" class="btn btn-default" name="classes">暑假班</button>
										<button type="button" class="btn btn-default" name="classes">寒假班</button>
										<button type="button" class="btn btn-default" name="classes">周末班</button>
									</div>
								</td>
							</tr>
						</table>

					</div>
				</div>


				<!-- 
				<div class="row">
					<hr style="border:0;background-color:#0033cc;height:3px;">
				</div>
				<div class="row">
					<div class="col-sm-2 col-sm-offset-1">
						<button type="button" class="btn btn-link">综合</button>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-link">价格</button>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-link">人数</button>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-link">最新</button>
					</div>
				</div>
				<div class="row">
					<hr style="border:0;background-color:#0033cc;height:2px;">
				</div>
				 -->
				<div class="panel panel-warning">
					<div class="panel-body">
						<ul id="sort">
							<li >排序</li>
							<li><a>综合</a></li>
							<li><a>价格</a></li>
							<li><a>人数</a></li>
							<li><a>最新</a></li>
						</ul>
					</div>
				</div>


				<div class="row">
					<div class="col-sm-9">
						<div class="panel panel-warning">
							<div class="panel-body">
								<div class="row">
									<div class="col-sm-9">
										<div class="row">
											<div class="col-sm-4">
												<img src="image/laoshi.jpg" height="80" width="100">
											</div>
											<div class="col-sm-8">
												<a href=""><font size="4" color="orange"><span class="glyphicon glyphicon-bookmark"></span>数据</font> </a><br>
												<span class="glyphicon glyphicon-user">教师姓名：<font color="orange">张三</font>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4"></div>
											<div class="col-sm-3">价格：数据</div>
											<div class="col-sm-3">
												人数：<font color="orange">数据</font>
											</div>
											<div class="col-sm-2"></div>
										</div>
									</div>
									<div class="col-sm-3">
										<button type="button" class="btn btn-warning"
											style="margin-top: 40px">去选课</button>
										<button type="button" class="btn btn-warning"
											style="margin-top: 2px">加入购物车</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-2">

				<div class="row" style="margin-left: 2px">
					<h3 class="page-header">热门教师</h3>
					<!-- 
					<hr style="border:0;background-color:#0033cc;height:2px;">
					 -->
					
							<div class="row">
								<div class="col-sm-3">
									<a href=""><img src="image/laoshi.jpg"
										class="img-responsive" height="60" width="60"> </a>
								</div>
								<div class="col-sm-9">
									<a href="  ">武玉密</a> <br> 教师介绍的数据<br>
									主要课程:<font color="orange">英语，数学</font>
									
								</div>
							</div>
						
				</div>



				<div class="row" style="margin-left: 2px">
					<h3 class="page-header">文档下载</h3>
					<!-- 
					<hr style="border:0;background-color:#0033cc;height:2px;">
					 -->
					
							<ul>
								<li><a>高中复习文档数据</a>
								<li><a><font color="orange">高中复习文档</font></a>
								<li><a>高中复习文档</a>
							</ul>
						
				</div>


			</div>
		</div>
	</div>



<%@ include file="../foot.jsp"%>
</body>

</html>
