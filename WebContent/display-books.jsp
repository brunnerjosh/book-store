<jsp:useBean id="bookDao" class="dao.BookDao"/>

<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<!-- MAIN BODY CONTENT -->
<div class="container">
	<div>
		<h1>Quest: An Online Bookstore</h1>

		<div class="item-list-group">
			<div class="side-left">
				Category:
				<div class="side-left">
					<%
					int categoryLength = bookDao.bookCategories.length;
					for(int i = 0; i < categoryLength; i++){
					%>
						<a href="BookController?action=bookDisplay&category=<%=bookDao.bookCategories[i]%>"><%=bookDao.bookCategories[i]%></a>
					<%
					}
					%>
				</div>
			</div>
		</div>
		<div class="products">
			<c:forEach items="${books}" var="book">
				<div class="product">
					<img src="http://lorempixel.com/172/262/abstract/" />
					<div class="product-info">
						<div class="product-title"><c:out value="${book.title}" /></div>
						<div class="product-price">$<c:out value="${book.price}" /></div>
						<%-- <button class="product-purchase s-green">View Detail</button> --%>
						<a href="BookController?action=bookDetail&bookId=${book.bookId}" class="product-purchase s-green">View Detail</a>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>

