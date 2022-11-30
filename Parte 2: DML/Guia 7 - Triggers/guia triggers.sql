----------- ejercicio 1
ALTER TRIGGER tr_ejercicio1
	ON Autores
	FOR DELETE
	AS
		PRINT 'Se eliminaron ' + CONVERT(varchar,@@ROWCOUNT) + ' filas'
	RETURN
	
DELETE FROM autores WHERE au_id = '172-32-1176' or au_id = '213-46-8915'

----------- ejercicio 2
ALTER TRIGGER tr_ejercicio2
	ON Autores
	AFTER UPDATE, INSERT
	AS
	DECLARE @filas int
		SELECT @filas = count(*) from inserted 
		IF @filas > 0
			BEGIN
				PRINT 'Datos insertados en transaction log'
				SELECT * from inserted
			END
		SELECT @filas = count(*) from deleted
		IF @filas > 0
			BEGIN
				PRINT 'Datos eliminados en transaction log'
				SELECT * from deleted
			END
	RETURN
	
INSERT INTO autores
SELECT '111-11-1111', 'Lynne', 'Jeff', '415 658-9932', 'Galvez y Ochoa', 'Berkeley', 'CA', '94705', 1
UPDATE Autores
SET au_fname = 'Nicanor' WHERE au_id = '111-11-1111'

----------- ejercicio 3
ALTER TRIGGER tr_ejercicio3
	ON productos
	FOR INSERT
	AS
		if (select stock from inserted) < 0
		BEGIN
			RAISERROR ('El stock debe ser positivo o cero',12,1)
			ROLLBACK TRANSACTION
		END
	RETURN

BEGIN TRANSACTION
INSERT INTO Productos
 VALUES (10, 'Producto 10', 200, -6)
COMMIT TRANSACTION

----------- ejercicio 4
ALTER TRIGGER tr_ejercicio4
	ON titles
	FOR INSERT
	AS
		DECLARE @pubid char(4),
				@ventas float
		SET @pubid = (SELECT pub_id from inserted)
		SET @ventas = (SELECT sum(S.qty*T.price) FROM titles T
								INNER JOIN sales S ON S.title_id = T.title_id
								WHERE T.pub_id = @pubid)
		if @ventas < 1500
		BEGIN
			PRINT('La editorial no vendió más de 1500')
			ROLLBACK TRANSACTION
		END
	RETURN

BEGIN TRANSACTION
INSERT INTO titles
 SELECT 'PC4545', 'Prueba 1', 'trad_cook', '1389',
 14.99, 8000.00, 10, 4095, 'Prueba 1', CURRENT_TIMESTAMP
 INSERT INTO titles
 SELECT 'PC4646', 'Prueba 2', 'trad_cook', '0736',
 14.99, 8000.00, 10, 4095, 'Prueba 1', CURRENT_TIMESTAMPCOMMIT TRANSACTION----------- ejercicio 7CREATE TABLE Registro
 (
 fecha DATE NULL,
 tabla varchar(100) NULL,
 operacion varchar(30) NULL,
 CantFilasAfectadas Integer NULL
 )
 
ALTER TRIGGER tr_ejercicio9
	ON employee2
	AFTER
	DELETE,UPDATE
	AS
	DECLARE
		@CantFilas INTEGER;
	BEGIN
		SET @CantFilas = (SELECT COUNT(*) FROM deleted);
		IF (@CantFilas > 1)
			BEGIN
			SET @CantFilas = (SELECT COUNT(*) FROM inserted);
			IF (@CantFilas > 1)
				INSERT INTO Registro
					SELECT CURRENT_TIMESTAMP, 'employee2', 'UPDATE', @CantFilas;
			ELSE 
				INSERT INTO Registro
					SELECT CURRENT_TIMESTAMP, 'employee2', 'DELETE', @CantFilas;	
			END	
	RETURN
 END   INSERT employee2 SELECT * from employee WHERE job_id = 8 DELETE from employee2 where job_id = 8 DELETE FROM RegistroSELECT * FROM RegistroUPDATE employee2 SET job_lvl = 100 where job_id = 8