CREATE DATABASE TELOS

USE TELOS
-- Criação das Tabelas

CREATE TABLE Books (
	book_id INT PRIMARY KEY IDENTITY(1,1),
	title VARCHAR(100) NOT NULL,
	author VARCHAR(100)NOT NULL,
	genre VARCHAR(50) NOT NULL,
	published_year INT
)

CREATE TABLE Users (
	user_id INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100) NOT NULL,
	email VARCHAR(255)
)

CREATE TABLE Loans (
	loan_id INT PRIMARY KEY IDENTITY(1,1),
	book_id INT NOT NULL,
	user_id INT NOT NULL,
	loan_date DATETIME NOT NULL,
	return_date DATETIME NOT NULL,
	FOREIGN KEY (book_id) REFERENCES Books(book_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
)