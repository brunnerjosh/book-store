<jsp:useBean id="user" class="model.User"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>

<%
user = (model.User) session.getAttribute("loggedInUser");  // Get the User signed in
if(user != null){
	int bookID = Integer.parseInt(request.getParameter("bookId"));  //get the bookID from the URL
	userDao.removeFromCart(user, bookID);  //Remove from user's bag
	response.sendRedirect("checkout.jsp");  //Return to the checkout view
} else {
%>
<%@ include file = "/partials/header.jsp" %>
<div class="container as-small">
	<div class="add-to-cart">
		<h1>You must be signed in</h1>

		<form method="post" name="signin" id="signin" action="loginCheck.jsp">
			<input type="text" placeholder="Email Address" id="email" name="email"  required>
			<input type="password" placeholder="Password" id="password" name="password"  required>
			<button type="submit" value="Log In" id="submit">Sign In</button>
		</form>
		<a href="signUp.jsp">Sign Up</a>
		<p><a href="index.jsp">Cancel</a></p>
	</div>
</div>
<%@ include file = "/partials/footer.jsp" %>
<%
}
%>