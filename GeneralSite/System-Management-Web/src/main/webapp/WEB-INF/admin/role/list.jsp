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
<link
	href="${pageContext.request.contextPath}/assets/template/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
</head>

<script type="text/javascript">

function setPermission(o){
	
	$("#id").val(o);
	
	$("#clickmodal").trigger("click"); 
	
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
					<i class="fa fa-table"></i> 系统基础管理 <span>角色管理</span>
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
						<h3 class="panel-title">角色管理</h3>

					</div>
					
					
					<button  id="clickmodal" data-toggle="modal" data-target="#myModal" style="display: none;"></button>
						<!-- 模态框（Modal） style="margin-top: 10%;"-->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">分类管理</h4>

								</div>
								<div class="modal-body">

							<div class="widget-content medias">

												<form action="${ctx }/role/addauthor" method="post">

													<input type="hidden" id="id" name="id" value="">
													<table
														class="table table-striped table-bordered table-hover "
														id="editable">
														<thead>
															<tr>
																<th style="width: 20px;">
																	<div class="checkbox  checkbox-inline">
																		<input type="checkbox" id="checkallPermission" name="checkallPermission" />
																		<label for="checkallPermission"></label>
																	</div>
																</th>
																<th style="width: 200px;">菜单名称</th>
																<th>按钮权限</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${listResource}" var="items"
																varStatus="status">
																<c:if test="${items.parentId eq '0'  }">

																	<tr class="gradeX">
																		<td>
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" name="permisids" id="${items.id}"  value="${items.id}"> <label for="${items.id}"></label>
																			</div>
																		<td>${items.name }</td>
																		<td></td>

																	</tr>
																	<c:forEach items="${listResource}" var="itemsmenu"
																		varStatus="status">
																		<c:if test="${itemsmenu.parentId eq items.id }">
																			<tr class="gradeX">
																				<td>
																					<div class="checkbox checkbox-inline">
																						<input type="checkbox" name="permisids" id="${itemsmenu.id}" value="${itemsmenu.id}"> <label for="${itemsmenu.id}"></label>
																					</div>
																				<td>${items.name}-${itemsmenu.name }</td>
																				<td><c:forEach items="${listResource}"
																						var="itemsbutton" varStatus="status">
																						<c:if
																							test="${itemsbutton.parentId eq itemsmenu.id }">
																							<input type="checkbox" id="${itemsbutton.id}" value="${itemsbutton.id}" name="permisids">${itemsbutton.name }
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
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
					
					<!-- 模态框结束 -->
					
					
					
					
					
					

					<div class="panel-body">
						<div class="row">

							<div class="col-md-12">

								<shiro:hasPermission name="role:add">
									<button class="btn btn-default btn-xs"
										onclick="return toaddPage()">
										<i class="glyphicon glyphicon-plus"> </i> 添加
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="user:edit">
									<button class="btn btn-primary btn-xs"
										onclick="return toeditPage()">
										<i class="fa fa-edit"> </i>编辑
									</button>
								</shiro:hasPermission>

								<shiro:hasPermission name="user:delete">
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
												<th>角色名称</th>
												<th>key</th>
												<th>描述</th>
												<th>使用状态</th>
												<th>操作</th>
											</tr>
										</thead>

										<tbody>

											<c:forEach items="${pageList.datas}" var="items"
												varStatus="status">
												<tr class="gradeX">
													<td>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" name="ids" id="${items.id}"
																value="${items.id}"> <label for="${items.id}"></label>
														</div>
													<td>${items.roleName }</td>
													<td>${items.roleKey }</td>
													<td>${items.description }</td>
													<td><c:if test="${items.ishiden  eq true}">
															<span class="label-success label label-default">启用</span>
														</c:if> <c:if test="${items.ishiden  eq false}">
															<span class="label label-danger label label-default">禁用</span>
														</c:if></td>




													<td class="table-action-hide"><shiro:hasPermission
															name="role:edit">
															<a href="javascript:void(0)"
																onclick="return toeditPage('${items.id}')"><i
																title="修改" class="fa fa-pencil"></i></a>
														</shiro:hasPermission> 
														<shiro:hasPermission name="role:delete">
															<a href="javascript:void(0)"
																onclick="return del('${items.id}')" class="delete-row"><i
																title="删除" class="fa fa-trash-o"></i></a>
														</shiro:hasPermission> 
														
														<shiro:hasPermission name="role:delete">
															<a href="javascript:void(0)"
																onclick="return setPermission('${items.id}')" class="delete-row">
																<i title="权限管理" class="fa fa-wrench"></i></a>
														</shiro:hasPermission> 
														
													</td>

												</tr>
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
											<c:if test="${pageList.upPage  eq '1' }">class="disabled"</c:if>><a
											<c:if test="${pageList.upPage  eq '1' }">href="javascript:void(0)"</c:if>
											href="${pageContext.request.contextPath}/role/list?pageNo=${pageList.upPage}&selectid=${selectid}&selectparentid=${selectparentid}">上一页</a></li>

										<c:forEach items="${pageList.navigatepageNums}" var="nav">
											<c:choose>
												<c:when test="${nav == pageList.pageNo}">
													<!-- 1当前页面 -->
													<li class="active"><a
														href="${pageContext.request.contextPath}/role/list?selectid=${selectid}&selectparentid=${selectparentid}">${nav}</a>
													</li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath}/role/list?pageNo=${nav}&selectid=${selectid}&selectparentid=${selectparentid}">${nav}</a></li>
												</c:otherwise>
											</c:choose>

										</c:forEach>
										<li><a
											href="${pageContext.request.contextPath}/role/list?pageNo=${pageList.nextPage}&selectid=${selectid}&selectparentid=${selectparentid}">下一页</a></li>
									</ul>
								</div>
							</div>

							<!-- 分页结束 -->
						</div>
						<!-- table-responsive -->

					</div>
					<!-- panel-body -->

				</div>
			</div>
			<!-- contentpanel -->

		</div>
		<!-- mainpanel -->

		<div class="rightpanel">
			<%@ include file="../../public/footer.jsp"%>
		</div>
		<!-- rightpanel -->
	</section>
	
	
	
	
	
	
</body>
</html>
