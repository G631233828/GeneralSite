<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>



<div class="logopanel">
	<h1>
		<span>[</span> bracket <span>]</span>
	</h1>
</div>
<!-- logopanel -->

<div class="leftpanelinner">

	<!-- This is only visible to small devices -->
	<div class="visible-xs hidden-sm hidden-md hidden-lg">
		<div class="media userlogged">
			<img alt="" src="images/photos/loggeduser.png" class="media-object">
			<div class="media-body">
				<h4>John Doe</h4>
				<span>"Life is so..."</span>
			</div>
		</div>

		<h5 class="sidebartitle actitle">Account</h5>
		<ul class="nav nav-pills nav-stacked nav-bracket mb30">
			<li><a href="profile.html"><i class="fa fa-user"></i> <span>Profile</span></a></li>
			<li><a href=""><i class="fa fa-cog"></i> <span>Account
						Settings</span></a></li>
			<li><a href=""><i class="fa fa-question-circle"></i> <span>Help</span></a></li>
			<li><a href="signout.html"><i class="fa fa-sign-out"></i> <span>Sign
						Out</span></a></li>
		</ul>
	</div>

	<h5 class="sidebartitle">菜单管理</h5>
	<ul class="nav nav-pills nav-stacked nav-bracket">
		<!--      <li><a href="email.html"><span class="pull-right badge badge-success">2</span><i class="fa fa-envelope-o"></i> <span>Email</span></a></li> -->


		<c:forEach items="${resourceslist }" var="rs" varStatus="Status">
			<c:if test="${rs.type eq '0'}">
				<li
					class="nav-parent <c:if test="${rs.id eq selectparentid }">nav-active</c:if>"><a
					href="javascript:void(0);"><i class="${rs.icon }"></i> <span>${rs.name }</span></a>
					<ul class="children"
						<c:if test="${rs.id eq selectparentid }">style="display:block;"</c:if>>
						<c:forEach items="${resourceslist }" var="rs2" varStatus="Status">
							<c:if test="${rs2.parentId eq rs.id  && rs2.type eq '1'}">
								<li><a
									href="javascript:void(0);" onclick="window.open('${pageContext.request.contextPath}/${rs2.resUrl }?selectid=${rs2.id}&selectparentid=${rs2.parentId}','_self')" ><i
										class="fa fa-caret-right"></i>${rs2.name }</a></li>
							</c:if>
						</c:forEach>


						<%-- 
			<li ><a href="${pageContext.request.contextPath}/user/list"><font style="margin-left: 50px;">用户管理</font></a> </li>
			<li ><a href="${pageContext.request.contextPath}/role/list"><font style="margin-left: 50px;">角色管理</font></a> </li>
			<li ><a href="${pageContext.request.contextPath}/resource/list"><font style="margin-left: 50px;">资源管理</font></a> </li> --%>
					</ul></li>
			</c:if>
		</c:forEach>
	</ul>


	<div class="infosummary">
		<!-- <h5 class="sidebartitle">Information Summary</h5>
		<ul>
			<li>
				<div class="datainfo">
					<span class="text-muted">Daily Traffic</span>
					<h4>630, 201</h4>
				</div>
				<div id="sidebar-chart" class="chart"></div>
			</li>
			<li>
				<div class="datainfo">
					<span class="text-muted">Average Users</span>
					<h4>1, 332, 801</h4>
				</div>
				<div id="sidebar-chart2" class="chart"></div>
			</li>
			<li>
				<div class="datainfo">
					<span class="text-muted">Disk Usage</span>
					<h4>82.2%</h4>
				</div>
				<div id="sidebar-chart3" class="chart"></div>
			</li>
			<li>
				<div class="datainfo">
					<span class="text-muted">CPU Usage</span>
					<h4>140.05 - 32</h4>
				</div>
				<div id="sidebar-chart4" class="chart"></div>
			</li>
			<li>
				<div class="datainfo">
					<span class="text-muted">Memory Usage</span>
					<h4>32.2%</h4>
				</div>
				<div id="sidebar-chart5" class="chart"></div>
			</li>
		</ul> -->
	</div>
	<!-- infosummary -->

</div>
<!-- leftpanelinner -->


