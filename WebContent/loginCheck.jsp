<jsp:useBean id="user" class="model.User"/>
<jsp:useBean id="myUser" class="model.User"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>

<%--
		Once authenticated, I need to request the user from the UserDao?
		With this User object, I need to set up a set of cookies containing
		all the parameters nessessary to perform "daily" tasks on the website.
		For example, I'll need to save thier userid to a cookie so that when
		they click "buy" on a book, their userid is the one that gets recorded.
--%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	user = userDao.authCreds(email, password); /* Get the authenticated user */
	if(user != null){
	  System.out.println("User is authenticated");
	  out.print( user.getFirstName());
	  session.setAttribute("loggedInUser", user); /* Save this User object to the session */
%>
	<%@ include file = "/createCookies.jsp" %> <!-- CREATE COOKIES -->
<%
		response.sendRedirect("admin.jsp");
	} else {
	  System.out.println("User is NOT authenticated");
	  response.sendRedirect("index.jsp"); /* Will redirect to a sign up page */
	}

  // myUser = userDao.getUserById(60);
  // System.out.println(myUser.toString());

	/* if (user.isAdmin(email, password)) {
		session.setAttribute("email", email);
		response.sendRedirect("admin.jsp");
	} else
		response.sendRedirect("index.jsp"); */
%>
