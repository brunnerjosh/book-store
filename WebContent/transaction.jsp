<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link type="text/css"
	    href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
	<title>Add new/Edit Transactions</title>
	</head>
	<body>
	<script>
		//transactionId
		//transactionDate
		//bookId
		//userId
		//transactionAmount
	</script>
	  <sql:setDataSource 
      url="jdbc:mysql://localhost:3306/bookstore" 
      driver="com.mysql.jdbc.Driver"  
      user="root"
      password="password"
      var="bookstoreData"/>  
      
  	 <sql:query sql="SELECT * FROM bookstore.users" 
      dataSource="${bookstoreData}" 
      var="users"/> 
     <sql:query sql="SELECT * FROM bookstore.books"
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
	</body>
</html>