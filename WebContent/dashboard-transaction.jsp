<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<!-- MAIN BODY CONTENT -->
<div class="container clearfix">
	<h1>Dashboard: 
		<muted>Transactions</muted>
	</h1>
	<%@ include file="listTransaction.jsp" %>

</div>


<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>