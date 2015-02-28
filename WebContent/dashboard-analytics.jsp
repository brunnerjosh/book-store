<%@ include file = "/partials/header.jsp" %> <!-- HEADER -->
<%@ include file = "/partials/navigation.jsp" %> <!-- NAVIGATION BAR -->

<%@ include file = "/confirmAdmin.jsp" %> <!-- ADMIN ACCESS ONLY -->

<!-- MAIN BODY CONTENT -->
<div class="container clearfix">
	<h1>Dashboard: 
		<muted>Analytics</muted>
	</h1>
	<div class="pane-left">Left side</div>
	<div class="pane-right">Right Side</div>
	
	<h2>The Weekly Top 10 Bestsellers</h2>
	<a href="TransactionController?action=bestSellers&topAmount=10&category=All">Best Sellers</a>
		
	<h2>Five Best Sellers by Category</h2>
	<a href="TransactionController?action=bestSellers&topAmount=5&category=Fiction">Fiction</a>
	<a href="TransactionController?action=bestSellers&topAmount=5&category=Children">Children</a>
	<a href="TransactionController?action=bestSellers&topAmount=5&category=Poetry">Poetry</a>
	<a href="TransactionController?action=bestSellers&topAmount=5&category=Biography">Biography</a>
	<a href="TransactionController?action=bestSellers&topAmount=5&category=Mystery">Mystery</a>
	<a href="TransactionController?action=bestSellers&topAmount=5&category=Horror">Horror</a>
	<a href="TransactionController?action=bestSellers&topAmount=5&category=Romance">Romance</a>
	
	<h2>Biweekly Favorite Books</h2>
	<a href="RatingController?action=favoriteBooks&topAmount=20">Top Rated</a>
	<br>
</div>




<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>