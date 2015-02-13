<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Show All Users</title>
	</head>
	<body>
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
						<td><c:out value="${book.reviewRating}" /></td>
						<td><a href="BookController?action=edit&bookId=<c:out value="${book.bookId}"/>">Update</a></td>
                    	<td><a href="BookController?action=delete&bookId=<c:out value="${book.bookId}"/>">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p><a href="BookController?action=insert">Add Book</a></p>
	</body>
</html>