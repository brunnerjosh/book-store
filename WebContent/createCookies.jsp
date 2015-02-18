<%
  Cookie username_ck = new Cookie("user_name", request.getParameter("username"));
  Cookie password_ck = new Cookie("user_pass", request.getParameter("password"));
  username_ck.setMaxAge(60*60*24);
  password_ck.setMaxAge(60*60*24);
  response.addCookie(username_ck);
  response.addCookie(password_ck);
  System.out.println("All cookies created");
%>
