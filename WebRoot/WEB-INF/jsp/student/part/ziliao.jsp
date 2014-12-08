<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div role="tabpanel" class="tab-pane ${(message==null)?'active':'' }  " id="ziliao">
	<form
		action="${pageContext.request.contextPath}/student/studentCenterAction!updateInfo"
		method="post" id="form2" name="form2" enctype="multipart/form-data">
		<div class="row">
			<div class="col-sm-8">
				<table width="100%" border="0" class="ft14">
					<tr>
						<td width="22%" height="50" class="textR pdright40 ftgray03">真实姓名:</td>
						<td width="78%">
							<div class="old" id="old_geren_name" style="display: block;">${student.name }</div>
							<div class="new" id="new_geren_name" style="display: none;">
								<input type="text" class="ipText01 wid150 ft14"
									value="${student.name }" id="stuName" name="stuName"
									readonly="readonly" /> <span
									style="color:#838383;font-size:12px;">&nbsp;不能修改</span>
							</div>
						</td>
					</tr>
					<tr>
						<td height="50" class="textR pdright40 ftgray03">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
						<td>
							<div class="old" id="old_geren_sex" style="display: block;">${student.sex}</div>
							<div class="new"  id="new_geren_sex">
								<input type="radio" name="student.sex" value="男">男 
								<input type="radio" name="student.sex" value="女">女
							</div>
						</td>
					</tr>
					<tr>
						<td height="50" class="textR pdright40 ftgray03">所在年级:</td>
						<td>
							<div class="old" id="old_xuexiao_class" style="display:block;">小学一年级</div>
							<div class="new" style="display:none;" id="new_xuexiao_class">
								<span class="fn-left pdright20"> <select id="stuGrade"
									name="stuGradeId" class="ipSelect03">
										<option value="0" selected='selected'>请选择年级</option>
										<option value="1">小学一年级</option>
										<option value="2">小学二年级</option>
										<option value="3">小学三年级</option>
										<option value="4">小学四年级</option>
										<option value="5">小学五年级</option>
										<option value="6">小学六年级</option>
										<option value="7">初中一年级</option>
										<option value="8">初中二年级</option>
										<option value="9">初中三年级</option>
										<option value="10">高中一年级</option>
										<option value="11">高中二年级</option>
										<option value="12">高中三年级</option>
								</select>
								</span>
							</div>
						</td>
					</tr>

					<tr>
						<td height="50" class="textR pdright40 ftgray03">出生日期:</td>
						<td>

							<div class="old" style="display: block;">
								<fm:formatDate value="${student.birth }" />
							</div>
							<div class="new" style="display: none;">
								<span class="fn-left pdright10"> <input
									name="stuBirthTime" type="text" id="stuBirthTime"
									class="ipText01 ft14"
									value="<fm:formatDate value="${student.birth }"/>"
									onclick="WdatePicker();" />

								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td height="50" class="textR pdright40 ftgray03">证件号码:</td>
						<td>
							<div class="old" id="old_geren_card" style="display: block;">${student.idNumber }</div>
							<div class="new" style="display: none;" id="new_geren_card">
								<span class="fn-left pdright20"><input
									class="ipText01 ft14" name="idNumber" type="text" id="idNumber"
									value="${student.idNumber }" /></span>
							</div>
						</td>
					</tr>
					<tr>
						<td height="50" class="textR pdright40 ftgray03">所属学校:</td>
						<td>
							<div class="old" id="old_xuexiao_address" style="display: block;">${student.school }</div>
							<div class="new" style="display: none;" id="new_xuexiao_address">
								<input class="ipText01 wid300" name="stuAddress" type="text"
									id="stuAddress" value="${student.school }" />
							</div>
						</td>
					</tr>
					<tr>
						<td height="50" class="textR pdright40 ftgray03">个人手机号:</td>
						<td>
							<div class="old" id="old_fumu_mphone" style="display: block;">${student.phoneNumber }</div>
							<div class="new" id="new_fumu_mphone" style="display: none;">
								<span class="fn-left pdright20"><input
									class="ipText01 wid150 ft14" type="text" name="phoneNumber"
									value="${student.phoneNumber }" id="phoneNumber" /></span>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-sm-4">
				<div class="user-photo-box">
					<dl>
						<dt>
							<img src="${pageContext.request.contextPath}/${student.picPath}"
								width="100" height="100" class="picImg" />
						</dt>
						<dd>
							<div class="form-group new">
								更改图像<label for="exampleInputFile"></label> <input type="file"
									id="pic" name="pic">
							</div>
						</dd>
					</dl>
				</div>
			</div>




		</div>
		<div class="row">
			<div class="col-sm-3 col-sm-offset-1">
				<div class="new" style="display: none;">
					<button type="submit" class="btn btn-primary">提交</button>
				</div>
			</div>
			<div class="col-sm-3 ">
				<button type="button" class="btn btn-primary" id="edit">修改</button>
			</div>

		</div>

	</form>

</div>