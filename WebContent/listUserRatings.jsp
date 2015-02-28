<a onclick="" href="user-profile.jsp">Go Back</a>

<div class="table-list-group">	
	<table>
	    <thead>
	        <tr>
                <th>Rating Id</th>
                <th>Book ID</th>
                <th>Rating Date</th>
                <th>Rating</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach items="${ratings}" var="rating">
	            <tr>
                    <td><c:out value="${rating.ratingId}" /></td>
                    <td><c:out value="${rating.bookId}" /></td>
                    <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${rating.ratingDate}" /></td>
                    <td><c:out value="${rating.rating}" /></td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
</div>
