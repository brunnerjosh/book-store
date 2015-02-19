<jsp:useBean id="prospect" class="model.User"/>
<%
prospect = (model.User) session.getAttribute("loggedInUser");
if(prospect != null && prospect.isAdmin()){
	System.out.println("Admin credentials verified");
} else {
	System.out.println("Credentials NOT verified");
	response.sendRedirect("index.jsp");
}
%>
