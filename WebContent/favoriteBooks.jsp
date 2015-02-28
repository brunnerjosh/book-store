<%@ include file = "/partials/header.jsp" %> <!-- HEADER -->
<%@ include file = "/partials/navigation.jsp" %> <!-- NAVIGATION BAR -->
<%@ include file = "/confirmAdmin.jsp" %> <!-- ADMIN ACCESS ONLY -->

<!-- MAIN BODY CONTENT -->
<div class="container clearfix">
	<h1>Dashboard: 
		<muted>Analytics</muted>
	</h1>
	<div class="pane-left">
		<%@ include file = 'analytics-left-side.jsp' %>
	</div>
	<div class="pane-right">
		<%@ include file="listFavoriteBooks.jsp" %>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>