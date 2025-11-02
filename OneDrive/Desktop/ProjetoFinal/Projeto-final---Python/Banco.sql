CREATE DATABASE  SuperSelectD;
USE SuperSelectD;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo ENUM('cliente', 'administrador') DEFAULT 'cliente',
    cpf VARCHAR(14) UNIQUE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    data_nascimento DATE
);

-- Inserindo 10 clientes
INSERT INTO usuarios (nome, email, senha, cpf) VALUES
('Daniel Colares', 'daniel@example.com', '123456', '123.456.789-00'),
('Maria Souza', 'maria@example.com', 'senha123', '987.654.321-00'),
('João Lima', 'joao@example.com', 'abc123', '111.222.333-44'),
('Ana Beatriz', 'ana@example.com', 'senha456', '555.666.777-88'),
('Carlos Mendes', 'carlos@example.com', 'qwerty', '999.888.777-66'),
('Fernanda Alves', 'fernanda@example.com', 'senha789', '444.333.222-11'),
('Ricardo Silva', 'ricardo@example.com', 'minhaSenha', '222.333.444-55'),
('Patrícia Gomes', 'patricia@example.com', 'abc456', '777.666.555-44'),
('Eduardo Nogueira', 'eduardo@example.com', 'teste123', '888.777.666-55'),
('Luana Freitas', 'luana@example.com', 'curso2025', '999.000.111-22');


SELECT * FROM usuarios;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL
);

INSERT INTO produtos (nome, marca, tipo, preco) VALUES
('Refrigerante Cola', 'Coca-Cola', 'Carbonatada', 5.50),
('Suco de Laranja', 'Del Valle', 'Natural', 7.20),
('Água Mineral', 'Crystal', 'Sem gás', 3.00),
('Energético', 'Red Bull', 'Funcional', 9.50),
('Chá Gelado', 'Lipton', 'Gelado', 6.00),
('Cerveja Pilsen', 'Heineken', 'Alcoólica', 8.00);

-- Conferindo os dados
SELECT * FROM produtos;

CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    texto TEXT,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);
INSERT INTO comentarios (produto_id, texto)
VALUES (1, 'Produto excelente! Chegou rápido e bem embalado.');

SELECT * FROM comentarios;


SELECT c.id, p.nome, c.texto, c.data_hora
FROM comentarios c
JOIN produtos p ON c.produto_id = p.id;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
FLUSH PRIVILEGES;







