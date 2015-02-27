<a class="s-right" href="TransactionController?action=insert">Add Transaction</a>
<a href="TransactionController?action=listTransaction">List Transactions</a>
<div class="table-list-group">
	<table border=1>
	    <thead>
	        <tr>
	            <th>Transaction Id</th>
	            <th>Shared Trans Id</th>
	            <th>Transaction Date</th>
	            <th>Book ID</th>
	            <th>User ID</th>
	            <th>Transaction Amount</th>
	            <th colspan=2>Action</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach items="${transactions}" var="transaction">
	            <tr>
	                <td><c:out value="${transaction.transactionId}" /></td>
	                <td><c:out value="${transaction.sharedTransID }" /></td>
	                <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${transaction.transactionDate}" /></td>
	                <td><c:out value="${transaction.bookId}" /></td>
	                <td><c:out value="${transaction.userId}" /></td>
	                <td><c:out value="${transaction.transactionAmount}" /></td>
	                <td><a href="TransactionController?action=edit&transactionId=<c:out value="${transaction.transactionId}"/>">Update</a></td>
	                <td><a href="TransactionController?action=delete&transactionId=<c:out value="${transaction.transactionId}"/>">Delete</a></td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
</div>
