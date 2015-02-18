<jsp:useBean id="user" class="model.User"/>
<jsp:useBean id="myUser" class="model.User"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>

<!-- CREATE COOKIES -->
<%@ include file = "/createCookies.jsp" %>

<%--
		Once authenticated, I need to request the user from the UserDao?
		With this User object, I need to set up a set of cookies containing
		all the parameters nessessary to perform "daily" tasks on the website.
		For example, I'll need to save thier userid to a cookie so that when
		they click "buy" on a book, their userid is the one that gets recorded.
--%>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

  if(userDao.authCreds(username, password)){
    System.out.println("User is authenticated");
  } else {
    System.out.println("User is NOT authenticated");
  }

  // myUser = userDao.getUserById(60);
  // System.out.println(myUser.toString());

	if (user.isAdmin(username, password)) {
		session.setAttribute("username", username);
		response.sendRedirect("admin.jsp");
	} else
		response.sendRedirect("index.jsp");
%>
