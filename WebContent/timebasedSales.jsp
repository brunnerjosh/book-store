<%@page import="model.Transaction"%>
<%@ include file = "/partials/header.jsp" %> <!-- HEADER -->
<%@ include file = "/partials/navigation.jsp" %> <!-- NAVIGATION BAR -->
<%@ include file = "/confirmAdmin.jsp" %> <!-- ADMIN ACCESS ONLY -->
<jsp:useBean id="transDao" class="dao.TransactionDao"/>
<jsp:useBean id="transaction" class="model.Transaction"/>
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
		<table class="stats-display width-100">
			<tr>
				<%-- <td>
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
				</td> --%>
				<td>
					<div class="sales-column">
						<h3 class="header">Weekly</h3>
						<ul>
							<%
							int currYear_week = 0;
							int nextYear_week = 1;
							double weekDiff_start = 0;
							double weekDiff_end = 0;
							double weeklyDifference = 0;
							for (int i = 0; i < Wlist.size(); i++){
								model.WeeklySale sale = Wlist.get(i);
								currYear_week = Integer.parseInt(sale.getYear());
								weekDiff_start = sale.getSales();
								weeklyDifference = transaction.round((weekDiff_start - weekDiff_end), 2);
								if(currYear_week != nextYear_week){
									%>
									<div class="header-row relative">
										<div class="sales-year"><%=currYear_week%></div>
										<div class="sales-week">Week Period</div>
										<div class="sales-total">Total</div>
										<div class="sales-change">Increase/Decrease</div>
									</div>
									<%
								}
							%>
								<li>
									<div class="sales-month"><%=sale.getWeekStart() %> &ndash; <%=sale.getWeekEnd() %></div>
									<div class="sales-amount">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$<%=transaction.round(sale.getSales(),2) %></div>
									<div class="sales-difference">
										<%
											if(weeklyDifference > 0){
												out.print("<div class=\"diff-good\">+<div class=\"dollar-sign\">$</div>" + weeklyDifference + "</div>");
											} else if(weeklyDifference == 0){
												out.print("<div class=\"dollar-sign\">$</div>" + weeklyDifference);
											} else {
												out.print("<div class=\"diff-bad\">-<div class=\"dollar-sign\">$</div>" + Math.abs(weeklyDifference) + "</div>");
											}
										%>
									</div>
								</li>

							<%
								weekDiff_end = sale.getSales();
								nextYear_week = currYear_week;
							}
							%>
						</ul>

					</div>
				</td>
				<td>
					<div class="sales-column">
						<h3 class="header">Monthly</h3>
						<ul>
							<%
							int currYear_month = 0;
							int nextYear_month = 1;
							double monthDiff_start = 0;
							double monthDiff_end = 0;
							double monthlyDifference = 0;
							for (int i = 0; i < Mlist.size(); i++){
								model.MonthlySale sale = Mlist.get(i);
								currYear_month = Integer.parseInt(sale.getYear());
								monthDiff_start = sale.getSales();
								monthlyDifference = transaction.round((monthDiff_start - monthDiff_end),2);
								if(currYear_month != nextYear_month){
									%>
									<div class="header-row relative">
										<div class="sales-year"><%=currYear_month%></div>
										<div class="sales-week">Month</div>
										<div class="sales-total">Total</div>
										<div class="sales-change">Increase/Decrease</div>
									</div>
									<%
								}
							%>
								<li>
									<div class="sales-month"><%= sale.getMonth() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
									<div class="sales-amount">$<%=transaction.round(sale.getSales(),2) %></div>
									<div class="sales-difference">
										<%
											if(monthlyDifference > 0){
												out.print("<div class=\"diff-good\">+<div class=\"dollar-sign\">$</div>" + monthlyDifference + "</div>");
											} else if(monthlyDifference == 0){
												out.print("<div class=\"dollar-sign\">$</div>" + monthlyDifference);
											} else {
												out.print("<div class=\"diff-bad\">-<div class=\"dollar-sign\">$</div>" + Math.abs(monthlyDifference) + "</div>");
											}
										%>
									</div>
								</li>

							<%
								monthDiff_end = sale.getSales();
								nextYear_month = currYear_month;
							}
							%>
						</ul>

					</div>
				</td>
				<td>
					<div class="sales-column">
						<h3 class="header">Total</h3>
						<ul>
							<li class="total-sales">$<%=transaction.round(transDao.getTotalSales(),2) %></li>
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
