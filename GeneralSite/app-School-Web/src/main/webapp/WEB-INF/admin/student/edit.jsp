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
					<i class="fa fa-table"></i>校园管理 <span>学校管理</span>
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
													<form action="${ctx }/school/addorUpdate" method="post" id="aaa">
								<div class="panel-body" style="padding-bottom: 0px;">
									<div class="box col-md-12">


											<div class="form-group col-md-5"> 
												<label>学校名称</label><label for="name" id="forname"
													style="color: red;"></label> <input type="text" class="form-control"
													id="name" name="name" value="${school.name }" onchange="return getrepletes('name');"
													placeholder="学校名称" required>
											</div>
											<div class="form-group col-md-5"> 
												<label>学校地址</label><label for="address"
													style="color: red;"></label> <input type="text" class="form-control"
													id="address" name="address" value="${school.address }" 
													placeholder="学校地址" required>
											</div>
											<div class="form-group col-md-5"> 
												<label>电话</label><label for="mobile"
													style="color: red;"></label> <input type="text" class="form-control"
													id="mobile" name="mobile" value="${school.mobile }" 
													placeholder="电话" >
											</div>
											<div class="form-group col-md-5"> 
												<label>网站地址</label><label for="website"
													style="color: red;"></label> <input type="text" class="form-control"
													id="website" name="website" value="${school.website }" 
													placeholder="网站地址" >
											</div>
											<div class="form-group col-md-5"> 
												<label>关键key</label><label for="webkey"
													style="color: red;"></label> <input type="text" class="form-control"
													id="webkey" name="webkey" value="${school.webkey }" 
													placeholder="关键key" >
											</div>


											<div class="form-group col-md-5">
												<label>使用状态：</label><label for="ishiden" style="color: red;"></label> <select name="ishiden" id="ishiden"
													class="form-control" required>
													<option value="1"
														<c:if test="${school.ishiden == true }">selected</c:if>>启用中</option>
													<option value="0"
														<c:if test="${school.ishiden == false }">selected</c:if>>禁用中</option>
												</select>

											</div>
											
											
											
											<input type="hidden" value="${school.id }" name="hid">

										</div>
									<div class="form-group  col-md-10">
										<button type="submit" style="float: right;" id="submit"
											class="btn btn-default">提交</button>
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
										required : a + "学校名称不能为空",
										minlength : a + " (不能少于 2个字母)"
									},
									address : {
										required : a + "学校地址不能为空",
										minlength : a + " (不能少于 3 个字母)"
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
