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