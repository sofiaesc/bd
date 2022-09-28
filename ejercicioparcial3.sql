/*==============================================================*/
/*  			     DROPS 				*/
/*==============================================================*/

ALTER TABLE persona
	drop constraint pk_persona;
ALTER TABLE persona
	drop constraint fk_persona_references_localidad;
	
ALTER TABLE localidad
	drop constraint pk_localidad;
ALTER TABLE localidad
	drop constraint fk_localidad_references_provincia;
	
ALTER TABLE provincia
	drop constraint pk_provincia;

/*==============================================================*/
/*  			    CAMBIOS 				*/
/*==============================================================*/

ALTER TABLE provincia -- agrego id
	add column id 	int 	not null;
ALTER TABLE provincia -- actualizo la primary key
	add constraint pk_provincia primary key (id);
ALTER TABLE provincia -- seteo la clave alternativa
	add constraint uk_provincia UNIQUE (codigo_provincia);
	
ALTER TABLE localidad -- agrego id
	add column id	int 	not null;
ALTER TABLE localidad -- cambio nombre de la pk heredada
	rename codigo_provincia TO id_provincia;
ALTER TABLE localidad -- actualizo la primary key
	add constraint pk_localidad primary key (id,id_provincia);
ALTER TABLE localidad -- seteo la clave alternativa
	add constraint uk_localidad UNIQUE (codigo_localidad);
ALTER TABLE localidad -- agrego foreign key
	add constraint fk_localidad_references_provincia foreign key (id_provincia) references provincia(id);

ALTER TABLE persona -- agrego id
	add column id 	int 	not null;
ALTER TABLE persona -- cambio nombre de la fk
	rename codigo_localidad to id_localidad;
ALTER TABLE persona  -- cambio nombre de la fk
	rename codigo_provincia to id_provincia;
ALTER TABLE persona -- actualizo la primary key
	add constraint pk_persona primary key (id);
ALTER TABLE persona -- agrego clave alternativa
	add constraint uk_persona UNIQUE (tipoDocumento,numeroDocumento);
ALTER TABLE persona -- agrego nueva foreign key con ids
	add constraint fk_persona_references_localidad foreign key (id_localidad,id_provincia) references localidad(id,id_provincia);
	
