<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<!-- HEADER -->
	<%@ include file = "/partials/header.jsp" %>

<body>
	<!-- NAVIGATION BAR -->
	<%@ include file = "/partials/navigation.jsp" %>

	<!-- MAIN BODY CONTENT -->
	<div class="container">
		<div>
			<h1>Admin Dashboard</h1>

			<div class="item-list-group">
				<div class="side-left">
					<div class="side-left">
						<a onclick="openAddBooks()" id="add-books" class="list-item">Books</a>
						<a onclick="openAddUsers()" id="add-users" class="list-item">Users</a>
					</div>
				</div>
			</div>
			
			<div id="add-book-details" class="add-entity as-book-entry">
				<h3>Enter book details:</h3>
				<form method="post">
					<input type="text" placeholder="Title" required/>
					<input type="text" placeholder="Author" required/>
					<input type="text" placeholder="Category" required/>
					<input type="text" placeholder="Publish Date" required/>
					<input type="text" placeholder="Quantity" required/>
					<input type="text" placeholder="Price (XX.XX)" required/>
					<input type="text" placeholder='ISBN' required/>
					<input type="file" name="book-cover" id="book-cover"/>
					<button type="submit">Add Book</button>
				</form>
			</div>
			
			<div id="add-user-details" class="add-entity as-user-entry">
				<h3>Enter user details:</h3>
				<%@ include file = "user.jsp" %>
			</div>
			
			<%@ include file = "listUser.jsp" %>
						
		</div>
	</div>


	<!-- FOOTER BAR -->
	<%@ include file = "/partials/footer.jsp" %>
</body>
</html>