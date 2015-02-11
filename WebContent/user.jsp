<script>
    $(function() {
        $('input[name=dob]').datepicker();
    });
</script>

<form method="POST" action='UserController' name="frmAddUser">
<%--     <input type="text" readonly="readonly" name="userid" placeholder="User ID" value="<c:out value="${user.userid}" />" />
 --%>    <input type="text" name="firstName" placeholder="First Name" value="<c:out value="${user.firstName}" />" />
    <input type="text" name="lastName" placeholder="Last Name" value="<c:out value="${user.lastName}" />" />
    <input type="text" name="dob" placeholder="Date of Birth (MM/DD/YYYY)" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${user.dob}" />" /> 
    <input type="text" name="email" placeholder="Email Address" value="<c:out value="${user.email}" />" />
    <button type="submit">Add User</button>
</form>

