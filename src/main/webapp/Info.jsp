<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		HttpSession httpSession = request.getSession();
		String userName = (String)httpSession.getAttribute("userName");
		String email = (String)httpSession.getAttribute("email");
		String password = (String)httpSession.getAttribute("password");
	%>
    <h1>My name is : <%= userName %></h1>
    <div>My email is : <%= email %></div>
    <div> My Password is : <%= password %></div>
</body>
</html>