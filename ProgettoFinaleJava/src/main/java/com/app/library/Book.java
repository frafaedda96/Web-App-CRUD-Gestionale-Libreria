package com.app.library;

import javax.persistence.*;

@Entity //indica che la classe rappresente un'entità e sarà mappata con una relativa tabella del database
@Table(name = "books") //indica la tabella del database che deve essere mappata dalla classe annotata

public class Book {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private int id;
	@Column(name = "titolo", length = 50, nullable = false)
	private String titolo;
	@Column(name = "autore", length = 50, nullable = false)
	private String autore;

	public Book() {
		
	}
	
	public Book(String titolo, String autore) {
		this.titolo = titolo;
		this.autore = autore;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getAutore() {
		return autore;
	}

	public void setAutore(String autore) {
		this.autore = autore;
	}

	
	
	
}

