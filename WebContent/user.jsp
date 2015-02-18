 <!-- HEADER BAR -->
 <%@ include file = "/partials/header.jsp" %>

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
		    <input type="text" name="password" placeholder="Password" value="<c:out value="${user.password}" />" />
		    <button type="submit">Submit</button>
		    <a href="UserController?action=listUser">Cancel</a>
		</form>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>

