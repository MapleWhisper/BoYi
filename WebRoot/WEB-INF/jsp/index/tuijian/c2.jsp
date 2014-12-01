<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

								<s:iterator status="qwe"
									value="clist.{?#this.course.grade.indexOf('初中')!=-1}"
									var="classes">

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
														<a target="_blank" href="${pageContext.request.contextPath}/course/indexAction!showClass?id=${classes.id}"> <s:property
																value="#classes.name" />
														</a><br>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-4"></div>
													<div class="col-xs-4">
														价格：<font color="orange"> <s:property
																value="classes.classPrice" /></font>
													</div>
													<div class="col-xs-4">
														人数：<font color="orange"> <s:property
																value="#classes.studentNumer" /></font>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-4"></div>
													<div class="col-xs-4">
														其他：<font color="orange"> <s:property
																value="#classes.classPrice" /></font>
													</div>
													<div class="col-xs-4">
														当前人数：<font color="orange"> <s:property
																value="#classes.curentNumber" /></font>
													</div>
												</div>

											</div>
										</div>
									</div>

								</s:iterator>
				 