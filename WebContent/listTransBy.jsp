<jsp:useBean id="bookAccess" class="dao.BookDao"/>
<jsp:useBean id="topBook" class="model.Book"/>
<jsp:useBean id="transUser" class="model.User"/>
<jsp:useBean id="userDao" class="dao.UserDao"/>
<jsp:useBean id="transaction" class="model.Transaction"/>
<%@ page import = "java.util.*, model.Transaction" %>
<%
String sortByType = request.getAttribute("sortByType").toString();
List<Transaction> myTrans = (List<Transaction>) request.getAttribute("transactions");
if(myTrans != null){
	System.out.println("myTrans object: " + myTrans.toString());	
} else {
	System.out.println("myTrans was NULL");
}

%>
<div class="analytics-right-section">
	<h2>View Transactions By <%=sortByType %></h2>
	<form method="post" action="processTransSort.jsp">
		View transactions 
		<%
		String threshold = request.getParameter("threshold");
		String priceLimit = request.getParameter("priceLimit");
		if(threshold == null && priceLimit == null){
			threshold = "";
			priceLimit = "";
		}
		%>
		<input type="text" id="thresholdParam" name="thresholdParam" value="<%=threshold %>" placeholder="ABOVE or BELOW" required>
		<input type="text" id="priceLimit" name="priceLimit" value="<%=priceLimit %>" placeholder="$$$" required>
		<input type="submit" value="View Transactions">
	</form>

	<%
		if(myTrans != null){
			int sharedTransId = 0; // Initialize sharedTransId
			int sharedTransId_old = 0;
			int sharedTransId_next = 0;
			int myTransSize = myTrans.size();
			boolean hasMoreContents = true;
			
			for(int i = 0; i < myTransSize; i++){
				
				//If the list has an item, save the shared id from it
				sharedTransId = myTrans.get(i).getSharedTransID(); //save current sharedTransId	
				
				//If there's a valid next item, save the shared id from that
				if((i+1) < myTransSize){
					sharedTransId_next = myTrans.get(i+1).getSharedTransID(); //save next sharedTransId
					System.out.println(sharedTransId+":"+sharedTransId_next + " for bookIDs: " + myTrans.get(i).getBookId() + ":" + myTrans.get(i+1).getBookId());
				
				//Else there was NOT a valid item next, trigger a boolean to say so
				} else {
					hasMoreContents = false;
					sharedTransId_next = -1;
				}
				transUser = userDao.getUserById(myTrans.get(i).getUserId());
				
				%>
				
				<div class="row-section">
					<div class="order-total">Total:  &nbsp $<%=myTrans.get(i).getTransactionAmount() %></div>
					<p class="row-title">Order Number: <%=myTrans.get(i).getSharedTransID()%></p>
					<p class="row-sub">made by <%=transUser.getFirstName()%> <%=transUser.getLastName()%></p>
					<ol>
				<%
				
				//compare the current and next items while ALSO making sure that there are no more items in the list (false-positive)
				//If the two ints match, we have found a multi-part transaction
				if(sharedTransId == sharedTransId_next && hasMoreContents){
					System.out.println("Multi-Part i="+i);
					//Start a second for loop to print these results out
					int j = 0;
					int current = 0;
					int next = 0;
					int count = (i+1);
					
					out.print("<ol class=\"sub-list\">");
					for(j = i; j < count; j++){
						System.out.println("Smokin a J: " + j);
						if((j+1) < myTransSize || j == (myTransSize-1)){
							topBook = bookAccess.getBookById(myTrans.get(j).getBookId());
							System.out.println("Still within list ==> I("+i+") to J("+j+") -- transSize:" + myTransSize);
							current = myTrans.get(j).getSharedTransID();
							if((j+1) < myTransSize){
								next = myTrans.get(j+1).getSharedTransID();
							}
							%>
							
							<li class="book-item">
								<%-- <div class="shared-transID">Transaction ID: <%=myTrans.get(j).getSharedTransID() %> for <%=myTrans.get(j).getBookId() %></div> --%>
								<img class="book-photo" src="<%=topBook.getPhoto() %>" />
						        <div class="book-title"><%=topBook.getTitle() %></div> 
						        <div class="book-info">by <%=topBook.getAuthor() %></div>
							</li>
							<%
							count++;
						} else {
							System.out.println("RAN OUT OF CONTENTS on " + topBook.getTitle() + " with j=" + j);
							hasMoreContents = false;
						}
						
						System.out.println("Comparing " + current + " : " + next);
						// If the next transaction DOES NOT have the same shared ID, error out with -1 
						if(current != next){
							System.out.println("Erroring out!");
							count = -1;
						}
					}
					out.print("</ol>");

					System.out.println("Setting I("+i+") to J("+j+")");
					i = (j-1); //set i (from the parent for loop) to j when for loop completes (fast-forward)
					
					
				//Else the two ints DID NOT MATCH, print out a single item transaction
				} else {
					
					System.out.println("Single-Part");
					topBook = bookAccess.getBookById(myTrans.get(i).getBookId());
					%>
					<li class="book-item">
						<%-- <div class="shared-transID">Transaction ID: <%=myTrans.get(i).getSharedTransID() %> for <%=myTrans.get(i).getBookId() %></div> --%>
						<img class="book-photo" src="<%=topBook.getPhoto() %>" />
				        <div class="book-title"><%=topBook.getTitle() %></div> 
				        <div class="book-info">by <%=topBook.getAuthor() %></div>
					</li>
					<%
				}
				%>
				</ol>
				</div>
				<%
			}
		}
	%>
</div>