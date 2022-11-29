-- IMPORT EN DEPARTAMENTO:
CREATE TABLE aux_departamento
	(
	id			int8		not null,
	idDeptoNivelSuperior	int8,
	codigoDepto		int4		not null,
	nombreDepto		varchar(40)	not null,
	reg			int4
	);
	
COPY aux_departamento
FROM 'C:\tmp\departamentoC.csv'
DELIMITER '	'
CSV HEADER;

INSERT INTO Departamento (id,idDeptoNivelSuperior,codigoDepto,nombreDepto)
	SELECT id,idDeptoNivelSuperior,codigoDepto,nombreDepto from aux_departamento;

DROP TABLE aux_departamento;
SELECT * from Departamento;

-- IMPORT EN ÁREA:
CREATE TABLE aux_area
	(
	reg			int4,
	id			int8		not null,
	codigoArea		int4		not null,
	nombreArea		varchar(40)	not null,
	idAreaNivelSuperior	int8		null
	);
	
COPY aux_area
FROM 'C:\tmp\areaC.csv'
DELIMITER '	'
CSV HEADER;

INSERT INTO Area (id, codigoArea, nombreArea, idAreaNivelSuperior)
	SELECT id,codigoArea,nombreArea,idAreaNivelSuperior from aux_area;

DROP TABLE aux_area;
SELECT * from Area;

-- IMPORT EN DISPOSITIVO:
CREATE TABLE aux_dispositivo
	(
	reg		int8		not null,
	id		int8		not null,
	nombrePuerta	varchar(20)	not null,
	numeroSerie	varchar(20)	not null,
	ip		varchar(15)	not null,
	puerto		int4		not null,
	status		int4,
	id_area		int8		not null,
	modelo		varchar(20)	DEFAULT 'Desconocido',
	versionFirmware	varchar(20)	not null,
	fechaInstalac	date		DEFAULT '2022/01/01',
	fechaBaja	date
	);	


COPY aux_dispositivo
FROM 'C:\tmp\dispositivoC.csv'
DELIMITER '	'
CSV HEADER;

INSERT INTO Dispositivo (id,nombrePuerta,numeroSerie,ip,puerto,status,id_area,modelo,versionFirmware,fechaInstalac,fechaBaja)
	SELECT id,nombrePuerta,numeroSerie,ip,puerto,status,id_area,modelo,versionFirmware,fechaInstalac,fechaBaja from aux_dispositivo;

DROP TABLE aux_dispositivo;
SELECT * from Dispositivo;

