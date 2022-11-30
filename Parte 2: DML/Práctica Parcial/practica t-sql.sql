-- Obtener apellido y nombre de los pilotos entrenados para pilotear TODOS los aviones de la tabla avi�n.

CREATE TABLE Piloto
	(
	idPiloto int,
	apeNom varchar(60),
	constraint pk_piloto primary key (idPiloto)
	)
	
CREATE TABLE Avion
	(
	idAvion int,
	nombreAvion varchar(100),
	constraint pk_avion primary key (idAvion)
	)
	
CREATE TABLE Entrenamiento
	(
	idPiloto int,
	idAvion int,
	constraint pk_entrenamineto primary key (idPiloto,idAvion),
	constraint fk_entramiento_piloto foreign key (idPiloto) references Piloto (idPiloto),
	constraint fk_entramiento_avion foreign key (idAvion) references Avion (idAvion)
	)

SELECT P.apeNom from Piloto P
	INNER JOIN Entrenamiento E ON E.idPiloto = P.idPiloto
	GROUP BY apeNom
	HAVING COUNT(*) = (SELECT COUNT(*) FROM Avion)

----------------------------------------------------------------------------------------------------------
-- Solo puede haber una ocurrencia empleado/dominio con estado activo "A" en un momento dado. 
-- Debe ser el utilizado más recientemente. Se acaban de importar datos a la tabla EmpDom y hay
-- algunos estados en NULL y otros que no están actualizados (están como activos sin ser el más reciente)

CREATE Empleado
	(
		idEmpleado 	int 		not null,
		apeNom		varchar(60)	not null,
		constraint pk_empleado primary key (idEmpleado)
	)

CREATE Dominio
	(
		idDominio 	int			not null,
		dominio		varchar(16)	not null,
		constraint pk_dominio primary key (idDominio)
	)
CREATE EmpDom
	(
		idEmpleado 	int		not null,
		idDominio	int		not null,
		constraint pk_empdom primary key (idEmpleado,idDominio),
		constraint fk_empdom_references_empleado foreign key (idEmpleado) references Empleado (idEmpleado),
		constraint fk_empdom_references_dominio foreign key (idDominio) references Dominio (idDominio)
	)

CREATE curEmpleado CURSOR
	FOR SELECT IDEmpleado FROM Empleado
	
DECLARE @id_emp int
OPEN curEmpleado
FETCH NEXT FROM curEmpleado into @id_emp

WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @fechaMax datetime,
				@dominio		int,
				@fecha	datetime,
				@dominioActivo	int
		SET @fechaMax = '1900-01-01'
		PRINT @fechaMax
		
		CREATE curEmpDom CURSOR
			FOR SELECT idDominio FROM EmpDom WHERE IDEmpleado = @id_emp
		FETCH NEXT curEmpDom INTO @dominioActivo
		
		WHILE @@FETCH_STATUS = 0
			IF @fechaMax < (SELECT @fecha = fechaUltimaAutentic from EmpDom 
							where IDDominio = @dominioActivo AND IDEmpleado = @id_emp)
			BEGIN
				@fechaMax = @fecha
				@dominioActivo = @dominio
			END
			FETCH NEXT curEmpDom INTO @dominioActivo
		END
		
		CLOSE curEmpDom
		DEALLOCATE curEmpDom
		
		UPDATE curEmpDom WHERE IDEmpleado = @id_emp AND IDDominio != @dominioactivo
			SET Estado = 'I' 
		UPDATE curEmpDom WHERE IDEmpleado = @id_emp AND FechaUltimaAutentic = @fechaMax AND IDDominio = @dominioactivo
			SET Estado = 'I' 
		
		FETCH NEXT FROM curEmpleado into @id_emp
	END

CLOSE curEmpleado
DEALLOCATE curEmpleado
	
----------------------------------------------------------------------------------------------------------
-- Dado el siguiente modelo de datos, obtener la razón social de los proovedores que, como mínimo, proveen
-- todos los componentes que provee el proveedor con idProveedor con valor 200.

CREATE TABLE Proveedor
	(
	idProv smallint		not null,
	razonSocial varchar(70),
	constraint pk_proveedor primary key (idProv)
	)
CREATE TABLE Componente 
	(
	idComponente 	int			not null,
	descripcion 	varchar(60),
	constraint pk_componente primary key (idComponente)
	)
CREATE TABLE ProvComp
	(
	idProv			smallint 	not null,
	idComponente	int			not null,
	constraint pk_provcomp primary key (idProv,idComponente),
	constraint fk_provcomp_references_proveedor foreign key (idProv) references Proveedor (idProv),
	constraint fk_provcomp_references_componente foreign key (idComponente) references Componenete (idComponente)
	)

INSERT Proveedor
	VALUES (200,'prov 1')
INSERT Proveedor
	VALUES(201,'prov 2')
INSERT Proveedor
	VALUES (202,'prov 3')
INSERT Componente
	VALUES(1,'comp 1')
INSERT Componente
	VALUES(2,'comp 2')
INSERT ProvComp
	VALUES(200,1)
INSERT ProvComp
	VALUES(200,2)
INSERT ProvComp
	VALUES(201,1)
INSERT ProvComp
	VALUES(201,2)
INSERT ProvComp
	VALUES(202,1)

SELECT P.razonSocial FROM proveedor P -- versión sin inner join y con where
	WHERE (SELECT COUNT(*) FROM ProvComp PC WHERE PC.idProv = 200) <= 
			(SELECT COUNT(*) FROM ProvComp PC2 WHERE PC2.idProv = P.idProv) AND P.idProv != 200

----------------------------------------------------------------------------------------------------------
-- Dado el siguiente modelo de datos, obtener los nombres y apellidos de los proveedores que proveen todos
-- los productos de la lista Producto.

CREATE TABLE Proveedor
	(
	idProveedor int not null,
	apeNom	varchar(30),
	domicilio	varchar(50),
	telefono	varchar(20)
	constraint pk_proveedor primary key (idProveedor)
	)
	
CREATE TABLE Producto
	(
	idProducto int not null,
	descripcion varchar(50),
	precio float,
	constraint pk_producto primary key (idProducto)
	)
	
CREATE TABLE ProvProd
	(
	idProveedor int not null,
	idProducto int not null,
	constraint pk_provprod primary key (idProveedor, idProducto),
	constraint fk_provprod_references_proveedor foreign key (idProveedor) references Proveedor (idProveedor),
	constraint fk_provprod_references_producto foreign key (idProducto) references Producto (idProducto)
	)

INSERT INTO Proveedor VALUES (1, 'Acosta Juan','Bv Galvez 2000','4488993')
INSERT INTO Proveedor VALUES (2, 'Villalba Ignacio','Av. Gral Paz 5900','4562105')
INSERT INTO Proveedor VALUES (3, 'Maderos Juan','Saavedra 2100','4332041')

INSERT INTO Producto VALUES (1,'Resma A4 80G',200)
INSERT INTO Producto VALUES (2,'Mouse Optical Genius',50)

INSERT INTO ProvProd VALUES (1,1)
INSERT INTO ProvProd VALUES (1,2)
INSERT INTO ProvProd VALUES (2,1)
INSERT INTO ProvProd VALUES (3,2)

SELECT Prov.apeNom FROM ProvProd PP INNER JOIN Proveedor Prov -- versión con inner join y having
										ON PP.idProveedor = Prov.idProveedor
					GROUP BY apeNom
					HAVING COUNT(PP.idProveedor) = (SELECT COUNT(Prod2.idProducto) FROM Producto Prod2)

----------------------------------------------------------------------------------------------------------
-- Generar una tabla que liste los diferentes años en los que se produjeron ventas junto al mes en que se
-- vendió la mayor cantidad de publicaciones:

create table MesMaximasVentas
	(
	anio	int		not null,
	mes		int		not null
	)
	
DECLARE curAnios CURSOR
	FOR SELECT DISTINCT YEAR(ord_date) FROM sales

DECLARE @anio int,
		@mes_max_venta int

OPEN curAnios
FETCH NEXT FROM curAnios INTO @anio

WHILE @@FETCH_STATUS = 0
BEGIN
	set @mes_max_venta = (SELECT TOP 1 MONTH(ord_date) FROM sales
												WHERE YEAR(ord_date) = @anio
												GROUP BY MONTH(ord_date)
												ORDER BY SUM(qty) DESC)
	insert into MesMaximasVentas values (@anio,@mes_max_venta)
	FETCH NEXT FROM curAnios INTO @anio
END

CLOSE curAnios
DEALLOCATE curAnios