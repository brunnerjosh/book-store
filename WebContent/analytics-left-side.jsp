<jsp:useBean id="bookDao" class="dao.BookDao"/>

<div class="analytics-left-nav">
	<ul>
		<h2>Quick Links:</h2>
		<li><a href="TransactionController?action=bestSellers&topAmount=10&category=All">Weekly Top 10 Best Sellers</a></li>
		<li>Top 5 Best Sellers (By Category)</li>
		<ul>
			<%
			int categoryLength = bookDao.bookCategories.length;
			for(int i = 1; i < categoryLength; i++){ // Starting at 1 to avoid showing 'All'
			%>
				<li><a href="TransactionController?action=bestSellers&topAmount=5&category=<%=bookDao.bookCategories[i]%>"><%=bookDao.bookCategories[i]%></a></li>
			<%
			}
			%>
		</ul>
		<li><a href="RatingController?action=favoriteBooks&topAmount=20">Top 20 Rated Books</a></li>
		<li><a href="TransactionController?action=viewTransactions&byType=Price">View Transactions (By Price)</a></li>
		<li><a href="TransactionController?action=sales&type=weekly&type=monthly&type=total">Show Sales Stats</a></li>
		<li><a href="./direct-market-data.jsp">Direct Market Data (By Category)</a></li>
		<!-- <li><a href="TransactionController?action=sales&type=total">Show Total Sales</a></li>
		<li><a href="TransactionController?action=sales&type=monthly">Show Monthly Sales</a></li>
		<li><a href="TransactionController?action=sales&type=weekly">Show Weekly Sales</a></li> -->
	</ul>
</div>