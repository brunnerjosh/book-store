<div class="table-list-group">
	<table border=1>
	    <thead>
	        <tr>
	            <th>Transaction Id</th>
	            <th>Transaction Date</th>
	            <th>Book ID</th>
	            <th>User ID</th>
	            <th>Transaction Amount</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach items="${transactions}" var="transaction">
	            <tr>
	                <td><c:out value="${transaction.transactionId}" /></td>
	                <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${transaction.transactionDate}" /></td>
	                <td><c:out value="${transaction.bookId}" /></td>
	                <td><c:out value="${transaction.userId}" /></td>
	                <td><c:out value="${transaction.transactionAmount}" /></td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
</div>
