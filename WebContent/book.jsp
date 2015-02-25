<!-- HEADER BAR -->
<%@ include file = "/partials/header.jsp" %>
<jsp:useBean id="bookDao" class="dao.BookDao"/>

<div class="container">
	<div id="add-user-details" class="add-entity as-user-entry">
		<p class="as-header">Enter book details:</p>
		<form method="POST" action='BookController' name="frmAddBook"> <!-- Will likely need to include enctype="multipart/form-data" -->
			<input type="hidden" placeholder="Book ID" readonly="readonly" name="bookId" value="<c:out value="${book.bookId}" />" />
			<input type="text" placeholder="Book Title" name="title" value="<c:out value="${book.title}" />" />
			<input type="text" placeholder="Author" name="author" value="<c:out value="${book.author}" />" />
			<input type="text" placeholder="Inventory Amount" name="inventoryAmount" value="<c:out value="${book.inventory}" />" />
			<input type="text" placeholder="Publisher" name="publisher" value="<c:out value="${book.publisher}" />" />
			<input type="text" placeholder="Publication Year" name="publicationYear" value="<c:out value="${book.yearPublished}" />" />
						
			<input type="text" readonly placeholder="Select Category (from dropdown)" id="selectedCategory" name="category" value="<c:out value="${book.category}" />" />
            <select id="categorySelect" class="book-categories">
	            <option>-- Select --</option>
	            <% 
	            String[] categories = bookDao.getBookCategories();
	            for(int i = 0 ; i < categories.length; i++){
	            	if(categories[i].equals("All")) continue;
	            	out.print("<option value=\"" + categories[i] +  "\">" + i + ". &nbsp " + categories[i] + "</option>");
	            }
	            %>
            </select>
 
			<input type="text" placeholder="Price $" name="price" value="<c:out value="${book.price}" />" />
			<input type="text" placeholder="Review Rating" name="reviewRating" value="<c:out value="${book.reviewRating}" />" />
			<c:if test="${not empty book }"> 
        		<input type="text" placeholder="Photo URL" readonly="readonly"  name="photo" value="<c:out value="${book.photo }" />"/>
        		<img class="bookCover" src="<c:out value="${book.photo }" />">
        		<%--TODO: change this route --%>
        		<a href="addPhoto.jsp?bookId=${book.bookId }">Add/Edit Photo</a><br>
       		</c:if>
        	<%-- <input type="file" name="photo" value="<c:out value="${book.photo }" />" /> --%>
			<button type="submit">Submit</button>
			<a href="BookController?action=listBook">Cancel</a>
	</form>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
