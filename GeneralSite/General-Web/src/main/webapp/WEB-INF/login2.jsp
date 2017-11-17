<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta charset="utf-8">
<title>基础管理系统</title>
  <!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico" />
<!-- The styles -->
<link id="bs-css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap-cerulean.min.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/assets/css/charisma-app.css"
	rel="stylesheet">

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugs/jquery-validation-1.14.0/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugs/jquery-validation-1.14.0/messages_zh.js"></script>
<script>
$.validator.setDefaults({
    /* submitHandler: function() {
    } */
});

$().ready(function() {
	// 提交时验证表单
	var validator = $("#aaa").validate({
		errorPlacement: function(error, element) {
			// Append error within linked label
			$( element )
				.closest( "form" )
					.find( "label[for='" + element.attr( "id" ) + "']" )
						.append( error );
		},
		errorElement: "span",
		messages: {
			accountName: {
				required: "账号不能为空",
				minlength: " (不能少于 3 个字母)"
			},
			passWord: {
				required: "密码不能为空",
				minlength: " (字母不能少于 5 个且不能大于 12 个)",
				maxlength: " (字母不能少于 5 个且不能大于 12 个)"
			}
		}
	});

	$(".cancel").click(function() {
		validator.resetForm();
	});
});


//ajax登录

		function toLogin(){
			var accountName = $('#accountName').val();
			var passWord = $('#passWord').val();
			if (accountName != "" && passWord != "") {
				$.ajax({
					type : "POST",
					url : "ajaxLogin",
					data : "accountName=" + accountName + "&passWord=" + passWord,
					dataType : "text",
					success : function(data) {
						if(data !=""){//登录失败
							$("#msg").show().html(data);
						}else{
							//登录成功
							window.location.href="/index";
						}
					},
					error : function(data) {
						console.info("error: " + data.responseText);
					}
				});
			}
	}
			




</script>
<style>
input.error { border: 10px solid red; }
label.error {
  padding-left: 16px;

  padding-bottom: 2px;

  font-weight: bold;

  color: #EA5200;
}
</style>
</head>
<body>
	<div class="ch-container">
		<div class="row">

			<div class="row">
				<div class="col-md-12 center login-header">
					<h2>欢迎访问！</h2>
				</div>
				<!--/span-->
			</div>
			<!--/row-->

			<div class="row">
				<div class="well col-md-5 center login-box">
				
						<div class="alert alert-info" id="msg" style="display: none;" >
						</div>
					
					 <form class="form-horizontal"    id="aaa"> 
						<fieldset>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock red"></i></span> <input
									type="text" class="form-control"  value="" placeholder="AccountName" name="accountName" id="accountName" required>
							</div>
							 <label for="accountName"></label>
							<div class="clearfix"></div>
							<br>

							<div class="input-group input-group-lg">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock red"></i></span> <input
									type="password" class="form-control"  value="" placeholder="Password" name="passWord" id="passWord" required>
							</div>
							 <label for="passWord"></label>
							<div class="clearfix"></div>

							<div class="input-prepend">
								<label class="remember" for="remember"><input
									type="checkbox" id="remember" name="remember"> Remember me</label>
							</div>
							<div class="clearfix"></div>

							<p class="center col-md-5">
								<button type="button" onclick="toLogin()"  class="btn btn-primary">登录</button>
							</p>
						</fieldset>
					</form>
				</div>
				<!--/span-->
			</div>
			<!--/row-->
		</div>
		<!--/fluid-row-->

	</div>
	<!--/.fluid-container-->



	
</body>
</html>