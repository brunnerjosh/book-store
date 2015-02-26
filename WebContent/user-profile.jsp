<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<jsp:useBean id="userDao" class="dao.UserDao"/>

<%
Date currDate = new Date();
int userID = 0;
if(user != null){
	userID = user.getUserid();
	%>
	
	<div class="container as-user-profile">
		<h1>User Profile</h1>
		<div class="user-profile-panel">
			<div class="pane-left">
				<img class="person-img" src="images/default-user.png" />
			</div>
			<div class="pane-right">
				<h2><%=user.getFirstName() %> <%=user.getLastName() %></h1>
				<p class="muted">born in <%=user.getDob() %></p>
	
				<div class="book-details">
					<h4>User Stats:</h4>
					<p>books purchased: <strong><%=userDao.countBooksPurchased(user.getUserid()) %></strong>&nbsp &nbsp <a href="TransactionController?action=transHist&userId=<%=user.getUserid()%>">View Transactions</a></p>
					<p>ratings made: <strong><%=userDao.countRatingsMade(user.getUserid()) %></strong>&nbsp &nbsp <a href="TransactionController?action=transHist&userId=<%=user.getUserid()%>">View Ratings</a></p>
				</div>
			</div>
		</div>
	
	</div>
	<%
} else {
	out.print("<div class=\"container\"><h1>You're not signed in!</h1></div>");
}
	%>
	
<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
