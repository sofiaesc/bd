---------------------- E j e r c i c i o 1 ----------------------------
/*
SELECT title_id, title, type, price * 1.08 FROM titles
*/


---------------------- E j e r c i c i o 2 ----------------------------
/*
SELECT title_id, title, type, price * 1.08 'precio actualizado' FROM titles
*/


---------------------- E j e r c i c i o 3 ----------------------------
/*
SELECT title_id, title, type, price * $1.08 'precio actualizado' FROM titles
	ORDER BY 'precio actualizado' DESC
*/


---------------------- E j e r c i c i o 4 ----------------------------
/*
SELECT title_id, title, type, price * $1.08 'precio actualizado' FROM titles
	ORDER BY 4 DESC
*/


---------------------- E j e r c i c i o 5 ----------------------------
/*
SELECT au_lname + ', ' + au_fname 'Listado de autores' FROM authors
	ORDER BY 1 ASC
*/


---------------------- E j e r c i c i o 6 ----------------------------
/*
SELECT title_id + ' posee un valor de $' + CAST(price as VARCHAR) FROM titles
*/


---------------------- E j e r c i c i o 7 ----------------------------
/*
SELECT title_id + ' posee un valor de $' +  CONVERT(varchar, price) from titles*/---------------------- E j e r c i c i o 8 ----------------------------/*SELECT title_id, price from titles	WHERE NOT price > 13*//*SELECT title_id, price from titles	WHERE price < 13*/	---------------------- E j e r c i c i o 9 ----------------------------/*SELECT lname, hire_date from employee	WHERE hire_date between '01/01/1991' AND '01/01/1992'*//*SELECT lname, hire_date from employee	WHERE hire_date > '01/01/1991' AND hire_date < '01/01/1992'*/---------------------- E j e r c i c i o 10 ----------------------------/*SELECT au_id, address, city from authors	WHERE au_id = '172-32-1176' or au_id = '238-95-7766'*//*	SELECT au_id, address, city from authors	WHERE au_id IN ('172-32-1176', '238-95-7766')*/---------------------- E j e r c i c i o 11 ----------------------------/*SELECT title_id,title from titles	WHERE title LIKE '%computer%'*/---------------------- E j e r c i c i o 12 ----------------------------/*SELECT pub_name,city,state FROM publishers	WHERE state is NULL*/---------------------- E j e r c i c i o 13 ----------------------------/*SELECT * FROM Sales	WHERE MONTH (ord_date) = 6*/