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

<html>
	<head>
		<title>View Book Detail</title>
	</head>
	
	<body>

		<h1>Book Detail Information</h1>

		<div class="table-list-group">
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
		</div>
	</body>
</html>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
