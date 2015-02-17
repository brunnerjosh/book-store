 <!-- HEADER BAR -->
 <%@ include file = "/partials/header.jsp" %>
	  <sql:setDataSource 
      url="jdbc:mysql://localhost:3306/Bookstore" 
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
    
	
	<form method="POST" action='TransactionController' name="frmAddTransaction">
		Transaction ID : <input type="text" readonly="readonly" name="transactionId"
            value="<c:out value="${transaction.transactionId}" />" /> <br /> 
		Transaction Date : <input type="text" name="transactionDate"
            value="<fmt:formatDate pattern="MM/dd/yyyy" value="${transaction.transactionDate}" />" /> <br /> 
		User ID : <input type="text" name="userId"
            value="<c:out value="${transaction.userId}" />" /> 
            <select name="user_id_names">
			      <c:forEach var="row" items="${users.rowsByIndex}">
			       <option><c:out value="${row[0]}"/> <c:out value="${row[1]}"/></option>
			      </c:forEach>
  			 </select>   * this is to ensure an actual User<br /> <!-- Should I route the book info in here? -->
        Book ID : <input type="text" name="bookId"
            value="<c:out value="${transaction.bookId}" />" /> 
            <select name="book_id_names">
			      <c:forEach var="row" items="${books.rowsByIndex}">
			       <option><c:out value="${row[0]}"/> <c:out value="${row[1]}"/></option>
			      </c:forEach>
  			 </select> * this is to ensure an actual Book<br /> <!-- Should I route the user info in here? -->
		Transaction Amount : <input type="text" name="transactionAmount"
            value="<c:out value="${transaction.transactionAmount}" />" /> <br />
		<input type="submit" value="Submit" />
	</form>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>