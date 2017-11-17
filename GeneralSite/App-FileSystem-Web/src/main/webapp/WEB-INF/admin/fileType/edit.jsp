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

<script type="text/javascript">


<!--ajax提交-->

function ajaxSaveFileTypeName(){
	
	var fileTypeName = $("#fileTypeName").val();
	
	var flag = $(".toggle-inner .active").text();
	
	 var id = $("#hidfileTypeNameid").val();
	 
		if(fileTypeName == ""){
			alert("文件类型名称不能为空")
			return;
		}
	 
	  $.ajax({

          type : 'post',

          url : '${pageContext.request.contextPath}/fileTypeName/ajaxSave',

          data : 'fileTypeName='+fileTypeName+'&disable='+flag+'&id='+id,

          success : function(data) {
        	  
        	  if(id==""){
        		  var dis = "";
        	  
        			if(data.disable == false){
        				dis =  "<span class='label-success label label-default'>启用</span>"
        			}else{
        				dis = "<span class='label label-danger label label-default'>禁用</span>"
        			}
        		  
        		  $("#test").append("<tr id="+data.id+">"+
							"<td id="+data.id+"_fileTypeName>"+data.fileTypeName+"</td>"+
							"<td id="+data.id+"_disable>"+dis+"</td>"+
							"<td id="+data.id+"_edit class='table-action'>"+
							"<a href='javascript:void(0)' onclick=editFileTypeName('"+data.fileTypeName+"','"+data.disable+"','"+data.id+"');>"+
							"<i class='fa fa-pencil'></i></a>"+
					  	    "<a href='javascript:void(0)' onclick=delFileTypeName('"+data.id+"'); class='delete-row'>"+
					 	    "<i class='fa fa-trash-o'></i></a></td>"+
							"</tr>")
				if(data.disable == false){
							
				$("#fileTypeNameId").append("<option value='"+data.id+"' >"+data.fileTypeName+"</option>");
				
				}
        		 swal("添加成功！","您已经成功添加了这条信息。","success")
        	  }else{
        		  
        		  var fileTypeName = "#"+data.id+"_fileTypeName";

            	  var disable = "#"+data.id+"_disable";
            	  
            	  var edit = "#"+data.id+"_edit";

            	  $(fileTypeName).text(data.fileTypeName);
            	  
            	  if(data.disable == false){
            		  
            		  $(disable).html("<span class='label-success label label-default'>启用</span>")
            		  
            		}else{
            			
            			 $(disable).html("<span class='label label-danger label label-default'>禁用</span>")
            			 
            		}
            	  
            	  
            	  $(edit).html("<a href='javascript:void(0)' onclick=editFileTypeName('"+data.fileTypeName+"','"+data.disable+"','"+data.id+"');>"+
						"<i class='fa fa-pencil'></i></a>"+
					    "<a href='javascript:void(0)' onclick=delFileTypeName('"+data.id+"'); class='delete-row'>"+
					    "<i class='fa fa-trash-o'></i></a>");
            	  if(data.disable == false){
            		  
            	 $("#fileTypeNameId").find("option[value='"+data.id+"']").text(data.fileTypeName)
            	//  $("#fileTypeNameId").append("<option value='"+data.id+"' >"+data.fileTypeName+"</option>");
            	  
            	  }else{
            		  
            		  $("#fileTypeNameId").find("option[value='"+data.id+"']").remove();
            		  
            	  }
            	  swal("修改成功！","您已经成功修改了这条信息。","success")
        	  }
        	  $("#hidfileTypeNameid").val("");
        	  $("#fileTypeName").val("");
        	 
          }
 
}); 
	 
	
}

function editFileTypeName(o1,o2,o3){
	
	$("#fileTypeName").val(o1);
	
	if(o2 == "false"){
		 $(".toggle-slide").addClass("active");
		 $(".toggle-inner").attr("style","width: 80px; margin-left:0px;");
		 $(".toggle-inner .toggle-on").addClass("active");
		$(".toggle-inner .toggle-off").removeClass("active");   
	}else{
		$(".toggle-slide").removeClass("active");
		 $(".toggle-inner").attr("style","width: 80px; margin-left: -30px;");
	 	 $(".toggle-inner .toggle-off").addClass("active");
		$(".toggle-inner .toggle-on").removeClass("active");   
	}
	
	$("#hidfileTypeNameid").val(o3);
	
}

function delFileTypeName(o){
	
		swal({
			title : "您确定要删除这条信息吗",
			text : "删除后将无法恢复，请谨慎操作！",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是的，我要删除！",
			cancelButtonText : "让我再考虑一下…",
			closeOnConfirm : false,
			closeOnCancel : false
		}, function(a) {
			if (a) {
				if (o != "") {
					
					 $.ajax({

				          type : 'post',

				          url : '${pageContext.request.contextPath}/fileTypeName/ajaxdelete',

				          data : 'id='+o,

				          success : function(data) {
				        	  if(data!=""){
				        		  var deltr= "#"+o;
				        		  $(deltr).remove();
				        		  $("#fileTypeNameId").find("option[value='"+o+"']").remove();
				        		  swal("删除成功！","您已经永久删除了这条信息。","success")
				        	  }
				        		
				          }
					}); 
				}
			
			} else {
				swal("已取消", "您取消了删除操作！", "error")
			}
		})
 
	
	
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
					<i class="fa fa-table"></i> 文件管理 <span>文件类型管理</span>
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
									<div class="panel-body">
										<div class="form-group">
											<label class="col-sm-2 control-label">分类名称:</label>
											<div class="col-sm-8">
												<input type="text" name="fileTypeName" id="fileTypeName"
													class="form-control">
											</div>
										</div>
										<input type="hidden" name="hidfileTypeNameid"
											id="hidfileTypeNameid" class="form-control">

										<div class="form-group">

											<label class="col-sm-2 control-label">使用状态:</label>
											<div class="col-sm-8">
												<div class="col-sm-7 control-label">
													<div class="form-group">
														<div class="col-sm-7 control-label">
															<div class="toggle toggle-success"></div>
														</div>
													</div>
												</div>
											</div>


										</div>
										<div class="form-group">
											<div class="col-sm-10">
												<button type="button" class="btn btn-default"
													style="float: right;"
													onclick="return ajaxSaveFileTypeName();">提交</button>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">


									<table class="table table-primary mb30">
										<thead>
											<tr>
												<!-- 	<th>编号</th> -->
												<th>文件类型</th>
												<th>使用状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody id="test">
											<c:forEach var="item" items="${fileTypeNameList}" begin="0"
												varStatus="status">
												<tr id="${item.id}">
													<%-- 	<td>${status.index}</td> --%>
													<td id="${item.id}_fileTypeName">${item.fileTypeName}</td>
													<td id="${item.id}_disable"><c:if
															test="${item.disable  eq false}">
															<span class="label-success label label-default">启用</span>
														</c:if> <c:if test="${item.disable  eq true}">
															<span class="label label-danger label label-default">禁用</span>
														</c:if></td>
													<td id="${item.id}_edit" class="table-action"><a
														href="javascript:void(0)"
														onclick="return editFileTypeName('${item.fileTypeName}','${item.disable }','${item.id }');"><i
															class="fa fa-pencil"></i></a> <a href="javascript:void(0)"
														onclick="return delFileTypeName('${item.id}');"
														class="delete-row"><i class="fa fa-trash-o"></i></a></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>

								</div>






							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
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
													action="${ctx }/fileType/addorUpdate" method="post"
													id="aaa" enctype="multipart/form-data">
													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;" style="width:200px;">文件后缀名：</label><label
															for="suffixName" class="control-label"
															style="color: red;"></label>
														<div class="col-lg-6	">
															<input type="text" class="form-control" id="suffixName"
																name="suffixName" value="${fileType.suffixName }"
																placeholder="文件后缀名" required>
														</div>
													</div>




													<div class="clearfix"></div>
													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;" style="width:200px;">文件类型：</label><label
															for="ishiden" class="control-label" style="color: red;"></label>
														<div class="col-lg-6">


															<select name="fileTypeNameId" id="fileTypeNameId"
															 class="form-control" required>
															 
															 <c:if test="${not empty fileType.fileTypeName.fileTypeName}">
															 		<option value="${fileType.fileTypeName.id }">${fileType.fileTypeName.fileTypeName}</option>
															 </c:if>
																	 <option value="">----请选择----</option>
													
																<c:forEach items="${fileTypeNameList }" var="item"
																	varStatus="Status">
																	<c:if test="${item.disable eq false }">
																		<c:if test="${fileType.fileTypeName.id ne item.id}">
																			<option value="${item.id }">${item.fileTypeName }</option>
																		</c:if>
																	</c:if>
																</c:forEach>
															</select>
														</div>
														<div class="col-lg-2">
															<a href="" class="btn btn-default-alt"
																data-toggle="modal" data-target="#myModal"><span
																class="glyphicon glyphicon-plus"></span>分类管理</a>
														</div>

													</div>
													<div class="clearfix"></div>


													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;">文件显示图片：</label> <label
															for="iconName" style="color: red;"></label>
														<div class="col-lg-6">

															<input type="file" class="file-input" id="file-3"
																name="imgName" value="" multiple="true">
														</div>

													</div>


													<div class="clearfix"></div>
													<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;" style="width:200px;">使用状态：${fileType.disable}</label><label
															for="ishiden" class="control-label" style="color: red;"></label>
														<div class="col-lg-6">
															<select name="fileTypeDisable" id="fileTypeDisable" class="form-control"
																required>
																<option value="1"
																	<c:if test="${fileType.disable == false }">selected</c:if>>启用中</option>
																<option value="0"
																	<c:if test="${fileType.disable == true}">selected</c:if>>禁用中</option>
															</select>
														</div>
													</div>
													
													
													
														<div class="form-group">
														<label class="col-lg-4 control-label"
															style="width: 200px;">描述：</label>
														<div class="col-lg-6	">
															<textarea rows="6"  class="form-control" >${fileType.description }</textarea>
													
														</div>
													</div>


													<input type="hidden" value="${fileType.id }" name="hid">
													<input type="hidden" value="${fileType.imgPath }"
														name="imgPath">

													<div class="form-group" style="margin-top: 40px;">
													
														<label class="col-lg-7 control-label"></label>
														<div class="col-lg-5" style="float: right;">
															<button type="submit"    id="submit"
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
		    	<c:if test="${not empty fileType.imgPath}">"<img src='${fileType.imgPath}' class='file-preview-image' style='width:auto;height:160px;'>",</c:if>],});

			
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
											suffixName : {
												required : a + "文件后缀名不能为空",
												minlength : a + " (不能少于 1 个字母)"
											},
											roleKey : {
												required : a + "角色Key不能为空",
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