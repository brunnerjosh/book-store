<%@ include file = "/partials/header.jsp" %>

<jsp:useBean id="user" class="model.User"/>
<jsp:useBean id="book" class="model.Book"/>
<jsp:useBean id="bookDao" class="dao.BookDao"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>

<%
user = (model.User) session.getAttribute("loggedInUser");
if(user != null) {
	// System.out.println("User is not signed in");
	int userID = user.getUserid();
	String strBook = request.getParameter("bookId");
	int intBook = Integer.parseInt(strBook);
	book = bookDao.getBookById(intBook);
	userDao.addToCart(user, intBook); //may need to hand in the User object
	// System.out.println("Added item to cart. " + user.getFirstName() +  " has this many items in cart: " + user.getBooksInBag().size());
%>
	<div class="container as-small">
		<div class="add-to-cart">
			<h1>Item Added to Cart!</h1>

			<p><a href="index.jsp">Go Home</a></p>
			<a href="checkout.jsp">
				<button class="checkout s-blue">Checkout Now</button>
			</a>
			<a href="BookController?action=bookDisplay&category=all">
				<button>View More Books</button>
			</a>
		</div>
	</div>
<%
} else {
%>

<div class="container as-small">
	<div class="add-to-cart">
		<h1>You must be signed in</h1>

		<form method="post" name="signin" id="signin" action="loginCheck.jsp">
			<input type="text" placeholder="Email Address" id="email" name="email"  required>
			<input type="password" placeholder="Password" id="password" name="password"  required>
			<button type="submit" value="Log In" id="submit">Sign In</button>
		</form>
		<a href="signUp.jsp">Sign Up</a>
		<p><a href="index.jsp">Cancel</a></p>
	</div>
</div>

<%
}
%>


<%@ include file = "/partials/footer.jsp" %>
