<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>profile</title>
    <link rel="stylesheet" href="profile.css">
</head>
<body>
	<div class="users" >
		<a href="UserList.jsp" class="list" >see list</a>
	</div>
    <div class="body">
        <div class="Dp">
            <img src="Dp1.jpeg" alt="" class="image">
			<div>
				<label for="img">update picture:</label>
   			 	<input type="file" name="image" accept="image/*" required class="imagein">
			</div>
            <div><h1> <%= request.getSession().getAttribute("userName") %></h1></div>
        </div>
    </div>
    <div class=" score-board">
    	<a href="Info"> Get Your info</a>
        <H1>score card</H1>
        <div class="score">
            <ul>
                <li>Email: </li>
                <li>Password: </li>
                <li>remark :</li>
                <li>Quizzes :</li>
                <li>Marks :</li>
                <li>A+ Marks :</li>
    
            </ul>
            <ul>
                <li> : </li>
                <li> : </li>
                <li> :</li>
                <li> :</li>
                <li> :</li>
                <li> :</li>
    
            </ul>
            <ul>
                <li><%= request.getSession().getAttribute("email")%> </li>
                <li><%= request.getSession().getAttribute("password")%> </li>
                <li>Brilliant</li>
                <li>2</li>
                <li>12</li>
                <li>1</li>
    
            </ul>
        </div>
    </div>
    </div>
    
</body>
</html>