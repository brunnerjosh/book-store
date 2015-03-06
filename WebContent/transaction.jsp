<jsp:useBean id="transDao" class="dao.TransactionDao"/>
 <!-- HEADER BAR -->
 <%@ include file = "/partials/header.jsp" %>
 
 <%
 	String transId = request.getParameter("transactionId");
 	System.out.println("trsnID being edited: " + transId);
 	int formSharedTransId = 0;
 	if(transId != null){
 		int sharedTransId = transDao.getTransactionById(Integer.parseInt(transId)).getSharedTransID();
 		formSharedTransId = sharedTransId; 
 	} else {
 		formSharedTransId = transDao.getLastId()+1;
 	}  
 	
 %>

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

<div class="container">
  <!-- <script>
      $(function() {
          $('input[name=dob]').datepicker();
      });
  </script> -->
  <div id="add-user-details" class="add-entity as-user-entry">
    <p class="as-header">Enter transaction details:</p>
      <form method="POST" action='TransactionController' name="frmAddTransaction">
          <input type="text" placeholder="Shared Transaction ID" name="sharedTransID" value="<%=formSharedTransId %>" />
          <input type="hidden" placeholder="Transaction ID" readonly="readonly" name="transactionId" value="<c:out value="${transaction.transactionId}" />" /> <br />
          <input type="text" placeholder="Transaction Date (MM/DD/YYYY)" name="transactionDate" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${transaction.transactionDate}" />" /> <br />
          <input type="text" placeholder="User ID" name="userId" value="<c:out value="${transaction.userId}" />" />
            <select name="user_id_names">
              <c:forEach var="row" items="${users.rowsByIndex}">
                <option><c:out value="${row[0]}"/> <c:out value="${row[1]}"/></option>
              </c:forEach>
            </select>   * this is to ensure an actual User<br /> <!-- Should I route the book info in here? -->
         <input type="text" placeholder="Book ID" name="bookId" value="<c:out value="${transaction.bookId}" />" />
            <select name="book_id_names">
              <c:forEach var="row" items="${books.rowsByIndex}">
                <option><c:out value="${row[0]}"/> <c:out value="${row[1]}"/></option>
              </c:forEach>
         </select> * make sure this book exists<br /> <!-- Should I route the user info in here? -->
         <input type="text" placeholder="Transaction Amount" name="transactionAmount" value="<c:out value="${transaction.transactionAmount}" />" /> <br />
    	<button type="submit">Submit</button>
    	<a href="TransactionController?action=listTransaction">Cancel</a>
  </form>
  </div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
