<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${classesList}" var="c">
						
						<div  >
						<div class="panel panel-warning">
							<div class="panel-body ">
								<div class="row" >
										<div class="col-xs-2" style="text-align: center;">
											<img src="${pageContext.request.contextPath}/${c.teacher.pic}" height="80" width="80"/>
											<br>
											${c.teacher.name}
										</div>
										<div class="col-xs-8" >
											<table>
												<tr class="ctitle">
													<td ><a href="${pageContext.request.contextPath}/course/indexAction!showClass?id=${c.id}"><span class="glyphicon glyphicon-bookmark"></span>${c.name }</a></td>
													<td></td>
												</tr>
												<tr class="ccontext">
													<td><span class="glyphicon glyphicon-time"></span> 开课时间：<fm:formatDate value="${c.beginDate}" pattern="yyyy-MM-dd"/></td>
													
												</tr>
												<tr class="ccontext">
													<td><span class="glyphicon glyphicon-heart"></span>适合于：${c.course.grade}学生</td>
												</tr>
												
												<tr class="ccontext">
													<td ><span class="glyphicon glyphicon-usd"></span>价格:${c.classPrice }</td>
													<td><span class="glyphicon glyphicon-user"></span>人数:${c.studentNumber}</td>
												</tr>
											</table>
										</div>
										
										<div class="col-xs-2">
											<button type="button" class="btn btn-warning" style="margin-top: 40px">去选课</button>
										</div>
									</div> <!-- row end -->
							</div><!-- panel body end -->
						</div><!-- panel end -->
						</div> <!-- 班级结束 -->
						
						</c:forEach>