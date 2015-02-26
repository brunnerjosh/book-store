 <!-- HEADER BAR -->
 <%@ include file = "/partials/header.jsp" %>
 <jsp:useBean id="user" class="model.User"/>
 <jsp:useBean id="book" class="model.Book"/>
 <jsp:useBean id="bookDao" class="dao.BookDao"/>
 <jsp:useBean id="userDao" class="dao.UserDao"/>
 
 <%
 	String strBook = request.getParameter("bookId");
 	if(strBook != null && !strBook.isEmpty()){
 		int intBook = Integer.parseInt(strBook);
 		book = bookDao.getBookById(intBook);
 %>

<div class="container">
	<div id="add-user-details" class="add-entity as-user-entry">
		<h2>Thanks for rating <%=book.getTitle() %></h2>
		<form method="post" action="display-book-detail.jsp?bookId=<%=strBook%>">
			<button type="submit">Go back</button>
		</form>
	</div>
</div>
<%
	} 
%>
<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
