<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<jsp:useBean id="book" class="model.Book"/>
<jsp:useBean id="bookDao" class="dao.BookDao"/>

<%
String strBook = request.getParameter("bookId");
int intBook = Integer.parseInt(strBook);
book = bookDao.getBookById(intBook);
%>

<div class="container as-book-detail">
	<h1>Book Information</h1>
	<div class="book-detail-panel">
		<div class="pane-left">
			<img src="http://lorempixel.com/258/393/abstract/" />
		</div>
		<div class="pane-right">
			<h2><%=book.getTitle() %></h1>
			<p class="muted">by: <%=book.getAuthor() %></p>

			<div class="book-details">
				<h4>Book Details:</h4>
				<p>category <strong><%=book.getCategory()%></strong></p>
				<p><strong><%=book.getInventory() %></strong> copies left</p>
				<p>published in <strong><%=book.getYearPublished() %></strong> by <strong><%=book.getPublisher() %></strong></p>
			</div>
			<div class="purchase-section">
				<div class="rating">Rating <%=book.getReviewRating()%>/10</div>
				<div class="price">$<%=book.getPrice() %></div>
				<button class="addToCart s-large s-green">Add To Cart</button>
				<a href="BookController?action=bookDisplay" class="goBack">Go Back</a>
			</div>
		</div>
	</div>

<%-- 	<div class="table-list-group">
		<table>
			<tr>
   				<th>Item</th>
   				<th>Value</th>
			</tr>
			<tr>
   				<td>Book id</td>
   				<td><% out.print( book.getBookId()); %></td>
			</tr>
			<tr>
   				<td>Title</td>
   				<td><% out.print(book.getTitle()); %></td>
			</tr>
			<tr>
   				<td>Author</td>
   				<td><% out.print(book.getAuthor()); %></td>
			</tr>
			<tr>
   				<td>Inventory</td>
   				<td><% out.print(book.getInventory()); %></td>
			</tr>
			<tr>
   				<td>Price</td>
   				<td><% out.print( book.getPrice()); %></td>
			</tr>
			<tr>
   				<td>Category</td>
   				<td><% out.print(book.getCategory()); %></td>
			</tr>
			<tr>
   				<td>Publisher</td>
   				<td><% out.print(book.getPublisher()); %></td>
			</tr>
			<tr>
   				<td>Publication Year</td>
   				<td><% out.print(book.getYearPublished()); %></td>
			</tr>
			<tr>
   				<td>Review Rating</td>
   				<td><% out.print(book.getReviewRating()); %></td>
			</tr>
		</table>
	</div> --%>
</div>


<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
