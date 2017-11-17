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

<script type="text/javascript">
	function getparent() {
		var type = $("#type").val();
		if (type == 1) {
			$("#parent").show();
			$("#parentmenu").css("display","none");
			$("#parentId").attr("disabled", false);
			$("#parentmenu").attr("disabled", "disabled");
		} else if (type == 2) {
			$("#parent").show();
			$("#parentmenu").show();
			$("#parentId").attr("disabled", false);
			$("#parentmenu").attr("disabled", false);
		} else if (type == 0) {
			$("#parent").css("display","none");
			$("#parentmenu").css("display","none");
			$("#parentId").attr("disabled", "disabled");
			$("#parentmenu").attr("disabled", "disabled");
		}

	}

	function getparentmenu(o) {
		var type = $("#type").val();
		var parentId = $("#parentId").val();
		if (type == 2) {
			//需要通过ajax加载对应的菜单列表
			$.ajax({
				type : 'POST',
				url : "getparentmenu",
				data : "parentId=" + parentId,
				dataType : "json",
				success : function(data) {
					var sale = "<option value=''>----选择菜单----</option>";
					$.each(data, function(index, item) {
						sale += "<option value="+item.id+">" + item.name
								+ "</option>";

					});
					$("#parentIdmenu").html(sale)
				}
			});
		}
	}
</script>
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
												<form action="${ctx }/resource/addorUpdate" method="post"
									id="aaa">
									<div class="panel-body" style="padding-bottom: 0px;">
										<div class="box col-md-12">




											<div class="form-group col-md-5">
												<label>菜单名称:</label><label for="name" style="color: red;"></label>
												<input type="text" class="form-control" id="name"
													name="name" value="${resource.name }" placeholder="菜单名称"
													required>
											</div>


											<div class="form-group col-md-5">
												<label>菜单key:</label><label for="resKey" style="color: red;"></label>
												<input type="text" class="form-control" id="resKey"
													name="resKey" value="${resource.resKey }"
													placeholder="菜单Key" required>
											</div>

											<div class="form-group col-md-5">
												<label>菜单url:</label><label for="resUrl" id="forresUrl"
													style="color: red;"></label> <input type="text"
													class="form-control" id="resUrl" name="resUrl"
													value="${resource.resUrl }"
													onchange="return getrepletes('resUrl');"
													placeholder="菜单url" required>
											</div>



											<input type="hidden" value="${role.resUrl }" id="resUrlhid">

											<div class="form-group col-md-5">
												<label>菜单类别：</label><label for="type" style="color: red;"></label>
												<select name="type" id="type" class="form-control"
													onchange="getparent();">
													<option value="0">目录</option>
													<option value="1">菜单</option>
													<option value="2">按钮</option>
												</select>

											</div>



											<div class="form-group col-md-5" id="parent"
												<c:if test="${type eq '添加资源' }">style="display: none;"</c:if>
												<c:if test="${resource.type eq 0 }">style="display: none;"</c:if>>
												<label>目录：</label><label for="parentId" style="color: red;"></label>
												<select name="parentId" id="parentId" class="form-control"
													onchange="return getparentmenu();" required>
													<option value="">----选择目录----</option>
													<c:forEach items="${reslist }" var="res" varStatus="status">
														<option value="${res.id }">${res.name }</option>

													</c:forEach>
												</select>

											</div>

											<div class="form-group col-md-5" id="parentmenu"
												<c:if test="${type eq '添加资源' }">style="display: none;"</c:if>
												<c:if test="${resource.type eq 0  || resource.type eq 1}">style="display: none;"</c:if>>
												<label>菜单 :</label><label for="parentIdmenu"
													style="color: red;"></label> <select name="parentIdmenu"
													id="parentIdmenu" class="form-control" required>
													<option value="">----选择菜单----</option>
													<c:forEach items="${resmenu}" var="rm" varStatus="status">
														<option value="${rm.id }"
															<c:if test="${rm.id eq resmenulist.id}">selected</c:if>>${rm.name }</option>

													</c:forEach>
												</select>

											</div>



											<div class="form-group col-md-5" >
												<label>使用状态：</label><label for="ishiden" style="color: red;"></label>
												<select name="ishiden" id="ishiden" class="form-control">
													<option value="true">启用中</option>
													<option value="false">禁用中</option>
												</select>

											</div>





											<div class="form-group col-md-5" >
												<label>菜单图标:</label><label for="icon" id="foricon"
													style="color: red;"></label> <input type="text"
													class="form-control" id="icon" name="icon"
													value="${resource.icon }" placeholder="菜单图标">
											</div>
											
									

											<input type="hidden" value="${resource.id }" name="hid">
										<div class="form-group col-md-10">
												<label>描述:</label> <textarea type="text" rows="5"  class="form-control"
													id="description" name="description"	placeholder="描述">
													${resource.description }</textarea>
											</div>
										</div>
										
										
											
										<div class="form-group  col-md-10" style="margin-top: 5px;">

											<button type="submit" style="float: right;" id="submit"
												class="btn btn-sm btn-primary pull-right m-t-n-xs ">提交</button>
										</div>
									</div>

								</form>
												
												<!-- Form end.  -->
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
	<script
		src="${pageContext.request.contextPath}/assets/template/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/template/js/plugins/validate/messages_zh.min.js"></script>
	<script>
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
								messages : {
									name : {
										required : a + "菜单名称不能为空",
									},
									resKey : {
										required : a + "菜单Key不能为空",
									},
									resUrl : {
										required : a + "菜单Url不能为空",
									},
									parentId : {
										required : a + "请选择父菜单",
									}
								}
							});

					$(".cancel").click(function() {
						validator.resetForm();
					});
				});
	</script>

	<script type="text/javascript">
		$("#type").find("option[value='${resource.type}']").attr("selected", "selected");
		$("#parentId").find("option[value='${resparentsmenu.id}']").attr("selected", "selected");
	</script>
</body>
</html>
