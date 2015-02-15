<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Show All Ratings</title>
</head>
<body>
    <script>
        //ratingId
        //userId
        //bookId
        //ratingDate
        //rating
    </script>
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
    <p><a href="RatingController?action=insert">Add Rating</a></p>
</body>
</html>