<%@ include file = "/partials/header.jsp" %>
<%@ page import = "java.util.*" %>

<jsp:useBean id="user" class="model.User"/>
<jsp:useBean id="book" class="model.Book"/>
<jsp:useBean id="bookDao" class="dao.BookDao"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>

<%
List<Integer> bookIDs = null;
user = (model.User) session.getAttribute("loggedInUser");
if(user != null) {
	bookIDs = user.getBooksInBag();
	System.out.println("Total: " + bookDao.getTotalFor(bookIDs));
/* 	for(int i = 0 ; i < bookIDs.size(); i++){
		book = bookDao.getBookById(bookIDs.get(i));
		System.out.println("Book in Bag: " + bookIDs.get(i));
	} 
*/
	
/* 	int userID = user.getUserid();
	
	String strBook = request.getParameter("bookId");
	int intBook = Integer.parseInt(strBook);
	book = bookDao.getBookById(intBook);
	userDao.addToCart(user, intBook); //may need to hand in the User object
	System.out.println("Added item to cart. " + user.getFirstName() +  " has this many items in cart: " + user.getBooksInBag().size());
 */
 %>
	<div class="container as-medium">
		<div class="add-to-cart">
			<h1>Checkout Page</h1>

			<div class="item-list-group as-row-listing">
				
				<%
					if(bookIDs.size() == 0){
						out.print("<h2>Your bag is empty!</h2>");
						out.print("<a href=\"BookController?action=bookDisplay&category=all\"><button class=\"s-blue\">Go Shopping!</button></a>");
					} else if (bookIDs.size() == 1){
						out.print("<h2>Item in bag:</h2>");
					} else {
						out.print("<h2>Items in bag:</h2>");
					}

					if(bookIDs.size() >= 1){
				%>
						<ol>
							<%
							for(int i = 0 ; i < bookIDs.size(); i++){
								book = bookDao.getBookById(bookIDs.get(i));
								/* System.out.println("Book in Bag: " + bookIDs.get(i)); */
							%>
								<li class="item-row">
									<p class="product-name">
										<strong><%=book.getTitle() %></strong> 
										<muted>by <%=book.getAuthor() %></muted>
									</p>
									<p class="product-price">$<%=book.getPrice() %></p>
									<a class="product-remove" href="removeFromCart.jsp?bookId=<%=book.getBookId() %>"> X </a>
								</li>
							<%
							}
							%>
						</ol>
						<div class="product-total clearfix">
							<strong>Total:</strong>
							<p class="total-amount s-right">$<%=bookDao.getTotalFor(bookIDs) %></p>
							<form>
								<button class="confirm-checkout s-large s-green">Confirm Purchase</button>
							</form>
						</div>
				<%
					}
				%>
			</div>
			
			<a href="BookController?action=bookDisplay&category=all">
				<button>View More Books</button>
			</a>
			<p><a href="index.jsp">Go Home</a></p>

		</div>
	</div>
<%
} else {
%>

<div class="container as-small">
	<div class="add-to-cart">
		<h1>You must be signed in to checkout!</h1>

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
