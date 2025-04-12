<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="index.css">
</head>
<%!
	
%>
<body	class="box-fit" style="background-image: url('bg1.jpg'); background-repeat: no-repeat; background-size: cover;">

    <div class="login-box">
        <h1>Welcome</h1>
        <form action="ValidateUser" method = "Get">
        	<div>
            <label for="name"   >Enter your name :</label><br>
            <input type="text" id="name" name="name">
	        </div>
	        <div>
	            <label for="email"   >Enter your email:</label><br>
	            <input type="email" id="email" name = "email">
	        </div>
	        <div>
	            <label for="pass"   >Enter your password :</label><br>
	            <input type="password" id="pass" name = "password">
	        </div>
	        <div class="robot">
	            <input type="checkbox" id="robot" >
	            <label for="robot">i'm not robot</label>
	        </div><br>
	       
	        <div class="submit">
	        	 <input type = "submit" value = "submit" >
	             
	        </div>
        
        </form> 
        <div>
            <a href="">forget password?</a>
            <a href= "">sign up?</a>
        </div>

    </div>
    
    git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/sheechakrawarty/ChildLiteracy.git
git push -u origin main
    
    <script src="login.js"></script>

</body>
</html>