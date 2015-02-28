<h2>The Weekly Top 10 Bestsellers</h2>
<a href="TransactionController?action=bestSellers&topAmount=10&category=All">Best Sellers</a>
	
<h2>Five Best Sellers by Category</h2>
<%
int categoryLength = bookDao.bookCategories.length;
for(int i = 1; i < categoryLength; i++){ // Starting at 1 to avoid showing 'All'
%>
	<a href="TransactionController?action=bestSellers&topAmount=5&category=<%=bookDao.bookCategories[i]%>"><%=bookDao.bookCategories[i]%></a>
<%
}
%>

<h2>Biweekly Favorite Books</h2>
<a href="RatingController?action=favoriteBooks&topAmount=20">Top Rated</a>
