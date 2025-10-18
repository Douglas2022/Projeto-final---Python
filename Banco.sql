create database SuperSelectD;
use SuperSelectD;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    nome VARCHAR(100) NOT NULL,         
    email VARCHAR(100) NOT NULL UNIQUE, 
    senha VARCHAR(255) NOT NULL,        
    tipo ENUM('aluno', 'professor', 'admin') DEFAULT 'aluno',
    cpf VARCHAR(14) UNIQUE,             
    endereco VARCHAR(255)               
);
INSERT INTO usuarios 
(nome, email, senha, tipo, cpf, endereco, telefone, data_nascimento)
VALUES
('Daniel Colares', 'daniel@example.com', '123456', 'professor', '123.456.789-00', 'Rua das Flores, 100 - Fortaleza', '(85) 99999-9999', '1985-10-10'),
('Maria Souza', 'maria@example.com', 'senha123', 'aluno', '234.567.890-11', 'Av. Central, 200 - Fortaleza', '(85) 98888-8888', '1990-03-15'),
('João Lima', 'joao@example.com', 'abc123', 'aluno', '345.678.901-22', 'Rua Verde, 55 - Caucaia', '(85) 97777-7777', '1995-05-25'),
('Ana Beatriz', 'ana@example.com', 'senha456', 'professor', '456.789.012-33', 'Rua das Acácias, 120 - Maracanaú', '(85) 96666-6666', '1988-09-09'),
('Carlos Mendes', 'carlos@example.com', 'qwerty', 'aluno', '567.890.123-44', 'Rua Azul, 300 - Eusébio', '(85) 95555-5555', '1992-11-20'),
('Fernanda Alves', 'fernanda@example.com', 'senha789', 'aluno', '678.901.234-55', 'Av. Leste, 400 - Fortaleza', '(85) 94444-4444', '1998-04-30'),
('Ricardo Silva', 'ricardo@example.com', 'minhaSenha', 'professor', '789.012.345-66', 'Rua Norte, 22 - Redenção', '(85) 93333-3333', '1982-12-12'),
('Patrícia Gomes', 'patricia@example.com', 'abc456', 'aluno', '890.123.456-77', 'Rua Sul, 10 - Itaitinga', '(85) 92222-2222', '1997-07-07'),
('Luana Freitas', 'luana@example.com', 'curso2025', 'admin', '901.234.567-88', 'Rua das Palmeiras, 15 - Pacatuba', '(85) 91111-1111', '1980-01-01'),
('Eduardo Nogueira', 'eduardo@example.com', 'teste123', 'aluno', '012.345.678-99', 'Av. Beira Mar, 500 - Fortaleza', '(85) 90000-0000', '1994-08-18');

SELECT * FROM usuarios;


