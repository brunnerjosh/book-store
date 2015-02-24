<!-- HEADER BAR -->
<%@ include file = "/partials/header.jsp" %>

<div class="container">
	<div id="add-user-details" class="add-entity as-user-entry">
		<h1 class="as-header">Add a Photo:</h1>
		<form action="phoAdd.jsp" method="post" enctype="multipart/form-data">
			<fieldset>
				<p> Book ID: <input readonly type="text" name="bookId" id="bookId"/></p>
				<script>
					var query_string = {};
					var query = window.location;
					var search = query.search;
					search = search.split('=');
					var id = search[1];
					document.getElementById('bookId').value = id;
				</script>
				<p>Upload Your Picture: <input type="file" name="pic" id="pic"/></p>
				<button type="submit" id="submit">Upload Book Cover</button>
				<a href="BookController?action=listBook">Cancel</a>
			</fieldset>
		</form>
	</div>
</div>

<!-- FOOTER BAR -->
<%@ include file = "/partials/footer.jsp" %>