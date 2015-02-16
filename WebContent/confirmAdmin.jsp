<%
String nameStr = (String) session.getAttribute("username");
String adminName = "admin";
if(nameStr.equals(adminName)){
	System.out.println("Admin credentials verified");
} else {
	response.sendRedirect("index.jsp");
}
%>
