# LISTA DE EXERCÍCIOS VIEW

# 1- Criar uma View que mostre o nome de cada cliente e o numero total de pedidos feitos.
CREATE VIEW ClienteTotalPedidos AS
	SELECT c.Nome, COUNT(p.PedidoID) AS TotalPedidos
	FROM Clientes c
	JOIN Pedidos p ON c.ClienteID = p.ClienteID
	GROUP BY c.Nome;

SELECT * FROM ClienteTotalPedidos;

# 2- Criar uma View que traga os pedidos junto com o nome dos clientes.
CREATE VIEW ClienteNomePedidos AS
	SELECT c.Nome, p.*
    FROM Pedidos p
    LEFT JOIN Clientes c ON p.ClienteID = c.ClienteID;
    
SELECT * FROM ClienteNomePedidos;

# 3- Montar uma View que liste apenas os produtos com estoque abaixo de 50 unidades.
CREATE VIEW EstoqueMenosCinquenta AS
	SELECT * FROM Estoque
    WHERE Quantidade < 50;

SELECT * FROM EstoqueMenosCinquenta;

# 4- Criar uma View que traga a quantidade total de pedidos por cliente.
CREATE VIEW ClienteIDTotalPedidos AS
	SELECT ClienteID, COUNT(PedidoID) AS TotalPedidos
	FROM Pedidos
	GROUP BY ClienteID;
    
SELECT * FROM ClienteIDTotalPedidos;

# 5- Montar uma View mostrando os pedidos realizados nos  ́ultimos 7 dias.
CREATE VIEW PedidosUltimaSemana AS
	SELECT *
	FROM Pedidos
	WHERE DataPedido >= CURDATE() - INTERVAL 7 DAY;

SELECT * FROM PedidosUltimaSemana;

# 6- Criar uma View com o nome do cliente, cidade e a data do  ́ultimo pedido.
CREATE VIEW UltimoPedidoPorCliente AS
	SELECT 
		c.Nome,
		c.Cidade,
		MAX(p.DataPedido) AS UltimoPedido
	FROM Clientes c
	JOIN Pedidos p ON c.ClienteID = p.ClienteID
	GROUP BY c.ClienteID, c.Nome, c.Cidade;

SELECT * FROM UltimoPedidoPorCliente;

# 7- Criar uma View listando os clientes que ainda n ̃ao fizeram nenhum pedido.
CREATE VIEW ClientesSemPedidos AS
	SELECT c.*
    FROM Clientes c
    LEFT JOIN Pedidos p ON c.ClienteID = p.ClienteID
	WHERE p.PedidoID IS NULL;

SELECT * FROM ClientesSemPedidos;

# 8- Montar uma View com o valor m ́edio dos pedidos por cidade.
CREATE VIEW MediaCidades AS
	SELECT c.Cidade, SUM(p.Valor) AS TotalCidade
    FROM Clientes c
    JOIN Pedidos p ON c.ClienteID = p.ClienteID
    GROUP BY c.Cidade;
    
SELECT * FROM MediaCidades;

# 9- Criar uma View que exiba a soma total de todas as vendas.
CREATE VIEW SomaTotalVendas AS
	SELECT SUM(p.Valor) AS TotalVendas
    FROM Pedidos p;
    
SELECT * FROM SomaTotalVendas;

# 10- Criar uma View listando clientes da cidade de Sao Paulo com pedidos acima de R$200.
CREATE VIEW ClientesSaoPaulo AS
	SELECT c.*
    FROM Clientes c
    JOIN Pedidos p ON c.ClienteID = p.ClienteID
    WHERE p.Valor > 200 AND c.Cidade = "São Paulo"
    GROUP BY c.ClienteID;

SELECT * FROM ClientesSaoPaulo;
