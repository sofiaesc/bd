/* ============================ */
/*           DROPS		*/
/* ============================ */

-- primero elimino las relaciones para que no haya error
ALTER TABLE sala
	drop constraint fk_sala_references_sector;
ALTER TABLE sala
	drop constraint fk_sala_references_especialidad;
ALTER TABLE sala
	drop constraint pk_sala;
ALTER TABLE especialidad
	drop constraint pk_especialidad;
drop table sector;
drop table seccion;

/* ============================ */
/*           CAMBIOS		*/
/* ============================ */

ALTER TABLE especialidad
	add column id 	int	 not null;
	
ALTER TABLE especialidad
	add constraint pk_especialidad primary key (id);
ALTER TABLE especialidad
	add constraint uk_especialidad UNIQUE (codigo_especialidad);

ALTER TABLE sala
	drop column codigo_sector;
ALTER TABLE sala
	drop column codigo_seccion;

ALTER TABLE sala
	add column id 	int 	not null;
ALTER TABLE sala
	add column id_sala_mayor int;
ALTER TABLE sala -- no renombro porque tengo que poner que puede ser null.
	drop column codigo_especialidad;
ALTER TABLE sala
	add column id_especialidad int;

ALTER TABLE sala
	add constraint pk_sala primary key (id);
ALTER TABLE sala
	add constraint uk_sala unique (nro_sala);
ALTER TABLE sala
	add constraint fk_sala_references_especialidad foreign key (id_especialidad) references especialidad(id);
ALTER TABLE sala
	add constraint fk_sala_references_sala foreign key (id_sala_mayor) references sala(id);

ALTER TABLE sala
	add column nivel char(1) not null;
ALTER TABLE sala
	add constraint chk_nivel CHECK (nivel in ('A','B','C'));