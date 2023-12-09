-- exemplo agencia de tursimo

-- Criar uma base de dados com especificação de UTF-8
CREATE DATABASE AgenciaDeTurismo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Usar a base de dados criada
USE AgenciaDeTurismo;

-- Criar uma tabela
CREATE TABLE Pacotes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Destino VARCHAR(100) NOT NULL,
    Duracao INT NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Descricao TEXT NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Inserir dados
INSERT INTO Pacotes (Destino, Duracao, Preco, Descricao)
VALUES ('Paris', 7, 1500.00, 'Uma semana inesquecível em Paris.'),
       ('Roma', 5, 1200.00, 'Cinco dias explorando a cidade eterna.'),
       ('Tokyo', 10, 2000.00, 'Dez dias de aventura em Tokyo.');

-- Alterar dados
UPDATE Pacotes
SET Preco = 1300.00
WHERE Destino = 'Roma';

-- Visualizar dados
SELECT * FROM Pacotes;

-- Apagar dados
DELETE FROM Pacotes
WHERE Destino = 'Tokyo';

-- Apagar tabela
DROP TABLE Pacotes;

-- Apagar base de dados
DROP DATABASE AgenciaDeTurismo;

