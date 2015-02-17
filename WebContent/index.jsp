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
					<a class="list-item">Item 1</a>
					<a class="list-item">Item 2</a>
					<a class="list-item">Item 3</a>
					<a class="list-item">Item 4</a>
					<a class="list-item">Item 5</a>
					<a class="list-item">Item 6</a>
					<a class="list-item">Item 7</a>
				</div>
			</div>
		</div>

		<%--  BOOK COVER TEMPLATES --%>
		<%-- <img src="images/girl-on-train.png" />
		<img src="images/american-sniper.png" />
		<img src="images/the-life-changing-magic.png" />
		<img src="images/the-alchemist.png" /> --%>

		<a href="BookController?action=bookDisplay">View Books</a>
	</div>
</div>


<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>

