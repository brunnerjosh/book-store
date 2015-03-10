<%@ include file = "/partials/header.jsp" %> <!-- HEADER -->
<%@ include file = "/partials/navigation.jsp" %> <!-- NAVIGATION BAR -->

<style type="text/css">
.help-block {
	background: white;
	border: 1px solid gray;
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
	transition: transform 300ms ease;
}
.help-block h3 {
	margin: 0;
}
.help-block h4 {
	margin: 0px 0px 0px 0px;
}
.help-block ol {
	margin: 0px;
}
.help-block:hover {
	transform: scale(1.1);
}
</style>
<!-- MAIN BODY CONTENT -->
<div class="container as-book-detail">
	<h1>Navigation Help: 
		<muted>How to use this website</muted>
	</h1>
	<h2>Scenarios</h2>
	
	<div class="help-block">
		<h3>Users Not Signed Up</h3>
		<h4>How to sign up</h4>
		<ol>
			<li>User starts at 'landing' screen</li>	
			<li>Mouse click on 'Sign Up' link</li>
			<li>Control launches 'SignUp' screen</li>
			<li>User fills in their name, date of birth, email address (this is the 'user id'), and password</li>
			<li>Use clicks on button 'Join Quest' link</li>
			<li>Control launches landing screen</li>	
		</ol>
	</div>
	
	<div class="help-block">
	    <h3>Users Not Signed In</h3>
		<h4>How to sign In</h4>
		<ol>
			<li>User starts at 'landing' screen</li>	
			<li>Mouse click on 'Sign In' link</li>
			<li>Control launches 'SignIn' dialogue</li>
			<li>User types first few letters of their login</li>
			<li>System displays all users who have a login beginning with those letters<br>
			    Note: This is a google chrome feature for users who have signed in from your computer</li>
			<li>User selects the 'User Id' that they created or the one that belongs to them</li>	
			<li>User enters their password and clicks button 'Log In' or presses 'Enter'</li>
			<li>Control launches 'Admin Dashboard' screen</li>
		</ol>
	</div>
	
	<div class="help-block">
	    <h3>Signed In Users</h3>
		<h4>How to Purchase a Book</h4>
		<ol>
			<li>User starts at the 'Admin Dashboard' screen</li>	
			<li>User clicks on link 'Browse Books'</li>
			<li>Control launches 'Book Display' screen</li>
			<li>User clicks on a book</li>
			<li>Control launches 'Book Detail' screen</li>
			<li>User clicks button 'Add to Cart'</li>	
			<li>Control launches 'Add to Cart' screen</li>
			<li>User clicks 'Checkout Now' button</li>
			<li>Control launches 'Check Out' screen</li>
			<li>User clicks 'Confirm Purchase' button</li>
			<li>Control launches 'Purchase Confirmed' screen</li>
			<li>User clicks 'View more Books' button</li>
			<li>Control launches 'Book Display' screen</li>
		</ol>
	</div>
	
	<div class="help-block">
	    <h3>Signed In Users</h3>
		<h4>How to Purchase multiple Books</h4>
		<ol>
			<li>User starts at the 'Admin Dashboard' screen</li>	
			<li>User clicks on link 'Browse Books'</li>
			<li>Control launches 'Book Display' screen</li>
			<li>User clicks on a book</li>
			<li>Control launches 'Book Detail' screen</li>
			<li>User clicks button 'Add to Cart'</li>	
			<li>Control launches 'Add to Cart' screen</li>
			<li>User clicks button 'View more Books' button.
            <li>Control launches 'Book Display' screen.
            <li>User clicks on a book.
            <li>Control launches 'Book Detail' screen.
            <li>User clicks button 'Add to Cart'
            <li>Control launches 'Add to Cart' screen.
			<li>User clicks 'Checkout Now' button</li>
			<li>Control launches 'Check Out' screen</li>
			<li>User clicks 'Confirm Purchase' button</li>
			<li>Control launches 'Purchase Confirmed' screen</li>
			<li>User clicks 'View more Books' button</li>
			<li>Control launches 'Book Display' screen</li>
		</ol>
	</div>

	<div class="help-block">
	    <h3>Signed In Users</h3>
		<h4>How to Rate a Book</h4>
		<ol>
			<li>User starts at the 'Admin Dashboard' screen</li>
			<li>User clicks on link 'Browse Books'</li>
			<li>Control launches 'Book Display' screen</li>
			<li>User clicks on a book</li>
			<li>Control launches 'Book Detail' screen</li>
			<li>User clicks pull-down list 'Add Rating'</li>
			<li>User selects desired rating from list</li>
			<li>User clicks 'Submit' button</li>
			<li>Control launches 'Confirm Rating' screen</li>
			<li>User clicks 'Go back' button</li>
			<li>Control launches 'Book Detail' screen</li>	
		</ol>
	</div>
	
	<div class="help-block">
	    <h3>Signed In Users</h3>
		<h4>How to Add a 'new' Book</h4>
		<ol>
			<li>User starts at the 'Admin Dashboard' screen</li>
			<li>User clicks on link 'View Books'</li>
			<li>Control launches 'Book Dashboard' screen</li>
			<li>User clicks on link 'Add Book'</li>
			<li>User enters book title, author, inventory amount, publisher,<br> 
			    publication year, book, category, price, and review rating</li>
			<li>User clicks button 'Submit'</li>
			<li>Control launches 'Book Dashboard' screen, shows added book</li>
		</ol>
	</div>
	
	<div class="help-block">
	    <h3>Signed In Users</h3>
		<h4>How to perform maintenance of an 'existing' Book</h4>
		<ol>
			<li>User starts at the 'Admin Dashboard' screen</li>
			<li>User clicks on link 'View Books'</li>
			<li>Control launches 'Book Dashboard' screen</li>
			<li>User clicks button 'Update'</li>
			<li>Control launches 'Book' screen</li>
			<li>User changes book title, author, inventory amount, publisher, publication year, <br>
			      book, category, price, or review rating</li>
			<li>User clicks button 'Submit'</li>
			<li>Control launches 'Book Dashboard' screen, with updated book information
		</ol>
	</div>	



	

</div>


<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>