<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../public/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	  <script src="js/html5shiv.js"></script>
	  <script src="js/respond.min.js"></script>
	  <![endif]-->
</head>
<link
	href="${pageContext.request.contextPath}/assets/plugs/bootstrap-fileinput-master/css/fileinput.css"
	media="all" rel="stylesheet" type="text/css" />
<body>



	<!-- Preloader -->
	<div id="preloader">
		<%@ include file="../../public/preloader.jsp"%>
	</div>


	<section>

		<div class="leftpanel">
			<%@ include file="../../public/leftpanel.jsp"%>
		</div>
		<!-- leftpanel -->

		<div class="mainpanel">

			<div class="headerbar">
				<%@ include file="../../public/headerbar.jsp"%>

			</div>
			<!-- headerbar -->

			<div class="pageheader">
				<h2>
					<i class="fa fa-table"></i> 系统基础管理 <span>用户管理</span>
				</h2>
				<!-- <div class="breadcrumb-wrapper">
					<span class="label">You are here:</span>
					<ol class="breadcrumb">
						<li><a href="index.html">Bracket</a></li>
						<li class="active">Tables</li>
					</ol>
				</div> -->
			</div>

			<div class="contentpanel">

				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-btns">
							<a href="" class="panel-close">&times;</a> <a href=""
								class="minimize">&minus;</a>
						</div>
						<!-- panel-btns -->
						<h3 class="panel-title">${type }</h3>

					</div>


					<!-- 编辑面板 -->
					<div class="contentpanel">

						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">

									<div class="col-md-12">

										<div class="widget-content">
											<div class="padd">

												<!-- Form starts.  -->
												<form class="form-horizontal" role="form"
													action="${ctx }/user/addorUpdate" method="post" id="aaa"
													enctype="multipart/form-data">
													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;" style="width:200px;">姓名:</label><label
															for="userName" class="control-label" style="color: red;"></label>
														<div class="col-lg-8">
															<input type="text" class="form-control" id="userName"
																name="userName" value="${user.userName }"
																placeholder="姓名" required>
														</div>
													</div>

													<div class="clearfix"></div>
													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;" style="width:200px;">使用状态：</label><label
															for="ishiden" class="control-label" style="color: red;"></label>
														<div class="col-lg-8">
															<select name="ishiden" id="ishiden" class="form-control"
																required>
																<option value="1"
																	<c:if test="${user.ishiden == 'true' }">selected</c:if>>启用中</option>
																<option value="0"
																	<c:if test="${user.ishiden == 'false' }">selected</c:if>>禁用中</option>
															</select>
														</div>

													</div>
													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;">登录帐号</label><label
															class="control-label" for="accountName"
															id="foraccountName" style="color: red;"></label>
														<div class="col-lg-8">
															<input type="text"
																<c:if test="${type == '编辑用户' }">readonly="readonly"</c:if>
																class="form-control" id="accountName" name="accountName"
																onchange="return getrepletes('accountName');"
																value="${user.accountName }" placeholder="登录账号" required>
														</div>
													</div>
													<input type="hidden" id="accountNamehid"
														value="${user.accountName }">

													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;">用户角色：</label><label
															class="control-label" for="roleId" style="color: red;"></label>
														<div class="col-lg-8">
															<select name="roleId" id="roleId" class="form-control">
																<option value="">----请选择角色----</option>
																<c:forEach items="${listRole }" var="items"
																	varStatus="status">
																	<option value="${items.id }"
																		<c:if test="${items.id == user.role.id }">selected</c:if>>${items.roleName }</option>
																</c:forEach>

															</select>
														</div>
													</div>

													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;">证件类型</label> <label for="cardType"
															style="color: red;" class="control-label"></label>
														<div class="col-lg-8">
															<select name="cardType" id="cardType"
																class="form-control" required>
																<option value="">---请选择证件类型---</option>
																<option value="身份证"
																	<c:if test="${user.cardType == '身份证' }">selected</c:if>>身份证</option>
																<option value="护照"
																	<c:if test="${user.cardType == '护照' }">selected</c:if>>护照</option>
																<option value="军人证"
																	<c:if test="${user.cardType == '军人证' }">selected</c:if>>军人证</option>
																<option value="港澳通行证"
																	<c:if test="${user.cardType == '港澳通行证' }">selected</c:if>>港澳通行证</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;">头像</label> <label for="headImg"
															style="color: red;"></label>
														<div class="col-lg-8">

															<input type="file" class="file-input" id="file-3"
																name="headImg" value="" multiple="true">
														</div>

													</div>



													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;">证件号码</label> <label for="cardId"
															style="color: red;" class="control-label"></label>
														<div class="col-lg-8">
															<input type="text" class="form-control" id="cardId"
																name="cardId" value="${user.cardId }" placeholder="证件号码"
																required>
														</div>
													</div>


													<c:if test="${type eq '添加用户' }">
														<div class="form-group">
															<label class="col-lg-4 control-label"
																style="width: 200px;">密码</label><label for="passWord"
																style="color: red;" class="control-label"></label>
															<div class="col-lg-8">
																<input type="password" class="form-control"
																	id="passWord" name="passWord" placeholder="密码" required>
															</div>
														</div>
													</c:if>

													<c:if test="${type eq '编辑用户' }">
														<div class="form-group">
															<label class="col-lg-4 control-label"
																style="width: 200px;">最近登录时间</label><label
																style="color: red;" for="lastLoginTime"></label>
															<div class="col-lg-8">
																<input type="text"
																	<c:if test="${type == '编辑用户' }">disabled="disabled"</c:if>
																	class="form-control" id="lastLoginTime"
																	value="${user.lastLoginTime }" required>
															</div>
														</div>
													</c:if>
													<c:if test="${type eq '添加用户' }">
														<div class="form-group">
															<label class="col-lg-4 control-label"
																style="width: 200px;"> 确认密码</label><label
																for="passWord2" class="control-label"
																style="color: red;"></label>
															<div class="col-lg-8">
																<input type="password" class="form-control"
																	id="passWord2" name="passWord2" placeholder="确认密码"
																	required>
															</div>
														</div>
													</c:if>
													<c:if test="${type eq '编辑用户' }">
														<div class="form-group">
															<label class="col-lg-4 control-label"
																style="width: 200px;">最近登录Ip地址</label><label
																for="lastLoginIp" style="color: red;"></label>
															<div class="col-lg-8">
																<input type="text"
																	<c:if test="${type == '编辑用户' }">disabled="disabled"</c:if>
																	class="form-control" required>
															</div>
														</div>
													</c:if>
													<input type="hidden" value="${user.id }" name="hid">
													<input type="hidden" value="${user.photograph }"
														name="photograph">

													<div class="form-group">
														<div class=" col-lg-9">
															<button type="submit" style="float: right;" id="submit"
																class="btn btn-primary">提交</button>
														</div>
													</div>
												</form>
											</div>
										</div>


									</div>
									<!-- table-responsive -->
								</div>
								<!-- col-md-6 -->

							</div>
							<!-- panel-body -->
						</div>
						<!-- panel -->


					</div>
					<!-- 编辑结束 -->




					<div class="panel-body"></div>

				</div>
				<!-- table-responsive -->

			</div>
			<!-- panel-body -->



		</div>
		<!-- contentpanel -->

		<!-- mainpanel -->

		<div class="rightpanel">
			<%@ include file="../../public/footer.jsp"%>
		</div>
		<!-- rightpanel -->

	</section>
	<script src="${ctx }/assets/bracketbootstrap/js/select2.min.js"></script>


	<script
		src="${ctx }/assets/bracketbootstrap/js/jquery.datatables.min.js"></script>

	<script
		src="${ctx}/assets/plugs/bootstrap-fileinput-master/js/fileinput.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/assets/template/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/template/js/plugins/validate/messages_zh.min.js"></script>
	<script>
	
		$("#file-3").fileinput({
			allowedFileExtensions : [ 'jpg', 'gif', 'png', 'jpeg' ],//接收的文件后缀
			language : 'zh', //设置语言
			showUpload : false,//是否显示上传按钮
			showCaption : false,//是否显示标题
			showPreview : true,//显示预览
			browseClass : "btn btn-primary btn-lg",
		    initialPreview: [
		    	<c:if test="${not empty user.photograph}">"<img src='${user.photograph}' class='file-preview-image' style='width:auto;height:160px;'>",  
		    	</c:if>
		
    ], 
		});

		$.validator.setDefaults({
		/* submitHandler: function() {
		} */
		});

		$().ready(
				function() {
					// 提交时验证表单
					var a = "<i class='fa fa-times-circle'></i> ";
					var validator = $("#aaa").validate(
							{
								errorPlacement : function(error, element) {
									// Append error within linked label
									$(element).closest("form").find(
											"label[for='" + element.attr("id")
													+ "']").append(error);
								},
								errorElement : "span",
								rules : {
									passWord : {
										equalTo : "#passWord2"
									},
									passWord2 : {
										equalTo : "#passWord"
									}

								},
								messages : {
									accountName : {
										required : a + "账号不能为空",
										minlength : a + " (不能少于 3 个字母)"
									},
									userName : {
										required : a + "请输入姓名",
										minlength : a + " (不能少于 3 个字母)"
									},
									cardType : {
										required : a + "请选择证件类型"
									},
									cardId : {
										required : a + "请输入证件号码"
									},
									passWord : {
										equalTo : a + "两次输入密码不一致",
										required : a + "密码不能为空",
										minlength : a
												+ " (字母不能少于 5 个且不能大于 12 个)",
										maxlength : a
												+ " (字母不能少于 5 个且不能大于 12 个)"
									},
									passWord2 : {
										equalTo : a + "两次输入密码不一致",
										required : a + "请确认密码",
										minlength : a
												+ " (字母不能少于 5 个且不能大于 12 个)",
										maxlength : a
												+ " (字母不能少于 5 个且不能大于 12 个)"
									}
								}
							});

					$(".cancel").click(function() {
						validator.resetForm();
					});
				});
	</script>


</body>
</html>
