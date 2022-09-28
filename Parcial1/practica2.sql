/*---------------------- DROPS ----------------------*/
DROP TABLE sala;
DROP TABLE especialidad;

/*---------------------- NIVEL 1 ----------------------*/
/* TABLE: ESPECIALIDAD */
CREATE TABLE especialidad (
	id			int		NOT NULL,
	cod_especialidad	smallint	NOT NULL,
	nom_especialidad	char(40)	NOT NULL,
	constraint pk_especialidad primary key (id)
);


/*---------------------- NIVEL 2 ----------------------*/
/* TABLE: SALA */
CREATE TABLE sala (
	id			int		NOT NULL,
	numero_sala		smallint	NOT NULL,
	nombre_sala		char(30)	NOT NULL,
	capacidad_sala		smallint,
	nivel_sala		char(1)		NOT NULL,
		constraint chk_nivel_sala CHECK  (nivel_sala in ('A','B','C')),
	id_especialidad 	smallint,
	id_sala_mayor		smallint,
	constraint pk_sala primary key (id)
);


/*---------------------- ALTERS ----------------------*/
ALTER TABLE especialidad
	add constraint AK_ESPECIALIDAD UNIQUE (cod_especialidad);
	
ALTER TABLE sala
	add constraint FK_SALA_REFERENCES_ESP foreign key (id_especialidad) references especialidad(id)
	on delete restrict on update restrict;

ALTER TABLE sala
	add constraint FK_SALA_REFERENCES_SALA foreign key (id_sala_mayor) references sala(id)
	on delete restrict on update restrict;

ALTER TABLE sala
	add constraint AK_SALA UNIQUE (numero_sala);