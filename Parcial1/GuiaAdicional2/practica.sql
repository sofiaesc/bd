-- Database: salas_hospital
DROP TABLE sala;
DROP TABLE sector;
DROP TABLE seccion;
DROP TABLE especialidad;

-- Table: ESPECIALIDAD (ORDEN 1)
CREATE TABLE especialidad (
	codigo_especialidad	int		NOT NULL,
	nom_especialidad	char(40)	NOT NULL,
	constraint pk_especialidad primary key (codigo_especialidad)
);

-- Table: SECCION (ORDEN 1)
CREATE TABLE seccion (
	codigo_seccion	int		NOT NULL,
	nombre_seccion	char(30)	NOT NULL,
	constraint pk_seccion primary key (codigo_seccion)
);

-- Table: SECTOR (ORDEN 2)
CREATE TABLE sector (
	codigo_seccion 	int		NOT NULL,
	codigo_sector	int		NOT NULL,
	nom_sector	char(30)	NOT NULL,
	constraint pk_sector primary key (codigo_sector,codigo_seccion)
);

-- Table: SALA (ORDEN 3)
CREATE TABLE sala (
	codigo_seccion		int	NOT NULL,
	codigo_sector		int	NOT NULL,
	nro_sala		int	NOT NULL,
	codigo_especialidad	int	NOT NULL,
	nom_sala		char(30),
	capacidad		int,
	constraint pk_sala primary key (nro_sala,codigo_sector,codigo_seccion)
);

-- ALTERS:
ALTER TABLE sector 
	add constraint fk_sector_references_seccion foreign key (codigo_seccion) references seccion (codigo_seccion)
	on delete restrict on update restrict;

ALTER TABLE sala
	add constraint fk_sala_references_sector foreign key (codigo_seccion,codigo_sector) references sector (codigo_seccion,codigo_sector)
	on delete restrict on update restrict;

ALTER TABLE sala
	add constraint fk_sala_references_especialidad foreign key (codigo_especialidad) references especialidad (codigo_especialidad)
	on delete restrict on update restrict;
	
