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
SELECT title_id + ' posee un valor de $' +  CONVERT(varchar, price) from titles