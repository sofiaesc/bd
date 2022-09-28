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
	id			int		not null,
	codigo_provincia	smallint	not null,
	nombre			char(60)	not null,
	constraint pk_provincia primary key (id),
	constraint uk_provincia UNIQUE (codigo_provincia)
);

/*==============================================================*/
/* 			    NIVEL 2                             */
/*==============================================================*/

create table localidad (
	id			int		not null,
	id_provincia		smallint	not null,
	codigo_localidad	smallint	not null,
	nombre			char(60)	not null,
	constraint pk_localidad primary key (id),
	constraint uk_localidad UNIQUE (id_provincia, codigo_localidad),
	constraint fk_localidad_references_provincia foreign key (id_provincia) references provincia(id)
);

create index idx_localidad_provincia on localidad (id_provincia);

/*==============================================================*/
/* 			    NIVEL 3                             */
/*==============================================================*/

create table persona (
	id			int		not null,
	tipoDocumento		varchar		not null,
		constraint chk_tipoDocumento CHECK (tipoDocumento in ('D', 'LE', 'LC', 'P', 'NI')),
	numeroDocumento		int		not null,
	id_localidad	smallint,
	id_provincia	smallint,
	apellido		char(120)	not null,
	nombre			char(120)	not null,
	fechaNacimiento		date,
	sexo			char(1)		not null,
		constraint chk_sexo CHECK (sexo in ('F','M','N')),
	observaciones		varchar,
	constraint pk_persona primary key (id),
	constraint uk_persona UNIQUE (tipoDocumento,numeroDocumento),
	constraint fk_persona_references_localidad foreign key (id_provincia,id_localidad) references localidad (id_provincia,id)
);

create index idx_persona_localidad on persona (id_provincia,id_localidad);