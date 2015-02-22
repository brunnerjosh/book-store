<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add a Photo</title>
	<body>

		<form action="phoAdd.jsp" method="post" enctype="multipart/form-data">
			<fieldset>
				<p> Book ID: <input type="text" name="bookId" id="bookId"/></p>
				<script>
					var query_string = {};
					var query = window.location;
					var search = query.search;
					search = search.split('=');
					var id = search[1];
					document.getElementById('bookId').value = id;
				</script>
				<p>Upload Your Picture1: <input type="file" name="pic" id="pic"/></p>
				<input type="submit" value="Upload" id="submit"/>
			</fieldset>
		</form>
		<script>
   	/* 
		var elSubmit = document.getElementById('submit');
		elSubmit.onclick =loginCheck; */
	</script>
	</body>
</html>