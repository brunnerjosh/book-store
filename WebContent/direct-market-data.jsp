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
		<div class="analytics-right-section">
			<table class="stats-display width-100">
				<tr>
					<td>
						<div class="sales-column as-direct-market-data">
							<h2>Direct Market Data (By Category)</h2>
							<ul>
							<%
								String [] categories = bookDao.getBookCategories();
								int [][] mostPopular = new int[categories.length][2];
								List<model.UserPurchase> userPurchases = transDao.getUserPurchaseData();
								for (int i = 1; i < categories.length; i++){
									String cat = categories[i];
									%>
										<div class="relative">
											<div class="header-row relative">Category: 
												<span class="type"><%=cat%></span>
											</div>
											<%
												int j = 0;
												// System.out.println(cat+"purchase size: " + userPurchases.size());
												while (userPurchases.size() > j){
													model.UserPurchase purchase = userPurchases.get(j);
													// System.out.println("count: " + purchase.getCount());
														if (purchase.getCategory().equalsIgnoreCase(cat) && purchase.getCount() >= 2){
														%>
															<li>
															 	<div class="buyer-name"><%=purchase.getFirstName() %> <%=purchase.getLastName() %></div>
															 	<div class="buyer-purchase-count">purchase count: <%=purchase.getCount() %></div>
														 	</li>		
														<%
														mostPopular[i][0]++;
														mostPopular[i][1] = 1;
														} 
													j++;
												}
												%>
													<div class="top-buyers">Customers: <span class="type"><%=mostPopular[i][0] %></span></div>
										</div>
											<%
											if(mostPopular[i][1] != 1){
												out.print("<div class=\"s-red\">*This was not a popular category this month :(</div> ");
											}
										}
									%>
							</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>