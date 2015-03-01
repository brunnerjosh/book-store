<jsp:useBean id="transDao" class="dao.TransactionDao"/>
<jsp:useBean id="transaction" class="model.Transaction"/>

<%
String strThresholdParam = request.getParameter("thresholdParam");
String strPriceLimit = request.getParameter("priceLimit");
response.sendRedirect("TransactionController?action=viewTransactions&byType=Price&threshold="+strThresholdParam+"&priceLimit="+strPriceLimit);
%>