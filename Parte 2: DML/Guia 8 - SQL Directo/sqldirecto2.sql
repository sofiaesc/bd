-- Crear un procedimiento almacenado T-SQL que permita generar este reporte para
-- cualquier nombre de tabla que se le pase por parámetro.

ALTER PROCEDURE sp_ColumnasPorTipo
	(
	@tabla varchar(20)
	)
	AS

DECLARE @tipo varchar(20),
		@cant int,
		@sqldir1 varchar(300),
		@sqldir2 varchar(300)

DECLARE curTipo CURSOR
	FOR SELECT DISTINCT ty.name FROM sys.tables t 
								INNER JOIN sys.columns c
									ON t.object_id = c.object_id
								INNER JOIN sys.types ty
									ON c.user_type_id = ty.user_type_id
								WHERE t.name = @tabla
								
CREATE TABLE aux
	(
	tabla varchar(20)
	)
INSERT INTO aux VALUES (@tabla)

OPEN curTipo
FETCH NEXT FROM curTipo INTO @tipo
WHILE @@FETCH_STATUS = 0
	BEGIN
		set @sqldir1 = 'ALTER TABLE aux ADD Tipo_' + @tipo + ' int'
		EXEC (@sqldir1)
		set @cant = (SELECT count(ty.user_type_id) FROM sys.tables t INNER JOIN sys.columns c
													ON t.object_id = c.object_id
																	INNER JOIN sys.types ty
													ON c.user_type_id = ty.user_type_id
												WHERE t.name = @tabla AND ty.name = @tipo)
		set @sqldir2 = 'UPDATE aux SET Tipo_' + @tipo + ' = ' + convert(varchar,@cant)
		EXEC (@sqldir2)
		FETCH NEXT FROM curTipo INTO @tipo
	END

SELECT * from aux
DROP TABLE aux

CLOSE curTipo
DEALLOCATE curTipo

EXECUTE sp_ColumnasPorTipo 'titles'