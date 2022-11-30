----------------------------------------------------------------------------------
-- Si se pretende insertar un empleado con job_id = 5 para la editorial que más
-- ha facturado, debo tener un trigger que modifique la situación:
-- Se debe buscar la editorial que menos ha facturado a lo largo del tiempo y,
-- si posee menos de dos empleados con job_id = 5, asignar el empleado a ella.
-- Si en cambio, tiene dos o más empleados, se debe anular la transacción.

CREATE OR REPLACE FUNCTION trg_funct1()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS
	$$
	DECLARE pub_menor_facturacion char(4);
		pub_mayor_facturacion char(4);
		pub_actual char(4);
	BEGIN

		pub_mayor_facturacion := (SELECT P.pub_id from publishers P
								INNER JOIN titles T ON T.pub_id = P.pub_id
								INNER JOIN sales S ON T.title_id = S.title_id
								GROUP BY P.pub_id
								ORDER BY sum(S.qty*T.price) DESC
								LIMIT 1);
		pub_menor_facturacion := (SELECT P.pub_id from publishers P
								INNER JOIN titles T ON T.pub_id = P.pub_id
								INNER JOIN sales S ON T.title_id = S.title_id
								GROUP BY P.pub_id
								ORDER BY sum(S.qty*T.price) ASC
								LIMIT 1);
	
		IF(NEW.pub_id = pub_mayor_facturacion) THEN -- Si estoy insertando en la editorial con mayor facturación
			IF 2 > (SELECT count(emp_id) FROM employee WHERE pub_id = pub_menor_facturacion AND job_id = 5) THEN -- Si la de menor facturación tiene menos de dos empleados
				NEW.pub_id := pub_menor_facturacion;
				RETURN NEW; -- Retorno la tupla alterada
			ELSE -- Si tiene dos o más empleados.
				RETURN NULL; -- Cancelo la inserción
			END IF;
		ELSE -- Si no estoy insertando en la editorial con mayor facturación
			RETURN NEW; -- Retorno tupla sin alterar
		END IF;
	END;
	$$;

CREATE TRIGGER trg1
	BEFORE INSERT ON employee
	FOR EACH ROW

	WHEN (NEW.job_id = 5)
		EXECUTE PROCEDURE trg_funct1();

INSERT INTO Employee values ('PMA42549M','Bartolome','T','Casiraghi',5,215,'1389','11/11/1989')
INSERT INTO Employee values ('GSG42444F','Sofia','R','Escudero',5,215,'1389','18/12/2000');
SELECT * from employee where pub_id = '0736' AND job_id = 5;


----------------------------------------------------------------------------------
-- Escriba una function PL/pgSQL que retorne la salida del siguiente SELECT:
/*	SELECT type, SUM(price) AS totalPrice, MIN(price) as minPrice
		FROM titles WHERE price IS NOT NULL 
		GROUP BY type;
*/

CREATE TYPE ejCT
AS (
	tipo char(12), 
	precioTotal numeric,
	precioMinimo numeric
	);
	
CREATE OR REPLACE FUNCTION funcEj( )
RETURNS setof ejCT
LANGUAGE plpgsql
AS
$$
BEGIN
	RETURN QUERY
		SELECT type, SUM(price) AS totalPrice, MIN(price) AS minPrice
			FROM titles
			WHERE price IS NOT NULL
			GROUP BY type;
END
$$;

SELECT funcEj ();

----------------------------------------------------------------------------------
-- ¿Es correcto el siguiente trigger? Justifique.

CREATE FUNCTION test()
	RETURNS trigger
	LANGUAGE plpgsql
	AS
	$$
	DECLARE
	BEGIN
		NEW.price := 15;
		RETURN NEW; -- statement-level triggers no pueden usar OLD o NEW
	END
	$$;

CREATE TRIGGER trTitles4
	BEFORE INSERT ON titles
	FOR EACH STATEMENT -- STATEMENT-LEVEL!!
	EXECUTE PROCEDURE test();

SELECT * FROM titles;