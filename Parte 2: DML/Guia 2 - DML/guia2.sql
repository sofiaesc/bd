------------------------------EJERCICIO 1------------------------------
/*
CREATE TABLE cliente
 (
 codCli int NOT NULL,
 ape varchar(30) NOT NULL,
 nom varchar(30) NOT NULL,
 dir varchar(40) NOT NULL,
 codPost char(9) NULL DEFAULT 3000
 )
CREATE TABLE productos
 (
 codProd int NOT NULL,
 descr varchar(30) NOT NULL,
 precUnit float NOT NULL,
 stock smallint NOT NULL
 )
CREATE TABLE proveed
 (
 codProv int IDENTITY(1,1),
 razonSoc varchar(30) NOT NULL,
 dir varchar(30) NOT NULL
 )
CREATE TABLE pedidos
 (
 numPed int NOT NULL,
 fechPed datetime NOT NULL,
 codCli int NOT NULL
 )
CREATE TABLE detalle
 (
 codDetalle int NOT NULL,
 numPed int NOT NULL,
 codProd int NOT NULL,
 cant int NOT NULL,
 precioTot float NULL
 )
 */
 
------------------------------EJERCICIO 2------------------------------
/*
 INSERT INTO cliente
	(codcli, ape, nom, dir, codPost)
	VALUES (1, 'LOPEZ', 'JOSE MARIA', 'Gral. Paz 3124')
*/
-- SELECT * FROM cliente -- para verificar.


------------------------------EJERCICIO 3------------------------------
/*
 INSERT INTO cliente
	(codcli, ape, nom, dir, codPost)
	VALUES (2, 'GERVASOLI', 'MAURO', 'San Luis 472', NULL)
*/
-- SELECT * FROM cliente -- para verificar.


------------------------------EJERCICIO 4------------------------------
/*
INSERT INTO proveed
	(razonSoc, dir)
	VALUES ('FLUKE INGENIERIA','RUTA 9 Km. 80')
	
INSERT INTO proveed
	(razonSoc, dir)
	VALUES ('PVD PATCHES','Pinar de Rocha 1154')
*/
-- SELECT * FROM proveed -- para verificar.


------------------------------EJERCICIO 5------------------------------
/*
CREATE TABLE Ventas
	(
		codVent		int				identity(1,1),
		fechaVent	datetime		NOT NULL DEFAULT CURRENT_TIMESTAMP,
		usuarioDB	varchar(40)		NOT NULL DEFAULT CURRENT_USER,
		monto		float
	)
*/


------------------------------EJERCICIO 6------------------------------
/*
INSERT INTO Ventas
	(monto) 
	VALUES ('100')
INSERT INTO Ventas
	(monto) 
	VALUES ('200')
*/
-- SELECT * from Ventas -- para verificar


------------------------------EJERCICIO 7------------------------------
/*
SELECT codcli, ape, nom, dir, codPost
	INTO clistafe
	FROM cliente
	WHERE codPost = '3000'
*/
-- SELECT * from cliente -- para verificar


------------------------------EJERCICIO 8------------------------------
/*
INSERT INTO clistafe
	SELECT *
		FROM cliente
*/		
-- SELECT * from cliente -- para verificar


------------------------------EJERCICIO 9------------------------------
/*
UPDATE cliente
	SET dir = 'TCM 168'
		WHERE dir like '%1%'
*/		
-- SELECT * from cliente -- para verificar


------------------------------EJERCICIO 10------------------------------
/*
DELETE from clistafe
	WHERE codPost is NULL
*/