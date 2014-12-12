<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

								<s:iterator status="qwe"
									value="clist.{?#this.course.grade.indexOf('小学')!=-1}"
									var="c">
									<div class="col-xs-6">
										<div class="panel panel-default">
											<div class="panel-body">
												
												<div class="row">
													<div class="col-xs-4" style="text-align: center;">
														<img src="${pageContext.request.contextPath}/${c.teacher.pic}" height="80" width="80"/>
														
													</div>
													<div class="col-xs-8">
														<a target="_blank" href="${pageContext.request.contextPath}/course/indexAction!showClass?id=${c.id}"
															style="font-size: 17px;">
															${c.name }
														</a>
														<table style="font-size: 14px;" >
															<tr class="cla">
																<td >授课教师：</td>
																<td >${c.teacher.name }</td>
															</tr>
															<tr class="cla">
																<td>班级人数：</td>
																<td>${c.studentNumber}</td>
															</tr>
														</table>
														<br>
													</div>
												</div>

											</div>
										</div>
									</div>

								</s:iterator>
				 