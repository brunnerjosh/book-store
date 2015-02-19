<%@ include file = "/partials/header.jsp" %> <!-- HEADER -->
<%@ include file = "/partials/navigation.jsp" %> <!-- NAVIGATION BAR -->

<%@ include file = "/confirmAdmin.jsp" %> <!-- ADMIN ACCESS ONLY -->

<!-- MAIN BODY CONTENT -->
<div class="container clearfix">
	<h1>Dashboard: 
		<muted>Users</muted>
	</h1>
	<%@ include file="listUser.jsp" %>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
