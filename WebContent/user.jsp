 <!-- HEADER BAR -->
 <%@ include file = "/partials/header.jsp" %>

<<<<<<< HEAD
<<<<<<< HEAD
    <form method="POST" action='UserController' name="frmAddUser">
        User ID : <input type="text" readonly="readonly" name="userid"
            value="<c:out value="${user.userid}" />" /> <br /> 
        First Name : <input
            type="text" name="firstName"
            value="<c:out value="${user.firstName}" />" /> <br /> 
        Last Name : <input
            type="text" name="lastName"
            value="<c:out value="${user.lastName}" />" /> <br /> 
        DOB : <input
            type="text" name="dob"
            value="<fmt:formatDate pattern="MM/dd/yyyy" value="${user.dob}" />" /> <br /> 
        Email : <input type="text" name="email"
            value="<c:out value="${user.email}" />" /> <br />
        Password : <input type="text" name="password"
            value="<c:out value="${user.password}" />" /> <br />
             <input type="submit" value="Submit" />
    </form>
</body>
</html>
=======
<form method="POST" action='UserController' name="frmAddUser">
	<input type="text" readonly="readonly" name="userid" placeholder="User ID" value="<c:out value="${user.userid}" />" />
    <input type="text" name="firstName" placeholder="First Name" value="<c:out value="${user.firstName}" />" />
    <input type="text" name="lastName" placeholder="Last Name" value="<c:out value="${user.lastName}" />" />
    <input type="text" name="dob" placeholder="Date of Birth (MM/DD/YYYY)" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${user.dob}" />" />
    <input type="text" name="email" placeholder="Email Address" value="<c:out value="${user.email}" />" />
    <button type="submit">Submit</button>
</form>
>>>>>>> FETCH_HEAD
=======
<div class="container">
	<!-- <script>
	    $(function() {
	        $('input[name=dob]').datepicker();
	    });
	</script> -->
	<div id="add-user-details" class="add-entity as-user-entry">
		<p class="as-header">Enter user details:</p>
		<form method="POST" action='UserController' name="frmAddUser">
		    <input type="text" readonly="readonly" name="userid" placeholder="User ID" value="<c:out value="${user.userid}" />" />
		    <input type="text" name="firstName" placeholder="First Name" value="<c:out value="${user.firstName}" />" />
		    <input type="text" name="lastName" placeholder="Last Name" value="<c:out value="${user.lastName}" />" />
		    <input type="text" name="dob" placeholder="Date of Birth (MM/DD/YYYY)" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${user.dob}" />" />
		    <input type="text" name="email" placeholder="Email Address" value="<c:out value="${user.email}" />" />
		    <button type="submit">Submit</button>
		    <a href="UserController?action=listUser">Cancel</a>
		</form>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>
>>>>>>> brunnerjosh/bookDisplay
