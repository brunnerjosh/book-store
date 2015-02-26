 <!-- HEADER BAR -->
 <%@ include file = "/partials/header.jsp" %>
 <%@ include file = "/partials/navigation.jsp" %>

<div class="container">
	<div id="add-user-details" class="add-entity as-user-entry">
		<p class="as-header">Update your settings<span class="s-red">*</span>:</p>
		<form method="POST" action='UserController?action=update-settings' name="update-settings">
		    <input type="hidden" readonly="readonly" name="userid" placeholder="User ID" value="<%=user.getUserid() %>" />
		    <input type="text" name="firstName" placeholder="First Name" value="<%=user.getFirstName() %>" />
		    <input type="text" name="lastName" placeholder="Last Name" value="<%=user.getLastName() %>" />
		    <input type="text" name="dob" placeholder="Date of Birth (MM/DD/YYYY)" value="<fmt:formatDate pattern="MM/dd/yyyy" value="<%=user.getDob() %>" />" />
		    <input type="text" name="email" placeholder="Email Address" value="<%=user.getEmail() %>" />
		    <input type="text" name="password" placeholder="Password" value="<%=user.getPassword() %>" />
		    <button type="submit">Submit</button>
		    <a href="user-profile.jsp">Cancel</a>
		    <p class="s-red">*Log out for changes to take effect</p>
		</form>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>

