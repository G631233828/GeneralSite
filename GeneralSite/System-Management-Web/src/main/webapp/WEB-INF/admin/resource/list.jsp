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
						<h3 class="panel-title">用户管理</h3>

					</div>

					<div class="panel-body">
						<div class="row">

							<div class="col-md-12">

								<shiro:hasPermission name="resource:add">
									<button class="btn btn-default btn-xs"
										onclick="return toaddPage()">
										<i class="glyphicon glyphicon-plus"> </i> 添加
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="resource:edit">
									<button class="btn btn-primary btn-xs"
										onclick="return toeditPage()">
										<i class="fa fa-edit"> </i>编辑
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="resource:deleteall">
									<button class="btn btn-danger btn-xs" onclick="return del()">
										<i class="fa fa-trash-o"> </i>删除
									</button>
								</shiro:hasPermission>



								<div class="table-responsive">
									<table class="table table-hidaction table-hover mb30">
										<thead>
											<tr>
												<th style="width: 20px;">
													<div class="checkbox  checkbox-inline">
														<input type="checkbox" id="checkall" name="checkall" /> <label
															for="checkall"></label>
													</div>
												</th>
												<th>菜单名称</th>
												<th>菜单key</th>
												<th>菜单url</th>
												<th>类别</th>
												<th>图标</th>
												<th>使用状态</th>
												<th>描述</th>
												<th>操作</th>
											</tr>
										</thead>

										<tbody>

											<c:forEach items="${pageList.datas}" var="items"
												varStatus="status">

												<c:if test="${items.parentId eq '0' }">

													<tr class="gradeX">
														<td>
															<div class="checkbox checkbox-inline">
																<input type="checkbox" name="ids" id="${items.id}"
																	value="${items.id}"> <label for="${items.id}"></label>
															</div>
														<td>${items.name }</td>
														<td>${items.resKey }</td>
														<td>${items.resUrl }</td>
														<td><c:if test="${items.type eq 0 }">
															目录
														</c:if> <c:if test="${items.type eq 1 }">
															菜单
														</c:if> <c:if test="${items.type eq 2 }">
															按钮
														</c:if></td>
														<td><i class="${items.icon }"></i></td>

														<td><c:if test="${items.ishiden  eq true}">
																<span class="label-success label label-default">启用</span>
															</c:if> <c:if test="${items.ishiden  eq false}">
																<span class="label label-danger label label-default">禁用</span>
															</c:if></td>
														<td><i class="${items.description }"></i></td>
														<td class="table-action-hide"><shiro:hasPermission
																name="resource:edit">
																<a href="javascript:void(0)"
																	onclick="return toeditPage('${items.id}')"><i
																	title="修改" class="fa fa-pencil"></i></a>
															</shiro:hasPermission> <shiro:hasPermission name="resource:delete">
																<a href="javascript:void(0)"
																	onclick="return del('${items.id}')" class="delete-row"><i
																	title="删除" class="fa fa-trash-o"></i></a>
															</shiro:hasPermission></td>
													</tr>
													<!-- 获取所有子目录 -->
													<!-- 获取具体功能 -->
													<c:forEach items="${pageList.datas}" var="itemsub"
														varStatus="status">
														<c:if test="${itemsub.parentId eq items.id }">
															<tr class="gradeX">
																<td>
																	<div class="checkbox checkbox-inline"
																		style="margin-left: 20px;">
																		<input type="checkbox" name="ids" id="${itemsub.id}"
																			value="${itemsub.id}"> <label
																			for="${itemsub.id}"></label>
																	</div>
																<td>${items.name}-${itemsub.name }</td>
																<td>${itemsub.resKey }</td>
																<td>${itemsub.resUrl }</td>
																<td><c:if test="${itemsub.type eq 0 }">
															目录
														</c:if> <c:if test="${itemsub.type eq 1 }">
															菜单
														</c:if> <c:if test="${itemsub.type eq 2 }">
															按钮
														</c:if></td>
																<td><i class="${itemsub.icon }"></i></td>

																<td><c:if test="${itemsub.ishiden  eq true}">
																		<span class="label-success label label-default">启用</span>
																	</c:if> <c:if test="${itemsub.ishiden  eq false}">
																		<span class="label label-danger label label-default">禁用</span>
																	</c:if></td>
																<td><i class="${itemsub.description }"></i></td>

																<td class="table-action-hide"><shiro:hasPermission
																		name="resource:edit">
																		<a href="javascript:void(0)"
																			onclick="return toeditPage('${itemsub.id}')"><i
																			title="修改" class="fa fa-pencil"></i></a>
																	</shiro:hasPermission> <shiro:hasPermission name="resource:delete">
																		<a href="javascript:void(0)"
																			onclick="return del('${itemsub.id}')"
																			class="delete-row"><i title="删除"
																			class="fa fa-trash-o"></i></a>
																	</shiro:hasPermission></td>
															</tr>
															<!-- 获取所有子目录 -->
															<c:forEach items="${pageList.datas}" var="itembuttom"
																varStatus="status">
																<c:if test="${itembuttom.parentId eq itemsub.id }">
																	<tr class="gradeX">
																		<td>
																			<div class="checkbox checkbox-inline"
																				style="margin-left: 40px;">
																				<input type="checkbox" name="ids"
																					id="${itembuttom.id}" value="${itembuttom.id}">
																				<label for="${itembuttom.id}"></label>
																			</div>
																		<td>${items.name}-${itemsub.name }-${itembuttom.name }</td>
																		<td>${itembuttom.resKey }</td>
																		<td>${itembuttom.resUrl }</td>
																		<td><c:if test="${itembuttom.type eq 0 }">
															目录
														</c:if> <c:if test="${itembuttom.type eq 1 }">
															菜单
														</c:if> <c:if test="${itembuttom.type eq 2 }">
															按钮
														</c:if></td>
																		<td><i class="${itembuttom.icon }"></i></td>

																		<td><c:if test="${itembuttom.ishiden  eq true}">
																				<span class="label-success label label-default">启用</span>
																			</c:if> <c:if test="${itembuttom.ishiden  eq false}">
																				<span class="label label-danger label label-default">禁用</span>
																			</c:if></td>
																		<td><i class="${itembuttom.description }"></i></td>
																		<td class="table-action-hide"><shiro:hasPermission
																				name="resource:edit">
																				<a href="javascript:void(0)"
																					onclick="return toeditPage('${itembuttom.id}')"><i
																					title="修改" class="fa fa-pencil"></i></a>
																			</shiro:hasPermission> <shiro:hasPermission name="resource:delete">
																				<a href="javascript:void(0)"
																					onclick="return del('${itembuttom.id}')"
																					class="delete-row"><i title="删除"
																					class="fa fa-trash-o"></i></a>
																			</shiro:hasPermission></td>

																	</tr>
																</c:if>
															</c:forEach>
														</c:if>
													</c:forEach>
												</c:if>





											</c:forEach>
										</tbody>
									</table>


								</div>
								<!-- table-responsive -->
							</div>
							<!-- col-md-6 -->

						</div>
						<!-- foot 分页 -->

						<div class="row">

							<div class="col-md-12">
								<div class="col-md-6">
									<div class="dataTables_info hidden-xs" style="margin-top: 0px;"
										role="status" aria-live="polite">每页显示${pageList.pageSize}行
										－ 当前页${pageList.pageNo}页 － 共${pageList.totalPage}页</div>
								</div>
								<div class="col-md-6">
									<ul class="pagination pagination-split pull-right"
										style="margin-top: 0px;">
										<li
											<c:if test="${pageList.pageNo  eq 1}">class="disabled"</c:if>><a
											<c:if test="${pageList.pageNo  eq 1 }">href="javascript:void(0)"</c:if>
											href="${pageContext.request.contextPath}/resource/list?pageNo=${pageList.upPage}&selectid=${selectid}&selectparentid=${selectparentid}">上一页</a></li>

										<c:forEach items="${pageList.navigatepageNums}" var="nav">
											<c:choose>
												<c:when test="${nav == pageList.pageNo}">
													<!-- 1当前页面 -->
													<li class="active"><a
														href="${pageContext.request.contextPath}/resource/list?selectid=${selectid}&selectparentid=${selectparentid}">${nav}</a>
													</li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath}/resource/list?pageNo=${nav}&selectid=${selectid}&selectparentid=${selectparentid}">${nav}</a></li>
												</c:otherwise>
											</c:choose>

										</c:forEach>
										<li><a
											href="${pageContext.request.contextPath}/resource/list?pageNo=${pageList.nextPage}&selectid=${selectid}&selectparentid=${selectparentid}">下一页</a></li>
									</ul>
								</div>
							</div>

							<!-- 分页结束 -->
						</div>
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
