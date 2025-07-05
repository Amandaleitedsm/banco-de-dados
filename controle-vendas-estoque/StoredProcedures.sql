# LISTA DE EXERCÍCIOS STORED PROCEDURE 

# 1- Criar uma procedure que, ao receber o ClienteID, retorne o total de pedidos feitos por ele.
DELIMITER $$
	CREATE PROCEDURE listarPedidos(IN ClienteID INT)
	BEGIN
		SELECT p.ClienteID, COUNT(p.PedidoID) AS NumeroPedidos
        FROM Pedidos p
        JOIN clientes c ON p.ClienteID = c.ClienteID
        WHERE p.ClienteID = ClienteID;
	END $$
DELIMITER ;

CALL listarPedidos(6);

# 2- Criar uma procedure que insira um novo pedido, recebendo ClienteID, Valor e DataPedido.
DELIMITER $$
	CREATE PROCEDURE inserirPedido(
		IN ClienteID INT, 
        IN Valor DECIMAL(10,2), 
        IN DataPedido DATE
	)
	BEGIN
		DECLARE novoID INT;
		SELECT IFNULL(MAX(PedidoID), 0) + 1 INTO novoID FROM Pedidos;
		INSERT INTO pedidos (PedidoID, ClienteID, Valor, DataPedido)
        VALUES (novoID, ClienteID, Valor, DataPedido);
	END $$
DELIMITER ;

CALL inserirPedido(7, 120.99, "2025-07-05");
SELECT * FROM Pedidos;

# 3- Criar uma procedure que atualize o email de um cliente, recebendo o ClienteID e o novo email.
DELIMITER $$
	CREATE PROCEDURE atualizarCliente(
		IN cClienteID INT, 
        IN cEmail VARCHAR(50)
	)
	BEGIN
		UPDATE Clientes 
        SET Email = cEmail 
        WHERE ClienteID = cClienteID;
	END $$
DELIMITER ;

CALL atualizarCliente(2, "diasbruno@yahoo.com.br");
SELECT * FROM Clientes;

# 4- Criar uma procedure que exclua todos os pedidos de um cliente especıfico.
DELIMITER $$
	CREATE PROCEDURE deletarClientePedido(
		IN pClienteID INT
	)
	BEGIN
		DELETE FROM Pedidos
        WHERE ClienteID = pClienteID;
	END $$
DELIMITER ;

CALL deletarClientePedido(2);
SELECT * FROM Pedidos;

# 5- Criar uma procedure que liste todos os clientes de uma determinada cidade.
DELIMITER $$
	CREATE PROCEDURE selecionarClientesCidade(
		IN cCidade VARCHAR(50)
	)
	BEGIN
		SELECT *
        FROM Clientes
        WHERE Cidade = cCidade;
	END $$
DELIMITER ;

CALL selecionarClientesCidade('São Paulo');

# 6- Criar uma procedure que aumente o estoque de um produto.
DELIMITER $$
	CREATE PROCEDURE aumentarEstoque(
		IN pProdutoID VARCHAR(50)
	)
	BEGIN
		UPDATE Estoque
        SET Quantidade = Quantidade + 1
        WHERE ProdutoID = pProdutoID;
	END $$
DELIMITER ;

CALL aumentarEstoque(3);
SELECT * FROM Estoque;

# 7- Criar uma procedure que diminua o estoque de um produto apos um pedido.
DELIMITER $$
	CREATE PROCEDURE baixaEstoque(
		IN pProdutoID VARCHAR(50),
        IN QtdVendida INT
	)
	BEGIN
		UPDATE Estoque
        SET Quantidade = Quantidade - QtdVendida
        WHERE ProdutoID = pProdutoID;
	END $$
DELIMITER ;

CALL baixaEstoque(3, 3);
SELECT * FROM Estoque;

# 8- Criar uma procedure que retorne o cliente com o maior valor total de compras.
DELIMITER $$
	CREATE PROCEDURE MaiorValor()
	BEGIN
		SELECT c.ClienteID, c.Nome, COUNT(p.Valor) AS TotalPedidos
        FROM Clientes c
        JOIN Pedidos p ON c.ClienteID = p.ClienteID
        GROUP BY c.ClienteID, c.Nome
		HAVING TotalPedidos = (
			SELECT MAX(PedidosPorCliente)
			FROM (
				SELECT COUNT(*) AS PedidosPorCliente
				FROM Pedidos
				GROUP BY ClienteID
			) AS Sub
		);
	END $$
DELIMITER ;

CALL MaiorValor();

# 9- Criar uma procedure que liste os produtos com estoque abaixo de um valor informado.
DELIMITER $$
	CREATE PROCEDURE EstoqueMenorX(
		IN QtdEstoque INT
	)
	BEGIN
		SELECT * 
        FROM Estoque
        WHERE Quantidade < QtdEstoque;
	END $$
DELIMITER ;

CALL EstoqueMenorX(30);

# 10- Criar uma procedure para atualizar o nome de um produto.
DELIMITER $$
	CREATE PROCEDURE atualizarNome(
		IN pProdutoID INT,
        IN pNomeProduto VARCHAR(50)
	)
	BEGIN
		UPDATE Estoque
        SET NomeProduto = pNomeProduto
        WHERE ProdutoID = pProdutoID;
	END $$
DELIMITER ;

CALL atualizarNome(3,'SmartTV 42"');
SELECT * FROM Estoque;