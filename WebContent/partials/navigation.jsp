<jsp:useBean id="user" class="model.User"/>
<%
user = (model.User) session.getAttribute("loggedInUser");
boolean loggedIn = false;
boolean isAdmin = false;

 if(user != null){
	loggedIn = true;
	if(user.isAdmin()){
		isAdmin = true;
	}
}

%>

<!-- VARIABLES -->
<c:set var="userIsAdmin" value="<%=isAdmin %>" />
<c:set var="isSignedIn" value="<%=loggedIn %>" />
<div class="container">
	<div class="main-nav item-list-group clearfix">
		<div class="side-left">
			<a href="/" class="list-item">Products</a>
			<c:choose>
				<c:when test="${userIsAdmin == true}">
					<a href="admin.jsp" class="list-item">Admin</a>
				</c:when>
			</c:choose>
		</div>
		<div class="side-right">
			<a class="list-item" id="shopping-bag" onclick="viewShoppingBag()">Bag</a>

			<c:set var="isSignedIn" value="<%=loggedIn %>" />
			<c:choose>
				<c:when test="${isSignedIn == true}">
					<%=user.getFirstName() %> :
					<a href="logOut.jsp" class="list-item">Log out</a>
				</c:when>
				<c:otherwise>
					<a class="list-item" id="signin" onclick="toggleLogIn()">Sign In</a>
					<a href="signUp.jsp" class="list-item" id="singup">Sign Up</a>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<%@ include file="signin.jsp" %>
	<%@ include file="shopping-bag.jsp" %>
</div>
