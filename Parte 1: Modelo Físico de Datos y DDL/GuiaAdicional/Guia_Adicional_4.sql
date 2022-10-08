/*==============================================================*/
/*  DROPS: Descomentar tras ejecutar el script por primera vez. */
/*==============================================================*/

DROP TABLE persona;
DROP TABLE localidad;
DROP TABLE provincia;

/*==============================================================*/
/* 			    NIVEL 1                             */
/*==============================================================*/

CREATE TABLE provincia (
	codigo_provincia	smallint	not null,
	nombre			char(60)	not null,
	constraint pk_provincia primary key (codigo_provincia)
);

/*==============================================================*/
/* 			    NIVEL 2                             */
/*==============================================================*/

CREATE TABLE localidad (
	codigo_provincia	smallint	not null,
	codigo_localidad	smallint	not null,
	nombre			char(60)	not null,
	constraint pk_localidad primary key (codigo_localidad, codigo_provincia)
);

/*==============================================================*/
/* 			    NIVEL 3                             */
/*==============================================================*/

CREATE TABLE persona (
	tipoDocumento		varchar		not null,
		constraint chk_tipo_doc CHECK (tipoDocumento in ('D','LE','LC','P','NI')),
	numeroDocumento		int		not null,
	codigo_localidad	smallint,
	codigo_provincia	smallint,
	apellido		char(120)	not null,
	nombre			char(120)	not null,
	fechaNacimiento		date,
	sexo			char(1)		not null,
		constraint chk_sexo CHECK (sexo in ('F','M','N')),
	observaciones		varchar,
	constraint pk_persona primary key (tipoDocumento,numeroDocumento)
);

/*==============================================================*/
/* 			     ALTERS                             */
/*==============================================================*/

ALTER TABLE localidad
	add constraint fk_loc_references_prov foreign key (codigo_provincia) references provincia(codigo_provincia)
	on delete restrict on update restrict;

ALTER TABLE persona
	add constraint fk_pers_references_loc foreign key (codigo_localidad,codigo_provincia) references localidad(codigo_localidad,codigo_provincia)
	on delete restrict on update restrict;
