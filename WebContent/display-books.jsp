<jsp:useBean id="bookDao" class="dao.BookDao"/>

<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<!-- MAIN BODY CONTENT -->
<div class="container">
	<div>
		<h1>Quest: An Online Bookstore</h1>
		
		<%
		String searchQuery = request.getParameter("query");
		String priceLimit = request.getParameter("priceLimit");
		if(searchQuery == null){
			searchQuery = "";
		}
		%>
		
		<div class="search-bar">
			<form method="get" name="searchQuery" action="processSearchQuery.jsp">
				<input type="text" id="searchQuery" name="searchQuery" value="<%=searchQuery %>" placeholder="Search">
				<button type="submit" class="s-blue search-button">Search</button>
			</form>
		</div>

		<div class="item-list-group">
			<div class="side-left">
				<span class="list-item-label">Category:</span>
				<div class="side-left">
					<%
					int categoryLength = bookDao.bookCategories.length;
					for(int i = 0; i < categoryLength; i++){
					%>
						<a class="list-item" href="BookController?action=bookDisplay&category=<%=bookDao.bookCategories[i]%>"><%=bookDao.bookCategories[i]%></a>
					<%
					}
					%>
				</div>
			</div>
		</div>
		<div class="products">
			<c:forEach items="${books}" var="book">
				<a href="BookController?action=bookDetail&bookId=${book.bookId}">
					<div class="product">
						<img src="<c:out value="${book.photo}" />" />
						<div class="product-info">
							<div class="product-title"><c:out value="${book.title}" /></div>
							<div class="product-author">by <c:out value="${book.author}" /></div>
							<div class="product-price">$<c:out value="${book.price}" /></div>
							<%@ include file = "/partials/product-rating.jsp" %>
						</div>	
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>

