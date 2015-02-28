<a onclick="" href="user-profile.jsp">Go Back</a>

<div class="table-list-group">	
	<table>
	    <thead>
	        <tr>
	            <th>Transaction ID</th>
	            <th>Shared Transaction ID</th>
	            <th>Date</th>
	            <th>Book Id</th>
	            <th>Amount</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach items="${transactions}" var="transaction">
	            <tr>
	                <td><c:out value="${transaction.transactionId}" /></td>
	                <td><c:out value="${transaction.sharedTransID}" /></td>
	                <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${transaction.transactionDate}" /></td>
	                <td><c:out value="${transaction.bookId}" /></td>
	                <td><c:out value="${transaction.transactionAmount}" /></td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
</div>
