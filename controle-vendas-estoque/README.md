
# 📚 Lista de Exercícios - Triggers, Views e Stored Procedures  
### Banco de Dados MySQL

---

## 🛠️ Script de Criação do Banco de Dados

```sql
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
    Valor DECIMAL(10,2),
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Estoque (
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Quantidade INT
);
````

---

## 🔁 Exercícios de **Triggers** (10)

1. Criar uma trigger que registre em uma tabela de log sempre que um novo cliente for inserido.
2. Impedir que o campo `Quantidade` na tabela `Estoque` fique negativo após uma atualização.
3. Atualizar automaticamente a cidade do cliente adicionando a data da última compra sempre que ele fizer um novo pedido.
4. Bloquear a inserção de pedidos com valor menor que zero.
5. Registrar em log toda vez que o valor de um pedido for alterado.
6. Criar uma trigger que registre que o total gasto de um cliente precisa ser recalculado sempre que um novo pedido for inserido.
7. Ao inserir um novo pedido, fazer uma baixa de 1 unidade de estoque do `ProdutoID = 1`.
8. Bloquear a inserção de clientes com emails terminados em `@fake.com`.
9. Ao excluir um cliente, deletar automaticamente todos os seus pedidos.
10. Registrar em log o nome de cada cliente excluído.

---

## 👁️ Exercícios de **Views** (10)

1. Criar uma View que mostre o nome de cada cliente e o número total de pedidos feitos.
2. Criar uma View que traga os pedidos junto com o nome dos clientes.
3. Montar uma View que liste apenas os produtos com estoque abaixo de 50 unidades.
4. Criar uma View que traga a quantidade total de pedidos por cliente.
5. Montar uma View mostrando os pedidos realizados nos últimos 7 dias.
6. Criar uma View com o nome do cliente, cidade e a data do último pedido.
7. Criar uma View listando os clientes que ainda não fizeram nenhum pedido.
8. Montar uma View com o valor médio dos pedidos por cidade.
9. Criar uma View que exiba a soma total de todas as vendas.
10. Criar uma View listando clientes da cidade de São Paulo com pedidos acima de R\$200.

---

## ⚙️ Exercícios de **Stored Procedures** (10)

1. Criar uma procedure que, ao receber o `ClienteID`, retorne o total de pedidos feitos por ele.
2. Criar uma procedure que insira um novo pedido, recebendo `ClienteID`, `Valor` e `DataPedido`.
3. Criar uma procedure que atualize o email de um cliente, recebendo o `ClienteID` e o novo email.
4. Criar uma procedure que exclua todos os pedidos de um cliente específico.
5. Criar uma procedure que liste todos os clientes de uma determinada cidade.
6. Criar uma procedure que aumente o estoque de um produto.
7. Criar uma procedure que diminua o estoque de um produto após um pedido.
8. Criar uma procedure que retorne o cliente com o maior valor total de compras.
9. Criar uma procedure que liste os produtos com estoque abaixo de um valor informado.
10. Criar uma procedure para atualizar o nome de um produto.

---

🧪 **Sinta-se à vontade para testar, adaptar e explorar cada exercício!**


