CREATE DATABASE IF NOT EXISTS SuperSelectD;
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
INSERT INTO usuarios (nome, email, senha, tipo, cpf, endereco, telefone, data_nascimento) VALUES
('Daniel Colares', 'daniel@example.com', '123456', 'cliente', '123.456.789-00', 'Rua das Flores, 100 - Fortaleza', '(85) 99999-9999', '1985-10-10'),
('Maria Souza', 'maria@example.com', 'senha123', 'cliente', '234.567.890-11', 'Av. Central, 200 - Fortaleza', '(85) 98888-8888', '1990-03-15'),
('João Lima', 'joao@example.com', 'abc123', 'cliente', '345.678.901-22', 'Rua Verde, 55 - Caucaia', '(85) 97777-7777', '1995-05-25'),
('Ana Beatriz', 'ana@example.com', 'senha456', 'cliente', '456.789.012-33', 'Rua das Acácias, 120 - Maracanaú', '(85) 96666-6666', '1988-09-09'),
('Carlos Mendes', 'carlos@example.com', 'qwerty', 'cliente', '567.890.123-44', 'Rua Azul, 300 - Eusébio', '(85) 95555-5555', '1992-11-20'),
('Fernanda Alves', 'fernanda@example.com', 'senha789', 'cliente', '678.901.234-55', 'Av. Leste, 400 - Fortaleza', '(85) 94444-4444', '1998-04-30'),
('Ricardo Silva', 'ricardo@example.com', 'minhaSenha', 'cliente', '789.012.345-66', 'Rua Norte, 22 - Redenção', '(85) 93333-3333', '1982-12-12'),
('Patrícia Gomes', 'patricia@example.com', 'abc456', 'cliente', '890.123.456-77', 'Rua Sul, 10 - Itaitinga', '(85) 92222-2222', '1997-07-07'),
('Eduardo Nogueira', 'eduardo@example.com', 'teste123', 'cliente', '012.345.678-99', 'Av. Beira Mar, 500 - Fortaleza', '(85) 90000-0000', '1994-08-18'),
('Luana Freitas', 'luana@example.com', 'curso2025', 'cliente', '901.234.567-88', 'Rua das Palmeiras, 15 - Pacatuba', '(85) 91111-1111', '1980-01-01'),
('Luana Freitas', 'luana@example.com', 'curso2025', 'administrador', '901.234.567-88', 'Rua das Palmeiras, 15 - Pacatuba', '(85) 91111-1111', '1980-01-01'),
('Daniel Colares', 'daniel@example.com', '123456', 'administrador', '123.456.789-00', 'Rua das Flores, 100 - Fortaleza', '(85) 99999-9999', '1985-10-10'),
('Maria Souza', 'maria@example.com', 'senha123', 'administrador', '234.567.890-11', 'Av. Central, 200 - Fortaleza', '(85) 98888-8888', '1990-03-15');

-- Inserindo 1 administrador
INSERT INTO usuarios (nome, email, senha, tipo, cpf, endereco, telefone, data_nascimento) VALUES
('Administrador', 'admin@supermercado.com', 'admin123', 'administrador', '999.999.999-99', 'Av. Central, 1 - Fortaleza', '(85) 98888-0000', '1980-01-01');

-- Conferindo os dados
SELECT * FROM usuarios;
CREATE TABLE cereais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    marca VARCHAR(100),
    tipo VARCHAR(50),
    preco DECIMAL(6,2)
);
INSERT INTO cereais (nome, marca, tipo, preco) VALUES
('Aveia em flocos', 'Quaker', 'Integral', 6.50),
('Granola tradicional', 'Mãe Terra', 'Integral', 9.90),
('Sucrilhos', 'Kellogg’s', 'Adoçado', 12.00),
('Corn Flakes', 'Nestlé', 'Tradicional', 8.50),
('Granola com mel e castanhas', 'Jasmine', 'Integral', 10.90),
('Cereal de chocolate', 'Nescau', 'Adoçado', 11.20),
('Farelo de trigo', 'Quaker', 'Integral', 5.40),
('Cereal de arroz', 'Taeq', 'Sem glúten', 7.80),
('Cereal de milho com mel', 'Kellogg’s', 'Adoçado', 10.50),
('Cereal multigrãos', 'Vitao', 'Integral', 9.70);

CREATE TABLE bebidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    marca VARCHAR(100),
    tipo VARCHAR(50),
    preco DECIMAL(6,2)
);
INSERT INTO bebidas (nome, marca, tipo, preco) VALUES
('Refrigerante Cola', 'Coca-Cola', 'Carbonatada', 5.50),
('Suco de Laranja', 'Del Valle', 'Natural', 7.20),
('Água Mineral', 'Crystal', 'Sem gás', 3.00),
('Energético', 'Red Bull', 'Funcional', 9.50),
('Chá Gelado', 'Lipton', 'Gelado', 6.00),
('Cerveja Pilsen', 'Heineken', 'Alcoólica', 8.00),
('Cerveja Lager', 'Brahma', 'Alcoólica', 6.50),
('Leite Integral', 'Italac', 'Láctea', 4.50),
('Suco de Uva', 'Santa Helena', 'Natural', 8.90),
('Água com Gás', 'São Lourenço', 'Carbonatada', 4.00);

CREATE TABLE limpeza (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    marca VARCHAR(100),
    tipo VARCHAR(50),
    preco DECIMAL(6,2)
);
INSERT INTO limpeza (nome, marca, tipo, preco) VALUES
('Detergente Líquido', 'Ypê', 'Limpador', 4.50),
('Desinfetante', 'Veja', 'Sanitizante', 7.00),
('Sabão em Pó', 'Omo', 'Roupas', 15.90),
('Amaciante', 'Comfort', 'Roupas', 12.50),
('Água Sanitária', 'Candida', 'Sanitizante', 6.00),
('Limpador Multiuso', 'Mr. Músculo', 'Limpador', 8.90),
('Esponja de Aço', 'Bombril', 'Utensílio', 3.50),
('Limpador de Vidros', 'Veja', 'Limpador', 9.00),
('Desengordurante', 'Veja', 'Limpador', 10.20),
('Pano de Chão', 'Vileda', 'Utensílio', 7.80);

CREATE TABLE frutas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    tipo VARCHAR(50),
    preco DECIMAL(10,2),
    origem VARCHAR(50)
);

INSERT INTO frutas (nome, tipo, preco, origem) VALUES
('Maçã', 'Nacional', 4.00, 'Brasil'),
('Banana', 'Nacional', 3.50, 'Brasil'),
('Laranja', 'Cítrica', 3.20, 'Brasil'),
('Uva', 'Doce', 8.90, 'Chile'),
('Manga', 'Tropical', 5.50, 'Brasil'),
('Melancia', 'Tropical', 4.30, 'Brasil'),
('Abacaxi', 'Tropical', 6.00, 'Brasil'),
('Morango', 'Vermelha', 9.80, 'Brasil'),
('Pera', 'Importada', 8.50, 'Argentina'),
('Kiwi', 'Importada', 7.70, 'Chile');


CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    texto TEXT,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

