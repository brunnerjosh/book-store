<jsp:useBean id="bookAccess" class="dao.BookDao"/>
<jsp:useBean id="topBook" class="model.Book"/>
<jsp:useBean id="transaction" class="model.Transaction"/>
<%
String topAmountStr = request.getParameter("topAmount");
int topAmount = Integer.parseInt(topAmountStr);
int count = 0; // Keeps track of how many items were displayed
%>
<div class="analytics-right-section">
	<h2>Top <%=topAmount %> Best Sellers</h2>
	<ol>
		<c:forEach items="${transactions}" var="transaction">
		    <li class="book-item">
		        <%
		        	transaction = (model.Transaction) pageContext.getAttribute("transaction");
		        	topBook = bookAccess.getBookById(transaction.getBookId());
		        	count++;
		        %>
		        <img class="book-photo" src="<%=topBook.getPhoto() %>" />
		        <div class="book-title"><%=topBook.getTitle() %></div> 
		        <div class="book-info">
		        	by <%=topBook.getAuthor() %>
		        	<br>
		        	<%=bookAccess.countBooksPurchased(topBook.getBookId()) %> copies sold
	        	</div>
		    </li>
		</c:forEach>
		<%
		if(count < topAmount){
			out.print("<h4 class=\"error\">Not enough results to display the Top "+topAmount+"</h4>");
		}
		%>
	</ol>
</div>