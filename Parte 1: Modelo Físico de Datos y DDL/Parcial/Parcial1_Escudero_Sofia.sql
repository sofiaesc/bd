/* =================== PRÁCTICA =================== */

-- AGREGO LOS IDS A CADA TABLA
ALTER TABLE provincia
	add column id smallint not null;
ALTER TABLE departamento
	add column id smallint not null;
ALTER TABLE localidad
	add column id smallint not null;
ALTER TABLE persona
	add column id smallint not null;
ALTER TABLE empleado
	add column id smallint not null;
ALTER TABLE oficina
	add column id smallint not null;
ALTER TABLE oficina_depende
	add column id smallint not null;
ALTER TABLE historial
	add column id smallint not null;

-- DROPEO LAS FOREIGN KEY
ALTER TABLE departamento
	drop constraint fk_departamento_provincia;
ALTER TABLE localidad
	drop constraint fk_localidad_departamento;
ALTER TABLE persona
	drop constraint fk_persona_localidad;
ALTER TABLE persona
	drop constraint fk_persona_padre;
ALTER TABLE persona
	drop constraint fk_persona_madre;
ALTER TABLE empleado
	drop constraint fk_empleado_persona;
ALTER TABLE oficina_depende
	drop constraint fk_oficina_depende_oficina;
ALTER TABLE oficina_depende
	drop constraint fk_oficina_depende_oficina_padre;
ALTER TABLE historial
	drop constraint fk_historial_empleado;
ALTER TABLE historial
	drop constraint fk_historia_fk_histor_oficina;

-- DROP DE LAS PRIMARY KEYS CON CN
ALTER TABLE historial
	drop constraint pk_historial;
ALTER TABLE persona
	drop constraint pk_persona;
ALTER TABLE empleado
	drop constraint pk_empleado;
ALTER TABLE oficina_depende
	drop constraint pk_oficina_depende;
ALTER TABLE localidad
	drop constraint pk_localidad;
ALTER TABLE departamento
	drop constraint pk_departamento;
ALTER TABLE oficina
	drop constraint pk_oficina;
ALTER TABLE provincia
	drop constraint pk_provincia;

-- AGREGO LAS PRIMARY KEYS CON IDS
ALTER TABLE provincia
	add constraint pk_provincia primary key (id);
ALTER TABLE departamento
	add constraint pk_departamento primary key (id);
ALTER TABLE localidad
	add constraint pk_localidad primary key (id);
ALTER TABLE persona
	add constraint pk_persona primary key (id);
ALTER TABLE empleado
	add constraint pk_empleado primary key (id);
ALTER TABLE oficina
	add constraint pk_oficina primary key (id);
ALTER TABLE oficina_depende
	add constraint pk_oficina_depende primary key (id);
ALTER TABLE historial
	add constraint pk_historial primary key (id);

-- DROPEO LOS ÍNDICES QUE REFERENCIAN LAS FOREIGN KEY
DROP INDEX idx_localidad_departamento;
DROP INDEX idx_persona_localidad;
DROP INDEX idx_persona_padre;
DROP INDEX idx_persona_madre;
DROP INDEX idx_oficinadepende_oficinapadre;
DROP INDEX idx_historial_oficina;

-- DROPEO LAS CN QUE ESTABAN COMO FK Y AGREGO LOS IDS COMO FK
ALTER TABLE departamento
	drop column codigo_provincia;
ALTER TABLE departamento
	add column id_provincia smallint not null;
ALTER TABLE departamento
	add constraint fk_departamento_provincia foreign key (id_provincia) references provincia(id);

ALTER TABLE localidad
	drop column codigo_provincia;
ALTER TABLE localidad
	drop column item;
ALTER TABLE localidad
	add column id_departamento smallint not null;
ALTER TABLE localidad
	add constraint fk_localidad_departamento foreign key (id_departamento) references departamento(id);

ALTER TABLE persona
	drop column codigo_localidad;
ALTER TABLE persona
	drop column tipo_documento_padre;
ALTER TABLE persona
	drop column tipo_documento_madre;
ALTER TABLE persona
	drop column numero_documento_padre;
ALTER TABLE persona
	drop column numero_documento_madre;
ALTER TABLE persona
	add column id_localidad smallint;
ALTER TABLE persona
	add column id_madre smallint;
ALTER TABLE persona
	add column id_padre smallint;
ALTER TABLE persona
	add constraint fk_persona_localidad foreign key (id_localidad) references localidad(id);
ALTER TABLE persona
	add constraint fk_persona_madre foreign key (id_madre) references persona(id);
ALTER TABLE persona 
	add constraint fk_persona_padre foreign key (id_padre) references persona(id);

ALTER TABLE empleado
	drop column tipo_documento;
ALTER TABLE empleado
	drop column numero_documento;
ALTER TABLE empleado
	add column id_persona smallint not null;
ALTER TABLE empleado
	add constraint fk_empleado_persona foreign key (id_persona) references persona(id);

ALTER TABLE oficina_depende
	drop column codigo_oficina;
ALTER TABLE oficina_depende
	drop column codigo_oficina_padre;
ALTER TABLE oficina_depende
	add column id_oficina smallint not null;
ALTER TABLE oficina_depende
	add column id_oficina_padre smallint not null;
ALTER TABLE oficina_depende
	add constraint fk_oficina_depende_oficina foreign key (id_oficina) references oficina(id);
ALTER TABLE oficina_depende
	add constraint fk_oficina_depende_oficina_padre foreign key (id_oficina_padre) references oficina(id);
	
ALTER TABLE historial
	drop column tipo_documento;
ALTER TABLE historial
	drop column numero_documento;
ALTER TABLE historial
	drop column codigo_oficina;
ALTER TABLE historial
	add column id_empleado smallint not null;
ALTER TABLE historial
	add column id_oficina smallint not null;
ALTER TABLE historial
	add constraint fk_historial_empleado foreign key (id_empleado) references empleado(id);
ALTER TABLE historial
	add constraint fk_historia_fk_histor_oficina foreign key (id_oficina) references oficina(id);

-- AGREGO CONSTRAINT UNIQUE A LAS CLAVES DE NEGOCIO (PK ANTERIORES)
ALTER TABLE provincia
	add constraint uk_provincia unique (codigo_provincia);
ALTER TABLE departamento
	add constraint uk_departamento unique (id_provincia,item);
ALTER TABLE localidad
	add constraint uk_localidad unique (codigo_localidad);
ALTER TABLE persona
	add constraint uk_persona unique (tipo_documento, numero_documento);
ALTER TABLE empleado
	add constraint uk_empleado_persona unique (id_persona);
ALTER TABLE oficina
	add constraint uk_oficina unique (codigo_oficina);
ALTER TABLE oficina_depende
	add constraint uk_oficina_depende unique (id_oficina,fecha_nicio);
ALTER TABLE historial
	add constraint uk_historial unique (id_empleado, fecha_desde);

-- AGREGO INDICES QUE BORRÉ ANTES PERO AHORA CON ID
CREATE INDEX idx_persona_localidad ON persona(id_localidad);
CREATE INDEX idx_persona_padre ON persona(id_padre);
CREATE INDEX idx_persona_madre ON persona(id_madre);
CREATE INDEX idx_oficinadepende_oficinapadre ON oficina_depende (id_oficina_padre);
CREATE INDEX idx_historial_oficina ON historial (id_oficina);

/* =================== TEORIA =================== */

/*
1) El diccionario de datos de una base de datos es, coloquialmente, un catálogo
con los datos de los datos. Esto es, almacena todos los datos del sistema: nombre,
tipo, tamaño, etcétera. 
El diccionario de datos se puede manipular mediante el lenguaje SQL, que se divide
en DDL (lenguaje de definición de datos) y DML (lenguaje de manejo de datos). El 
primero tiene instrucciones como CREATE que permite crear las tablas o DROP que las
elimina, mientras que el segundo tiene SELECT (entre otros) que permite consultar
los datos.

2) Un DBMS es un sistema de manejo de base de datos ("Data Base Management System")
que incluye tanto la base de datos como los programas para accederla y consultarla.
Implica el almacenamiento de una gran cantidad de datos, los mecanismos para la
manipulación de estos datos (modificar, eliminar, agregar) y la garantización de la
seguridad de los datos (ante caídas del sistema o accesos no autorizados) y la
integridad de estos (limitaciones puestas por el administrador del sistema, como
por ejemplo, que el año de nacimiento no sea menor a 1900).

3)
	a. Si quiero particionar verticalmente en 3 tablas con igual cantidad de
	columnas, hago 3 tablas nuevas manteniendo las primary key en todas, luego
	identifico cuales son las 39 columnas más utlizadas (sin contar las pk) 
	y las pongo en una de las tablas. Después tomo de a 39 columnas para las
	otras dos y copio todas las filas en las tablas nuevas, pero con los datos
	de las columnas correspondientes.
	Debo mantener la primary key entera (las 3 columnas) para que no hayan
	problemas en los índices unique para las nuevas tablas particionadas.
	b. Cada tabla tiene 42 columnas (39 columnas diferenciadas + 3 primary key).
	c. Cada tabla tiene 3.000.000 filas (se mantienen).

4)
	a. Si quiero particionar horizontalmente en 3 tablas con igual cantidad de
	filas, creo tres tablas adicionales con las mismas columnas que la original
	y copio de a 1.000.000 datos para cada una de las tablas nuevas.
	b. Cada tabla tiene 100 columnas (se mantienen).
	c. Cada tabla tiene 1.000.000 de filas.
*/