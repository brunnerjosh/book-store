<%!
	public static int factorial(int x){
		int c, result = 1;
		
		if (x >= 0){
			for(c =1; c<= x; c++){
				result *= c;
			}
		}
		return result;
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<div>
	Fact of 7 is <%=factorial(2) %>
</div>

</body>
</html>