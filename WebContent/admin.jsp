<%@ include file = "/partials/header.jsp" %> <!-- HEADER -->
<%@ include file = "/partials/navigation.jsp" %> <!-- NAVIGATION BAR -->

<%@ include file = "/confirmAdmin.jsp" %> <!-- ADMIN ACCESS ONLY -->

<!-- MAIN BODY CONTENT -->
<div class="container">
  <div>
    <h1>Admin Dashboard</h1>

    <!-- <div class="item-list-group">
      <div class="side-left">
        <div class="side-left">
          <a href="/UserController?action=listUser" class="list-item">Users</a>
          <a href="/BookController?action=listBook" class="list-item">Books</a>
          <a href="/TransactionController?action=listTransaction" class="list-item">Transactions</a>
          <a href="/RatingController?action=listRating" class="list-item">Ratings</a>
        </div>
      </div>
    </div> -->

    <%-- DISPLAY COOKIES --%>
  <%--   <%@ include file = "displayCookies.jsp" %> --%>
	<div class="pane-left">
		<div class="left-pane-wrapper">
			<h3>Make Changes</h3>
			<p>Note that changes to these items goes against the normal "flow" of interactions. Nevertheless, in some instances, it may be necessary to modify a particular item in the database. Proceed with caution.
			<div class="admin-link-group">
				<ul>
					<li><a href="/UserController?action=listUser" class="list-item">Users</a></li>
				    <li><a href="/BookController?action=listBook" class="list-item">Books</a></li>
				    <li><a href="/TransactionController?action=listTransaction" class="list-item">Transactions</a></li>
				    <li><a href="/RatingController?action=listRating" class="list-item">Ratings</a></li>
			    </ul>
		    </div>
	    </div>
	</div>
	<div class="pane-right">
		<a href="/dashboard-analytics.jsp">View Analytics</a>
		<div class="analytics-right-section">
			<%@include file="view_timebasedSales.jsp" %>
		</div>
	</div>    
  </div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
