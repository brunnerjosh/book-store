<!-- SPECIAL INCLUDES -->
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="dao.BookDao" %>
<%
	BookDao dao = new BookDao();

	// Check that we have a file upload request
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	Enumeration<String> paramterNames = request.getParameterNames();
	
	while (paramterNames.hasMoreElements()){
		String parameterName = paramterNames.nextElement();
		String[] paramValues = request.getParameterValues(parameterName);
		for (int i = 0; i < paramValues.length; i++) {
			String paramValue = paramValues[i];
		}
	}
	
	if (isMultipart) {
		// Configure a repository parameter
		ServletContext context = pageContext.getServletContext();
		
		String filePath = context.getInitParameter("file-upload");
		
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		try{ 
			// Parse the request to get file items.
			List<FileItem> items = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator<FileItem> iter = items.iterator();
			String bookId = "";
			int indx = 1;
			while (iter.hasNext ()){
				FileItem fi = iter.next();
				if ( fi.isFormField () ){
					// Process a regular form field
	            	String otherFieldName = fi.getFieldName();
	            	String otherFieldValue = fi.getString();
	            	
	            	if (otherFieldName.equals("bookId")){
	            		 bookId = otherFieldValue;
	            	}
	            }else{
	            	// Get the uploaded file parameters
					String fileName = fi.getName();
					String fieldName = fi.getFieldName();
					long sizeInBytes = fi.getSize();
					
					// Write the file
					File file = new File(filePath + File.separator + fileName) ;
					System.out.println("BEFORE fi.write()");
	            	fi.write( file ) ;
	            	System.out.println("AFTER fi.write()");
	            	if(!fileName.equals("")){
	            		String photoURL = "./uploadFiles/" + fileName;
	            		int id = Integer.parseInt(bookId);
	            		dao.updateBookPhoto(id, photoURL);
	            		request.setAttribute("bookId",bookId);
	            		response.sendRedirect("BookController?action=edit&bookId=" + bookId);
	            	}
	            }
			}
		}catch(IOException ex) {
		}
	}
	
%>
