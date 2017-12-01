<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- Copyright info -->
				<p class="copy">
					Copyright &copy; 2012 | <a href="#">Your Site</a>
				</p>
			</div>
		</div>
	</div>

</footer>
<!-- JS -->
<script src="${ctx }/assets/bracketbootstrap/js/jquery-1.11.1.min.js"></script>
<script src="${ctx }/assets/bracketbootstrap/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${ctx }/assets/bracketbootstrap/js/jquery-ui-1.10.3.min.js"></script>
<script src="${ctx }/assets/bracketbootstrap/js/bootstrap.min.js"></script>
<script src="${ctx }/assets/bracketbootstrap/js/modernizr.min.js"></script>
<script src="${ctx }/assets/bracketbootstrap/js/jquery.sparkline.min.js"></script>
<script src="${ctx }/assets/bracketbootstrap/js/toggles.min.js"></script>
<script src="${ctx }/assets/bracketbootstrap/js/retina.min.js"></script>
<script src="${ctx }/assets/bracketbootstrap/js/jquery.cookies.js"></script>

<script src="${ctx }/assets/bracketbootstrap/js/custom.js"></script>


<!-- Sweet alert -->
<script src="${ctx }/assets/template/js/plugins/sweetalert/sweetalert.min.js"></script>


<script type="text/javascript">
	$(function() {
		
		$("#checkall").click(function() {
			var flag = $("[name=checkall]:checkbox").is(':checked');
			$("[name=ids]:checkbox").each(function() {
				$(this).prop("checked", flag);
			})
		})
		
	$("#checkallPermission").click(function() {
		var flag = $("[name=checkallPermission]:checkbox").is(':checked');
		$("[name=permisids]:checkbox").each(function() {
			$(this).prop("checked", flag);
		})
	})

		
		
		
		
		
		
		
		
		
	    // Show aciton upon row hover
	    jQuery('.table-hidaction tbody tr').hover(function(){
	      jQuery(this).find('.table-action-hide a').animate({opacity: 1});
	    },function(){
	      jQuery(this).find('.table-action-hide a').animate({opacity: 0});
	    });
		
	})
</script>

