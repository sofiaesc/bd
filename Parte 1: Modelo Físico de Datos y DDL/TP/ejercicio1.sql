 --- DROPS:
 /*
DROP TABLE Evento;
DROP TABLE Habilitacion;
DROP TABLE Huella;
DROP TABLE Dispositivo;
DROP TABLE Persona;
DROP TABLE Area;
DROP TABLE Departamento;
DROP TABLE Tarjeta;
*/


-- CREACIÓN DE TABLAS:
CREATE TABLE Tarjeta
	(
	id		int8		NOT NULL,
	numeroTarjeta	int8		NOT NULL,
	tipoDispositivo	VARCHAR(15) 	NOT NULL
		constraint CHK_TIPODISPOSITIVO_TARJETA check (TIPODISPOSITIVO in ('TARJETA','LLAVERO','OTRO')),
	fechaBaja	DATE,
	CONSTRAINT pk_tarjeta primary key (id),
	CONSTRAINT uk_tarjeta unique (numeroTarjeta)
	);

CREATE TABLE Departamento
	(
	id			int8		not null,
	idDeptoNivelSuperior	int8,
	codigoDepto		int4		not null,
	nombreDepto		varchar(40)	not null,
	nombreCompleto		varchar(120)	not null	default 'Desconocido',
	CONSTRAINT pk_departamento primary key (id),
	CONSTRAINT uk_departamento unique (codigoDepto),
	CONSTRAINT fk_departamento_references_departamento foreign key (idDeptoNivelSuperior) references Departamento (id)
	);

CREATE TABLE Area
	(
	id			int8		not null,
	codigoArea		int4		not null,
	nombreArea		varchar(40)	not null,
	idAreaNivelSuperior	int8		null,
	nombreCompleto		varchar(120)	not null	default 'Desconocido',
	CONSTRAINT pk_area primary key (id),
	CONSTRAINT uk_area unique (codigoArea),
	CONSTRAINT fk_area_references_area foreign key (idAreaNivelSuperior) references Area (id)
	);

CREATE TABLE Persona
	(
	id			int8		not null,
	documento		int8		not null,
	id_departamento		int8		not null,
	id_tarjeta		int8,
	apellidoNombre		varchar(100)	not null,
	fechaBaja		date,
	telefono		varchar(20),
	telefonoMovil		varchar(20),
	fechaNacimiento		date,
	correoElectronico	varchar(60),
	genero			char
		constraint CHK_GENERO_PERSONA check (GENERO is null or (GENERO in ('M','F','O'))),
	observaciones		VARCHAR(256),
	CONSTRAINT pk_persona primary key (id),
	CONSTRAINT fk_persona_references_departamento foreign key (id_departamento) references Departamento (id),
	CONSTRAINT fk_persona_references_tarjeta foreign key (id_tarjeta) references Tarjeta (id),
	CONSTRAINT uk_persona_documento unique (documento),
	CONSTRAINT uk_persona_tarjeta unique (id_tarjeta)
	);

CREATE TABLE Dispositivo
	(
	id		int8		not null,
	nombrePuerta	varchar(20)	not null,
	numeroSerie	varchar(20)	not null,
	ip		varchar(15)	not null,
	puerto		int4		not null,
	status		int4
		constraint CHK_STATUS_DISPOSIT check (STATUS is null or (STATUS in (0,1,3,4))),
	id_area		int8		not null,
	modelo		varchar(20)	DEFAULT 'Desconocido',
	versionFirmware	varchar(20)	not null,
	fechaInstalac	date		DEFAULT '2022/01/01',
	fechaBaja	date,
	CONSTRAINT pk_dispositivo primary key (id),
	CONSTRAINT fk_dispositivo_references_area foreign key (id_area) references Area (id),
	CONSTRAINT uk_dispositivo_nombrePuerta unique (nombrePuerta),
	CONSTRAINT uk_dispositivo_numeroSerie unique (numeroSerie),
	CONSTRAINT uk_dispositivo_ip unique (ip)
	);
	
CREATE TABLE Huella
	(
	id		int8	not null,
	id_persona	int8	not null,
	numeroDedo	int2	not null,
	huella		text	not null,
	CONSTRAINT pk_huella primary key (id),
	constraint uk_huella unique (id_persona,numeroDedo),
	CONSTRAINT fk_huella_references_persona foreign key (id_persona) references Persona (id)
	);

CREATE TABLE Habilitacion
	(
	id		int8	not null,
	id_persona	int8	not null,
	id_dispositivo	int8	not null,
	tipoAcceso	char(1)	not null
		constraint CHK_TIPOACCESO_HABILITA check (TIPOACCESO in ('T','D')),
	fechaDesde	date	not null,
	fechaHasta	date,
	CONSTRAINT pk_habilitacion primary key (id),
	CONSTRAINT fk_habilitacion_references_persona foreign key (id_persona) references Persona (id),
	CONSTRAINT fk_habilitacion_references_dispositivo foreign key (id_dispositivo) references Dispositivo (id),
	CONSTRAINT uk_habilitacion unique (id_persona, id_dispositivo)
	);

CREATE TABLE Evento
	(
	id		int8		not null,
	id_evento	int8		not null,
	id_dispositivo	int8		not null,
	momento		timestamp	not null,
	tipoEvento	varchar(20)	not null
		constraint CHK_TIPOEVENTO_EVENTO check (TIPOEVENTO in ('1','2','9')),
	observaciones	varchar(200),
	id_persona	int8,
	CONSTRAINT pk_evento primary key (id),
	CONSTRAINT fk_evento_references_dispositivo foreign key (id_dispositivo) references Dispositivo(id),
	CONSTRAINT fk_evento_references_persona foreign key (id_persona) references Persona (id),
	CONSTRAINT uk_evento unique (id_dispositivo,id_evento)
	);

-- CREACIÓN DE INDICES:
create index idx_persona_departamento on Persona(id_departamento);
create index idx_dispositivo_area on Dispositivo(id_area);
create index idx_habilitacion_dispositivo on Habilitacion(id_dispositivo);
create index idx_evento_persona on Evento(id_persona);