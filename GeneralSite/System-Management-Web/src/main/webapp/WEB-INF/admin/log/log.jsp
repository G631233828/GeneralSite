<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../public/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>


<link href="${ctx }/assets/bracketbootstrap/css/jquery.datatables.css"
	rel="stylesheet">


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	  <script src="js/html5shiv.js"></script>
	  <script src="js/respond.min.js"></script>
	  <![endif]-->
<link
	href="${pageContext.request.contextPath}/assets/template/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<script type="text/javascript">
	function author(o) {
		if (o == null) {
			//编辑为表格上方的按钮
			var a = $("input[name='ids']:checked").length;
			if (a == 1) {
				var id = $("input[name='ids']:checked").val();
				window.location.href = "toauthorPage?selectid=${selectid}&selectparentid=${selectparentid}&type=2&id="
						+ id;
			} else if (a == 0) {
				swal({
					type : "warning",
					title : "",
					text : "请选择用户进行分配权限！！",
				});
			} else {
				swal({
					type : "warning",
					title : "",
					text : "请不要同时给多个用户分配权限！！",
				});
			}
		} else {
			window.location.href = "toauthorPage?selectid=${selectid}&selectparentid=${selectparentid}&type=2&id="
					+ o;
		}

	}
</script>
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
					<i class="fa fa-table"></i> 系统监控 <span>日志监控</span>
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
						<h3 class="panel-title">日志监控</h3>

					</div>

					<div class="panel-body">
						<div class="row">
<div class="clients-list">
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#tab-1"
											id="a"><i class="fa fa-user"></i>操作日志</a></li>
										<li class=""><a data-toggle="tab" href="#tab-2" id="b"><i
												class="fa fa-briefcase"></i>异常监控</a></li>
									</ul>
									<div class="tab-content">
										<div id="tab-1" class="tab-pane active">
											<div class="full-height-scroll">
												<div class="table-responsive">

													<table
														class="table table-striped table-bordered table-hover "
														id="editable">
														<thead>
															<tr>
																<th>操作</th>
																<th>操作人</th>
																<th>操作时间</th>
																<th>请求ip</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach items="${pageList0.datas}" var="items"
																varStatus="status">
																<c:if test="${items.type == '0' }">
																	<tr class="gradeC">
																		<td>${items.description}</td>
																		<td>${items.createby}</td>
																		<td>${items.createDate}</td>
																		<td>${items.requestIp}</td>
																	</tr>
																</c:if>


															</c:forEach>
														</tbody>

													</table>

													<div class="widget-foot">
														<div class="row">
															<div class="col-sm-5 hidden-xs">
																<small class="text-muted inline m-t-sm m-b-sm">
																	每页显示${pageList0.pageSize}行 － 当前页${pageList0.pageNo}页 －
																	共${pageList0.totalPage}页 </small>

															</div>

															<ul class="pagination pull-right">
																<li <c:if test="${pageList.pageNo  eq 1}">class="disabled"</c:if>><a
															<c:if test="${pageList.pageNo  eq 1 }">href="javascript:void(0)"</c:if>
																	href="${pageContext.request.contextPath}/log/list?type=0&pageNo1=${pageList0.upPage}&pageNo1=${pageno1}">
																		上一页 </a></li>
																<c:forEach items="${pageList0.navigatepageNums}"
																	var="nav">
																	<c:choose>
																		<c:when test="${nav == pageList0.pageNo}">
																			<!-- 1当前页面 -->
																			<li class="active"><a
																				style="border-color: #eaeef1; background-color: #e8eff0;"
																				href="${pageContext.request.contextPath}/log/list?type=0&pageNo1=${pageno1}">${nav}</a>
																			</li>
																		</c:when>
																		<c:otherwise>
																			<li><a
																				href="${pageContext.request.contextPath}/log/list?pageNo0=${nav}&type=0&pageNo1=${pageno1}">${nav}</a></li>
																		</c:otherwise>
																	</c:choose>

																</c:forEach>
																<li><a
																	href="${pageContext.request.contextPath}/log/list?pageNo0=${pageList0.nextPage}&type=0&pageNo1=${pageno1}">
																		下一页 </a></li>
															</ul>

															<div class="clearfix"></div>

														</div>

													</div>

												</div>
											</div>
										</div>
										<div id="tab-2" class="tab-pane">
											<div class="full-height-scroll">
												<div class="table-responsive">

													<table
														class="table table-striped table-bordered table-hover "
														id="editable">
														<thead>
															<tr>
																<th>操作</th>
																<th>操作人</th>
																<th>操作时间</th>
																<th>异常代码</th>
																<th>请求ip</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach items="${pageList1.datas}" var="items"
																varStatus="status">
																<c:if test="${items.type == '1' }">
																	<tr class="gradeC">
																		<td>${items.description}</td>
																		<td>${items.createby}</td>
																		<td>${items.createDate}</td>
																		<td>${items.exceptionCode}</td>
																		<td>${items.requestIp}</td>
																	</tr>
																</c:if>


															</c:forEach>
														</tbody>

													</table>

													<div class="widget-foot">
														<div class="row">
															<div class="col-sm-5 hidden-xs">
																<small class="text-muted inline m-t-sm m-b-sm">
																	每页显示${pageList1.pageSize}行 － 当前页${pageList1.pageNo}页 －
																	共${pageList1.totalPage}页 </small>

															</div>

															<ul class="pagination pagination-split pull-right" style="margin-top: 0px;">
															<li <c:if test="${pageList.pageNo  eq 1}">class="disabled"</c:if>><a
															<c:if test="${pageList.pageNo  eq 1 }">href="javascript:void(0)"</c:if>
																	href="${pageContext.request.contextPath}/log/list?type=1&pageNo1=${pageList1.upPage}&pageNo0=${pageno0}">
																		上一页 </a></li>
																<c:forEach items="${pageList1.navigatepageNums}"
																	var="nav">
																	<c:choose>
																		<c:when test="${nav == pageList1.pageNo}">
																			<!-- 1当前页面 -->
																			<li class="active"><a
																				href="${pageContext.request.contextPath}/log/list?type=1&pageNo0=${pageno0}">${nav}</a>
																			</li>
																		</c:when>
																		<c:otherwise>
																			<li><a
																				href="${pageContext.request.contextPath}/log/list?pageNo1=${nav}&type=1&pageNo0=${pageno0}">${nav}</a></li>
																		</c:otherwise>
																	</c:choose>

																</c:forEach>
																<li><a
																	href="${pageContext.request.contextPath}/log/list?pageNo1=${pageList1.nextPage}&type=1&pageNo0=${pageno0}">
																		下一页 </a></li>
															</ul>

															<div class="clearfix"></div>

														</div>

													</div>
												</div>
											</div>
										</div>
									</div>

								</div>

						</div>
						<!-- foot 分页 -->

						<!-- table-responsive -->

					</div>
					<!-- panel-body -->



				</div>
				<!-- contentpanel -->

			</div>
		</div>
		<!-- mainpanel -->

			<div class="rightpanel">
				<%@ include file="../../public/footer.jsp"%>
			</div>
			<!-- rightpanel -->
	</section>

	<script
		src="${ctx }/assets/bracketbootstrap/js/jquery.datatables.min.js"></script>
</body>
</html>
