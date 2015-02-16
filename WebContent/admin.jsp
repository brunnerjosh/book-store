<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <!-- HEADER -->
  <%@ include file = "/partials/header.jsp" %>

<body>
	
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
      <br>
      go to <a href="/UserController?action=listUser"> Users </a><br>
      go to <a href="/BookController?action=listBook"> Books </a><br>
      go to <a href="/TransactionController?action=listTransaction"> Transactions </a><br>
      go to <a href="/RatingController?action=listRating"> Ratings </a><br>

    </div>
  </div>


  <!-- FOOTER BAR -->
  <%@ include file = "/partials/footer.jsp" %>
</body>
</html>
