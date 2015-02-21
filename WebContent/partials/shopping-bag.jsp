<jsp:useBean id="customer" class="model.User"/>
<%@ page import = "java.util.*" %>
<%
customer = (model.User) session.getAttribute("loggedInUser");
List<Integer> totalBooksInBag = null;

if(customer != null) {
	System.out.println("Found customer");
	totalBooksInBag = customer.getBooksInBag();
} else {
	System.out.println("Didn't find customer");
}

if(totalBooksInBag != null){
	System.out.println("Shopping bag amount: " + totalBooksInBag.size());
%>
	<div class="bag-dropdown">
		<span>You have <%=totalBooksInBag.size()%> item(s) in your cart</span>
		<%
			if(totalBooksInBag.size() > 0){
		%>
				<button class="as-checkout s-large s-blue">Checkout</button>
		<%
			}
		%>
	</div>
<%
} else {
	System.out.println("List was NULL - user is NOT SIGNED IN");
%>
	<div class="bag-dropdown">
		<span>You are not signed in</span>
		<form method="post" name="signin" id="signin" action="loginCheck.jsp">
			<input type="text" placeholder="Email Address" id="email" name="email"  required>
			<input type="password" placeholder="Password" id="password" name="password"  required>
			<button type="submit" value="Log In" id="submit">Sign In</button>
		</form>
	</div>
<%
}
%>
