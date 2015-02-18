<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<!-- HEADER -->
	<%@ include file = "/partials/header.jsp" %>

<body>
	<!-- NAVIGATION BAR -->
	<%@ include file = "/partials/navigation.jsp" %>

	<!-- MAIN BODY CONTENT -->
	<div class="container">
		<div>
			<h1>Quest: An Online Bookstore</h1>

			<div class="item-list-group">
				<div class="side-left">
					<div class="side-left">
						<a class="list-item">Item 1</a>
						<a class="list-item">Item 2</a>
						<a class="list-item">Item 3</a>
						<a class="list-item">Item 4</a>
						<a class="list-item">Item 5</a>
						<a class="list-item">Item 6</a>
						<a class="list-item">Item 7</a>
					</div>
				</div>
			</div>

			<div class="products">
				<div class="product">
					<img src="images/girl-on-train.png" />
					<div class="product-info">
						<div class="product-title">Book Title</div>
						<div class="product-price">$0.00</div>
						<button class="product-purchase s-green">Add To Cart</button>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<div class="product">
					<img src="images/american-sniper.png" />
					<div class="product-info">
						<div class="product-title">Book Title</div>
						<div class="product-price">$0.00</div>
						<button class="product-purchase s-green">Add To Cart</button>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<div class="product">
					<img src="images/the-alchemist.png" />
					<div class="product-info">
						<div class="product-title">Book Title</div>
						<div class="product-price">$0.00</div>
						<button class="product-purchase s-green">Add To Cart</button>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<div class="product">
					<img src="images/the-life-changing-magic.png" />
					<div class="product-info">
						<div class="product-title">Book Title</div>
						<div class="product-price">$0.00</div>
						<button class="product-purchase s-green">Add To Cart</button>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<div class="product">
					<img src="images/american-sniper.png" />
					<div class="product-info">
						<div class="product-title">Book Title</div>
						<div class="product-price">$0.00</div>
						<button class="product-purchase s-green">Add To Cart</button>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<div class="product">
					<img src="images/the-alchemist.png" />
					<div class="product-info">
						<span class="product-title">Book Title</span>
						<span class="product-price">$0.00</span>
						<button class="product-purchase s-green">Add To Cart</button>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<div class="product">
					<img src="images/girl-on-train.png" />
					<div class="product-info">
						<div class="product-title">Book Title</div>
						<div class="product-price">$0.00</div>
						<button class="product-purchase s-green">Add To Cart</button>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<div class="product">
					<img src="images/american-sniper.png" />
					<div class="product-info">
						<div class="product-title">Book Title</div>
						<div class="product-price">$0.00</div>
						<button class="product-purchase s-green">Add To Cart</button>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<div class="product">
					<img src="images/the-alchemist.png" />
					<div class="product-info">
						<div class="product-title">Book Title</div>
						<div class="product-price">$0.00</div>
						<button class="product-purchase s-green">Add To Cart</button>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<!-- <div class="product">
					<img src="images/the-life-changing-magic.png" />
					<div class="product-info">
						<div class="product-title">Book Title</div>
						<div class="product-price">$0.00</div>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<div class="product">
					<img src="images/american-sniper.png" />
					<div class="product-info">
						<div class="product-title">Book Title</div>
						<div class="product-price">$0.00</div>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div>
				<div class="product">
					<img src="images/the-alchemist.png" />
					<div class="product-info">
						<span class="product-title">Book Title</span>
						<span class="product-price">$0.00</span>
						<%@ include file = "/partials/product-rating.jsp" %>
					</div>
				</div> -->
			</div>

			<%-- <button>Button (REGULAR)</button>
			<button class="s-large">Button (LARGE)</button>
			<button class="s-small">Button (SMALL)</button> --%>
		</div>
	</div>


	<!-- FOOTER BAR -->
	<%@ include file = "/partials/footer.jsp" %>
</body>
</html>
