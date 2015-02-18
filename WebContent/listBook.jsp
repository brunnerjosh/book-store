<a class="s-right" href="BookController?action=insert">Add Book</a>
<a href="BookController?action=listBook">List Books</a>

<div class="table-list-group">
	<table border=1>
		<thead>
			<tr>
				<th>Book ID</th>
				<th>Title</th>
				<th>Author</th>
				<th>Inventory</th>
				<th>Publisher</th>
				<th>Publication Year</th>
				<th>Category</th>
				<th>Price</th>
				<th>Review Rating</th>
				<!-- <th>Update</th>
				<th>Delete</th> -->
				<th colspan=2>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${books}" var="book">
				<tr>
					<td><c:out value="${book.bookId}" /></td>
					<td><c:out value="${book.title}" /></td>
					<td><c:out value="${book.author}" /></td>
					<td><c:out value="${book.inventory}" /></td>
					<td><c:out value="${book.publisher}" /></td>
					<td><c:out value="${book.yearPublished}" /></td>
					<td><c:out value="${book.category}" /></td>
					<td><c:out value="${book.price }"/></td>
					<td><c:out value="${book.reviewRating}" /></td>
					<td><a href="BookController?action=edit&bookId=<c:out value="${book.bookId}"/>">Update</a></td>
	                  	<td><a href="BookController?action=delete&bookId=<c:out value="${book.bookId}"/>">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
