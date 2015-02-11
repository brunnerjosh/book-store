<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<!-- HEADER -->
	<%@ include file = "/partials/header.jsp" %>

<body>
	<!-- NAVIGATION BAR -->
	<%@ include file = "/partials/navigation.jsp" %>

	<!-- MAIN BODY CONTENT -->
	<div class="container clearfix">
		<h1>Dashboard: 
			<muted>Add Users</muted>
		</h1>
		<div class="pane-left">
			<!-- <div class="item-list-group">
				<div class="side-left">
					<div class="side-left">
						<a onclick="openAddUsers()" id="add-users" class="list-item">Add Users</a>
					</div>
				</div>
			</div> -->
			
			<div id="add-user-details" class="add-entity as-user-entry">
				<h3>Enter user details:</h3>
				<%@ include file="user.jsp" %>
			</div>

		</div>
		<div class="pane-right">
			<%@ include file="listUser.jsp" %>
		</div>
	</div>


	<!-- FOOTER BAR -->
	<%@ include file = "/partials/footer.jsp" %>
</body>
</html>