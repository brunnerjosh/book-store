<%
  Cookie[] cookies= request.getCookies();
  System.out.println(cookies);
  if(cookies != null) {
	  for(int i = 0; i < cookies.length; i++){
%>
  session name: <%=cookies[i].getName()%><br/>
  session value: <%=cookies[i].getValue()%><br/>
<%
  	}
  }
%>
