<%@ include file = "/partials/header.jsp" %>

<jsp:useBean id="user" class="model.User"/>
<jsp:useBean id="book" class="model.Book"/>
<jsp:useBean id="bookDao" class="dao.BookDao"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>

<%
List<Integer> booksInBag = null;
user = (model.User) session.getAttribute("loggedInUser");
if(user != null) {
	booksInBag = user.getBooksInBag();
	int bagSize = booksInBag.size(); // Get amount of books in bag
	// Loop over list and remove the book from the user's bag
	for(int i = 0 ; i < bagSize; i++){
 		user.removeBookFromBag(booksInBag.get(0)); // Since the array list for Integer is different, remove the 0th position
	}
%>
	<div class="container as-small">
		<div class="add-to-cart">
			<h1>Purchase Confirmed</h1>

			<p><a href="index.jsp">Go Home</a></p>
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
