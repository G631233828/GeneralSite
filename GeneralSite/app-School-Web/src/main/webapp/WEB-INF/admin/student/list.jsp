<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../public/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>

<link
	href="${pageContext.request.contextPath}/assets/studentMessage/css/bootstrap.min.css?v=3.4.0"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/studentMessage/css/font-awesome.min.css?v=4.3.0"
	rel="stylesheet">
<!-- Data Tables -->
<link
	href="${pageContext.request.contextPath}/assets/studentMessage/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/studentMessage/css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/studentMessage/css/style.min.css?v=3.2.0"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/studentMessage/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<!-- Sweet Alert -->
<link
	href="${pageContext.request.contextPath}/assets/studentMessage/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<!-- 日期控件 -->
<link
	href="${pageContext.request.contextPath}/assets/studentMessage/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">




</head>
<script type="text/javascript">
	//判断上传文件后缀名
	function checkfiletype(o) {
		var file1 = $(o).val();
		if (file1 != null) {
			var file1type = file1.substring(file1.lastIndexOf('.') + 1);
			if (file1type == "xls" || file1type == "xlsx") {
				var size = (o.files[0].size / 1024).toFixed(2);
				if (file1type == "xls" || file1type == "xlsx") {
					if (size > 20480) {
						alert("上传文件过大");
						$(o).val("");
						$("#submit").attr("disabled", true);
						return;
					} else {
						$("#submit").attr("disabled", false);
					}
				}
			} else {
				alert("上传文件格式错误");
				$(o).val("");
				$("#submit").attr("disabled", true);
				return;
			}
		}
	}

	function toadd() {
		$("#schoolName").val('');
		$("#enrollmentYear").val('');
		$("#classes").val('');
		$("#studentName").val('');
		$("#studentsex1").attr("checked", false);
		$("#studentsex2").attr("checked", false);
		$("#studentBirthday").val('');
		$("#permanentAddress").val('');
		$("#accountoftheStreet").val('');
		$("#accountCategory").val('');
		$("#accountProperties").val('');
		$("#residenceAddress").val('');
		$("#postcode").val('');
		$("#contactPhone").val('');
		$("#fatherName").val('');
		$("#fatherEducation").val('');
		$("#fatherWorkUnit").val('');
		$("#fatherPost").val('');
		$("#fatherContactPhone").val('');
		$("#matherName").val('');
		$("#matherEducation").val('');
		$("#matherWorkUnit").val('');
		$("#matherPost").val('');
		$("#matherContactPhone").val('');
		$("#jiedou1").attr("checked", false);
		$("#jiedou2").attr("checked", false);
		$("#studentIdCard").val('');
		$("#otherCertificates").val('');
		$("#id").val('');
		$("#type").text("添加学生信息");
		$("#edit").trigger("click");//模拟点击时间
	}

	function edit() {
		var a = $("input[name='ids']:checked").length;
		if (a == 1) {
			var o = $("input[name='ids']:checked").val();

			var schoolName = "#" + o + "schoolName";
			$("#schoolName").val($(schoolName).text().trim());

			var enrollmentYear = "#" + o + "enrollmentYear";
			$("#enrollmentYear").val($(enrollmentYear).text().trim());

			var classes = "#" + o + "classes";
			$("#classes").val($(classes).text().trim());

			var studentName = "#" + o + "studentName";
			$("#studentName").val($(studentName).text().trim());

			var studentsex = $("#" + o + "studentsex").text().trim();
			if (studentsex == '男') {
				$("#studentsex1").attr("checked", "checked");
				$("#studentsex2").attr("checked", false);
			}
			if (studentsex == '女') {
				$("#studentsex2").attr("checked", "checked");
				$("#studentsex1").attr("checked", false);
			}

			var studentBirthday = "#" + o + "studentBirthday";
			$("#studentBirthday").val($(studentBirthday).text().trim());

			var permanentAddress = "#" + o + "permanentAddress";
			$("#permanentAddress").val($(permanentAddress).text().trim());

			var accountoftheStreet = "#" + o + "accountoftheStreet";
			$("#accountoftheStreet").val($(accountoftheStreet).text().trim());

			var accountCategory = "#" + o + "accountCategory";
			$("#accountCategory").val($(accountCategory).text().trim());

			var accountProperties = "#" + o + "accountProperties";
			$("#accountProperties").val($(accountProperties).text().trim());

			var residenceAddress = "#" + o + "residenceAddress";
			$("#residenceAddress").val($(residenceAddress).text().trim());

			var accountProperties = "#" + o + "accountProperties";
			$("#accountProperties").val($(accountProperties).text().trim());

			var postcode = "#" + o + "postcode";
			$("#postcode").val($(postcode).text().trim());

			var contactPhone = "#" + o + "contactPhone";
			$("#contactPhone").val($(contactPhone).text().trim());

			var fatherName = "#" + o + "fatherName";
			$("#fatherName").val($(fatherName).text().trim());

			var fatherEducation = "#" + o + "fatherEducation";
			$("#fatherEducation").val($(fatherEducation).text().trim());

			var fatherWorkUnit = "#" + o + "fatherWorkUnit";
			$("#fatherWorkUnit").val($(fatherWorkUnit).text().trim());

			var fatherPost = "#" + o + "fatherPost";
			$("#fatherPost").val($(fatherPost).text().trim());

			var fatherContactPhone = "#" + o + "fatherContactPhone";
			$("#fatherContactPhone").val($(fatherContactPhone).text().trim());

			var matherName = "#" + o + "matherName";
			$("#matherName").val($(matherName).text().trim());

			var matherEducation = "#" + o + "matherEducation";
			$("#matherEducation").val($(matherEducation).text().trim());

			var matherWorkUnit = "#" + o + "matherWorkUnit";
			$("#matherWorkUnit").val($(matherWorkUnit).text().trim());

			var matherPost = "#" + o + "matherPost";
			$("#matherPost").val($(matherPost).text().trim());

			var matherContactPhone = "#" + o + "matherContactPhone";
			$("#matherContactPhone").val($(matherContactPhone).text().trim());

			var jiedou = $("#" + o + "jiedou").text().trim();
			if (jiedou == '借读') {
				$("#jiedou1").attr("checked", "checked");
				$("#jiedou2").attr("checked", false);
			}
			if (jiedou == '非借读') {
				$("#jiedou2").attr("checked", "checked");
				$("#jiedou1").attr("checked", false);
			}

			var studentIdCard = "#" + o + "studentIdCard";
			$("#studentIdCard").val($(studentIdCard).text().trim());

			var otherCertificates = "#" + o + "otherCertificates";
			$("#otherCertificates").val($(otherCertificates).text().trim());

			$("#id").val(o);
			$("#type").text("修改添加学生信息");
			$("#edit").trigger("click");//模拟点击时间
		} else if (a == 0) {
			swal({
				type : "warning",
				title : "",
				text : "请选择一条记录进行编辑!!",
			});
		} else {
			swal({
				type : "warning",
				title : "",
				text : "请不要同时选择多个进行编辑",
			});
		}

	}

	function editone(o, o2) {
		var schoolName = "#" + o + "schoolName";
		$("#schoolName").val($(schoolName).text().trim());

		var enrollmentYear = "#" + o + "enrollmentYear";
		$("#enrollmentYear").val($(enrollmentYear).text().trim());

		var classes = "#" + o + "classes";
		$("#classes").val($(classes).text().trim());

		var studentName = "#" + o + "studentName";
		$("#studentName").val($(studentName).text().trim());

		var studentsex = $("#" + o + "studentsex").text().trim();
		if (studentsex == '男') {
			$("#studentsex1").prop("checked", "checked");
			$("#studentsex2").prop("checked", false);
		}
		if (studentsex == '女') {
			$("#studentsex2").prop("checked", "checked");
			$("#studentsex1").prop("checked", false);
		}

		var studentBirthday = "#" + o + "studentBirthday";
		$("#studentBirthday").val($(studentBirthday).text().trim());

		var permanentAddress = "#" + o + "permanentAddress";
		$("#permanentAddress").val($(permanentAddress).text().trim());

		var accountoftheStreet = "#" + o + "accountoftheStreet";
		$("#accountoftheStreet").val($(accountoftheStreet).text().trim());

		var accountCategory = "#" + o + "accountCategory";
		$("#accountCategory").val($(accountCategory).text().trim());

		var accountProperties = "#" + o + "accountProperties";
		$("#accountProperties").val($(accountProperties).text().trim());

		var residenceAddress = "#" + o + "residenceAddress";
		$("#residenceAddress").val($(residenceAddress).text().trim());

		var accountProperties = "#" + o + "accountProperties";
		$("#accountProperties").val($(accountProperties).text().trim());

		var postcode = "#" + o + "postcode";
		$("#postcode").val($(postcode).text().trim());

		var contactPhone = "#" + o + "contactPhone";
		$("#contactPhone").val($(contactPhone).text().trim());

		var fatherName = "#" + o + "fatherName";
		$("#fatherName").val($(fatherName).text().trim());

		var fatherEducation = "#" + o + "fatherEducation";
		$("#fatherEducation").val($(fatherEducation).text().trim());

		var fatherWorkUnit = "#" + o + "fatherWorkUnit";
		$("#fatherWorkUnit").val($(fatherWorkUnit).text().trim());

		var fatherPost = "#" + o + "fatherPost";
		$("#fatherPost").val($(fatherPost).text().trim());

		var fatherContactPhone = "#" + o + "fatherContactPhone";
		$("#fatherContactPhone").val($(fatherContactPhone).text().trim());

		var matherName = "#" + o + "matherName";
		$("#matherName").val($(matherName).text().trim());

		var matherEducation = "#" + o + "matherEducation";
		$("#matherEducation").val($(matherEducation).text().trim());

		var matherWorkUnit = "#" + o + "matherWorkUnit";
		$("#matherWorkUnit").val($(matherWorkUnit).text().trim());

		var matherPost = "#" + o + "matherPost";
		$("#matherPost").val($(matherPost).text().trim());

		var matherContactPhone = "#" + o + "matherContactPhone";
		$("#matherContactPhone").val($(matherContactPhone).text().trim());

		var jiedou = $("#" + o + "jiedou").text().trim();
		if (jiedou == '借读') {
			$("#jiedou1").prop("checked", "checked");
			$("#jiedou2").prop("checked", false);
		}
		if (jiedou == '非借读') {
			$("#jiedou2").prop("checked", "checked");
			$("#jiedou1").prop("checked", false);
		}

		var studentIdCard = "#" + o + "studentIdCard";
		$("#studentIdCard").val($(studentIdCard).text().trim());

		var otherCertificates = "#" + o + "otherCertificates";
		$("#otherCertificates").val($(otherCertificates).text().trim());
		if (o2 != "") {
			$("#type").text("查看学生详细");
		} else {
			$("#type").text("修改角色权限");
		}

		$("#id").val(o);
		$("#edit").trigger("click");//模拟点击时间
	}

	function del() {
		var a = $("input[name='ids']:checked").length;
		if (a == 0) {
			swal({
				type : "warning",
				title : "",
				text : "您至少选择一条记录进行删除!!",
			});
		} else {
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
					var delids = $("input[name='ids']:checked");
					//获取所有的id执行删除操作，使用ajax
					var str = "";
					$(delids).each(function() {
						str += this.value + ",";
					});
					if (str != "") {
						var ids = str.substring(0, str.length - 1);
						window.location.href = "delete?ids=" + ids;
					} else {
						window.location.href = document.URL;
					}
					//swal("删除成功！","您已经永久删除了这条信息。","success")
				} else {
					swal("已取消", "您取消了删除操作！", "error")
				}
			})

		}

	}

	function delone(o) {

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
					window.location.href = "delete?id=" + o;
				} else {
					window.location.href = document.URL;
				}
				//swal("删除成功！","您已经永久删除了这条信息。","success")
			} else {
				swal("已取消", "您取消了删除操作！", "error")
			}
		})

	}
	//ajax判断有没有重复
	function getaccountName() {
		var accountName = $("#accountName").val();
		var accountNamehid = $("#accountNamehid").val();
		if (accountNamehid != accountNamehid) {
			$
					.ajax({
						type : "POST",
						url : "ajaxgetUser",
						data : "accountName=" + accountName,
						dataType : "text",
						success : function(msg) {
							if (msg == "true") {//
								document.getElementById("accountNametext").innerHTML = "当前账号已存在！！";
								document.getElementById("accountNametext").style.cssText = "float: right; color: red;";
								$("#submit").attr("disabled", true);
							} else {
								$("#submit").attr("disabled", false);
								document.getElementById("accountNametext").innerHTML = " ";
							}
						}
					});
		}
	}
	
	
	
</script>
<style>
td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>



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
					<i class="fa fa-table"></i> 校园管理<span>学校管理</span>
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
						<h3 class="panel-title">学生管理</h3>
						<c:if test="${roleType== 1 }">
							<label style="color: red;"> (双击当前学生查看详细)</label>
						</c:if>
						<div class="ibox-tools">
							<label style="color: green;"> <b>注：查询可以通过多个查询条件联合搜索，如果无多条件只需通过其中一个进行查询</b></label>
						</div>
					</div>

					<div class="panel-body">
					
	<div class="ibox-content">

						<div class="">
							<c:if test="${not empty error }">
								<div class="alert alert-danger alert-dismissable">
									<button aria-hidden="true" data-dismiss="alert" class="close"
										type="button">×</button>
									${error }
								</div>
							</c:if>
							<form role="form" class="form-inline" method="post"
								action="${pageContext.request.contextPath}/student/list">
								<input type="hidden" value="${roleType}" name="roleType">
								<a href="#modal-form" data-toggle="modal" id="edit"></a>
								<c:if test="${roleType ==0 }">
									<button class="btn btn-primary " type="button"
										style="margin-top: -10px;" onclick="return toadd();">
										<i class="fa fa-plus"></i>添加
									</button>
									<a href="#modal-form2" class="btn btn-success "
										style="margin-top: -10px;" data-toggle="modal"> <i
										class="fa fa-upload"></i>批量导入
									</a>
									<button class="btn btn-info " type="button"
										style="margin-top: -10px;" onclick="return edit();">
										<i class="fa fa-paste"></i> 编辑
									</button>

									<button class="btn btn-warning " type="button"
										style="margin-top: -10px;" onclick="return del();">
										<i class="fa fa-trash-o"></i> 删除
									</button>
									<div class="form-group">
										<select class="form-control m-b" name="search1"
											style="width: 140px;">
											<c:if test="${not empty search1 }">
												<option value="${search1 }">${search1text }</option>
												<c:if test="${search1 eq 'schoolName_校区'}">
													<option value="">请选择查询条件</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="classes_班级">班级</option>
													<option value="enrollmentYear_入学年份">入学年份</option>
												</c:if>
												<c:if test="${search1 eq 'studentName_学生姓名'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="classes_班级">班级</option>
													<option value="enrollmentYear_入学年份">入学年份</option>
												</c:if>
												<c:if test="${search1 eq 'classes_班级'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="enrollmentYear_入学年份">入学年份</option>
												</c:if>
												<c:if test="${search1 eq 'enrollmentYear_入学年份'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="classes_班级">班级</option>
												</c:if>

											</c:if>
											<c:if test="${empty search1 }">
												<option value="">请选择查询条件</option>
												<option value="schoolName_校区">校区</option>
												<option value="studentName_学生姓名">学生姓名</option>
												<option value="classes_班级">班级</option>
												<option value="enrollmentYear_入学年份">入学年份</option>
											</c:if>

										</select> <input type="text" placeholder="请输入查询条件" id="serach1val"
											value="${search1val }" name="search1val"
											class="form-control m-b"> <select
											class="form-control m-b" name="search2" style="width: 140px;">
											<c:if test="${not empty search2 }">
												<option value="${search2 }">${search2text }</option>
												<c:if test="${search2 eq 'schoolName_校区'}">
													<option value="">请选择查询条件</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="classes_班级">班级</option>
													<option value="enrollmentYear_入学年份">入学年份</option>
												</c:if>
												<c:if test="${search2 eq 'studentName_学生姓名'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="classes_班级">班级</option>
													<option value="enrollmentYear_入学年份">入学年份</option>
												</c:if>
												<c:if test="${search2 eq 'classes_班级'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="enrollmentYear_入学年份">入学年份</option>
												</c:if>
												<c:if test="${search2 eq 'enrollmentYear_入学年份'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="classes_班级">班级</option>
												</c:if>

											</c:if>
											<c:if test="${empty search2 }">
												<option value="">请选择查询条件</option>
												<option value="schoolName_校区">校区</option>
												<option value="studentName_学生姓名">学生姓名</option>
												<option value="classes_班级">班级</option>
												<option value="enrollmentYear_入学年份">入学年份</option>
											</c:if>
										</select> <input type="text" placeholder="请输入查询条件" id="serach2val"
											name="search2val" value="${search2val }"
											class="form-control m-b">
									</div>
								</c:if>

								<c:if test="${roleType ==2}">
									<div class="form-group">
										<select class="form-control m-b" name="search1"
											style="width: 140px;">
											<c:if test="${not empty search1 }">
												<option value="${search1 }">${search1text }</option>
												<c:if test="${search1 eq 'schoolName_校区'}">
													<option value="">请选择查询条件</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
												</c:if>
												<c:if test="${search1 eq 'studentName_学生姓名'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>

												</c:if>
												<c:if test="${search1 eq 'permanentAddress_户籍地址'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
												</c:if>
											</c:if>
											<c:if test="${empty search1 }">
												<option value="">请选择查询条件</option>
												<option value="schoolName_校区">校区</option>
												<option value="studentName_学生姓名">学生姓名</option>
												<option value="permanentAddress_户籍地址">户籍地址</option>
											</c:if>



										</select> <input type="text" placeholder="请输入查询条件" id="search1val"
											value="${search1val }" name="search1val"
											class="form-control m-b"> <select
											class="form-control m-b" name="search2" style="width: 140px;">
											<c:if test="${not empty search2 }">
												<option value="${search2 }">${search2text }</option>
												<c:if test="${search2 eq 'schoolName_校区'}">
													<option value="">请选择查询条件</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
												</c:if>
												<c:if test="${search2 eq 'studentName_学生姓名'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>

												</c:if>
												<c:if test="${search2 eq 'permanentAddress_户籍地址'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
												</c:if>
											</c:if>
											<c:if test="${empty search2 }">
												<option value="">请选择查询条件</option>
												<option value="schoolName_校区">校区</option>
												<option value="studentName_学生姓名">学生姓名</option>
												<option value="permanentAddress_户籍地址">户籍地址</option>
											</c:if>
										</select> <input type="text" placeholder="请输入查询条件" id="search2val"
											name="search2val" value="${search2val }"
											class="form-control m-b">
									</div>
								</c:if>
								<!-- 高级查询 -->
								<c:if test="${roleType ==1}">
									<div class="form-group">
										<select class="form-control m-b" name="search1"
											style="width: 140px;">
											<c:if test="${not empty search1 }">
												<option value="${search1 }">${search1text }</option>
												<c:if test="${search1 eq 'schoolName_校区'}">
													<option value="">请选择查询条件</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search1 eq 'studentName_学生姓名'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search1 eq 'permanentAddress_户籍地址'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search1 eq 'fatherName_父亲姓名'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search1 eq 'matherName_母亲姓名'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search1 eq 'fatherWorkUnit_父亲工作单位'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search1 eq 'matherWorkUnit_母亲工作单位'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
												</c:if>
											</c:if>
											<c:if test="${empty search1 }">
												<option value="">请选择查询条件</option>
												<option value="schoolName_校区">校区</option>
												<option value="studentName_学生姓名">学生姓名</option>
												<option value="permanentAddress_户籍地址">户籍地址</option>
												<option value="fatherName_父亲姓名">父亲姓名</option>
												<option value="matherName_母亲姓名">母亲姓名</option>
												<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
												<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>

											</c:if>

										</select> <input type="text" placeholder="请输入查询条件" id="serach1val"
											value="${search1val }" name="search1val"
											class="form-control m-b"> <select
											class="form-control m-b" name="search2" style="width: 140px;">
											<c:if test="${not empty search2 }">
												<option value="${search2 }">${search2text }</option>
												<c:if test="${search2 eq 'schoolName_校区'}">
													<option value="">请选择查询条件</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search2 eq 'studentName_学生姓名'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search2 eq 'permanentAddress_户籍地址'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search2 eq 'fatherName_父亲姓名'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search2 eq 'matherName_母亲姓名'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search2 eq 'fatherWorkUnit_父亲工作单位'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>
												</c:if>
												<c:if test="${search2 eq 'matherWorkUnit_母亲工作单位'}">
													<option value="">请选择查询条件</option>
													<option value="schoolName_校区">校区</option>
													<option value="studentName_学生姓名">学生姓名</option>
													<option value="permanentAddress_户籍地址">户籍地址</option>
													<option value="fatherName_父亲姓名">父亲姓名</option>
													<option value="matherName_母亲姓名">母亲姓名</option>
													<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
												</c:if>
											</c:if>
											<c:if test="${empty search2 }">
												<option value="">请选择查询条件</option>
												<option value="schoolName_校区">校区</option>
												<option value="studentName_学生姓名">学生姓名</option>
												<option value="permanentAddress_户籍地址">户籍地址</option>
												<option value="fatherName_父亲姓名">父亲姓名</option>
												<option value="matherName_母亲姓名">母亲姓名</option>
												<option value="fatherWorkUnit_父亲工作单位">父亲工作单位</option>
												<option value="matherWorkUnit_母亲工作单位">母亲工作单位</option>

											</c:if>
										</select> <input type="text" placeholder="请输入查询条件" id="serach2val"
											name="search2val" value="${search2val }"
											class="form-control m-b">
									</div>
								</c:if>



								<button class="btn btn-white" type="submit"
									style="margin-top: -10px;">查询</button>

							</form>
						</div>
						<!-- <div style="overflow: auto; width: 100%;"> -->
						<table class="table table-striped table-bordered table-hover "
							id="editable">
							<thead>
								<tr style="white-space: nowrap;">
									<c:if test="${roleType ==0 }">
										<th style="width: 20px;">
											<div class="checkbox  checkbox-inline">
												<input type="checkbox" id="checkall" name="checkall" /> <label
													for="checkall"></label>
											</div>
										</th>
									</c:if>
									<th>校区</th>
									<th style="display: none;">入学年份</th>
									<th>姓名</th>
									<c:if test="${roleType ==0 }">
										<th>班级</th>
										<th>性别</th>
									</c:if>
									<th style="display: none;">出生日期</th>

									<c:if test="${roleType ==2 }">
										<th>户籍地址</th>
										<th>户口所属街道</th>
										<th>户口类别</th>
										<th>户口性质</th>
									</c:if>
									<c:if test="${roleType ==0 }">
										<th style="display: none;">户籍地址</th>
										<th style="display: none;">户口所属街道</th>
										<th style="display: none;">户口类别</th>
										<th style="display: none;">户口性质</th>
									</c:if>
									<c:if test="${roleType ==0 || roleType==2}">
										<th>居住地址</th>
									</c:if>
									<c:if test="${roleType==0}">
										<th style="display: none;">邮政编码</th>
										<th style="display: none;">联系电话</th>
									</c:if>
									<c:if test="${roleType==2}">
										<th>邮政编码</th>
										<th>联系电话</th>
									</c:if>

									<c:if test="${roleType ==0 }">
										<th style="display: none;">父亲姓名</th>
										<th style="display: none;">学历</th>
										<th style="display: none;">工作单位</th>
										<th style="display: none;">职务</th>
										<th style="display: none;">联系电话</th>
										<th style="display: none;">母亲姓名</th>
										<th style="display: none;">学历</th>
										<th style="display: none;">工作单位</th>
										<th style="display: none;">职务</th>

									</c:if>

									<c:if test="${roleType ==1 }">
										<th>父亲姓名</th>
										<th>学历</th>
										<th>工作单位</th>
										<th>职务</th>
										<th>母亲姓名</th>
										<th>学历</th>
										<th>工作单位</th>
										<th>职务</th>
									</c:if>
									<c:if test="${roleType ==0 }">
										<th>联系电话</th>
										<th style="display: none;">在校类型</th>
										<th style="display: none;">身份证号码</th>
										<th style="display: none;">其他证件</th>

										<th style="width: 20%;">操作</th>
									</c:if>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageList.datas}" var="items"
									varStatus="status">

									<c:if test="${roleType == 1 }">
										<tr class="gradeC" style="white-space: nowrap;"
											ondblclick="return editone('${items.id}','${items.id}');">
									</c:if>
									<c:if test="${roleType ne 1 }">
										<tr class="gradeC" style="white-space: nowrap;">
									</c:if>

									<c:if test="${roleType ==0 }">
										<td>
											<div class="checkbox checkbox-inline">
												<input type="checkbox" name="ids" id="${items.id}"
													value="${items.id}"> <label for="${items.id}"></label>
											</div>
										</td>
									</c:if>
									<td title="${items.schoolName}" id="${items.id}schoolName">
										<div
											style="width: 74px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.schoolName}
										</div>
									</td>
									<td style="display: none;" id="${items.id}enrollmentYear">${items.enrollmentYear }</td>
									<td title=${items.studentName } id="${items.id}studentName">
										<div
											style="width: 74px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.studentName }
										</div>
									</td>

									<c:if test="${roleType ==0 }">
										<td title=${items.classes } id="${items.id}classes">
											<div
												style="width: 70px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.classes }</div>
										</td>
										<td title=${items.studentsex } id="${items.id}studentsex">${items.studentsex}</td>
										<td style="display: none;" id="${items.id}studentBirthday">${items.studentBirthday }</td>
									</c:if>
									<c:if test="${roleType ==2 }">
										<td title=${items.permanentAddress }
											id="${items.id}permanentAddress"><div
												style="width: 140px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.permanentAddress}</div></td>
										<td title=${items.accountoftheStreet }
											id="${items.id}accountoftheStreet"><div
												style="width: 140px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.accountoftheStreet }</div></td>
										<td title=${items.accountCategory }
											id="${items.id}accountCategory">
											<div
												style="width: 74px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
												${items.accountCategory}</div>

										</td>
										<td title=${items.accountProperties }
											id="${items.id}accountProperties">
											<div
												style="width: 74px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.accountProperties}</div>
										</td>
									</c:if>
									<c:if test="${roleType ==0 }">
										<td style="display: none;" id="${items.id}permanentAddress">${items.permanentAddress}</td>
										<td style="display: none;" id="${items.id}accountoftheStreet">${items.accountoftheStreet }</td>
										<td style="display: none;" id="${items.id}accountCategory">${items.accountCategory}</td>
										<td style="display: none;" id="${items.id}accountProperties">${items.accountProperties}</td>
									</c:if>
									<c:if test="${roleType ==0 || roleType==2}">
										<td title=${items.residenceAddress }
											id="${items.id}residenceAddress"><div
												style="width: 140px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.residenceAddress}</div></td>
									</c:if>
									<c:if test="${roleType ==2 }">
										<td title=${items.postcode } id="${items.id}postcode">
											<div
												style="width: 74px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.postcode}</div>
										</td>
										<td title=${items.contactPhone } id="${items.id}contactPhone">
											<div
												style="width: 74px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.contactPhone }</div>
										</td>
									</c:if>
									<c:if test="${roleType ==0 }">
										<td style="display: none;" id="${items.id}postcode">${items.postcode}</td>
										<td style="display: none;" id="${items.id}contactPhone">${items.contactPhone }</td>
									</c:if>
									<c:if test="${roleType ==1 }">
										<td style="display: none;" id="${items.id}residenceAddress">${items.residenceAddress}</td>
										<td style="display: none;" id="${items.id}studentBirthday">${items.studentBirthday }</td>
										<td style="display: none;" id="${items.id}studentsex">${items.studentsex}</td>
										<td style="display: none;" id="${items.id}permanentAddress">${items.permanentAddress}</td>
										<td style="display: none;" id="${items.id}accountoftheStreet">${items.accountoftheStreet }</td>
										<td style="display: none;" id="${items.id}accountCategory">${items.accountCategory}</td>
										<td style="display: none;" id="${items.id}accountProperties">${items.accountProperties}</td>
										<td style="display: none;" id="${items.id}studentIdCard">${items.studentIdCard }</td>
										<td style="display: none;" id="${items.id}otherCertificates">${items.otherCertificates }</td>
										<td style="display: none;" id="${items.id}matherContactPhone">${items.matherContactPhone }</td>
										<td style="display: none;" id="${items.id}classes">${items.classes }</td>
										<td style="display: none;" id="${items.id}jiedou">${items.jiedou }</td>
										<td style="display: none;" id="${items.id}postcode">${items.postcode}</td>
										<td style="display: none;" id="${items.id}contactPhone">${items.contactPhone }</td>
										<td style="display: none;" id="${items.id}fatherContactPhone">${items.fatherContactPhone }</td>
										<td title=${items.fatherName } id="${items.id}fatherName">
											<div
												style="width: 70px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.fatherName
												}</div>
										</td>
										<td title=${items.fatherEducation }
											id="${items.id}fatherEducation">
											<div
												style="width: 70px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.fatherEducation }</div>
										</td>
										<td title=${items.fatherWorkUnit }
											id="${items.id}fatherWorkUnit"><div
												style="width: 140px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.fatherWorkUnit }</div></td>
										<td title=${items.fatherPost } id="${items.id}fatherPost">
											<div
												style="width: 70px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.fatherPost }</div>
										</td>

										<td title=${items.matherName } id="${items.id}matherName">
											<div
												style="width: 70px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.matherName }</div>
										</td>

										<td title=${items.matherEducation }
											id="${items.id}matherEducation">
											<div
												style="width: 70px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.matherEducation }</div>
										</td>

										<td title=${items.matherWorkUnit }
											id="${items.id}matherWorkUnit"><div
												style="width: 140px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.matherWorkUnit }</div></td>
										<td title=${items.matherPost } id="${items.id}matherPost">
											<div
												style="width: 70px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.matherPost}</div>
										</td>

									</c:if>
									<c:if test="${roleType ==0 }">
										<td style="display: none;" id="${items.id}fatherName">${items.fatherName }</td>
										<td style="display: none;" id="${items.id}fatherEducation">${items.fatherEducation }</td>
										<td style="display: none;" id="${items.id}fatherWorkUnit">${items.fatherWorkUnit }</td>
										<td style="display: none;" id="${items.id}fatherPost">${items.fatherPost }</td>
										<td style="display: none;" id="${items.id}matherContactPhone">${items.matherContactPhone }</td>
										<td style="display: none;" id="${items.id}fatherContactPhone">${items.fatherContactPhone }</td>
										<td style="display: none;" id="${items.id}matherName">${items.matherName }</td>
										<td style="display: none;" id="${items.id}matherEducation">${items.matherEducation }</td>
										<td style="display: none;" id="${items.id}matherWorkUnit">${items.matherWorkUnit }</td>
										<td style="display: none;" id="${items.id}matherPost">${items.matherPost}</td>
									</c:if>
									<c:if test="${roleType ==0 }">
										<td title=${items.contactPhone } id="${items.id}contactPhone">
											<div
												style="width: 70px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.contactPhone }</div>
										</td>

										<td style="display: none;" id="${items.id}jiedou">${items.jiedou }</td>
										<td style="display: none;" id="${items.id}studentIdCard">${items.studentIdCard }</td>
										<td style="display: none;" id="${items.id}otherCertificates">${items.otherCertificates }</td>


										<td>
											<button class="btn btn-info btn-xs" type="button"
												onclick="return editone('${items.id}','');">
												<i class="fa fa-paste"></i> 编辑
											</button>
											<button class="btn btn-warning btn-xs" type="button"
												onclick="return delone('${items.id}');">
												<i class="fa fa fa-trash"></i>删除
											</button>
										</td>
									</c:if>
									</tr>

								</c:forEach>
							</tbody>

						</table>
						<!-- </div> -->
						<div class="row">
							<div class="col-sm-5 hidden-xs">
								<small class="text-muted inline m-t-sm m-b-sm">
									每页显示${pageList.pageSize}行 － 当前页${pageList.pageNo}页 －
									共${pageList.totalPage}页 </small>

							</div>
							<div class="col-sm-7 text-right text-center-xs">
							
							<ul class="pagination pagination-split pull-right"
										style="margin-top: 0px;">
										<li
											<c:if test="${pageList.pageNo  eq 1}">class="disabled"</c:if>><a
											<c:if test="${pageList.pageNo  eq 1 }">href="javascript:void(0)"</c:if>
											href="${pageContext.request.contextPath}/student/list?roleType=${roleType}&selectid=${selectid}&selectparentid=${selectparentid}&search1=${search1}&search1val=${search1val}&search2=${search2}&search2val=${search2val}">上一页</a></li>

										<c:forEach items="${pageList.navigatepageNums}" var="nav">
											<c:choose>
												<c:when test="${nav == pageList.pageNo}">
													<!-- 1当前页面 -->
													<li class="active"><a
														href="${pageContext.request.contextPath}/student/list?roleType=${roleType}&search1=${search1}&selectid=${selectid}&selectparentid=${selectparentid}&search1val=${search1val}&search2=${search2}&search2val=${search2val}">${nav}</a>
													</li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath}/student/list?pageNo=${nav}&roleType=${roleType}&search1=${search1}&selectid=${selectid}&selectparentid=${selectparentid}&search1val=${search1val}&search2=${search2}&search2val=${search2val}">${nav}</a></li>
												</c:otherwise>
											</c:choose>

										</c:forEach>
										<li><a
											href="${pageContext.request.contextPath}/student/list?pageNo=${pageList.nextPage}&roleType=${roleType}&search1=${search1}&selectid=${selectid}&selectparentid=${selectparentid}&search1val=${search1val}&search2=${search2}&search2val=${search2val}">下一页</a></li>
									</ul>
							
							
							</div>
						</div>
					</div>
				
				
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
		
		<div id="modal-form" class="modal fade" aria-hidden="true">
		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<h3 class="m-t-none m-b" id="type">添加学生信息</h3>
						<div class="col-sm-12">
							<div class="ibox float-e-margins">
								<div class="ibox-content">
									<form role="form" class="form-horizontal m-t" id="signupForm"
										action="${pageContext.request.contextPath}/student/addorupdate"
										method="post">
										<div class="col-sm-6 b-r">
											<div class="form-group">
												<label>姓名</label> <input type="text" style="width: 80%"
													placeholder="请输入学生姓名" class="form-control" id="studentName"
													name="studentName">
											</div>
											<div class="form-group">
												<label>性别</label> <br />
												<div class="radio radio-info radio-inline">
													<input type="radio" id="studentsex1" value="男"
														name="studentsex"> <label for="studentsex1">男</label>
												</div>
												<div class="radio radio-inline">
													<input type="radio" id="studentsex2" value="女"
														name="studentsex"> <label for="studentsex2">
														女 </label>
												</div>
											</div>
											<div class="form-group">
												<label>户口所属街道</label> <input type="text" style="width: 80%"
													placeholder="请输入户口所属街道" class="form-control"
													id="accountoftheStreet" name="accountoftheStreet">
											</div>
											<div class="form-group">
												<label>户口性质</label> <input type="text" style="width: 80%"
													placeholder="请输入户口性质" class="form-control"
													id="accountProperties" name="accountProperties">
											</div>
											<div class="form-group">
												<label>邮政编码</label> <input type="text" style="width: 80%"
													placeholder="请输入邮政编码" class="form-control" id="postcode"
													name="postcode">
											</div>
											<div class="form-group">
												<label>校区</label> <input type="text" style="width: 80%"
													placeholder="请输入学校所在校区" class="form-control"
													id="schoolName" name="schoolName">
											</div>

											<div class="form-group">
												<label>班级</label> <input type="text" style="width: 80%"
													placeholder="请输入学生所在班级" class="form-control" id="classes"
													name="classes">
											</div>


											<div class="form-group">
												<label>学生父亲学历</label> <input type="text" style="width: 80%"
													placeholder="请输入学生父亲学历" class="form-control"
													id="fatherEducation" name="fatherEducation">
											</div>


											<div class="form-group">
												<label>学生父亲公司职务</label> <input type="text"
													style="width: 80%" placeholder="请输入学生父亲公司职务"
													class="form-control" id="fatherPost" name="fatherPost">
											</div>
											<div class="form-group">
												<label>学生母亲姓名</label> <input type="text" style="width: 80%"
													placeholder="请输入学生母亲姓名" class="form-control"
													id="matherName" name="matherName">
											</div>


											<div class="form-group">
												<label>学生母亲工作单位</label> <input type="text"
													style="width: 80%" placeholder="请输入学生母亲工作单位"
													class="form-control" id="matherWorkUnit"
													name="matherWorkUnit">
											</div>

											<div class="form-group">
												<label>学生母亲联系电话</label> <input type="text"
													style="width: 80%" placeholder="请输入学生母亲联系电话"
													class="form-control" id="matherContactPhone"
													name="matherContactPhone">
											</div>


											<div class="form-group">
												<label>学生身份证号码</label> <input type="text" style="width: 80%"
													id="studentIdCard" name="studentIdCard"
													placeholder="请输入学生身份证号码" class="form-control">
											</div>

										</div>
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<div class="form-group" id="data_1">
												<label>出生日期</label> <span
													style="position: relative; z-index: 9999;">
													<div class="input-group date">
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span> <input type="text"
															readonly="readonly" class="form-control"
															placeholder="请选择日期" style="width: 90%"
															id="studentBirthday" name="studentBirthday">
													</div>
												</span>
											</div>
											<div class="form-group">
												<label>在校类型</label> <br />
												<div class="radio radio-info radio-inline">
													<input type="radio" id="jiedou1" value="借读" name="jiedou">
													<label for="jiedou1">借读</label>
												</div>
												<div class="radio radio-inline">
													<input type="radio" id="jiedou2" value="非借读" name="jiedou">
													<label for="jiedou2"> 非借读 </label>
												</div>
											</div>
											<div class="form-group">
												<label>户籍地址</label> <input type="text" style="width: 90%"
													placeholder="请输入户籍地址" class="form-control"
													id="permanentAddress" name="permanentAddress">
											</div>

											<div class="form-group">
												<label>户口类别</label> <input type="text" style="width: 90%"
													placeholder="请输入户口类别" class="form-control"
													id="accountCategory" name="accountCategory">
											</div>

											<div class="form-group">
												<label>居住地址</label> <input type="text" style="width: 90%"
													placeholder="请输入居住地址" class="form-control"
													id="residenceAddress" name="residenceAddress">
											</div>

											<div class="form-group">
												<label>联系电话</label> <input type="text" style="width: 90%"
													placeholder="请输入联系电话" class="form-control"
													id="contactPhone" name="contactPhone">
											</div>

											<div class="form-group">
												<label>入学年份</label> <input type="text" style="width: 90%"
													placeholder="请输入入学年份" class="form-control"
													id="enrollmentYear" name="enrollmentYear">
											</div>


											<div class="form-group">
												<label>学生父亲姓名</label> <input type="text" style="width: 90%"
													placeholder="请输入学生父亲姓名" class="form-control"
													id="fatherName" name="fatherName">
											</div>

											<div class="form-group">
												<label>学生父亲工作单位</label> <input type="text"
													style="width: 90%" placeholder="请输入学生父亲工作单位"
													class="form-control" id="fatherWorkUnit"
													name="fatherWorkUnit">
											</div>

											<div class="form-group">
												<label>学生父亲联系电话</label> <input type="text"
													style="width: 90%" placeholder="请输入学生父亲联系电话"
													class="form-control" id="fatherContactPhone"
													name="fatherContactPhone">
											</div>



											<div class="form-group">
												<label>学生母亲学历</label> <input type="text" style="width: 90%"
													placeholder="请输入学生母亲姓名" class="form-control"
													id="matherEducation" name="matherEducation">
											</div>

											<div class="form-group">
												<label>学生母亲公司职务</label> <input type="text"
													style="width: 90%" placeholder="请输入学生母亲公司职务"
													class="form-control" id="matherPost" name="matherPost">
											</div>


											<div class="form-group">
												<label>学生其他证件</label> <input type="text" style="width: 90%"
													placeholder="请输入学生其他证件" class="form-control"
													id="otherCertificates" name="otherCertificates">
											</div>
										</div>
										<div>
											<input type="hidden" id="id" name="id">
											<c:if test="${roleType ==0 }">
												<button class="btn btn-sm btn-primary pull-right m-t-n-xs"
													type="submit" id="submit">
													<strong>提交</strong>
												</button>
											</c:if>
										</div>
									</form>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- form2 -->
	<div id="modal-form2" class="modal fade" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<h3 class="m-t-none m-b">导入学生数据</h3>
						<div class="col-sm-12">
							<form role="form" class="form-horizontal m-t" id="signupForm"
								action="${pageContext.request.contextPath}/student/upload"
								enctype="multipart/form-data" method="post">
								<div class="ibox float-e-margins">
									<div class="ibox-content">
										<div id="file-pretty">
											<div class="form-group">
												<div class="col-sm-10">
													<input type="file" style="display: none;" name="upload"
														id="upload" onchange="checkfiletype(this);"
														class="form-control" data-icon="false">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">模版下载</label>
												<div class="col-sm-10" style="margin-top: 8px;">
													<a
														href="${pageContext.request.contextPath}/student/download"><font
														color="blue">学生信息导入模版.xls</font></a>
												</div>
											</div>
											<div style="position: relative">
												<div style="position: absolute; left: 0; top: 0">
													<div id="proBartext"></div>
												</div>

												<div class="progress progress-striped active">
													<div id="proBar" class="progress-bar progress-bar-danger">
													</div>
												</div>
											</div>

											<!-- <div class="form-group">
												<label class="font-noraml">文件选择（单选）</label> <input
													type="file" class="form-control">
											</div>
											<div class="form-group">
												<label class="font-noraml">文件选择（多选）</label> <input
													type="file" multiple="multiple" class="form-control">
											</div> -->
										</div>

									</div>
								</div>
								<div>
									<button class="btn btn-sm btn-primary pull-right m-t-n-xs"
										type="submit" id="submit111">
										<strong>导入</strong>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
				<div class="rightpanel">
		</div>
	</section>








	<script>
		$.validator
				.setDefaults({
					highlight : function(a) {
						$(a).closest(".form-group").removeClass("has-success")
								.addClass("has-error")
					},
					success : function(a) {
						a.closest(".form-group").removeClass("has-error")
								.addClass("has-success")
					},
					errorElement : "span",
					errorPlacement : function(a, b) {
						if (b.is(":radio") || b.is(":checkbox")) {
							a.appendTo(b.parent().parent().parent())
						} else {
							a.appendTo(b.parent())
						}
					},
				/* errorClass:"help-block m-b-none",validClass:"help-block m-b-none" */});
		$().ready(function() {
			$("#commentForm").validate();
			var a = "<i class='fa fa-times-circle'></i> ";
			$("#signupForm").validate({
				rules : {
					classes : "required",
					studentName : "required",
					schoolName : "required",
					contactPhone : "required",
					studentIdCard : "required",

				},
				messages : {
					classes : a + "请输入学生所在班级",
					studentName : a + "请输入学生姓名",
					schoolName : a + "请输入学生所在校区",
					contactPhone : a + "请输入学生家长联系方式",
					studentIdCard : a + "请输入学生身份证号码"
				}
			});
		});
	</script>



	<script>
		$(document)
				.ready(
						function() {
							$('#submit111')
									.bind(
											'click',
											function() {
												var eventFun = function() {
													$
															.ajax({
																type : 'GET',
																url : '${pageContext.request.contextPath}/student/uploadprocess',
																data : {},
																dataType : 'json',
																success : function(
																		data) {
																	$("#proBar")
																			.attr(
																					"style",
																					"width:"
																							+ (data.nownum / data.allnum)
																							* 100
																							+ ''
																							+ '%');
																	$('#proBar')
																			.css(
																					'aria-valuenow',
																					data.nownum
																							+ ''
																							+ '%');
																	$('#proBar')
																			.css(
																					'aria-valuemax',
																					data.allnum
																							+ ''
																							+ '%');
																	$(
																			'#proBartext')
																			.text(
																					"正在导入第"
																							+ data.nownum
																							+ "条记录，总共"
																							+ data.allnum
																							+ "条记录");
																	if (data.nownum == data.allnum) {
																		window
																				.clearInterval(intId);
																	}
																}
															});
												};
												var intId = window.setInterval(
														eventFun, 100);
											});

							$('#file-pretty input[type="file"]').prettyFile();
							$("#data_1 .input-group.date").datepicker({
								keyboardNavigation : false,
								forceParse : false,
								autoclose : true
							});
							$(".demo4").click(
									function() {
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
											alert(a);
											if (a) {
												swal("删除成功！", "您已经永久删除了这条信息。",
														"success")
											} else {
												swal("已取消", "您取消了删除操作！",
														"error")
											}
										})
									})
						});
	</script>


	<script type="text/javascript">
		$(function() {

			$("#checkall").click(function() {
				var flag = $("[name=checkall]:checkbox").is(':checked');
				$("[name=ids]:checkbox").each(function() {
					$(this).prop("checked", flag);
				})
			})
		})
	</script>
<!-- 全局js -->
	<!-- Sweet alert -->
	<script
		src="${pageContext.request.contextPath}/assets/studentMessage/js/plugins/sweetalert/sweetalert.min.js"></script>

	<!-- Prettyfile -->
	<script
		src="${pageContext.request.contextPath}/assets/studentMessage/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>

	<!-- Data picker -->
	<script
		src="${pageContext.request.contextPath}/assets/studentMessage/js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<script
		src="${pageContext.request.contextPath}/assets/studentMessage/js/plugins/jeditable/jquery.jeditable.js"></script>

	<!-- Data Tables -->
	<script
		src="${pageContext.request.contextPath}/assets/studentMessage/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/studentMessage/js/plugins/dataTables/dataTables.bootstrap.js"></script>

	<!-- 自定义js -->
	<script
		src="${pageContext.request.contextPath}/assets/studentMessage/js/content.min.js?v=1.0.0"></script>

	<!-- jQuery Validation plugin javascript-->
	<script
		src="${pageContext.request.contextPath}/assets/studentMessage/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/studentMessage/js/plugins/validate/messages_zh.min.js"></script>
	
</body>
</html>
