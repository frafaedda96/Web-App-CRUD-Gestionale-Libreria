<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.app.library.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pagina dell'Admin</title>

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

table, th, td{

/*border: 2px solid black;*/
border-collapse: collapse;
}

td{
background-color: #d3b7f2;
color: black;
text-align: center;

}

th{
background-color: #d3b7f2;
border-style: solid;
}


table, th, td{
border: 1px solid black;
border-radius: 5px;


}

table{
width: 80%;

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
</style>

<body>
<% 
    User user = (User) session.getAttribute("user");
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%
if(request.getAttribute("users") == null){
	response.sendRedirect("UserList");
}

%>

<ul class="menu-nav">
<li><a href="index.jsp">HOME</a></li>
<li><a href="login.jsp">LOGIN</a></li>
<li><a href="register.jsp">REGISTRATI</a></li>
<li><a href="logout.jsp">LOGOUT</a></li>
</ul>

<h2>Lista Utenti</h2>
<table style="border: 1px solid black">
    <tr>
        <th style = "width: 4%">ID</th>
        <th style = "width: 32%"> Nome</th>
        <th style = "width: 32%">Cognome</th>
        <th style = "width: 32%">Azioni</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr style="border-bottom: 1px solid black">
            <td>${user.id}</td>
            <td style = "font-size: 30px">${user.nome}</td>
            <td style = "font-size: 30px">${user.cognome}</td>
            <td>
                <form action="UserList" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="userId" value="${user.id}"/>
                    <input type="text" name="nome" value="${user.nome}" placeholder="Nome"/>
                    <input type="text" name="cognome" value="${user.cognome}" placeholder="Cognome"/>
                    <button type="submit">Aggiorna</button>
                </form>
                <form action="UserList" method="post" style="display: inline;" onsubmit="return confirm('Sei sicuro di voler cancellare questo utente?');">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="userId" value="${user.id}"/>
                    <button type="submit">Cancella</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<div class="container">
    <div class="container-input">
        <h3>Aggiungi un libro al catalogo</h3>
        <form action="addbook.do" method="POST">
            <label for="titolo" class="form-label">Titolo:</label>
            <input type="text" class="form-control" id="titolo" placeholder="Inserisci il titolo del libro" name="titolo">
            <label for="autore" class="form-label">Autore:</label>
            <input type="text" class="form-control" id="autore" placeholder="Inserisci l'autore del libro" name="autore">
            <button type="submit">Invia</button>
        </form>
    </div>
</div> 
<form method="post" action="BookList">
    <button type="submit">Vai alla Lista aggiornata del Catalogo</button>
</form>
</body>
</html>