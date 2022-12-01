--------------------- ARMADO DE TABLA

DROP TABLE coloquio_aux;
CREATE TABLE coloquio_aux
	(
	editorial	varchar(4)	NOT NULL
	);

INSERT INTO coloquio_aux 
	SELECT DISTINCT pub_id FROM publishers;

CREATE OR REPLACE FUNCTION armadoDeTabla()
	RETURNS void
	language plpgsql
	AS
	$$
DECLARE 
	sqldir1	varchar(300); 
	anio	varchar(4);
	curAnio	CURSOR FOR SELECT DISTINCT CAST(date_part('year',ord_date) AS varchar) from sales;

BEGIN
OPEN curAnio;
LOOP
	FETCH NEXT FROM curAnio INTO anio;
	EXIT WHEN NOT FOUND;

	sqldir1 := 'ALTER TABLE coloquio_aux 
			ADD Anio' || anio || ' int';
	EXECUTE  sqldir1;

END LOOP;
CLOSE curAnio;

END;
$$;

SELECT armadoDeTabla();
select * from coloquio_aux;


--------------------- LLENADO DE TABLA

CREATE OR REPLACE FUNCTION llenadoDeTabla()
	RETURNS void
	language plpgsql
	AS
	$$
DECLARE 
	sqldir2 	varchar(300);
	anio		varchar(4);
	pub		varchar(4);
	cant		integer;
	curLlenado	CURSOR FOR SELECT P.pub_id AS "pub", CAST(date_part('year',S.ord_date) AS varchar) AS "Anio", sum(S.qty) AS "Cant"
					FROM sales S INNER JOIN titles T ON T.title_id = S.title_id
						     INNER JOIN publishers P ON P.pub_id = T.pub_id
					GROUP BY P.pub_id,CAST(date_part('year',S.ord_date) AS varchar)
					ORDER BY P.pub_id,CAST(date_part('year',S.ord_date) AS varchar);
BEGIN
OPEN curLlenado;
LOOP
	FETCH NEXT FROM curLlenado INTO pub,anio,cant;
	EXIT WHEN NOT FOUND;
	
	sqldir2 := 'UPDATE coloquio_aux
			SET anio' || anio || ' = ';
	sqldir2 := sqldir2 || cant;
	sqldir2 := sqldir2 || ' WHERE editorial = ''' || pub || '''';
	EXECUTE  sqldir2;

END LOOP;
CLOSE curLlenado;

END;
$$;

SELECT llenadoDeTabla();
select * from coloquio_aux;