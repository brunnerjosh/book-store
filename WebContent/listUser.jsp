<a onclick="toggleElement('table-list-group')" href="UserController?action=listUser">List Users</a>

<div class="table-list-group">	
	<table>
	    <thead>
	        <tr>
	            <th>User Id</th>
	            <th>First Name</th>
	            <th>Last Name</th>
	            <th>DOB</th>
	            <th>Email</th>
	            <th colspan=2>Action</th>
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
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
</div>
