<a onclick="toggleElement('table-list-group')" href="UserController?action=listUser">List Users</a>

<<<<<<< HEAD
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Show All Users</title>
</head>
<body>
    <table border=1 class="userTable">
        <thead class="row-title">
            <tr>
                <th>User Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>DOB</th>
                <th>Email</th>
                <th>Password</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr id="${user.userid}">
                    <td id="${user.userid}"><c:out value="${user.userid}" /></td>
                    <td id="${user.firstName}"><c:out value="${user.firstName}" /></td>
                    <td id="${user.lastName}"><c:out value="${user.lastName}" /></td>
                    <td id="${user.dob}"><fmt:formatDate pattern="yyyy-MMM-dd" value="${user.dob}" /></td>
                    <td id="${user.email}"><c:out value="${user.email}" /></td>
                    <td id="${user.password }"><c:out value="${user.password }" /></td>
                    <td><a href="UserController?action=edit&userId=<c:out value="${user.userid}"/>">Update</a></td>
                    <td><a href="UserController?action=delete&userId=<c:out value="${user.userid}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="UserController?action=insert">Add User</a></p>
</body>
</html>
=======
<div class="table-list-group">
	<table>
	    <thead>
	        <tr>
	            <th>User Id</th>
	            <th>First Name</th>
	            <th>Last Name</th>
	            <th>DOB</th>
	            <th>Email</th>
	            <th colspan=3>Action</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach items="${users}" var="user">
	            <tr>
	                <td><c:out value="${user.userid}" /></td>
	                <td><c:out value="${user.firstName}" /></td>
	                <td><c:out value="${user.lastName}" /></td>
	                <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${user.dob}" /></td>
	                <td><c:out value="${user.email}" /></td>
	                <td><a href="UserController?action=edit&userId=<c:out value="${user.userid}"/>">Update</a></td>
	                <td><a href="UserController?action=delete&userId=<c:out value="${user.userid}"/>">Delete</a></td>
	                <td><a href="UserController?action=transHist&userId=<c:out value="${user.userid}"/>">Transactions</a></td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
</div>
>>>>>>> FETCH_HEAD
