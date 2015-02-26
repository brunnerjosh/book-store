<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<jsp:useBean id="book" class="model.Book"/>
<jsp:useBean id="bookDao" class="dao.BookDao"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>

<%
Date currDate = new Date();
int userID = 0;
if(user != null){
	userID = user.getUserid();
	int intBook = 2;
	book = bookDao.getBookById(intBook);
	System.out.println("Display Book Detail: id:" + intBook + " title:" + book.getTitle());
	%>
	
	<div class="container as-book-detail">
		<h1>User Profile</h1>
		<div class="book-detail-panel">
			<div class="pane-left">
				<img class="product-img" src="<%=book.getPhoto() %>" />
			</div>
			<div class="pane-right">
				<h2><%=user.getFirstName() %> <%=user.getLastName() %></h1>
				<p class="muted">born in <%=user.getDob() %></p>
	
				<div class="book-details">
					<h4>User Stats:</h4>
					<p>books purchased: <strong><%=userDao.countBooksPurchased(user.getUserid()) %></strong>&nbsp &nbsp <a href="TransactionController?action=transHist&userId=<%=user.getUserid()%>">View Transactions</a></p>
					<p>ratings made: <strong><%=userDao.countRatingsMade(user.getUserid()) %></strong>&nbsp &nbsp <a href="TransactionController?action=transHist&userId=<%=user.getUserid()%>">View Ratings</a></p>
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
	
					<form method="POST" action='RatingController?action=userAddRating&bookId=<%=book.getBookId() %>' name="userAddRating">
					    <select id="ratingSelect" class="rating-options">
				            <option>-- Add Rating --</option>
				            <%
				            for(int i = 1 ; i < 11; i++){
				            	out.print("<option value=\"" + i +  "\">" + i + " star</option>");
				            }
				            %>
			            </select>
					    <input type="submit" value="Submit" />
					    <input placeholder="RatingID" type="hidden" readonly="readonly" name="ratingId" value="<c:out value="${rating.ratingId}" />" />
					    <input placeholder="UserID" type="hidden" name="userId" value="<%=user.getUserid()%>" />
					    <input placeholder="BookID" type="hidden" name="bookId" value="<%=book.getBookId()%>" />
					    <input placeholder="Date of Trans" type="hidden" name="ratingDate"  value="<fmt:formatDate pattern="MM/dd/yyyy" value="<%=currDate %>" />" />
					    <input placeholder="Rating" type="hidden" id="selectedRating" name="rating" value="" />
					</form>
				</div>
			</div>
		</div>
	
	</div>
	<%
} else {
	out.print("<h1>You're not signed in!</h1>");
}
	%>
	
<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
