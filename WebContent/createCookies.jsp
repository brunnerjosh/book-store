<%
	/* Add cookie for EMAIL ADDRESS */
	Cookie email_ck = new Cookie("user_email", request.getParameter("email"));
	email_ck.setMaxAge(60*60*24);
	response.addCookie(email_ck);
	
	/* Add cookie for PASSWORD */
	Cookie password_ck = new Cookie("user_pass", request.getParameter("password"));
	password_ck.setMaxAge(60*60*24);
	response.addCookie(password_ck);
	
	System.out.println("All cookies created");
%>
