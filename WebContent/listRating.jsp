<a class="s-right" href="RatingController?action=insert">Add User</a>
<a href="RatingController?action=listRating">List Users</a>
<div class="table-list-group">
    <table border=1>
        <thead>
            <tr>
                <th>Rating Id</th>
                <th>User ID</th>
                <th>Book ID</th>
                <th>Rating Date</th>
                <th>Rating</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${ratings	}" var="rating">
                <tr>
                    <td><c:out value="${rating.ratingId}" /></td>
                    <td><c:out value="${rating.userId}" /></td>
                    <td><c:out value="${rating.bookId}" /></td>
                    <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${rating.ratingDate}" /></td>
                    <td><c:out value="${rating.rating}" /></td>
                    <td><a href="RatingController?action=edit&ratingId=<c:out value="${rating.ratingId}"/>">Update</a></td>
                    <td><a href="RatingController?action=delete&ratingId=<c:out value="${rating.ratingId}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
