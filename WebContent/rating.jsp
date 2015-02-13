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
	<title>Add new/Edit Ratings</title>
	</head>
	<body>
	<script>
		//ratingId
		//userId
		//bookId
		//ratingDate
		//rating
	</script>
	<form method="POST" action='RatingController' name="frmAddRating">
		rating ID : <input type="text" readonly="readonly" name="ratingId"
            value="<c:out value="${rating.ratingId}" />" /> <br /> 
		User ID : <input type="text" name="userId"
            value="<c:out value="${rating.userId}" />" /> <br /> <!-- Should I route the book info in here? -->
		Book ID : <input type="text" name="bookId"
            value="<c:out value="${rating.bookId}" />" /> <br /> <!-- Should I route the user info in here? -->
		Rating Date : <input type="text" name="ratingDate"
            value="<c:out value="${rating.ratingDate}" />" /> <br /> 
		Rating Amount : <input type="text" name="ratingAmount"
            value="<c:out value="${rating.ratingAmount}" />" /> <br />
		<input type="submit" value="Submit" />
	</form>
	</body>
</html>