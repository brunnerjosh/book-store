<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<!-- MAIN BODY CONTENT -->
<div class="container clearfix">
	<h1>Dashboard: 
		<muted>Add Users</muted>
	</h1>
	<div class="pane-left">
		
		<%-- 
		<div id="add-user-details" class="add-entity as-user-entry">
			<p class="as-header">Enter user details:</p>
			<%@ include file="user.jsp" %>
		</div> 
		--%>

	</div>
	<div class="pane-right">
		<%@ include file="listUser.jsp" %>
	</div>
</div>


<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
