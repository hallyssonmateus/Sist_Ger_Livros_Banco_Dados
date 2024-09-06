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

-- Livros
-- Adicionando novos livros
INSERT INTO Books (title, author, genre, published_year) 
VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960),
('1984', 'George Orwell', 'Dystopian', 1949),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951),
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813);
-- Atualizando informações de livros existentes.
UPDATE Books SET author = 'Tiririca', genre = 'Comedy'
Where book_id = 1;

UPDATE Books SET title = 'Journey to the Centre of the Earth', author = 'Júlio Verne', genre = 'Adventure', published_year='2008'
Where book_id = 4;

-- Excluir livros do catálogo.
DELETE FROM Books Where book_id=5;

-- Buscar livros no catálogo portítulo, autor, gênero, etc.
SELECT * FROM Books
--Where title = '1984'
Where author = 'Tiririca'

-- Usuarios
-- Adicionando novos usuarios
INSERT INTO Users (name, email)
VALUES 
('João Silva', 'joao.silva@email.com'),
('Maria Oliveira', 'maria.oliveira@email.com'),
('Carlos Souza', 'carlos.souza@email.com'),
('Ana Pereira', 'ana.pereira@email.com'),
('Pedro Santos', 'pedro.santos@email.com');
-- Atualizar informações de usuários existentes.
UPDATE Users SET name = 'Hallysson Mateus', email = 'hallysson@gmail.com'
Where user_id = 5;
-- Excluir usuários.
DELETE FROM Users Where user_id=3;
-- Buscar usuários por nome, email, etc.
SELECT * FROM Users
--Where name = 'Hallysson Mateus'
Where email = 'joao.silva@email.com'