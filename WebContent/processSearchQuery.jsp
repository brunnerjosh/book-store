<jsp:useBean id="bookDao" class="dao.BookDao"/>
<%
String searchQuery = request.getParameter("searchQuery");
System.out.println("SearchQuery: " + searchQuery);
response.sendRedirect("http://localhost:3000/BookController?action=bookDisplay&category=Search&query="+searchQuery);
%>