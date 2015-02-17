<jsp:useBean id="user" class="model.User"/>
<jsp:useBean id="myUser" class="model.User"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>

<!-- CREATE COOKIES -->
<%@ include file = "/createCookies.jsp" %>

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
