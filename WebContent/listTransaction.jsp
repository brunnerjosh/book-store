<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Show All Transactions</title>
</head>
<body>
    <script>
        //transactionId
        //transactionDate
        //bookId
        //userId
        //transactionAmount
    </script>
    <table border=1>
        <thead>
            <tr>
                <th>Transaction Id</th>
                <th>Transaction Date</th>
                <th>Book ID</th>
                <th>User ID</th>
                <th>Transaction Amount</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${transactions}" var="transaction">
                <tr>
                    <td><c:out value="${transaction.transactionId}" /></td>
                    <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${transaction.transactionDate}" /></td>
                    <td><c:out value="${transaction.bookId}" /></td>
                    <td><c:out value="${transaction.userId}" /></td>
                    <td><c:out value="${transaction.transactionAmount}" /></td>
                    <td><a href="TransactionController?action=edit&transactionId=<c:out value="${transaction.transactionId}"/>">Update</a></td>
                    <td><a href="TransactionController?action=delete&transactionId=<c:out value="${transaction.transactionId}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="TransactionController?action=insert">Add Transaction</a></p>
</body>
</html>