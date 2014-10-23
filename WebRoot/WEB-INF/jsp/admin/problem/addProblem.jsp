<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
	<%@ include file="../header.jspf" %>
	<title>管理员列表</title>
  </head>
  
  <body>
    	<div class="container">
    		<div class="row">
    			<%@ include file="../head.jsp" %>
    		</div>
    		<div class="row" style="margin-top: 70px">
    				<!--左侧的导航条 -->
					<div class="col-xs-3">
						<%@include file="../left.jsp"%>
					</div>
					<!--左侧的导航条 -->
					
					<!--右侧的内容 -->
					<div class="col-xs-9">
						<!-- 面板开始 -->
									<div class="panel panel-primary">
							  <div class="panel-heading">
							    <h3 class="panel-title">添加试题</h3>
							  </div>
							  <div class="panel-body">
									<!--添加试题框 -->
									<ul class="nav nav-pills nav-justified" role="tablist">
									  <li class="active"><a href="#single" role="tab" data-toggle="tab">单选题</a></li>
									  <li><a href="#Multiple" role="tab" data-toggle="tab">多选题</a></li>
									  <li><a href="#juedge" role="tab" data-toggle="tab">判断题</a></li>
									  <li><a href="#question" role="tab" data-toggle="tab">问答题</a></li>
									</ul>
									
									<!-- 添加试题 -->
									<div class="tab-content " style="margin-top: 50px">
										<!--单选题 -->
									  <div class="tab-pane active" id="single">
									  		
									  		
									  		<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/problem/problemAction!save" method="post" id="form1" >
											  <div class="form-group">
											    <label  class="col-xs-1 control-label">题目</label>
											    <div class="col-xs-11">
											      <textarea   rows="10" id="editor1" class="from-control" name="problem.title" ></textarea>
											      <input  type="hidden" name="problem.type" value="单选题">
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">选项A</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control"  name="problem.optA">
											     
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">选项B</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control" name="problem.optB" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">选项C</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control"  name="problem.optC">
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">选项D</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control" name="problem.optD" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">答案</label>
											    <div class="col-xs-3">
											      	<select class="form-control" name="problem.answer">
											      		<option value="A" selected="selected">A</option>
											      		<option value="B">B</option>
											      		<option value="C">C</option>
											      		<option value="D">D</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">标签</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control" name="problem.tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">难易</label>
											    <div class="col-xs-3">
											      	<select class="form-control" multiple name="problem.difficulty">
											      		<option value="简单" selected="selected">简单</option>
											      		<option value="中等">中等</option>
											      		<option value="困难">困难</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">年级</label>
											    <div class="col-xs-3">
											      	<select class="form-control"  name="problem.grade">
									      					<option value="小学一年级"   >小学一年级</option>
                                                              <option value="小学二年级"   >小学二年级</option>
                                                              <option value="小学三年级"   >小学三年级</option>
                                                              <option value="小学四年级"   >小学四年级</option>
                                                              <option value="小学五年级"   >小学五年级</option>
                                                              <option value="小学六年级"   >小学六年级</option>
                                                              <option value="初中一年级"  selected>初中一年级</option>
                                                              <option value="初中二年级"   >初中二年级</option>
                                                              <option value="初中三年级"   >初中三年级</option>
                                                              <option value="高中一年级"   >高中一年级</option>
                                                              <option value="高中二年级"   >高中二年级</option>
                                                              <option value="高中三年级"   >高中三年级</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">科目</label>
											    <div class="col-xs-3">
											      	<select class="form-control"  name="problem.subject">
						      								  <option value="数学"  >数学</option>
                                                                <option value="语文"  >语文</option>
                                                                <option value="英语"  >英语</option>
                                                                <option value="物理"  >物理</option>
                                                                <option value="化学"  >化学</option>
                                                                <option value="生物"  >生物</option>
											      	</select>
											    </div>
											  </div>
											   <div class="form-group">
											    <div class="col-xs-3 col-xs-offset-4">
											      <input type="submit" class="btn btn-primary btn-lg"  value="提交题目">
											    </div>
											  </div>
											</form>
									  </div><!--单选题 -->
									  
									  
									  <!--多选题 -->
									  <div class="tab-pane" id="Multiple">
									  		<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/problem/problemAction!save" method="post"  >
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">题目</label>
											    <div class="col-xs-11">
											      <textarea type="text" id="editor2" class="form-control"  rows="3" name="problem.title"></textarea>
											      <input type="hidden" name="problem.type" value="多选题">
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">选项A</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control"  name="problem.optA">
											     
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">选项B</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control" name="problem.optB" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">选项C</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control"  name="problem.optC">
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">选项D</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control" name="problem.optD" >
											    </div>
											  </div>
											  <div class="form-group" >
											    <label   class="col-xs-1 control-label">答案</label>
											    <div class="col-xs-3" data-toggle="tooltip" data-placement="top" title="按住 Control (Ctrl) 键多选" onmouseover="$(this).tooltip('show')">
											      	<select class="form-control" multiple name="problem.answer">
											      		<option value="A" selected="selected">A</option>
											      		<option value="B">B</option>
											      		<option value="C">C</option>
											      		<option value="D">D</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">标签</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control" name="problem.tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">难易</label>
											    <div class="col-xs-3">
											      	<select class="form-control" multiple name="problem.difficulty">
											      		<option value="简单" selected="selected">简单</option>
											      		<option value="中等">中等</option>
											      		<option value="困难">困难</option>
											      	</select>
											    </div>
											  </div>
											   <div class="form-group">
											    <div class="col-xs-3 col-xs-offset-4">
											      <input type="submit" class="btn btn-primary btn-lg"  value="添加多选题">
											    </div>
											  </div>
											</form>
									  
									  </div><!--多选题 -->
									  
									  <!--判断题 -->
									  <div class="tab-pane" id="juedge">
									  		<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/problem/problemAction!save" method="post" >
											  <div class="form-group">
											    <label   class="col-xs-1  control-label">题目</label>
											    <div class="col-xs-11">
											      <textarea id="editor3" class="form-control"  rows="3" name="problem.title"></textarea>
											      <input type="hidden" name="problem.type" value="判断题">
											    </div>
											  </div>
											 
											  <div class="form-group" >
											    <label   class="col-xs-1 control-label">答案</label>
											    <div class="col-xs-3" >
											      	<select class="form-control"  name="problem.answer">
											      		<option value="对" selected="selected">对</option>
											      		<option value="错">错</option>
											      	</select>
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">标签</label>
											    <div class="col-xs-11">
											      <input type="text" class="form-control" name="problem.tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
											    </div>
											  </div>
											  <div class="form-group">
											    <label   class="col-xs-1 control-label">难易</label>
											    <div class="col-xs-3">
											      	<select class="form-control" multiple name="problem.difficulty">
											      		<option value="简单" selected="selected">简单</option>
											      		<option value="中等">中等</option>
											      		<option value="困难">困难</option>
											      	</select>
											    </div>
											  </div>
											   <div class="form-group">
											    <div class="col-xs-3 col-xs-offset-4">
											      <input type="submit" class="btn btn-primary btn-lg"  value="添加判断题">
											    </div>
											  </div>
											</form>
									  </div><!--判断题 -->
									  
									  
									  <!--简答题 -->
									  <div class="tab-pane" id="question">
									  			<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/problem/problemAction!save" method="post" >
												  <div class="form-group">
												    <label   class="col-xs-1 control-label">题目</label>
												    <div class="col-xs-11">
												      <textarea type="text" id="editor4" class="form-control"  rows="3" name="problem.title"></textarea>
												      <input type="hidden" name="problem.type" value="简答题">
												    </div>
												  </div>
												  <div class="form-group" >
												    <label   class="col-xs-1 control-label">参考答案</label>
												    <div class="col-xs-11" >
												      	<textarea type="text" class="form-control"  rows="3" name="problem.answer" placeholder="参考答案"></textarea>
												    </div>
												  </div>
												  <div class="form-group">
												    <label   class="col-xs-1 control-label">标签</label>
												    <div class="col-xs-11">
												      <input type="text" class="form-control" name="problem.tabel" placeholder="请输入标签，便于搜索题目，例如: <高中数学>,<初中英语>" >
												    </div>
												  </div>
												  <div class="form-group">
												    <label   class="col-xs-1 control-label">难易</label>
												    <div class="col-xs-3">
												      	<select class="form-control" multiple name="problem.difficulty">
												      		<option value="简单" selected="selected">简单</option>
												      		<option value="中等">中等</option>
												      		<option value="困难">困难</option>
												      	</select>
												    </div>
												  </div>
												   <div class="form-group">
												    <div class="col-xs-3 col-xs-offset-4">
												      <input type="submit" class="btn btn-primary btn-lg"  value="添加问答题">
												    </div>
												  </div>
											</form>
									  </div><!--简答题 -->
									</div>
							  </div>
							</div>
								
						<!-- 面板结束 -->
					</div><!--右侧的内容 -->
					
    		</div>
    		<%@ include file="../buttom.jsp" %>
    	</div>
    	<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
		<script src="${pageContext.request.contextPath}/js/ckeditor/jquery.js"></script>
    	<script type="text/javascript">
    		$(function(){
    			$("#problem").css("margin-right","-30px").css("font-size"," 25px");
    		});
    		$(function() {
    			$( 'textarea#editor1' ).ckeditor();
    			$( 'textarea#editor2' ).ckeditor();
    			$( 'textarea#editor3' ).ckeditor();
    			$( 'textarea#editor4' ).ckeditor();
    		});
    		$(function(){
    			$("#scanProblem").click(function(){
    				if($("button.active").size()!=2){
    					$("#e2").toggle();
    					$("#e2").fadeOut(3000);
    				}
    			});
    		});
    	</script>
    	
  </body>
</html>
