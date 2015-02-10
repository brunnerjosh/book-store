<script>
    $(function() {
        $('input[name=dob]').datepicker();
    });
</script>

<form method="POST" action='UserController' name="frmAddUser">
    <input type="text" readonly="readonly" name="userid" placeholder="User ID" value="<c:out value="${user.userid}" />" /> <br /> 
    <input type="text" name="firstName" placeholder="First Name" value="<c:out value="${user.firstName}" />" /> <br /> 
    <input type="text" name="lastName" placeholder="Last Name" value="<c:out value="${user.lastName}" />" /> <br />
    <input type="text" name="dob" placeholder="Date of Birth (MM/DD/YYYY)" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${user.dob}" />" /> <br /> 
    <input type="text" name="email" placeholder="Emaill Address" value="<c:out value="${user.email}" />" /> <br /> 
    <input type="submit" value="Submit" />
</form>
