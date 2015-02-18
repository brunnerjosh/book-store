<!-- HEADER BAR -->
<%@ include file = "/partials/header.jsp" %>

<<<<<<< HEAD
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
        Photo : <input type="file" name="photoUrl" value="<c:out value="${book.photo }" />" />
            <input type="submit" value="Submit" />
=======
<div class="container">
	<!-- <script>
	    $(function() {
	        $('input[name=dob]').datepicker();
	    });
	</script> -->
	<div id="add-user-details" class="add-entity as-user-entry">
		<p class="as-header">Enter book details:</p>
		<form method="POST" action='BookController' name="frmAddBook">
			<input type="text" placeholder="Book ID" readonly="readonly" name="bookId" value="<c:out value="${book.bookId}" />" />
			<input type="text" placeholder="Book Title" name="title" value="<c:out value="${book.title}" />" />
			<input type="text" placeholder="Author" name="author" value="<c:out value="${book.author}" />" />
			<input type="text" placeholder="Inventory Amount" name="inventoryAmount" value="<c:out value="${book.inventory}" />" />
			<input type="text" placeholder="Publisher" name="publisher" value="<c:out value="${book.publisher}" />" />
			<input type="text" placeholder="Publication Year" name="publicationYear" value="<c:out value="${book.yearPublished}" />" />
			<input type="text" placeholder="Category" name="category" value="<c:out value="${book.category}" />" />
			<input type="text" placeholder="Price" name="price" value="<c:out value="${book.price}" />" />
			<input type="text" placeholder="Review Rating" name="reviewRating" value="<c:out value="${book.reviewRating}" />" />
			<button type="submit">Submit</button>
			<a href="BookController?action=listBook">Cancel</a>
>>>>>>> brunnerjosh/bookDisplay
	</form>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
