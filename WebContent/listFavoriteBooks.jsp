<jsp:useBean id="bookAccess" class="dao.BookDao"/>
<jsp:useBean id="topBook" class="model.Book"/>
<jsp:useBean id="rating" class="model.Rating"/>
<%
String topAmountStr = request.getParameter("topAmount");
int topAmount = Integer.parseInt(topAmountStr);
int count = 0; // Keeps track of how many items were displayed
%>
<div class="analytics-right-section">
	<h2>
	Top <%=topAmount %> Rated Books
	</h2>
	<ol>
		<c:forEach items="${ratings}" var="rating">
		    <li class="book-item">
		        <%
		        	rating = (model.Rating) pageContext.getAttribute("rating");
		        	topBook = bookAccess.getBookById(rating.getBookId());
		        	count++;
		        %>
		        <img class="book-photo" src="<%=topBook.getPhoto() %>" />
		        <div class="book-title"><%=topBook.getTitle() %></div> 
		        <div class="book-info">
		        	by <%=topBook.getAuthor() %>
		        	<br>
		        	<strong><%=bookAccess.countRatingsFor(topBook.getBookId()) %></strong> total ratings with average of <strong><%=topBook.getReviewRating() %>/10</strong>
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
