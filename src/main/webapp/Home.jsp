<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import = "javax.servlet.http.*" %>
  <%@ page import = "java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,javax.servlet.RequestDispatcher" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>children literacy</title>
    <link rel="stylesheet" href="Home.css">
</head>
<%!
		
		
	
	%>
<body>		
	<%
		HttpSession httpSession = request.getSession();
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		httpSession.setAttribute("userName",name);
		httpSession.setAttribute("email", email);
		String password = request.getParameter("password");
		httpSession.setAttribute("password", password);		
		
	
	%>
    <nav>
        <header class="nav">
            <h1 class="head">BaalChetna</h1>
            <ul class="navlist">
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="Spinner.html"> Games</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Help</a></li>
            </ul>
           <div class="profile">
             <a href="index.jsp">logout</a>
             <a href="profile.jsp">Profile</a>
            </div>
        </header>
    </nav>
    
    <div class="back">
        <a href="Quize.jsp" class="quize">tap to play quizzes</a>
        <a href="Games.html" class="quize">Games</a>
        <a href="legel_vedio.html" class="quize">legals</a>
    </div>
    <footer>
        <div class="foot">
            <details>
                <p>call us</p>
                <p>whatsApp</p>
                <p>twitter</p>
             </details>
            <p>child help line number</p>
            
        </div>
    </footer>
</body>
</html>