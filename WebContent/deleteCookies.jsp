<%
	
	Cookie[] cookies = request.getCookies();	/* Get array of cookies from request obj */
    for(int i = 0; i < cookies.length; i++) {   /* Loop over each cookie and delete it */
       	cookies[i].setMaxAge(0);	
       	response.addCookie(cookies[i]);
	}
	
    // System.out.println("...All cookies crumbled (deleted)");
%>
