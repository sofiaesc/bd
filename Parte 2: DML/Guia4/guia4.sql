--------------------------EJERCICIO 1--------------------------
/*
SELECT au_lname, au_fname, title
	FROM titleauthor TA
		INNER JOIN authors A ON A.au_id = TA.au_id
		INNER JOIN titles T ON T.title_id = TA.title_id
	ORDER BY au_lname ASC 
*/

--------------------------EJERCICIO 2--------------------------
/*
SELECT pub_name,fname + lname 'Empleado', job_lvl 
	from publishers P inner join employee E
		on E.pub_id = P.pub_id
		where job_lvl >= 200
*/

--------------------------EJERCICIO 3--------------------------
/*
SELECT A.au_lname, A.au_fname, SUM(T.price * S.qty) 'Ingresos'
	from authors A
		INNER JOIN titleauthor TA ON A.au_id = TA.au_id
		INNER JOIN titles T ON TA.title_id = T.title_id
		INNER JOIN sales S ON T.title_id = S.title_id
	GROUP BY au_lname, au_fname
	ORDER BY 'Ingresos' DESC
*/
/*
SELECT A2.au_lname, A2.au_fname, (SELECT SUM(T.price * S.qty)
		from authors A
			INNER JOIN titleauthor TA ON A.au_id = TA.au_id
			INNER JOIN titles T ON TA.title_id = T.title_id
			INNER JOIN sales S ON T.title_id = S.title_id
		WHERE A.au_id = A2.au_id) 'Ingresos'
	FROM authors A2
	ORDER BY 'Ingresos' DESC
*/
	
--------------------------EJERCICIO 4--------------------------
/*
SELECT type FROM titles
	GROUP BY type
	HAVING AVG(price) > 12
*/

--------------------------EJERCICIO 5--------------------------
/* -- RESOLUCIÓN CON TOP
SELECT TOP 1 fname,lname FROM employee
	ORDER BY hire_date DESC
*/
/* -- RESOLUCIÓN CON QUERY EXTERNO
SELECT fname, lname FROM employee
	WHERE hire_date = (SELECT max(hire_date) from employee)
*/
--------------------------EJERCICIO 6--------------------------
/* -- RESOLUCIÓN CON JOIN
SELECT P.pub_name
	FROM publishers P INNER JOIN titles T 
		ON P.pub_id = T.pub_id
	WHERE T.type = 'business'
	GROUP BY pub_name
*/
/* -- RESOLUCIÓN CON JOIN PERO DISTINCT EN VEZ DE GROUP BY
SELECT DISTINCT P.pub_name
	FROM publishers P INNER JOIN titles T 
		ON P.pub_id = T.pub_id
	WHERE T.type = 'business'
*/
/* -- RESOLUCIÓN CON QUERY EXTERNO
SELECT P.pub_name
	FROM publishers P
	WHERE pub_id IN (select pub_id
						FROM titles T
						WHERE T.type = 'business')
*/

--------------------------EJERCICIO 7--------------------------
/*
SELECT title from titles 
	WHERE not title_id IN(SELECT title_id
						FROM sales
						WHERE YEAR(ord_date) IN (1994, 1993))
	GROUP BY title
*/

--------------------------EJERCICIO 8--------------------------
/*
SELECT title, pub_name, price 
	FROM titles T INNER JOIN publishers P
	ON T.pub_id = P.pub_id
	WHERE T.price < (SELECT AVG(T2.price)
						FROM titles T2
						WHERE T2.pub_id = P.pub_id)
ORDER BY price DESC
*/

--------------------------EJERCICIO 9--------------------------
/*
SELECT au_fname 'Nombre', au_lname 'Apellido', CASE contract
												WHEN 1 THEN 'Si'
												ELSE 'No'
												END 'Posee contrato?'
	FROM authors
	WHERE state = 'CA'
*/

--------------------------EJERCICIO 10--------------------------
/*
SELECT lname, CASE
				WHEN job_lvl > 100 AND job_lvl < 200 THEN 'Puntaje entre 100 y 200'
				WHEN job_lvl > 200 THEN 'Puntaje mayor que 200'
				ELSE 'Puntaje menor que 100'
				END 'Nivel'
	FROM employee
	ORDER BY 'Nivel',lname ASC
*/

--------------------------ADICIONAL--------------------------
/* -- Obtengo titulo y precio de la publicación, y el promedio de precio de su tipo
SELECT T.title, T.price, (SELECT AVG(T2.price)
							from titles T2
							where T2.type = T.type) AS 'Promedio de precios por tipo'
	from titles T
*/

/* -- Obtengo título y precio de las publicaciones con precio mayor al promedio de su tipo
SELECT T.title, T.price
	from titles T 
	WHERE T.price >= (SELECT AVG(T2.price) from titles T2
						WHERE T2.type = T.type)
*/

/* -- Primero junta todas las tuplas. Después filtra las tuplas. De las tuplas que quedan,
   -- arma los grupos. De los grupos, arma la función de agregación AVG. Después deja sólo
   -- los que tienen más de una instancia (más de un tipo de publicación con una publicación)
   -- type es atributo de grupo porque estoy buscando por type. AVG(PRICE) siempre es un
   -- atributo de grupo.
SELECT type, AVG(price)
	FROM titles
	WHERE pub_id <> '1389' -- no puedo poner WHERE MAX(price) > 100 porque es un atributo
						   -- de grupo en una condición de tupla.
	GROUP BY type
	HAVING COUNT(*) > 1 -- no puedo poner HAVING price < 100, porque estaría poniendo un
						-- atributo de tupla en una condición de grupo.
*/

/* -- Por cada tupla de publicaciones, pregunto si el promedio de precios
   -- para el tipo de publicación que estoy evaluando es mayor que el promedio
   -- de precios para los otros tipos. Obtengo una lista de las publicaciones
   -- de los tipos más caro.
SELECT title, type
	FROM titles T
	WHERE (SELECT AVG(price)
			FROM titles T2
			WHERE T2.type = T.type) > (SELECT AVG(price)
										FROM titles T3
										WHERE T3.type <> T.type)
*/

/* -- La única forma de sacar au_lname y au_fname es haciendo GROUP BY, esto es,
   -- convertirlos en atributos de grupo para que no colisione con MIN y MAX.
SELECT A.au_lname, A.au_fname, MIN(price) 'Precio mínimo', MAX(price) 'Precio máximo'
	FROM authors A 
	INNER JOIN titleauthor TA
		ON A.au_id = TA.au_id
	INNER JOIN Titles T 
		ON TA.title_id = T.title_id
	GROUP BY A.au_lname, A.au_fname 
*/

/* -- Le sumo al precio de las publicaciones en 'business' 100 y a las demás
   -- publicaciones le sumo 160.
SELECT title, type, price 'Precio original', price + CASE type 
						WHEN 'business' then 100
						ELSE 160
					END 'Precio incrementado'
	FROM titles
*/

/* -- Obtengo una tabla con las publicaciones de tipo business y popular_comp
SELECT type, title
	FROM titles
	WHERE type = 'business'
	
UNION ALL

SELECT type, title
	FROM titles
	WHERE type = 'popular_comp'
*/

/* -- Si quiero ordenar esa tabla con la unión, la puedo meter en otro select
   -- y a ese hacerle el order by. Sino, solo le aplica el order a un select.
SELECT /*TOP 2*/ derivada.title, derivada.type
	FROM (SELECT type, title
				FROM titles
				WHERE type = 'business'
	
			UNION ALL

			SELECT type, title
				FROM titles
				WHERE type = 'popular_comp') derivada
	ORDER BY title
*/