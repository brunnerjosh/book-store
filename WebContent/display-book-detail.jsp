<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<jsp:useBean id="book" class="model.Book"/>
<jsp:useBean id="bookDao" class="dao.BookDao"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>

<%
int userID = 0;
if(user != null){
	userID = user.getUserid();
}
String strBook = request.getParameter("bookId");
int intBook = Integer.parseInt(strBook);
book = bookDao.getBookById(intBook);
/* userDao.addToCart(userID, intBook); */
%>

<div class="container as-book-detail">
	<h1>Book Information</h1>
	<div class="book-detail-panel">
		<div class="pane-left">
			<img class="product-img" src="<%=book.getPhoto() %>" />
		</div>
		<div class="pane-right">
			<h2><%=book.getTitle() %></h1>
			<p class="muted">by: <%=book.getAuthor() %></p>

			<div class="book-details">
				<h4>Book Details:</h4>
				<p>category <strong><%=book.getCategory()%></strong></p>
				<%
				if(book.getInventory() >= 1){
					out.print("<p><strong>"+book.getInventory()+"</strong> copies left</p>");
				} else {
					out.print("<p class=\"s-red\"><strong>"+book.getInventory()+"</strong> copies left</p>");					
				}
				%>
				
				<p>published in <strong><%=book.getYearPublished() %></strong> by <strong><%=book.getPublisher() %></strong></p>
			</div>
			<div class="purchase-section">
				<div class="rating">Rating <%=book.getReviewRating()%>/10</div>
				<div class="price">$<%=book.getPrice() %></div>
				<form action="addToCart.jsp?bookId=<%=book.getBookId() %>" method="post">
					<%
						if(book.getInventory() >= 1){
							out.print("<button type=\"submit\" class=\"addToCart s-large s-green\">Add To Cart</button>");
						} else {
							out.print("<button type=\"submit\" disabled class=\"addToCart disabled s-large s-red\">Out of Stock</button>");					
						}
					%>
				</form>
				<a href="BookController?action=bookDisplay&category=all" class="goBack">Go Back</a>
			</div>
		</div>
	</div>

</div>


<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
