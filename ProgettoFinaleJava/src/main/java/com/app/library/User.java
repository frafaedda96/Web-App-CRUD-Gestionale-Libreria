package com.app.library;

import javax.persistence.*;

@Entity //indica che la classe rappresente un'entità e sarà mappata con una relativa tabella del database
@Table(name = "users") //indica la tabella del database che deve essere mappata dalla classe annotata

public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private int id;
	@Column(name = "nome", length = 50, nullable = false)
	private String nome;
	@Column(name = "cognome", length = 50, nullable = false)
	private String cognome;
	@Column(name = "email", length = 255, nullable = false, unique = true)
	private String email;
	@Column(name = "password", length = 255, nullable = false)
	private String password;
	@Column(name = "role", length = 50, nullable = false)
	private String role;


	public User() {
		
	}
	
	public User(String nome, String cognome, String email, String password, String role) {
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		this.password = password;
		this.role = role;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
