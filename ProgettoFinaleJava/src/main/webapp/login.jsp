<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>


</head>
<style>
body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	background-color: #eedba9;
	font-family: Arial, sans-serif;
	margin: 0;
}

ul.menu-nav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #3e7cac;
}

.menu-nav li {
	display: inline;
	float: left;
}

.menu-nav li a {
	display: block;
	color: white;
	text-align: center;
	padding: 15px;
	text-decoration: none;
	font-weight: bold;
}

.menu-nav li a:hover {
	background-color: lightblue;
}

h1 {
	text-align: center;
	margin-top: 20px;
}


div.container-input{
	background-color: #d3b7f2;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
	
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 450px;
	
}

input{
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	margin: 10px 0;
	
	
}

button{
	width: 100%;
	padding: 10px;
	background-color: #8ec8ae;
	border-radius: 5px;
	cursor: pointer;
	
}

button:hover{
	background-color: green;
}

#message{
	margin-top: 10px;
	color: red;	
}

footer {
	padding: 10px;
	text-align: center;
	background-color: #3e7cac;
	color: white;
	margin-top: auto;
}

footer p {
	margin: 5px 0;
}

footer img {
	width: 30px;
	height: auto;
	border-radius: 5px;
	vertical-align: middle;
	margin-right: 5px;
}

</style>
<body>

<ul class="menu-nav">
<li><a href="index.jsp">HOME</a></li>
<li><a href="login.jsp">LOGIN</a></li>
<li><a href="register.jsp">REGISTRATI</a></li>
<% if (session.getAttribute("user") != null) { %>
    <li><a href="logout.jsp">LOGOUT</a></li>
<% } %>
</ul>
<h1>Procedi con il Login</h1>
<div class="container">
<div class="container-input">
<h2>Fai il login</h2>
<form action="login.co" method="POST">
    <label for="email" class="form-label">Email</label>
    <input type="email" class="form-control" id="email" placeholder="Inserisci la tua email" name="email" required>
    
    <label for="password" class="form-label">Password</label>
    <input type="password" class="form-control" id="password" placeholder="Inserisci la tua password" name="password" required>
    
    <button type="submit">Invia</button>
</form>
</div>
</div>

<% String error = request.getParameter("error");
if("true".equals(error)){
    %>
    <p style="color: red">Email o password errati</p>
    <% 
}
%>

<footer>
	<p>Contatti: francesco@faedda.it</p>
	<p>
		<img src="./img/instagram.jpg" alt="logo instagram"> InstaLibreriaOnline
		<img src="./img/facebook.jpg" alt="logo facebook"> FaceLibreriaOnline
	</p>
</footer>

</body>
</html>
