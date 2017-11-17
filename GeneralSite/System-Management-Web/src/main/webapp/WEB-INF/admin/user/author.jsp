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
									<div class="col-md-2"></div>
									<div class="col-md-8">
										<div class="widget">
											<div class="widget-head">
												<div class="widget-icons pull-right">
													<a href="#" class="wminimize"><i
														class="icon-chevron-up"></i></a> <a href="#" class="wclose"><i
														class="icon-remove"></i></a>
												</div>
												<div class="clearfix"></div>
											</div>
											<div class="widget-content medias">

												<form action="${ctx }/user/addauthor" method="post">

													<input type="hidden" id="userId" name="userId"
														value="${userId }">
													<table
														class="table table-striped table-bordered table-hover "
														id="editable">
														<thead>
															<tr>
																<th style="width: 20px;">
																	<div class="checkbox  checkbox-inline">
																		<input type="checkbox" id="checkall" name="checkall" />
																		<label for="checkall"></label>
																	</div>
																</th>
																<th style="width: 200px;">菜单名称</th>
																<th>按钮权限</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${pageList.datas}" var="items"
																varStatus="status">
																<c:if test="${items.parentId eq '0'  }">


																	<tr class="gradeX">
																		<td>


																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" name="ids" id="${items.id}"
																					<c:forEach items="${resuser }" var="checkres" varStatus="status">
																		<c:if test="${items.id eq checkres.id }">checked</c:if>
																
																	</c:forEach>
																					value="${items.id}"> <label
																					for="${items.id}"></label>
																			</div>
																		<td>${items.name }</td>
																		<td></td>

																	</tr>
																	<c:forEach items="${pageList.datas}" var="itemsmenu"
																		varStatus="status">
																		<c:if test="${itemsmenu.parentId eq items.id }">
																			<tr class="gradeX">
																				<td>
																					<div class="checkbox checkbox-inline">
																						<input type="checkbox" name="ids"
																							id="${itemsmenu.id}"
																							<c:forEach items="${resuser }" var="checkres" varStatus="status">
																		<c:if test="${itemsmenu.id eq checkres.id }">checked</c:if>
																
																	</c:forEach>
																							value="${itemsmenu.id}"> <label
																							for="${itemsmenu.id}"></label>
																					</div>
																				<td>${items.name}-${itemsmenu.name }</td>
																				<td><c:forEach items="${pageList.datas}"
																						var="itemsbutton" varStatus="status">
																						<c:if
																							test="${itemsbutton.parentId eq itemsmenu.id }">
																							<input
																								<c:forEach items="${resuser }" var="checkres" varStatus="status">
																						<c:if test="${itemsbutton.id eq checkres.id }">checked</c:if>
																					</c:forEach>
																								type="checkbox" id="${itemsbutton.id}"
																								value="${itemsbutton.id}" name="ids">${itemsbutton.name }
																			</c:if>
																					</c:forEach></td>

																			</tr>
																		</c:if>


																	</c:forEach>

																</c:if>
															</c:forEach>
														</tbody>

													</table>
													<div class="row" style="margin-top: 10px;">
														<div class="col-sm-5 hidden-xs"></div>



														<div class="col-sm-7 text-right text-center-xs">
															<button type="submit" style="float: right;" id="submit"
																class="btn btn-sm btn-primary pull-right m-t-n-xs ">提交</button>
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
