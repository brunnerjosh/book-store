<a onclick="" href="user-profile.jsp">Go Back</a>

<div class="table-list-group">	
	<table>
	    <thead>
	        <tr>
	            <th>Transaction Id</th>
	            <th>Date</th>
	            <th>Book Id</th>
<!-- 	            <th>User Id</th> -->
	            <th>Amount</th>
<!-- 	            <th colspan=3>Action</th> 
-->
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach items="${transactions}" var="transaction">
	            <tr>
	                <td><c:out value="${transaction.transactionId}" /></td>
	                <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${transaction.transactionDate}" /></td>
	                <td><c:out value="${transaction.bookId}" /></td>
<!-- 	                <td><c:out value="${transaction.userId}" /></td>  -->
	                <td><c:out value="${transaction.transactionAmount}" /></td>
<!--  	                <td><a href="UserController?action=edit&userId=<c:out value="${user.userid}"/>">Update</a></td> 
-->
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
</div>
