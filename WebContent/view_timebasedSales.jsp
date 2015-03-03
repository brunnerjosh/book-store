<%@ page import = "java.util.*" %>
<%@page import="model.Transaction"%>
<jsp:useBean id="transDao" class="dao.TransactionDao"/>
<jsp:useBean id="transaction" class="model.Transaction"/>
<jsp:useBean id="month" class="model.MonthlySale"/>
<jsp:useBean id="week" class="model.WeeklySale"/>
<%
	String period = request.getParameter("type");
	List<model.MonthlySale> Mlist  = transDao.getMonthlySales();
	List<model.WeeklySale> Wlist = transDao.getWeeklySales();
%>
<h2>Sales Stats for <strong>Quest</strong></h2>
<div class="total-sales"><muted>Total Revenue:</muted> $<%=transaction.round(transDao.getTotalSales(),2) %></div>
<table class="stats-display width-100">
	<tr>
		<td>
			<div class="sales-column as-weekly">
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
								<div class="sales-change">Increase/Decrease</div>
								<div class="sales-total">Total</div>
							</div>
							<%
						}
					%>
						<li>
							<div class="sales-month"><%=sale.getWeekStart() %> &ndash; <%=sale.getWeekEnd() %></div>
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
							<div class="sales-amount">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$<%=transaction.round(sale.getSales(),2) %></div>
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
								<div class="sales-change">Increase/Decrease</div>
								<div class="sales-total">Total</div>
							</div>
							<%
				
						}
					%>
						<li>
							<div class="sales-month"><%= sale.getMonth() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
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
							<div class="sales-amount">$<%=transaction.round(sale.getSales(),2) %></div>
						</li>

					<%
						monthDiff_end = sale.getSales();
						nextYear_month = currYear_month;
					}
					%>
				</ul>
			</div>
		</td>
	</tr>
</table>