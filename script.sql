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

-- Emprestimos Livros
ALTER TABLE Books
ADD quantity INT DEFAULT 1;

-- Atualizando a quantidade de livros existentes
UPDATE Books
SET quantity = 5
WHERE title = 'The Great Gatsby';

UPDATE Books
SET quantity = 3
WHERE title = 'To Kill a Mockingbird';

UPDATE Books
SET quantity = 4
WHERE title = '1984';

UPDATE Books
SET quantity = 2
WHERE title = 'Journey to the Centre of the Earth';


INSERT INTO Loans (book_id, user_id, loan_date, return_date)
VALUES
(1, 2, '01/09/2024', '15/09/2024'),
(2, 4, '02/09/2024', '16/09/2024'),
(3, 1, '03/09/2024', '17/09/2024'),
(4, 5, '04/09/2024', '18/09/2024'),
(2, 4, '05/09/2024', '19/09/2024');

TRUNCATE TABLE Loans;  -- Setando valores da tabela
-- Criação da Procedure
CREATE PROCEDURE RegisEmprestimo
@BookID INT,
@UserID INT,
@LoanDate DATETIME,
@ReturnDate DATETIME
AS
BEGIN
    BEGIN TRANSACTION;
   
DECLARE @AvailableQuantity INT;
SELECT @AvailableQuantity = quantity
FROM Books WHERE book_id = @BookID;

IF @AvailableQuantity > 0
BEGIN
	-- Registra o emprestimo
	INSERT INTO Loans (book_id, user_id, loan_date, return_date)
    VALUES (@BookID, @UserID, @LoanDate, @ReturnDate);

    -- Atualizar a quantidade disponível do livro
    UPDATE Books
    SET quantity = quantity - 1
    WHERE book_id = @BookID;

    COMMIT TRANSACTION;
END
ELSE
BEGIN
	PRINT 'Não há cópias disponiveis para emprestimo';
	ROLLBACK TRANSACTION;
END
END;

EXEC RegisEmprestimo
@BookID = 4,
@UserID = 5,
@LoanDate = '06/09/2024',
@ReturnDate = '31/10/2024';

EXEC RegisEmprestimo
@BookID = 3,
@UserID = 5,
@LoanDate = '06/09/2024',
@ReturnDate = '15/09/2024';


SELECT @@DATEFIRST;
-- Registrar devoluções de livros.
CREATE PROCEDURE RegisDevolucao
    @LoanID INT,           -- Id empréstimo
    @ReturnDate DATETIME  
AS
BEGIN
    BEGIN TRANSACTION;

    -- Declara variáveis para armazenar informações necessárias
    DECLARE @BookID INT;
    DECLARE @Quantity INT;

    -- Obtém o book_id do empréstimo
    SELECT @BookID = book_id
    FROM Loans
    WHERE loan_id = @LoanID;

    -- Atualiza a data de devolução no registro de empréstimo
    UPDATE Loans
    SET return_date = @ReturnDate
    WHERE loan_id = @LoanID;

    -- Obtém a quantidade atual de livros na tabela Books
    SELECT @Quantity = quantity
    FROM Books
    WHERE book_id = @BookID;

    -- Atualiza a quantidade disponível de livros
    UPDATE Books
    SET quantity = @Quantity + 1
    WHERE book_id = @BookID;

    COMMIT TRANSACTION;
END;

EXEC RegisDevolucao
    @LoanID = 2,
    @ReturnDate = '27/09/2024';