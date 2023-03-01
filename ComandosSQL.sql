--Comandos SQL

BEGIN TRANSACTION

CREATE DATABASE nomes

--COMMIT
--ROLLBACK

CREATE TABLE Nome 
(
	Codigo_Cliente int,
	Data_Adesao DATETIME NOT NULL,
	Pontos INT,
	CONSTRAINT PK_CodigoClienteFidelidade PRIMARY KEY (Codigo_Cliente),
	CONSTRAINT FK_CodigoCliente_Fidelidade FOREIGN KEY (Codigo_Cliente) REFERENCES Cliente(Codigo)
)

SELECT Distinct e Top
	Nome_Campo1,
	Nome_Campo
FROM
	Nome_tabela
WHERE
	Condição(And,Or e Not)
ORDER BY
	Nome_Campo1, Nome_Campo2 DESC/ASC

BEGIN TRANSACTION
UPDATE Nome_Tabela SET
	Nome_Campo1 = Valor1,
	Nome_Campo2 = Valor2
WHERE
	Condição;	

--COMMIT
--ROLLBACK

BEGIN TRANSACTION

INSERT INTO Nome_Tabela
	(Nome_Campo1, Nome_Campo2,...)
VALUES
	(Valor1,Valor2,...)	

--COMMIT
--ROLLBACK

BEGIN TRANSACTION

DELETE
FROM 
	Nome_Tabela
WHERE
	Condição;

--COMMIT
--ROLLBACK		

SELECT
	MIN(VALOR)
FROM
	Pedido_Compra

SELECT
	MAX(VALOR)
FROM
	Pedido_Venda

SELECT
	MIN(Data_Adesao)
FROM
	Fidelidade

SELECT
	MAX(VALOR)
FROM
	Pedido_Venda
WHERE 
	DATA >= '2021-02-01' AND DATA <= '2021-02-28'

SELECT
	MAX(VALOR)
FROM
	Pedido_Venda
WHERE 
	MONTH(DATA) = 3 OR
	DATA >= '2021-03-01' AND DATA <= '2021-03-31'

SELECT
	COUNT(*)
FROM
	Cliente


SELECT
	COUNT(*)
FROM
	Cliente

SELECT
	COUNT(*)
FROM
	Pedido_Compra
WHERE
	Valor > 1000

SELECT
	COUNT(*)
FROM
	CLiente
WHERE								
	Estado = 'SP'

SELECT
	SUM(Nome_Campo)
FROM	
	Nome_Tabela
WHERE
	Condição;

SELECT
	SUM(Quantidade)
FROM
	Item_Pedido_Compra	

SELECT
	SUM(Valor_Imposto)
FROM
	Pedido_Venda

SELECT
	SUM(Pontos)
FROM
	Fidelidade

SELECT
	AVG(Nome_campo)
FROM
	Nome_Tabela
WHERE
	Condição;

SELECT
	AVG(Valor)
FROM
	Pedido_Compra
				
SELECT
	AVG(Valor)
FROM
	Pedido_Venda

SELECT
	AVG(Quantidade)
FROM
	Item_Pedido_venda

--Operadores aritméticos

SELECT
	atributo1 + atributo2 AS Alias, --Soma
	atributo1 - atributo2 AS Alias, --Subtração
	atributo1 * atributo2 AS Alias, --Multiplicação
	atributo1 / atributo2 AS Alias --Divisão
FROM
	Nome_Tabela
WHERE
	Condição

--Exercícios

SELECT
	Valor - Valor_Imposto
FROM
	Pedido_Venda

SELECT
	Valor_Unitario + Valor_Imposto
FROM
	Item_Pedido_Venda	

SELECT
	Valor + Valor_Imposto
FROM
	Pedido_Venda

SELECT
	Pontos / 2
FROM
	Fidelidade			

SELECT
	Pontos / 2 AS Pontos_Metade, --ou
	Pontos / 2 AS [Pontos Metade],
	Pontos AS Pontos_Originais
FROM
	Fidelidade	

--Comandos de agrupamento

--GROUP BY
SELECT
	Comando(Nome_Campo), Nome_Campo1,Nome_Campo2...
FROM
	Nome_Tabela
GROUP BY
	Nome_Campo1,Nome_Campo2...

SELECT
	COUNT(*) AS Qtd_Cliente,
	Cidade
FROM
	Cliente
GROUP BY
	Cidade	

SELECT
	COUNT(*) AS Qtd_Forma_Pagamento,
	Tipo
FROM
	Forma_Pagamento
GROUP BY
	Tipo	

SELECT
	SUM(Valor) AS Valor_Mes,
	MONTH(data) AS Mes
FROM 
	Pedido_venda
GROUP BY
	MONTH(data)


--Usando CASE na seleção de dados

--CASE WHEN
SELECT
   CASE
		WHEN Condição1 THEN Resultado_Condição1
		WHEN Condição2 THEN Resultado_Condição2
		...
		ELSE Resulta_Senão_Houver_das_outras
	END	
FROM
	Nome_tabela

--Exercício

SELECT
	CASE
		WHEN Estado = 'SP' THEN 'Dentro de São Paulo'
		WHEN Estado = 'RJ' THEN 'Dentro do Rio de Janeiro'
		ELSE 'Fora de São Paulo/Rio'
	END AS [Dentro De SP/RJ],	
	Nome,
	Estado
FROM
	Cliente

--trazer as formas de pagamento classificando-as em cartão, refeição ou outro tipo de pagamento

SELECT
	CASE 
		WHEN Tipo LIKE '%Cart%' THEN 'Cartão'
		WHEN Tipo LIKE '%Refei%' THEN 'Refeição'
		ElSE 'Outro tipo de Pagamento'
	END AS Tipo_de_Pagamento,
	Tipo,
	Nome
FROM 
	Forma_Pagamento		

--Conceito de juntar tabelas
--JUntar dados de duas tabelas ou mais (Inner Join)
SELECT
	C.Nome AS Nome_Cliente,
	F.Pontos
FROM
	Cliente AS C
	INNER JOIN Fidelidade AS F ON C.Codigo = F.Codigo_Cliente

SELECT
	SUM(Item_Pedido_Venda.Quantidade) AS Soma_un_produto,
	Produto.Nome
FROM
	Item_Pedido_Venda
	INNER JOIN Produto ON Item_Pedido_Venda.Codigo_Produto = Produto.Codigo
GROUP BY	
	Nome		

SELECT
	Quantidade
FROM
	Item_Pedido_Venda

--Left Join
--Pegar dados a esquerda, pega a intersecção mais os dados a esquerda do conjunto
SELECT
	Nome_Campo1,Nome_Campo2...
FROM
	Tabela1
	LEFT JOIN Tabela2 ON Tabela1.Campo = Tabela2.Campo 

	
SELECT
	C.Nome,
	CASE
		WHEN F.Pontos IS NULL THEN 0
		ELSE F.Pontos
	END AS Pontos_Cliente,
	C.Logadouro,
	C.Cidade,
	C.Estado,
	C.Telefone	
FROM
	Cliente AS C
	LEFT JOIN Fidelidade AS F ON C.Codigo = F.Codigo_Cliente
ORDER BY
	F.Pontos DESC	

SELECT
	D.Nome_Fantasia,
	CASE
		WHEN SUM(PC.Valor) IS NULL THEN 0
		ELSE SUM(PC.Valor)
	END AS Valor_DE_Compras	
FROM
	Distribuidor AS D
	LEFT JOIN Pedido_Compra AS PC ON D.Codigo = PC.Codigo_Distribuidor
GROUP BY
	D.Nome_Fantasia	
ORDER BY
	D.Nome_Fantasia

--OUTER LEFT JOIN
--DADOS QUE NÃO SE REALCIONAM EM DUAS OU MAIS TABELAS

SELECT
	Nome_Campo1,Nome_Campo2...
FROM
	Tabela1
	LEFT JOIN Tabela2 ON Tabela1.Campo = Tabela2.Campo 
WHERE
	Tabela2.Campo IS NULL

SELECT
	C.Nome
FROM
	Cliente AS C
	LEFT JOIN Fidelidade AS F ON C.Codigo = F.Codigo_Cliente
WHERE
	F.Pontos IS NULL

SELECT
	P.Nome 
FROM
	Produto AS P 
	LEFT JOIN Item_Pedido_Venda AS It ON P.Codigo = It.Codigo_Produto
WHERE
	It.Valor_Unitario IS NULL




