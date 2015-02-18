<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link type="text/css"
	    href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
	<title>Add new/Edit book</title>
	</head>
	<body>
	
	<form method="POST" action='BookController' name="frmAddBook">
		Book ID : <input type="text" readonly="readonly" name="bookId"
            value="<c:out value="${book.bookId}" />" /> <br /> 
		Title : <input type="text" name="title"
            value="<c:out value="${book.title}" />" /> <br /> 
		Author : <input type="text" name="author"
            value="<c:out value="${book.author}" />" /> <br />
		Inventory Amount : <input type="text" name="inventoryAmount"
            value="<c:out value="${book.inventory}" />" /> <br />
		Publisher : <input type="text" name="publisher"
            value="<c:out value="${book.publisher}" />" /> <br />
		Publication Year : <input type="text" name="publicationYear"
            value="<c:out value="${book.yearPublished}" />" /> <br />
		Category : <input type="text" name="category"
            value="<c:out value="${book.category}" />" /> <br />
		Price : <input type="text" name="price"
            value="<c:out value="${book.price}" />" /> <br />
		Review Rating : <input type="text" name="reviewRating"
            value="<c:out value="${book.reviewRating}" />" /> <br />
            <input type="submit" value="Submit" />
	</form>
	</body>
</html>