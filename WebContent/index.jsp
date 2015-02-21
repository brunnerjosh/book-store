<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<!-- MAIN BODY CONTENT -->
<div class="container">
	<div>
		<h1>Quest: An Online Bookstore</h1>

		<div class="item-list-group">
			<div class="side-left">
				<div class="side-left">
					<a class="list-item">Fiction</a>
					<a class="list-item">Children's</a>
					<a class="list-item">Poetry</a>
					<a class="list-item">Biography</a>
					<a class="list-item">Mystery</a>
					<a class="list-item">Horror</a>
					<a class="list-item">Romance</a>
				</div>
			</div>
		</div>

		<%--  BOOK COVER TEMPLATES --%>
		<%-- <img src="images/girl-on-train.png" />
		<img src="images/american-sniper.png" />
		<img src="images/the-life-changing-magic.png" />
		<img src="images/the-alchemist.png" /> --%>

		<%-- <a href="BookController?action=bookDisplay">View Books</a> --%>
		<a href="BookController?action=bookDisplay&category=all">View Books</a>
		<br>
			
		<%-- DISPLAY COOKIES --%>
		<%@ include file = "displayCookies.jsp" %>

	</div>
</div>


<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
