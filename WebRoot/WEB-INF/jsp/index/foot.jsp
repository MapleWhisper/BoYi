<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="contain" style="margin-bottom: 0px" class="container">
		<!-- footer 开始 -->
		<div id="footer">
			<ul>

				
				
				<li><a href="#" style="font-size:14px;color:#fff;">新闻中心</a>
					<ul>
						<li><a href="#">行业聚焦</a></li>
						<li><a href="#">活动专题</a></li>
					</ul></li>
				<li><a href="#" style="font-size:14px;color:#fff;">相关网站</a>
					<ul>
						<li><a target="_blank" href="http://bbs.bjsyedu.com">教育论坛</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/indexAction">后台管理</a></li>
						<li><a href="${pageContext.request.contextPath}/exam/examAction">考试系统</a></li>
						<li><a href="${pageContext.request.contextPath}/student/studentCenterAction">学生中心</a></li>
					</ul></li>
				<li><a href="#" style="font-size:14px;color:#fff;">关于我们</a>
					<ul>
						<li><a target="_blank" href="http://company.bjsyedu.com">公司首页</a></li>
						<li><a target="_blank" href="http://company.bjsyedu.com/?page_id=35">公司介绍</a></li>
						<li><a target="_blank" href="http://company.bjsyedu.com/?page_id=53">关于我们</a></li>
						<li><a target="_blank" href="http://job.bjsyedu.com/ZhaoPin/client/index">诚聘英才</a></li>
					</ul>
				</li>
				<li><a href="#" style="font-size:14px;color:#fff;">联系我们</a>
					<ul>
						
						<li><a ><span class="glyphicon glyphicon-earphone"></span>${applicationScope.system['company.phoneNumber']}</a></li>
						<li><a ><span class="glyphicon glyphicon-envelope"></span>${applicationScope.system['admin.email']}</a></li>
						<li><a ><span class="glyphicon glyphicon-map-marker"></span>哈尔滨南岗邮政街321号</a></li>
						<li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2089442068&site=qq&menu=yes">
							<img  src="${pageContext.request.contextPath}/image/index/qq.png" 
								alt="点击这里给我发消息" title="点击这里给我发消息"/>点此发送QQ消息</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- footer 结束 -->

		<!-- footer1 开始 -->
		<div id="footer1" style="text-align: center;color:#fff">
			
			<span style="font-size:16px;">黑ICP备14006802号 ©2014 博精思弈 教育 版权所有 
			</span> 
		</div>
		<!-- footer1 结束 -->
	</div>