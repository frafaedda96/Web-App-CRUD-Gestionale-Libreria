<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage</title>

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

main {
	flex: 1;
	display: flex;
	padding: 20px;
	box-sizing: border-box;
}

.left-column {
	flex: 1;
	background-color: #d3b7f2;
	padding: 20px;
	box-sizing: border-box;
	text-align: left;
	display: flex;
	flex-direction: column;
	justify-content:center;
}

.right-column {
	flex: 0 0 35%;
	background-color: #d3b7f2;
	padding: 20px;
	box-sizing: border-box;
	display: flex;
	align-items: center;
	justify-content: center;
}

.right-column img {
	width: 100%;
	height: auto;
	max-height: 100%;
	object-fit: cover;
	border-radius: 5px;
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
		<li><a href="./register.jsp">REGISTRATI</a></li>
		<li><a href="logout.jsp">LOGOUT</a></li>
	</ul>

	<h1>Benvenuto nella Libreria Online Condivisa</h1>
	
	<main>
		<div class="left-column">
			<p style="font-size: 20px;">
				Qui potrai trovare un grande catalogo di libri preferiti dai nostri
				utenti. Non sai ancora come funziona? Non preoccuparti, è molto
				semplice. Per prima cosa devi registrarti, e una volta fatto il
				login avrai accesso al catalogo personalizzato da ogni utente
				registrato nella piattaforma, che avrà inserito il proprio, o i
				propri libri preferiti. Quindi cosa aspetti? Entra a far parte di
				questa community e condividi con noi i tuoi libri preferiti. Non ne
				hai? Non c'è nessun problema, puoi prendere spunto dalla miriade di
				consigli che troverai e una volta che li avrai letti avrai anche la
				possibilità di eliminare quelli che non ti interessano più o
				modificare quelli degli altri utenti. Il catalogo cambia ogni
				giorno, quindi ricordati di fare l'accesso frequentemente così
				potrai restare al passo delle ultime novità. Spero che ti sarà utile
				e ti divertirai. Buona Lettura!
			</p>
		</div>
		<div class="right-column">
			<img src="./img/libreriaonline.jpg" alt="immagine libreria">
		</div>
	</main>

	<footer>
		<p>Contatti: francesco@faedda.it</p>
		<p>
			<img src="./img/instagram.jpg" alt="logo instagram"> InstaLibreriaOnline
			<img src="./img/facebook.jpg" alt="logo facebook"> FaceLibreriaOnline
		</p>
	</footer>
</body>
</html>
