CREATE DATABASE IF NOT EXISTS ExemploBD;
USE ExemploBD;

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Cidade VARCHAR(100)
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    Valor DECIMAL(10, 2),
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Estoque (
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Quantidade INT
);
