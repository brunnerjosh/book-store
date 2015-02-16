<jsp:useBean id="user" class="model.User"/>
<%-- <jsp:useBean id="userDao" class="dao.UserDao"/> --%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	if (user.isAdmin(username, password)) {
		session.setAttribute("username", username);
		response.sendRedirect("admin.jsp");
	} else
		response.sendRedirect("index.jsp");
%>
