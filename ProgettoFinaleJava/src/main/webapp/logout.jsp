<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
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

.card {
background-color:white;
padding:30px;
}

.card img{
width: 40%;
height: auto;
margin-left: 450px;
justify-content: center;
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
<ul class = "menu-nav">
<li> <a href = "index.jsp">HOME</a> </li>
<li> <a href = "login.jsp">LOGIN</a> </li>
<li> <a href = "./register.jsp">REGISTRATI</a> </li>
<li> <a href = "logout.jsp">LOGOUT</a></li>
</ul>
<h1>Arrivederci! Torna presto a trovarci!</h1>

<div class = "card" style = "background-color:#eedba9 ">
<img src="./img/logout.jpg" alt= "immagine logout">
</div>

<footer>
	<p>Contatti: francesco@faedda.it</p>
	<p>
		<img src="./img/instagram.jpg" alt="logo instagram"> InstaLibreriaOnline
		<img src="./img/facebook.jpg" alt="logo facebook"> FaceLibreriaOnline
	</p>
</footer>


</body>
</html>