<div class="container">
	<div class="main-nav item-list-group clearfix">
		<div class="side-left">
			<a href="/" class="list-item">Products</a>
			<a class="list-item">About</a>
		</div>
		<div class="side-right">
			<a class="list-item" id="shopping-bag" onclick="viewShoppingBag()">Bag</a>
			
			<%			
			String u_name = (String) session.getAttribute("username");
			boolean loggedIn = false;
			if(u_name != null){
				loggedIn = true;
			}
			%>
			
			<c:set var="isSignedIn" value="<%=loggedIn %>" />
			<c:choose>
				<c:when test="${isSignedIn == true}">
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
