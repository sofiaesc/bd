-------------------------------------------------------------
------------------------ EJERCICIO 1 ------------------------
-------------------------------------------------------------

-- SIN CURSORES:
/*
UPDATE titles
		SET price=price+price*0.25
		WHERE pub_id LIKE '0736' AND price<=10

		UPDATE titles
		SET price=price-price*0.25
		WHERE pub_id LIKE '0736' AND price>10
*/

-- CON CURSORES:

DECLARE curPrecios CURSOR
	FOR
		SELECT price FROM titles
			WHERE pub_id LIKE '0736' -- solo los títulos de esa editorial!!
		FOR UPDATE
		
DECLARE @precio float

OPEN curPrecios
FETCH NEXT
	FROM curPrecios
	INTO @precio
	
WHILE @@FETCH_STATUS = 0
	BEGIN 
		if @precio <= 10
			BEGIN
				UPDATE titles
				SET price = price + price * 0.25
				WHERE CURRENT of curPrecios
			END
		ELSE
			BEGIN
				UPDATE titles
				SET price = price - price * 0.25
				WHERE CURRENT OF curPrecios
			END
		FETCH NEXT FROM curPrecios INTO @precio
END

CLOSE curPrecios
DEALLOCATE curPrecios

SELECT * FROM titles
			WHERE pub_id LIKE '0736'

-------------------------------------------------------------
------------------------ EJERCICIO 3 ------------------------
-------------------------------------------------------------

DECLARE curTipo CURSOR
	FOR
		SELECT DISTINCT type FROM titles
		FOR UPDATE
		
DECLARE @tipo char(12)

OPEN curTipo
FETCH NEXT
	FROM curTipo
	INTO @tipo

WHILE @@FETCH_STATUS = 0
	BEGIN 
		PRINT(SELECT DISTINCT TOP 3 price 'Precio' FROM titles
		WHERE type = @tipo
		ORDER BY price desc)
		
		FETCH NEXT FROM curTipo INTO @tipo
END

CLOSE curTipo
DEALLOCATE curTipo
