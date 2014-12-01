<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<ul>
							<s:iterator status="qwe" value="alist" var="a">
						   		 <s:if test="#qwe.odd == false"> 
						   		 	<li> <a href="${a.url }" target="_blank">
						   		 		<s:property value="#a.title" />
						   		 	</a>
						   		 	</li>
						   		  </s:if>
						   		  <s:if test="#qwe.odd == true">
						   		  	 <li>
						   		  	 	<a href="${a.url }" target="_blank"><s:property
											value="#a.title" />
										</a>
									</li>
						   		  </s:if>
							</s:iterator>
						</ul>