<%
String nameStr = (String) session.getAttribute("username");
if(user.isAdminName(nameStr)){
	System.out.println("Admin credentials verified");
} else {
	response.sendRedirect("index.jsp");
}
%>
