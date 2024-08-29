<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Elenco Libri</title>
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

	if(request.getAttribute("books") == null){
	response.sendRedirect("BookList");
}

%>


<ul class="menu-nav">
    <li><a href="index.jsp">HOME</a></li>
    <li><a href="login.jsp">LOGIN</a></li>
    <li><a href="register.jsp">REGISTRATI</a></li>
    <li><a href="logout.jsp">LOGOUT</a></li>
</ul>
<h1>Lista dei Libri</h1>

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


<table style="border: 1px solid black; width: 100%;">
    <tr>
        <th style = "width: 4%">ID</th>
        <th style = "width: 32%">Titolo</th>
        <th style = "width: 32%">Autore</th>
        <th style = "width: 32%">Azione</th>
    </tr>
    <c:forEach var="book" items="${books}">
        <tr style="border-bottom: 1px solid black">
            <td>${book.id}</td>
            <td style = "font-size: 30px">${book.titolo}</td>
            <td style = "font-size: 30px">${book.autore}</td>
            <td>
                <!-- Form per l'aggiornamento del libro -->
                <form action="BookList" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="bookId" value="${book.id}"/>
                    <input type="text" name="title" value="${book.titolo}" placeholder="Titolo"/>
                    <input type="text" name="author" value="${book.autore}" placeholder="Autore"/>
                    <button type="submit">Aggiorna</button>
                </form>
                <!-- Form per la cancellazione del libro -->
                <form action="BookList" method="post" style="display: inline;" onsubmit="return confirm('Sei sicuro di voler cancellare questo libro?');">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="bookId" value="${book.id}"/>
                    <button type="submit">Cancella</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
