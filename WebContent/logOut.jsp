<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<!-- DELETE COOKIES -->
	<%@ include file = "/deleteCookies.jsp" %>
	<%
		session.removeAttribute("username");
		session.removeAttribute("password");
		session.invalidate();
		response.sendRedirect("index.jsp");
	%>
</body>
</html>
