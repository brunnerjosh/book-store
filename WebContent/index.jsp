<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<!-- MAIN BODY CONTENT -->
<div class="container">
	<div>
		<h1>Welcome to Quest: An Online Bookstore</h1>

		<%-- <div class="item-list-group">
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
		</div> --%>

		<%--  BOOK COVER TEMPLATES --%>
		<%-- <img src="images/girl-on-train.png" />
		<img src="images/american-sniper.png" />
		<img src="images/the-life-changing-magic.png" />
		<img src="images/the-alchemist.png" /> --%>
		
		<!-- Landing Page -->
		<%-- <h3> Welcome to the Quest Bookstore </h3> --%>
		<p> The Quest Bookstore is the ideal destination for anyone looking for the best books. 
		    With age-based selections, as well as specialty varieties that cater to all audiences, it's the ultimate one-stop shop. 
		    The Quest Bookstore stocks books of many different genres for your reading enjoyment. 
            Quest get Unlimited Free Member Express Shipping in 3 days or less on eligible orders. 
            Non-members can get Free Shipping on orders of $25 or more of eligible items. 
            We even offer Same Day Delivery to many locations at no extra charge.
		</p>
		<img src="images/quest.jpg" />
		<br>

		<%-- <a href="BookController?action=bookDisplay">View Books</a> --%>
		<a href="BookController?action=bookDisplay&category=all">View Books</a>
		<br>
				
		<%-- DISPLAY COOKIES --%>
		<%-- <%@ include file = "displayCookies.jsp" %> --%>

	</div>
</div>


<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
