<div class="container">
	<div class="main-nav item-list-group clearfix">
		<div class="side-left">
			<a href="/" class="list-item">Products</a>
			<a class="list-item">About</a>
		</div>
		<div class="side-right">
			<a class="list-item" id="signin" onclick="toggleLogIn()">Sign In</a>
			<a class="list-item" id="shopping-bag" onclick="viewShoppingBag()">Bag</a>
		</div>
	</div>
	<%@ include file="signin.jsp" %>
	<%@ include file="shopping-bag.jsp" %>
</div>
