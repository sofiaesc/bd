-------------------------------------------------------
--------------------- EJERCICIO 1 ---------------------
-------------------------------------------------------
/*
ALTER PROCEDURE obtenerPrecio
	(
	@prmtitle_id VARCHAR(6)
	)
AS
	SELECT price from titles T WHERE T.title_id = @prmtitle_id
GO

EXECUTE obtenerPrecio 'PS1372'
*/

-------------------------------------------------------
--------------------- EJERCICIO 2 ---------------------
-------------------------------------------------------
/*
ALTER PROCEDURE obtenerFecha
	(
	@prmstor_id char(4),
	@prmord_num VARCHAR(20)
	)
AS
	SELECT DISTINCT ord_date FROM sales WHERE stor_id = @prmstor_id AND ord_num = @prmord_num
GO

EXECUTE obtenerFecha '7067', 'P2121'
*/

-------------------------------------------------------
--------------------- EJERCICIO 3 ---------------------
-------------------------------------------------------
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

/*
ALTER PROCEDURE buscarPrecio
	(
	@prmcod_prod	int,
	@prmprecio		FLOAT OUTPUT
	)
AS
	SELECT @prmprecio = precUnit from productos P WHERE P.codProd = @prmcod_prod
GO
*/
/* -- para probar buscarPrecio
DECLARE @precioUnit float
EXECUTE buscarPrecio 10, @precioUnit OUTPUT
SELECT CONVERT(VARCHAR, @precioUnit)
*/
/*
ALTER PROCEDURE insertarDetalle
	(
	@prmcod_detalle		int,
	@prmnum_ped			int,
	@prmcod_prod		int,
	@prmcant			int
	)
AS
	DECLARE @precioUnit float
	EXECUTE buscarPrecio @prmcod_prod, @precioUnit OUTPUT
	
	INSERT INTO detalle
	VALUES (@prmcod_detalle, @prmnum_ped, @prmcod_prod, @prmcant, @precioUnit * @prmcant)
GO

--EXECUTE insertarDetalle 1540, 120, 10, 2
SELECT * from detalle
*/

-------------------------------------------------------
--------------------- EJERCICIO 4 ---------------------
-------------------------------------------------------
/*
ALTER PROCEDURE buscarPrecio
(
	@CodProd int,
	@PrecUnit money OUTPUT 
)
AS
	SELECT @PrecUnit = PrecUnit FROM Productos
		WHERE CodProd = @Codprod
	IF @@ROWCOUNT = 0
		RETURN 70
	IF @PrecUnit IS NULL
		RETURN 71
	RETURN 0

GO

ALTER PROCEDURE insertarDetalle
	(
	@prmcod_detalle		int,
	@prmnum_ped			int,
	@prmcod_prod		int,
	@prmcant			int
	)
AS
	DECLARE @precioUnit float
	DECLARE @retorno int
	EXECUTE @retorno = buscarPrecio @prmcod_prod, @precioUnit OUTPUT
	
	IF @retorno != 0
	BEGIN
		IF @retorno = 70 
			PRINT 'Codigo de producto inexistente.'
		ELSE IF @retorno = 71
			PRINT 'Error en el SP buscarPrecio'
			RETURN 99
	END
	
	INSERT INTO detalle
	VALUES (@prmcod_detalle, @prmnum_ped, @prmcod_prod, @prmcant, @precioUnit * @prmcant)
	
	IF @@ERROR != 0
		RETURN 77
GO

EXECUTE insertarDetalle 1540,120,99,2
SELECT * from detalle
*/

-------------------------------------------------------
--------------------- EJERCICIO 5 ---------------------
-------------------------------------------------------

/*INSERT productos
	VALUES (100, 'Articulo 3', 30, 10)*/

ALTER PROCEDURE registrarPedido
	(
	@cantidad	smallint,
	@cod_prod	int,
	@total		float OUTPUT
	)
AS

DECLARE @stockDisp INT
SET @stockDisp = (select Stock from productos where codprod = @cod_prod)
	IF @stockDisp < @cantidad 
		BEGIN
			RETURN 1000; --no hay stock, ya retorno
		END
	ELSE
		BEGIN
			SET @total = @cantidad * (select precUnit from productos where codprod = @cod_prod)
			UPDATE productos
				SET Stock = Stock - @cantidad
				WHERE codprod = @cod_prod
			RETURN @cantidad; --se ha establecido el pedido y devuelvo la cantidad de articulos que quiero comprar
		END
GO

BEGIN TRANSACTION -- inicia la transaccion
	DECLARE @status INT -- valor del return
	DECLARE @precio_total FLOAT -- valor por referencia
	EXECUTE @status = registrarPedido 5, 100, @precio_total OUTPUT
	if @status = 1000
		begin -- si no hay stock
			PRINT 'no hay stock suficiente'
			ROLLBACK TRANSACTION -- se aborta la transaccion
		end
	else -- si hay stock
		begin
			INSERT INTO Detalle VALUES (1200,1108,100,@status,@precio_total)
			COMMIT TRANSACTION  -- finaliza de manera satisfactoria
		end

 SELECT * FROM detalle