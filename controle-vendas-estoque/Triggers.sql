
# LISTA DE EXERCÍCIOS TRIGGER

# 1 - Criar uma trigger que registre em uma tabela de log sempre que um novo cliente for inserido.
CREATE TABLE log_clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
	acao VARCHAR(50),
	data_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$
	CREATE TRIGGER log_novo_cliente 
    AFTER INSERT ON Clientes
    FOR EACH ROW
    BEGIN
		INSERT INTO log_clientes (acao)
        VALUES (CONCAT('NOVO CLIENTE: ', NEW.Nome));
	END $$
DELIMITER ;

SELECT * FROM log_clientes;

# 2 - Impedir que o campo Quantidade na tabela Estoque fique negativo apos uma atualizacao
DELIMITER $$
	CREATE TRIGGER estoque_negativo
    BEFORE UPDATE ON Estoque
    FOR EACH ROW
    BEGIN
		if NEW.Quantidade < 0 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Erro: A quantidade em estoque não pode ser negativa.';
		END IF;
	END $$
DELIMITER ;

UPDATE  estoque SET Quantidade = -2 where ProdutoID = 2;

# 4 - Bloquear a insercao de pedidos com valor menor que zero.
DELIMITER $$
	CREATE TRIGGER valor_negativo
    BEFORE INSERT ON Pedidos
    FOR EACH ROW
    BEGIN
		if NEW.Valor < 0 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Erro: O valor do pedido não pode ser negativo.';
		END IF;
	END $$
DELIMITER ;

INSERT INTO Pedidos VALUES (4, 1, -150.00, '2025-06-10');

# 5 - Registrar em log toda vez que o valor de um pedido for alterado.
CREATE TABLE log_alteracao_pedidos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	acao VARCHAR(50),
	data_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$
	CREATE TRIGGER log_alteracao_pedidos 
    AFTER UPDATE ON Pedidos
    FOR EACH ROW
    BEGIN
		INSERT INTO log_alteracao_pedidos (acao)
        VALUES (CONCAT('NOVO VALOR: ', NEW.valor));
	END $$
DELIMITER ;

UPDATE Pedidos SET valor = 200.00 WHERE PedidoID = 2;
SELECT * FROM log_alteracao_pedidos;

# 6 - Criar uma trigger que registre que o total gasto de um cliente precisa ser recalculado sempre que um novo pedido for inserido.
CREATE TABLE total_cliente (
	ID_total INT PRIMARY KEY AUTO_INCREMENT,
	id INT ,
	total DECIMAL(10,2),
    DATA_ALTERACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id) REFERENCES Pedidos(ClienteID)
);
DELIMITER $$
	CREATE TRIGGER atualiza_total 
    AFTER INSERT ON Pedidos
    FOR EACH ROW
    BEGIN
		INSERT INTO total_cliente (TOTAL)
        VALUES (Pedidos.ClienteID, total = total + NEW.Valor);
	END $$
DELIMITER ;

INSERT INTO Pedidos VALUES (9, 1, 150.00, '2025-06-10');    
SELECT * FROM total_cliente;

# 7- Ao inserir um novo pedido, fazer uma baixa de 1 unidade de estoque do ProdutoID 1;
SELECT * FROM Estoque;
DELIMITER $$
	CREATE TRIGGER baixaPedidos
	AFTER INSERT ON Pedidos
	FOR EACH ROW
    BEGIN
		UPDATE Estoque
        SET Quantidade = Quantidade -1 
        WHERE Estoque.ProdutoID = 1;
	END $$
DELIMITER ;
INSERT INTO PEDIDOS VALUES (4,5, 100.00, '2025-07-05');

# 8- Bloquear a insercao de clientes com emails terminados em ”@fake.com”.
DELIMITER $$
	CREATE TRIGGER InsercaoEmailFake
	BEFORE INSERT ON Clientes
	FOR EACH ROW
	BEGIN
		if New.Email LIKE "%@fake.com" THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Erro: O endereço de email não é permitido.';
		END IF;
	END $$
DELIMITER ;
INSERT INTO Clientes VALUES (4,"Amanda Leite", "amandaleite@fake.com", "Jacareí");

# 9- Ao excluir um cliente, deletar automaticamente todos os seus pedidos.
SELECT * FROM Clientes;
SELECT * FROM Pedidos;
DELIMITER $$
	CREATE TRIGGER DeletarRelacionados
    BEFORE DELETE ON Clientes
    FOR EACH ROW
    BEGIN
		DELETE FROM PEDIDOS WHERE Pedidos.ClienteID = OLD.ClienteID;
	END $$
DELIMITER ; 
DELETE FROM Clientes WHERE ClienteID = 5;

# 10- Registrar em log o nome de cada cliente excluıdo.
SELECT * FROM log_exclusaoCliente;
SELECT * FROM Clientes;
CREATE TABLE log_exclusaoCliente(
	id INT AUTO_INCREMENT PRIMARY KEY,
	acao VARCHAR(50),
	data_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
	CREATE TRIGGER log_exclusaoCliente 
    AFTER DELETE ON Clientes
    FOR EACH ROW
    BEGIN
		INSERT INTO log_exclusaoCliente (acao)
        VALUES (CONCAT('CLIENTE DELETADO: ', OLD.Nome));
	END $$
DELIMITER ;
INSERT INTO Clientes VALUES (8,"Jonas", "Jonas@gmail.com","Campinas");
DELETE FROM Clientes where ClienteID = 8;