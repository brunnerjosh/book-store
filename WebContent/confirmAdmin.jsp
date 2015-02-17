<jsp:useBean id="prospect" class="model.User"/>
<%
String nameStr = (String) session.getAttribute("username");

if(nameStr != null && prospect.isAdminName(nameStr)){
	System.out.println("Admin credentials verified");
} else {
	System.out.println("Credentials NOT verified");
	response.sendRedirect("index.jsp");
}


%>
