<!-- HEADER -->
<%@ include file = "/partials/header.jsp" %>

<!-- NAVIGATION BAR -->
<%@ include file = "/partials/navigation.jsp" %>

<!-- ADMIN ACCESS ONLY -->
<%@ include file = "/confirmAdmin.jsp" %>

<!-- MAIN BODY CONTENT -->
<div class="container">
  <div>
    <h1>Quest: An Online Bookstore</h1>

    <div class="item-list-group">
      <div class="side-left">
        <div class="side-left">
          <a href="/UserController?action=listUser" class="list-item">Users</a>
          <a href="/BookController?action=listBook" class="list-item">Books</a>
          <a href="/TransactionController?action=listTransaction" class="list-item">Transactions</a>
          <a href="/RatingController?action=listRating" class="list-item">Ratings</a>
        </div>
      </div>
    </div>

    <a href="BookController?action=bookDisplay">View Books</a>

  </div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
