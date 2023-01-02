-- Para criar um banco de dados --
CREATE DATABASE fs06_api;

-- Para selecionar um banco de dados --
USE fs06_api;

CREATE TABLE tb_veiculo (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    ano INT(4) NOT NULL
);

-- Manipulação de Dados --

-- Para inserir dados na tabela --
INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2010, 'Celta', 'Chevrolet');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2014, 'Classic', 'Chevrolet');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2004, 'Gol', 'VolksWalgen');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (1998, 'Uno', 'Fiat');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2014, 'C180', 'Mercedes');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2015, 'Celta', 'Chevrolet');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2021, 'Mobi', 'Fiat');

CREATE TABLE tb_cliente (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE
);

INSERT INTO tb_cliente (nome, email, cpf)
VALUES
('Alessandro', 'ale@email.com', '12312312312'),
('Rafael', 'ale@email.com', '22312312312'),
('Michael', 'ale@email.com', '32312312312'),
('Victor', 'ale@email.com', '42312312312'),
('Guilherme', 'ale@email.com', '52312312312');

-- Adicionando um relacionamento entre cliente e veículo --

INSERT INTO tb_cliente (nome, email, cpf) VALUES ('Nao definido', '---', '---');

-- Adicionando a coluna que referencia o cliente --
ALTER TABLE tb_veiculo ADD COLUMN cliente_id INT (11) NOT NULL DEFAULT 6;

-- Criando a relação entre as duas tabelas --
ALTER TABLE tb_veiculo ADD FOREIGN KEY (cliente_id) REFERENCES tb_cliente(id);

CREATE TABLE tb_produto (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    preco FLOAT(2) NOT NULL,
    quantidade INT(7) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    cliente_id INT(11) NOT NULL
);

INSERT INTO tb_produto(nome, preco, quantidade, descricao, categoria, cliente_id) VALUES
('Mouse', 19.99, 30, 'Mouse sem fio bluetooth', 'Tecnologia', 1),
('O Senhor dos Aneis', 25.50, 15, 'Livro O Senhors dos Aneis', 'Livros', 2),
('Teclado', 21.60, 8, 'Teclado sem fio bluetooth', 'Tecnologia', 3),
('Caixa de Ferramentas Bosh', 110.99, 4, 'Caixa de Ferramentas da marca Boch com 60 peças', 'Construcao', 4),
('Violao', 537.00, 22, 'Violao Eletroacustico Nylon', 'Musical', 5),
('Notebook', 8.000, 9, 'Notebook Dell Latitude', 'Tecnologia', 2);

ALTER TABLE tb_produto ADD FOREIGN KEY (cliente_id) REFERENCES tb_cliente(id);
