/* JOIN es lo que necesito cuando necesito consultar cosas que no están en una
misma tabla. Así relaciono y enlazo para obtener lo que necesito. Hay distintos
tipos de JOIN: LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN. 
Si tengo una base de datos grande no la tengo que usar porque obtengo una tabla
muy grande como resultado de la consulta. */

/* CROSS JOIN: Obtengo una tabla de mxn, con las m instancias de la primera tabla 
	relacionadas con las n instancias de la segunda. */
	
/*
CREATE TABLE R1
 (
 A Integer,
 B Integer
 )

CREATE TABLE S1
 (
 B Integer,
 C Integer,
 D Integer
 )
INSERT R1 VALUES (1, 2)
INSERT R1 VALUES (3, 4)
INSERT S1 VALUES (2, 5, 6)
INSERT S1 VALUES (4, 7, 8)
INSERT S1 VALUES (9, 10, 11)
SELECT A, R1.B 'R1.B', S1.B 'S1.B', C, D
 FROM R1 CROSS JOIN S1 -- me arma una matriz cuyas filas son las combinaciones de las instancias de R1 con las de R2, 2*3 = 6 tuplas*//* -- me devuelve la cantidad de filas de la tabla (23)Select COUNT(*) FROM authors *//* -- me relaciona cada autor con los demás, como hay 23 autores, 23*23 filas	(algunas combinaciones se repiten pero dadas vuelta)SELECT a1.au_lname, a1.city, a2.au_lname, a2.city
 FROM authors a1 CROSS JOIN authors a2*//* -- otra sintaxis media sin querer pero que hace lo mismo que la anteriorSELECT a1.au_lname, a1.city, a2.au_lname, a2.city
 FROM authors a1, authors a2*//* -- hace lo mismo que antes, relaciona autor con autorSELECT a1.au_lname, a1.city, a2.au_lname, a2.city
 FROM authors a1, authors a2*//* -- relaciona autor con autor, evitando que un autor se relacione consigo mismoSELECT a1.au_lname, a1.city, a2.au_lname, a2.city
 FROM authors a1 CROSS JOIN authors a2
 WHERE a1.au_lname <> a2.au_lname*//* -- relaciona autor con autor, con autores distintos y de la misma ciudadSELECT a1.au_lname, a2.au_lname, a1.city
 FROM authors a1 CROSS JOIN authors a2
 WHERE a1.au_lname <> a2.au_lname AND
 a1.city = a2.city
*/

/* -- relaciona autor con autor, con autores distintos y de la misma ciudad   -- arregla problema de que autores se relacionen dos veces pero invertidosSELECT a1.au_lname, a2.au_lname, a1.city
 FROM authors a1 CROSS JOIN authors a2
 WHERE a1.au_lname < a2.au_lname AND
 a1.city = a2.city 
*/

--------------------------------------------------------------------------------
/* INNER JOIN: Lo usamos más en general. Compara con operador de igualdad 
	dadas dos columnas, esto es, los matchea sólo si éstas son iguales. */

/* -- obtengo el titulo de titles y el nombre de publishers,
   -- con un alias para titles (T) y otro para publishers (p)
   -- buscando el publisher con la referencia (el id de fk)
SELECT T.title, P.pub_name
 FROM Titles T INNER JOIN Publishers P
 ON T.pub_id = P.pub_id*//* -- selecciona el nombre del publisher del title tal que el   -- autor del title tenga un cierto id. de esta forma, veo   -- con qué editorial se ha relacionado cierto autor con su id.SELECT P.pub_name
 FROM Publishers P INNER JOIN Titles T
 ON P.pub_id = T.pub_id
 INNER JOIN titleauthor TA
 ON T.title_id = TA.title_id -- sintaxis del inner join
 WHERE TA.au_id = '998-72-3567' -- cuando APARTE del inner join necesitas filtrar por otra cosa.*//* -- obtengo la id y el nombre del publisher, y el id del title   -- tal que estos dos se relacionan, o sea, obtengo la id de la   -- editorial, su nombre y los títulos que sacaron   -- las editoriales que no sacaron libros no van a aparecer acáSELECT publishers.pub_id, pub_name, titles.title_id
 FROM publishers INNER JOIN titles
 ON publishers.pub_id = titles.pub_id */----------------------------------------------------------------------------/* LEFT JOIN/LEFT OUTER JOIN y RIGHT JOIN/RIGHT OUTER JOIN: Obtengo los	resultados que cumplen la condición especificada y también aquellos	resultados que no tienen una relación definida (null). *//* -- como el anterior, pero sí obtengo todas las editoriales que hay,   -- con un null en el caso de aquellas que no publicaron titulos.SELECT publishers.pub_id, pub_name, titles.title_id
 FROM publishers LEFT JOIN titles
 ON publishers.pub_id = titles.pub_id*//* -- funciona igual que el LEFT JOINSELECT publishers.pub_id, pub_name, titles.title_id
 FROM titles RIGHT JOIN publishers
 ON titles.pub_id = publishers.pub_id 
*/

----------------------------------------------------------------------------
/* FULL OUTER JOIN: */
/* -- en este caso, se obtienen también publicaciones que no tengan
-- una editorial asociada con las que tengo instancias.
SELECT publishers.pub_id, pub_name, titles.title_id
 FROM publishers FULL OUTER JOIN titles
 ON publishers.pub_id = titles.pub_id
*/

/* -- selecciono apellidos de dos autores, tal que éstos sean de la misma
   -- ciudad y me aseguro de no repetir duplas o coincidencias con la 
   -- condicion de menor. Si pusiera <= aparecen repetidos consigo mismos. 
   -- Si pusiera <> (desigual), se repetirían duplas.
SELECT Autor1.au_lname, Autor2.au_lname
 FROM authors Autor1, authors Autor2 -- sintaxis simplificada
 WHERE Autor1.city = Autor2.city AND
 Autor1.au_lname < Autor2.au_lname
*/