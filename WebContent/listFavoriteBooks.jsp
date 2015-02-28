<div class="table-list-group">
    <table border=1>
        <thead>
            <tr>
                <th>Book ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${ratings	}" var="rating">
                <tr>
                    <td><c:out value="${rating.bookId}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
