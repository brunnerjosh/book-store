<%			
String u_name = (String) session.getAttribute("username");
boolean loggedIn = false;
boolean isAdmin = false;

if(u_name != null){
	loggedIn = true;
	if(u_name.equals("admin")){
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
			<a class="list-item">About</a>
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
					<%=u_name %> : 
					<a href="logOut.jsp" class="list-item">Log out</a>
				</c:when>
				<c:otherwise>
					<a class="list-item" id="signin" onclick="toggleLogIn()">Sign In</a>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<%@ include file="signin.jsp" %>
	<%@ include file="shopping-bag.jsp" %>
</div>
