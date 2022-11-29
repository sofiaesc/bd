-----------------------------------------------------
-------------------- EJERCICIO 1 --------------------
-----------------------------------------------------
/* 
CREATE OR REPLACE FUNCTION obtenerPrecio
	(
	IN prmTitle_id VARCHAR(6)
	)
	
	RETURNS setof numeric
	LANGUAGE plpgsql
	AS
	$$
	BEGIN
		return QUERY SELECT price FROM titles T
			WHERE T.title_id = prmTitle_id;
	END
	$$;

SELECT obtenerPrecio('BU1032')
*/

-----------------------------------------------------
-------------------- EJERCICIO 2 --------------------
-----------------------------------------------------

/*
CREATE OR REPLACE FUNCTION obtenerFecha
	(
	IN prmStor_id VARCHAR(4),
	IN prmOrd_num VARCHAR(20)
	)
	
	RETURNS setof date
	LANGUAGE plpgsql
	AS
	$$
	BEGIN
		return QUERY SELECT ord_date FROM sales S
			WHERE S.stor_id = prmStor_id AND S.ord_num = prmOrd_num;
	END
	$$;

SELECT obtenerFecha('7067','P2121')
*/

-----------------------------------------------------
-------------------- EJERCICIO 3 --------------------
-----------------------------------------------------
/*
CREATE TABLE cliente
 (
 codCli int NOT NULL,
 ape varchar(30) NOT NULL,
 nom varchar(30) NOT NULL,
 dir varchar(40) NOT NULL,
 codPost char(9) NULL DEFAULT 3000
 );
CREATE TABLE productos
 (
 codProd int NOT NULL,
 descr varchar(30) NOT NULL,
 precUnit float NOT NULL,
 stock smallint NOT NULL
 );
CREATE TABLE proveed
 (
 codProv SERIAL,
 razonSoc varchar(30) NOT NULL,
 dir varchar(30) NOT NULL
 );
CREATE TABLE pedidos
 (
 numPed int NOT NULL,
 fechPed date NOT NULL,
 codCli int NOT NULL
 );
CREATE TABLE detalle
 (
 codDetalle int NOT NULL,
 numPed int NOT NULL,
 codProd int NOT NULL,
 cant int NOT NULL,
 precioTot float NULL
 );

 INSERT INTO productos
 VALUES (10, 'Articulo 1', 50, 20);
 INSERT INTO productos
 VALUES (20, 'Articulo 2', 70, 40);
 */

-----------------------------------------------------
-------------------- EJERCICIO 4 --------------------
-----------------------------------------------------

CREATE OR REPLACE FUNCTION buscarPrecio
	(
	IN prmCod_prod int
	)
	
	RETURNS setof float
	LANGUAGE plpgsql
	AS
	$$
	BEGIN
		return QUERY SELECT precUnit FROM productos P
			WHERE P.codProd = prmCod_prod;
	END
	$$;


CREATE OR REPLACE FUNCTION insertarDetalle
	(
	IN prmCod_detalle int,
	IN prmNum_ped int,
	IN prmCod_prod int,
	IN cant int
	)
	returns void
	LANGUAGE plpgsql
	AS
	$$
	BEGIN
		DECLARE precioObtenido float;
		 precioObtenido = buscarPrecio (prmCod_prod);
		INSERT INTO detalle 
		VALUES (prmCod_detalle,prmNum_ped,prmCod_prod,cant,cant*;
	END
	$$;

	
