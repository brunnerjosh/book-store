<%@ include file = "/partials/header.jsp" %> <!-- HEADER -->
<%@ include file = "/partials/navigation.jsp" %> <!-- NAVIGATION BAR -->
<%@ include file = "/confirmAdmin.jsp" %> <!-- ADMIN ACCESS ONLY -->
<jsp:useBean id="transDao" class="dao.TransactionDao"/>
<jsp:useBean id="month" class="model.MonthlySale"/>
<jsp:useBean id="week" class="model.WeeklySale"/>
<%
	String period = request.getParameter("type");
	List<model.MonthlySale> Mlist  = transDao.getMonthlySales();
	List<model.WeeklySale> Wlist = transDao.getWeeklySales();
%>
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
		<h2>Sales Stats for <strong>Quest</strong></h2>
		<table class="width-100">
			<tr>
				<td>
					<div class="sales-column">
						<h3 class="header">Weekly</h3>
						<ul>
							<%for (int i = 0; i < Wlist.size(); i++){ 
									model.WeeklySale sale = Wlist.get(i);
								%>
									<li><%= sale.getWeek() %> - $<%= sale.getSales() %></li>
							<% } %>	
						</ul>
					</div>
				</td>
				<td>
					<div class="sales-column">
						<h3 class="header">Monthly</h3>
						<ul>
							<%
							for (int i = 0; i < Mlist.size(); i++){ 
								model.MonthlySale sale = Mlist.get(i);
							%>
								<li><%= sale.getMonth() %> - $<%= sale.getSales() %></li>
								
							<% } %>
						</ul>
						
					</div>
				</td>
				<td>
					<div class="sales-column">
						<h3 class="header">Total</h3>
						<ul>
							<li>$<%=transDao.getTotalSales() %></li>
						</ul>
					</div>
				</td>
			</tr>
		</table>
	</div>
		<%-- <table border="1">
		<tr>
			<td>Total Sales</td>
		</tr>
		<tr>
			<td><%=transDao.getTotalSales() %></td>
		</tr>
		</table>
		<table border="2">
			<% if (period.equalsIgnoreCase("monthly")){ %>
			<div>Total Sales By Month</div>
				<tr>
					<td>Month</td>
					<td>Sales</td>
				</tr>
				
				<%for (int i = 0; i < Mlist.size(); i++){ 
						model.MonthlySale sale = Mlist.get(i);
					%>
					<tr>
						<td><%= sale.getMonth() %></td>
						<td><%= sale.getSales() %></td>
					</tr>
				<% } %>
				
			<%} else { %>
			<div>Total Sales by Week</div>
			<tr>
					<td>Week</td>
					<td>Sales</td>
				</tr>
				
					<%for (int i = 0; i < Wlist.size(); i++){ 
						model.WeeklySale sale = Wlist.get(i);
					%>
					<tr>
						<td><%= sale.getWeek() %></td>
						<td><%= sale.getSales() %></td>
					</tr>
				<% } %>
				
			<%} %>
		</table> --%>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>