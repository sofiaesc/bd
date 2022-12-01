DROP TABLE coloquio
SELECT pub_id INTO coloquio FROM publishers

DECLARE @anios varchar(4),
		@pub char(4),
		@cant smallint,
		@sqldir1 varchar(300),
		@sqldir2 varchar(300)

-- ARMO LA TABLA
DECLARE curAnios CURSOR 
			FOR SELECT DISTINCT CONVERT(varchar,YEAR(ord_date)) FROM sales

OPEN curAnios
FETCH NEXT FROM curAnios INTO @anios
 
WHILE @@FETCH_STATUS = 0 
BEGIN
	SET @sqldir1 = 'ALTER TABLE coloquio ADD Anio' + @anios + ' varchar(4)'
	EXEC (@sqldir1)
	FETCH NEXT FROM curAnios INTO @anios
END

CLOSE curAnios
DEALLOCATE curAnios


-- LLENO LA TABLA
DECLARE curPub CURSOR
	FOR SELECT p.pub_id, convert(varchar(4),year(s.ord_date)), SUM(s.qty)
		FROM sales s INNER JOIN titles t
						ON s.title_id = t.title_id
					 INNER JOIN publishers p 
						ON p.pub_id = t.pub_id
		GROUP BY p.pub_id, convert(varchar(4),year(s.ord_date))

OPEN curPub
FETCH NEXT FROM curPub INTO @pub, @anios, @cant

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @sqldir2 = 'UPDATE coloquio SET Anio' + @anios + ' = '
	SET @sqldir2 = @sqldir2 + convert(varchar(5),@cant)
	SET @sqldir2 = @sqldir2 + ' WHERE pub_id = ' + @pub
	EXEC(@sqldir2)
	FETCH NEXT FROM curPub INTO @pub, @anios, @cant
END

CLOSE curPub
DEALLOCATE curPub

SELECT * from coloquio
