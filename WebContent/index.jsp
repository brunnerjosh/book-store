<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<!-- MAIN BODY CONTENT -->
<div class="container as-index-page">
	<div class="pane-left">
		<img class="index-logo" src="images/quest.jpg">
	</div>
	<div class="pane-right">
		<h1>Welcome to Quest: An Online Bookstore</h1>
		<p class="index-description"> The Quest Bookstore is the ideal destination for anyone looking for the best books. 
		    With age-based selections, as well as specialty varieties that cater to all audiences, it's the ultimate one-stop shop. 
		    The Quest Bookstore stocks books of many different genres for your reading enjoyment. 
            Quest get Unlimited Free Member Express Shipping in 3 days or less on eligible orders. 
            Non-members can get Free Shipping on orders of $25 or more of eligible items. 
            We even offer Same Day Delivery to many locations at no extra charge.
		</p>
		<table class="as-button-group">
			<tr>
				<td>
					<a href="signUp.jsp">
						<button class="cta-button sign-up">Sign Up</button>
					</a>
				</td>
				<td>
					<a onclick="toggleLogIn()" id="signin" >
						<button class="cta-button sign-in">Sign In</button>
					</a>
				</td>
				<td>
					<a href="BookController?action=bookDisplay&category=all">
						<button class="cta-button view-books">Browse Books</button>
					</a>
				</td>
			</tr>
		</table>
		
	</div>
</div>


<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
