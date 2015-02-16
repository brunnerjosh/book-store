<jsp:useBean id="prospect" class="model.User"/>
<%
String nameStr = (String) session.getAttribute("username");
if(prospect.isAdminName(nameStr)){
	System.out.println("Admin credentials verified");
} else {
	response.sendRedirect("index.jsp");
}
%>
