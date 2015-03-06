 <!-- HEADER BAR -->
 <%@ include file = "/partials/header.jsp" %>
 <div class="container">
  <!-- <script>
      $(function() {
          $('input[name=dob]').datepicker();
      });
  </script> -->
  <div id="add-user-details" class="add-entity as-user-entry">
    <p class="as-header">Enter transaction details:</p>
	  <sql:setDataSource
      url="jdbc:mysql://localhost:3306/bookstore"
      driver="com.mysql.jdbc.Driver"
      user="root"
      password=""
      var="bookstoreData"/>

  	 <sql:query sql="SELECT * FROM Bookstore.users"
      dataSource="${bookstoreData}"
      var="users"/>
     <sql:query sql="SELECT * FROM Bookstore.books"
     dataSource="${bookstoreData }"
     var="books" />

    	<form method="POST" action='RatingController' name="frmAddRating">
        <input placeholder="RatingID" type="hidden" name="ratingId" value="<c:out value="${rating.ratingId}" />" /> <br />
        <input placeholder="UserID" type="text" name="userId" value="<c:out value="${rating.userId}" />" />
        <select name="user_id_names">
          <c:forEach var="row" items="${users.rowsByIndex}">
            <option><c:out value="${row[0]}"/> <c:out value="${row[1]}"/></option>
          </c:forEach>
        </select>   * this is to ensure an actual User<br /> <!-- Should I route the book info in here? -->

        <input placeholder="BookID" type="text" name="bookId" value="<c:out value="${rating.bookId}" />" />
        <select name="book_id_names">
          <c:forEach var="row" items="${books.rowsByIndex}">
            <option><c:out value="${row[0]}"/> <c:out value="${row[1]}"/></option>
          </c:forEach>
        </select> * this is to ensure an actual Book <br /> <!-- Should I route the user info in here? -->
        <input placeholder="Date of Transaction (MM/DD/YYYY)" type="text" name="ratingDate"  value="<fmt:formatDate pattern="MM/dd/yyyy" value="${rating.ratingDate}" />" /> <br />
        <input placeholder="Rating" type="text" name="rating" value="<c:out value="${rating.rating}" />" /> <br />
        <button type="submit">Submit</button>
    	<a href="RatingController?action=listRating">Cancel</a>
    	</form>

	  </div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
