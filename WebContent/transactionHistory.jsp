<a onclick="toggleElement('table-list-group')" href="UserController?action=transHist">Transactions</a>

<div class="table-list-group">	
	<table>
	    <thead>
	        <tr>
	            <th>Transaction Id</th>
	            <th>Date</th>
	            <th>Book Id</th>
	            <th>User Id</th>
	            <th>Amount</th>
<!-- 	            <th colspan=3>Action</th> 
-->
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach items="${transactions}" var="transaction">
	            <tr>
	                <td><c:out value="${transactions.transactionId}" /></td>
	                <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${transactions.transactionDate}" /></td>
	                <td><c:out value="${transactions.bookId}" /></td>
	                <td><c:out value="${transactions.userId}" /></td>
	                <td><c:out value="${transactions.transactionAmount}" /></td>
<!--  	                <td><a href="UserController?action=edit&userId=<c:out value="${user.userid}"/>">Update</a></td> 
-->
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
</div>
