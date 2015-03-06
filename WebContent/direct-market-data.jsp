<%@page import="model.UserPurchase"%>
<%@ include file = "/partials/header.jsp" %> <!-- HEADER -->
<%@ include file = "/partials/navigation.jsp" %> <!-- NAVIGATION BAR -->
<%@ include file = "/confirmAdmin.jsp" %> <!-- ADMIN ACCESS ONLY -->
<%-- <jsp:useBean id="bookDao" class="dao.BookDao"/> --%>
<jsp:useBean id="transDao" class="dao.TransactionDao"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>
<jsp:useBean id="userPurchase" class="model.UserPurchase"/>

<!-- MAIN BODY CONTENT -->
<div class="container clearfix">
	<h1>Dashboard: 
		<muted>Analytics</muted>
	</h1>
	<div class="pane-left">
		<%@ include file = 'analytics-left-side.jsp' %>
	</div>
	<div class="pane-right">
	<ul>
	<%
		String [] categories = bookDao.getBookCategories();
		List<model.UserPurchase> userPurchases = transDao.getUserPurchaseData();
		for (int i = 1; i < categories.length; i++){
			String cat = categories[i];
		
	%>	
	<div><%= cat %></div>
		<%
		int j = 0;
		while (userPurchases.size() > j){
			model.UserPurchase purchase = userPurchases.get(j);
			if (purchase.getCategory().equalsIgnoreCase(cat) &&
					purchase.getCount() >= 2){
			%>
				<li>firstName=<%=purchase.getFirstName() %>, 
				 	lastName=<%=purchase.getLastName() %>,
				 	transactionId=<%=purchase.getTransacitonId() %>, 
				 	category=<%=purchase.getCategory() %>, 
				 	count=<%=purchase.getCount() %></li>		
			<%
			}
			j++;
		}
	%>
		
	
	<%} %>
	</ul>
		<ul>
	
		</ul>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>