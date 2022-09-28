/*==============================================================*/
/*  DROPS: Descomentar tras ejecutar el script por primera vez. */
/*==============================================================*/

drop table persona;
drop table localidad;
drop table provincia;

/*==============================================================*/
/* 			    NIVEL 1                             */
/*==============================================================*/

create table provincia (
	codigo_provincia	smallint	not null,
	nombre			char(60)	not null,
	constraint pk_provincia primary key (codigo_provincia)
);

/*==============================================================*/
/* 			    NIVEL 2                             */
/*==============================================================*/

create table localidad (
	codigo_provincia	smallint	not null,
	codigo_localidad	smallint	not null,
	nombre			char(60)	not null,
	constraint pk_localidad primary key (codigo_provincia,codigo_localidad),
	constraint fk_localidad_references_provincia foreign key (codigo_provincia) references provincia(codigo_provincia)
);

/*==============================================================*/
/* 			    NIVEL 3                             */
/*==============================================================*/

create table persona (
	tipoDocumento		varchar		not null,
		constraint chk_tipoDocumento CHECK (tipoDocumento in ('D', 'LE', 'LC', 'P', 'NI')),
	numeroDocumento		int		not null,
	codigo_localidad	smallint,
	codigo_provincia	smallint,
	apellido		char(120)	not null,
	nombre			char(120)	not null,
	fechaNacimiento		date,
	sexo			char(1)		not null,
		constraint chk_sexo CHECK (sexo in ('F','M','N')),
	observaciones		varchar,
	constraint pk_persona primary key (tipoDocumento,numeroDocumento),
	constraint fk_persona_references_localidad foreign key (codigo_localidad,codigo_provincia) references localidad (codigo_localidad,codigo_provincia)
);